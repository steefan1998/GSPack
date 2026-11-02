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
"Done. In-game: /ftbquests reload, then F3+T."
