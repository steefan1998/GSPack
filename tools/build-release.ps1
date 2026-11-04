# Build a CurseForge import archive from the tracked pack overrides and exact installed addon IDs.
param(
    [Parameter(Mandatory = $true)][string]$Version,
    [string]$Instance = 'D:\CurseForge\Instances\GSPack Dev Build',
    [string]$Output = ''
)
$ErrorActionPreference = 'Stop'
$Root = Split-Path $PSScriptRoot -Parent
if (-not $Output) { $Output = Join-Path $Root "dist\GSPack-$Version.zip" }
$Output = [IO.Path]::GetFullPath($Output)
$metadata = Get-Content -LiteralPath (Join-Path $Instance 'minecraftinstance.json') -Raw | ConvertFrom-Json
$addons = @{}
foreach ($addon in $metadata.installedAddons) { $addons[$addon.fileNameOnDisk] = $addon }
$manifestFiles = [Collections.Generic.List[object]]::new()
$modRows = [Collections.Generic.List[string]]::new()
foreach ($jar in Get-ChildItem -LiteralPath (Join-Path $Instance 'mods') -Filter '*.jar' | Sort-Object Name) {
    $addon = $addons[$jar.Name]
    if (-not $addon.addonID -or -not $addon.installedFile.id) { throw "Missing CurseForge metadata: $($jar.Name)" }
    $manifestFiles.Add([ordered]@{ projectID = [int]$addon.addonID; fileID = [int]$addon.installedFile.id; required = $true })
    $name = [Net.WebUtility]::HtmlEncode($addon.name)
    $url = [Net.WebUtility]::HtmlEncode($addon.webSiteURL)
    $modRows.Add("<li><a href=`"$url`">$name</a></li>")
}
foreach ($addon in $metadata.installedAddons) {
    $folder = switch ([int]$addon.categoryClassID) { 12 { 'resourcepacks' } 6552 { 'shaderpacks' } default { $null } }
    if ($folder -and (Test-Path -LiteralPath (Join-Path (Join-Path $Instance $folder) $addon.fileNameOnDisk))) {
        if (-not $addon.addonID -or -not $addon.installedFile.id) { throw "Missing addon metadata: $($addon.name)" }
        $manifestFiles.Add([ordered]@{ projectID = [int]$addon.addonID; fileID = [int]$addon.installedFile.id; required = $true })
    }
}
$seenProjects = [Collections.Generic.HashSet[int]]::new()
foreach ($file in $manifestFiles) {
    if (-not $seenProjects.Add([int]$file['projectID'])) { throw "Duplicate CurseForge project ID: $($file['projectID'])" }
}
$manifest = [ordered]@{
    minecraft = [ordered]@{ version = $metadata.gameVersion; modLoaders = @(@{ id = $metadata.baseModLoader.name; primary = $true }); recommendedRam = 8192 }
    manifestType = 'minecraftModpack'; manifestVersion = 1; name = 'GSPack'; version = $Version
    author = 'steefan1998'; files = @($manifestFiles.ToArray()); overrides = 'overrides'
}
$tracked = @(& git -C $Root ls-files -- config kubejs defaultconfigs global_packs datapacks)
if ($LASTEXITCODE) { throw 'Could not enumerate tracked overrides' }
$tracked = @($tracked | Where-Object { $_ -ne 'config/resourceful-config-web.json' -and $_ -notmatch '(^|/)(logs|exported|\.cache)(/|$)' })
if (-not $tracked.Count) { throw 'No tracked overrides' }
Add-Type -AssemblyName System.IO.Compression.FileSystem
New-Item -ItemType Directory -Force (Split-Path $Output -Parent) | Out-Null
$archive = [IO.Compression.ZipFile]::Open($Output, [IO.Compression.ZipArchiveMode]::Create)
try {
    $entry = $archive.CreateEntry('manifest.json')
    $writer = [IO.StreamWriter]::new($entry.Open(), [Text.UTF8Encoding]::new($false))
    try { $writer.Write(($manifest | ConvertTo-Json -Depth 12)) } finally { $writer.Dispose() }
    $entry = $archive.CreateEntry('modlist.html')
    $writer = [IO.StreamWriter]::new($entry.Open(), [Text.UTF8Encoding]::new($false))
    try { $writer.Write("<!doctype html><html><body><h1>GSPack $Version</h1><ul>" + ($modRows -join "`n") + '</ul></body></html>') } finally { $writer.Dispose() }
    foreach ($file in $tracked) {
        [void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, (Join-Path $Root $file), ('overrides/' + $file.Replace('\', '/')), [IO.Compression.CompressionLevel]::Optimal)
    }
} finally { $archive.Dispose() }
"Created $Output ($($manifestFiles.Count) CurseForge files; $($tracked.Count) override files)."
