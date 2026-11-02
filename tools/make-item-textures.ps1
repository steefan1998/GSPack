# Renders the 16x16 item textures for the KubeJS endgame items into kubejs/assets/gspack/textures/item.
# Usage:  powershell -ExecutionPolicy Bypass -File tools\make-item-textures.ps1
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$Out = Join-Path (Split-Path $PSScriptRoot -Parent) 'kubejs\assets\gspack\textures\item'
New-Item -ItemType Directory -Force $Out | Out-Null

function Col([string]$hex) { [Drawing.ColorTranslator]::FromHtml($hex) }
function Mix([Drawing.Color]$a, [Drawing.Color]$b, [double]$t) {
    $t = [Math]::Max([double]0, [Math]::Min([double]1, [double]$t))   # double literals: an int 1 makes PowerShell round $t
    [Drawing.Color]::FromArgb(255, [int]($a.R + ($b.R - $a.R) * $t), [int]($a.G + ($b.G - $a.G) * $t), [int]($a.B + ($b.B - $a.B) * $t))
}

# A shaded orb: dark outline, body lit from the top-left, a glowing centre and a highlight.
function Draw-Orb([string]$file, [string]$dark, [string]$mid, [string]$light, [string]$glow) {
    $bmp = New-Object Drawing.Bitmap 16, 16
    $cD = Col $dark; $cM = Col $mid; $cL = Col $light; $cG = Col $glow
    for ($y = 0; $y -lt 16; $y++) {
        for ($x = 0; $x -lt 16; $x++) {
            $dx = $x - 7.5; $dy = $y - 7.5; $r = [Math]::Sqrt($dx * $dx + $dy * $dy)
            if ($r -gt 6.9) { continue }
            if ($r -gt 6.0) { $bmp.SetPixel($x, $y, (Mix $cD ([Drawing.Color]::Black) 0.35)); continue }
            $lit = (-$dx - $dy) / 12.0 + 0.5            # 0 = bottom-right, 1 = top-left
            $c = if ($lit -gt 0.5) { Mix $cM $cL (($lit - 0.5) * 2) } else { Mix $cD $cM ($lit * 2) }
            if ($r -lt 2.6) { $c = Mix $c $cG (1 - $r / 2.6) }   # inner glow
            $bmp.SetPixel($x, $y, $c)
        }
    }
    foreach ($p in @(@(5, 4), @(4, 5), @(5, 5), @(6, 4))) { $bmp.SetPixel($p[0], $p[1], (Mix $cL ([Drawing.Color]::White) 0.7)) }
    $bmp.Save((Join-Path $Out $file), [Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
}

# The singularity: a near-black orb with a rainbow ring around it.
function Draw-Singularity([string]$file) {
    $bmp = New-Object Drawing.Bitmap 16, 16
    $ring = @('#ff5555', '#ffaa33', '#ffff55', '#55ff55', '#55ffff', '#5577ff', '#cc55ff')
    for ($y = 0; $y -lt 16; $y++) {
        for ($x = 0; $x -lt 16; $x++) {
            $dx = $x - 7.5; $dy = $y - 7.5; $r = [Math]::Sqrt($dx * $dx + $dy * $dy)
            if ($r -le 4.6) {
                $c = Mix (Col '#1a0d2e') (Col '#5b2a8c') ((-$dx - $dy) / 10 + 0.35)
                if ($r -lt 1.6) { $c = Col '#ffffff' } elseif ($r -lt 2.4) { $c = Col '#d9b3ff' }
                $bmp.SetPixel($x, $y, $c)
            } elseif ([Math]::Abs([Math]::Pow($dx / 7.4, 2) + [Math]::Pow(($dy + $dx * 0.35) / 3.2, 2) - 1) -lt 0.32) {
                # Tilted elliptical ring around the core.
                $a = [Math]::Atan2($dy, $dx) + [Math]::PI
                $bmp.SetPixel($x, $y, (Col $ring[[int]($a / (2 * [Math]::PI) * $ring.Count) % $ring.Count]))
            }
        }
    }
    $bmp.Save((Join-Path $Out $file), [Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
}

# The trophy: a golden cup with a purple gem, drawn from a pixel map.
function Draw-Trophy([string]$file) {
    $map = @(
        '................',
        '..HHHHHHHHHHHH..',
        '.HGLLLLLLLLLLGH.',
        'HG.GLLLLLLLLG.GH',
        'HG.GLLLPPLLLG.GH',
        'HG.GLLPWPPLLG.GH',
        '.HGGLLPPPPLGGH..',
        '..HHGLLPPLLGHH..',
        '....HGLLLLGH....',
        '.....HGLLGH.....',
        '......HGGH......',
        '......HGGH......',
        '.....HGLLGH.....',
        '....HGGGGGGH....',
        '...HDDDDDDDDH...',
        '...HHHHHHHHHH...'
    )
    $pal = @{ 'H' = '#5c3a00'; 'G' = '#c98a00'; 'L' = '#ffd84a'; 'D' = '#8a5a00'; 'P' = '#a347ff'; 'W' = '#f2ddff' }
    $bmp = New-Object Drawing.Bitmap 16, 16
    for ($y = 0; $y -lt 16; $y++) { for ($x = 0; $x -lt 16; $x++) {
        $k = [string]$map[$y][$x]
        if ($pal.ContainsKey($k)) { $bmp.SetPixel($x, $y, (Col $pal[$k])) }
    } }
    $bmp.Save((Join-Path $Out $file), [Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
}

# A crux block: a dark stone frame with a bevelled metal plate and a glowing gem in the middle.
function Draw-Crux([string]$file, [string]$dark, [string]$mid, [string]$light, [string]$glow) {
    $bmp = New-Object Drawing.Bitmap 16, 16
    $cD = Col $dark; $cM = Col $mid; $cL = Col $light; $cG = Col $glow
    $frame = Col '#2a2630'; $frameLit = Col '#4a4452'
    for ($y = 0; $y -lt 16; $y++) {
        for ($x = 0; $x -lt 16; $x++) {
            $edge = [Math]::Min([Math]::Min($x, $y), [Math]::Min(15 - $x, 15 - $y))
            if ($edge -eq 0) { $c = $frame }
            elseif ($edge -eq 1) { $c = if ($x -lt 8 -and $y -lt 8) { $frameLit } else { Mix $frame $frameLit 0.5 } }
            else {
                $lit = ((15 - $x) + (15 - $y)) / 30.0           # 1 = top-left
                $c = if ($lit -gt 0.5) { Mix $cM $cL (($lit - 0.5) * 2) } else { Mix $cD $cM ($lit * 2) }
                if ($edge -eq 2) { $c = Mix $c $cD 0.45 }        # inner bevel
                $d = [Math]::Abs($x - 7.5) + [Math]::Abs($y - 7.5) # diamond-shaped gem
                if ($d -lt 4.2) { $c = Mix $cL $cG (1 - $d / 4.2) }
                elseif ($d -lt 5.2) { $c = Mix $cD ([Drawing.Color]::Black) 0.3 }
            }
            $bmp.SetPixel($x, $y, $c)
        }
    }
    $bmp.Save((Join-Path $BlockOut $file), [Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
}

$BlockOut = Join-Path (Split-Path $PSScriptRoot -Parent) 'kubejs\assets\gspack\textures\block'
New-Item -ItemType Directory -Force $BlockOut | Out-Null
Draw-Crux 'allthemodium_crux.png' '#7a4a06' '#d99a1e' '#ffd46a' '#fff6d8'
Draw-Crux 'vibranium_crux.png' '#0c5a46' '#22b48a' '#7af0cc' '#e8fff8'
Draw-Crux 'unobtainium_crux.png' '#4a1470' '#9a3ad6' '#d79cff' '#fbefff'

Draw-Orb 'tech_core.png' '#0e3a5c' '#2f8fd8' '#8fd8ff' '#e6fbff'
Draw-Orb 'arcane_core.png' '#3a0f52' '#8a3fc4' '#d49cff' '#fff0ff'
Draw-Orb 'verdant_core.png' '#13401a' '#3fa83a' '#a6f07a' '#f4ffe0'
Draw-Orb 'dimensional_core.png' '#4a2c00' '#d68f12' '#ffd36a' '#fff8de'
Draw-Orb 'cosmic_core.png' '#151a4a' '#4a55c8' '#9fb0ff' '#ffffff'
Draw-Singularity 'creative_singularity.png'
Draw-Trophy 'infinity_trophy.png'
"Item textures written to $Out"
