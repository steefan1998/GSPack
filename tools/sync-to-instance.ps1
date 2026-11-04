# Installs the quest book and KubeJS files from this repository into a GSPack instance, to test them in-game.
# Usage:  powershell -ExecutionPolicy Bypass -File tools\sync-to-instance.ps1 [-Instance <path>] [-WhatIf]
# Afterwards, in-game: /ftbquests reload, then F3+T to reload the textures (restart the game if KubeJS startup scripts changed).
param([string]$Instance = 'D:\CurseForge\Instances\GSPack Dev Build', [switch]$WhatIf)

$ErrorActionPreference = 'Stop'
$Root = Split-Path $PSScriptRoot -Parent
if (-not (Test-Path "$Instance\mods")) { throw "No mods folder in $Instance" }

# Quest files and KubeJS are owned by this repo: files removed here are removed in the instance too (/MIR).
# KubeJS folders the game creates itself (config, data, ...) are left alone.
$sync = @(
    @{ From = 'config\ftbquests\quests'; Mirror = $true },
    @{ From = 'config\mysticalcustomization\crops'; Mirror = $true },
    @{ From = 'kubejs\assets\gspack'; Mirror = $true },
    @{ From = 'kubejs\assets\hostilenetworks'; Mirror = $true },
    @{ From = 'kubejs\assets\minecraft'; Mirror = $false },
    @{ From = 'kubejs\data'; Mirror = $false },
    @{ From = 'kubejs\startup_scripts'; Mirror = $false },
    @{ From = 'kubejs\server_scripts'; Mirror = $false },
    @{ From = 'kubejs\client_scripts'; Mirror = $false }
)
foreach ($s in $sync) {
    $src = Join-Path $Root $s.From; $dst = Join-Path $Instance $s.From
    $mode = $(if ($s.Mirror) { '/MIR' } else { '/E' })
    $opts = @($mode, '/NJH', '/NJS', '/NDL', '/NP') + $(if ($WhatIf) { @('/L') } else { @() })
    $out = robocopy $src $dst @opts
    if ($LASTEXITCODE -ge 8) { throw "robocopy failed for $($s.From) (exit $LASTEXITCODE)" }
    $changed = @($out | Where-Object { $_ -match '\S' })
    '{0,-28} {1} file(s) {2}' -f $s.From, $changed.Count, $(if ($WhatIf) { 'would change' } else { 'updated' })
}
# Merge pack EMC exclusion; retain local custom entries.
$emcTarget = Join-Path $Instance 'config\Equivox\custom_emc.json'
$packEmc = Get-Content (Join-Path $Root 'config\Equivox\custom_emc.json') -Raw | ConvertFrom-Json
$currentEmc = if (Test-Path $emcTarget) { Get-Content -LiteralPath $emcTarget -Raw | ConvertFrom-Json } else { $packEmc }
$entries = @($currentEmc.entries | Where-Object { $_.tag -ne 'gspack:emc_excluded' })
$entries += @($packEmc.entries | Where-Object { $_.tag -eq 'gspack:emc_excluded' })
$mergedEmc = [ordered]@{ comment = $packEmc.comment; entries = $entries }
if (-not $WhatIf) {
    New-Item -ItemType Directory -Force (Split-Path $emcTarget -Parent) | Out-Null
    [IO.File]::WriteAllText($emcTarget, ($mergedEmc | ConvertTo-Json -Depth 30), (New-Object Text.UTF8Encoding($false)))
}
'Equivox EMC policy merged; local entries retained.'
"Done. Restart after startup or EMC changes; otherwise /reload, /ftbquests reload and F3+T."
