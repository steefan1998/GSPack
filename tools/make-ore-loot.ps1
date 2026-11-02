# Writes kubejs/data/<mod>/loot_table/blocks/<ore>.json so the ores of every mod drop the preferred materials
# (AllTheOres first, see kubejs/server_scripts/gspack_zz_unify.js). Re-run after adding or updating ore mods:
#   powershell -ExecutionPolicy Bypass -File tools\make-ore-loot.ps1
# For each c:ores/<metal> tag, an ore from another mod gets the loot table of the matching preferred ore
# (deepslate -> deepslate, nether -> nether, end -> end, otherwise the stone ore).
param([string]$ModsDir = 'D:\CurseForge\Instances\GSPack Dev Build\mods', [string]$OutDir = (Join-Path (Split-Path $PSScriptRoot -Parent) 'kubejs\data'), [string]$Report = '')
Add-Type -AssemblyName System.IO.Compression.FileSystem
$priority = @('alltheores', 'mekanism', 'stellaris', 'oritech', 'railcraft', 'ltxi', 'mekmm', 'occultism')
$tags = @{}; $loot = @{}
foreach ($jar in Get-ChildItem $ModsDir -Filter *.jar) {
    $z = [IO.Compression.ZipFile]::OpenRead($jar.FullName)
    try {
        foreach ($e in $z.Entries) {
            if ($e.FullName -match '^data/c/tags/items?/(ores/.+)\.json$' -or $e.FullName -match '^data/c/tags/blocks?/(ores/.+)\.json$') {
                $t = 'c:' + $Matches[1]
                $r = New-Object IO.StreamReader($e.Open()); $txt = $r.ReadToEnd(); $r.Dispose()
                if (-not $tags.ContainsKey($t)) { $tags[$t] = New-Object System.Collections.Generic.HashSet[string] }
                foreach ($m in [regex]::Matches($txt, '"(#?[a-z0-9_.-]+:[a-z0-9_/.-]+)"')) { [void]$tags[$t].Add($m.Groups[1].Value) }
            } elseif ($e.FullName -match '^data/([a-z0-9_.-]+)/loot_table/blocks/(.+)\.json$') {
                $r = New-Object IO.StreamReader($e.Open()); $loot["$($Matches[1]):$($Matches[2])"] = $r.ReadToEnd(); $r.Dispose()
            }
        }
    } catch {} finally { $z.Dispose() }
}
function Members([string]$t, $seen) {
    if ($seen.Contains($t) -or -not $tags.ContainsKey($t)) { return @() }
    [void]$seen.Add($t)
    foreach ($v in $tags[$t]) { if ($v.StartsWith('#')) { Members $v.Substring(1) $seen } else { $v } }
}
function Variant([string]$id) { $p = ($id -split ":")[1]; if ($p -match "deepslate") { "deepslate" } elseif ($p -match "nether") { "nether" } elseif ($p -match "(^|_)end(stone)?_") { "end" } elseif ($p -match "(^|_)other_") { "other" } elseif ($p -match "^(moon|mars|venus|mercury|glacio)_") { "planet" } else { "stone" } }
$rows = New-Object System.Collections.Generic.List[string]
foreach ($t in ($tags.Keys | Where-Object { $_ -match '^c:ores/[a-z_]+$' } | Sort-Object)) {
    $m = @(Members $t (New-Object System.Collections.Generic.HashSet[string]) | Sort-Object -Unique)
    $ns = @($m | ForEach-Object { ($_ -split ':')[0] } | Sort-Object -Unique)
    # Cinnabar stays: Thaumaturge makes quicksilver from its own cinnabar ore.
    if ($ns.Count -lt 2 -or $ns -contains 'minecraft' -or $t -eq 'c:ores/cinnabar') { continue }
    $pref = $priority | Where-Object { $ns -contains $_ } | Select-Object -First 1
    if (-not $pref) { continue }
    $prefOres = @($m | Where-Object { $_ -like "${pref}:*" })
    foreach ($ore in ($m | Where-Object { $_ -notlike "${pref}:*" })) {
        $v = Variant $ore
        $target = @($prefOres | Where-Object { (Variant $_) -eq $v }) + @($prefOres | Where-Object { (Variant $_) -eq 'stone' }) | Select-Object -First 1
        if (-not $target -or -not $loot.ContainsKey($target) -or -not $loot.ContainsKey($ore)) { $rows.Add("SKIP $t $ore (target $target)"); continue }
        $ons, $opath = $ore -split ':', 2
        $file = Join-Path $OutDir "$ons\loot_table\blocks\$opath.json"
        New-Item -ItemType Directory -Force (Split-Path $file) | Out-Null
        $json = $loot[$target] -replace '"random_sequence"\s*:\s*"[^"]*"', "`"random_sequence`": `"${ons}:blocks/$opath`""
        [IO.File]::WriteAllText($file, $json, (New-Object Text.UTF8Encoding($false)))
        $rows.Add("$t  $ore -> loot of $target")
    }
}
if ($Report) { [IO.File]::WriteAllLines($Report, [string[]]$rows) }
"$(@($rows | Where-Object { $_ -notlike 'SKIP*' }).Count) ore loot tables written, $(@($rows | Where-Object { $_ -like 'SKIP*' }).Count) skipped"
