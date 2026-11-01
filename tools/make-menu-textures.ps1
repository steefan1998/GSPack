# Renders the FancyMenu main menu textures (background + logo) into config/fancymenu/assets/gspack.
# Everything is drawn at low resolution and scaled up with nearest neighbour for a pixel-art look.
# Usage:  powershell -ExecutionPolicy Bypass -File tools\make-menu-textures.ps1
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$Out = Join-Path (Split-Path $PSScriptRoot -Parent) 'config\fancymenu\assets\gspack'
New-Item -ItemType Directory -Force $Out | Out-Null

function Col([string]$hex, [int]$a = 255) { $c = [Drawing.ColorTranslator]::FromHtml($hex); [Drawing.Color]::FromArgb($a, $c.R, $c.G, $c.B) }
function Mix([Drawing.Color]$a, [Drawing.Color]$b, [double]$t) {
    $t = [Math]::Max([double]0, [Math]::Min([double]1, [double]$t))   # double literals: an int 1 makes PowerShell round $t
    [Drawing.Color]::FromArgb(255, [int]($a.R + ($b.R - $a.R) * $t), [int]($a.G + ($b.G - $a.G) * $t), [int]($a.B + ($b.B - $a.B) * $t))
}
function Save-Scaled([Drawing.Bitmap]$bmp, [int]$scale, [string]$file) {
    $big = New-Object Drawing.Bitmap ($bmp.Width * $scale), ($bmp.Height * $scale)
    $g = [Drawing.Graphics]::FromImage($big)
    $g.InterpolationMode = 'NearestNeighbor'; $g.PixelOffsetMode = 'Half'
    $g.DrawImage($bmp, 0, 0, $big.Width, $big.Height); $g.Dispose()
    $big.Save((Join-Path $Out $file), [Drawing.Imaging.ImageFormat]::Png); $big.Dispose()
}

# ---------- Background: dusk landscape with floating islands (480x270 -> 1920x1080) ----------
$W = 480; $H = 270
$bmp = New-Object Drawing.Bitmap $W, $H
$rng = New-Object Random 1998
$skyTop = Col '#0a0820'; $skyMid = Col '#2b1a5e'; $skyLow = Col '#7a3f8c'; $glow = Col '#e0906a'

# Sky gradient with a warm glow near the horizon.
for ($y = 0; $y -lt $H; $y++) {
    $t = $y / 190.0
    $c = if ($t -lt 0.55) { Mix $skyTop $skyMid ($t / 0.55) } else { Mix $skyMid $skyLow (($t - 0.55) / 0.45) }
    if ($y -gt 150) { $c = Mix $c $glow (($y - 150) / 70.0 * 0.6) }
    for ($x = 0; $x -lt $W; $x++) { $bmp.SetPixel($x, $y, $c) }
}
# Stars, denser at the top.
for ($i = 0; $i -lt 260; $i++) {
    $x = $rng.Next(0, $W); $y = [int]([Math]::Pow($rng.NextDouble(), 1.8) * 150)
    $b = 150 + $rng.Next(0, 105)
    $bmp.SetPixel($x, $y, [Drawing.Color]::FromArgb(255, $b, $b, [Math]::Min(255, $b + 30)))
    if ($rng.Next(0, 14) -eq 0 -and $x -gt 0 -and $x -lt $W - 1 -and $y -gt 0) {
        $s = [Drawing.Color]::FromArgb(255, [int]($b * 0.6), [int]($b * 0.6), [int]($b * 0.75))
        $bmp.SetPixel($x - 1, $y, $s); $bmp.SetPixel($x + 1, $y, $s); $bmp.SetPixel($x, $y - 1, $s); $bmp.SetPixel($x, $y + 1, $s)
    }
}
# Moon with a soft halo and craters.
$mx = 382; $my = 58; $mr = 20
for ($y = $my - $mr - 10; $y -le $my + $mr + 10; $y++) {
    for ($x = $mx - $mr - 10; $x -le $mx + $mr + 10; $x++) {
        $d = [Math]::Sqrt(($x - $mx) * ($x - $mx) + ($y - $my) * ($y - $my))
        $base = $bmp.GetPixel($x, $y)
        if ($d -le $mr) {
            $c = Mix (Col '#fff4d6') (Col '#d9c9a8') (($x - $mx + $y - $my) / (2.0 * $mr) + 0.5)
            $bmp.SetPixel($x, $y, $c)
        } elseif ($d -le $mr + 10) { $bmp.SetPixel($x, $y, (Mix $base (Col '#c9a0d0') ((1 - ($d - $mr) / 10) * 0.45))) }
    }
}
foreach ($cr in @(@(375, 52, 4), @(390, 66, 3), @(386, 48, 2), @(372, 66, 2))) {
    for ($y = $cr[1] - $cr[2]; $y -le $cr[1] + $cr[2]; $y++) { for ($x = $cr[0] - $cr[2]; $x -le $cr[0] + $cr[2]; $x++) {
        if ((($x - $cr[0]) * ($x - $cr[0]) + ($y - $cr[1]) * ($y - $cr[1])) -le $cr[2] * $cr[2]) { $bmp.SetPixel($x, $y, (Col '#c4b38f')) }
    } }
}

# Mountain ridges from layered sine noise, back to front.
function Ridge([double]$base, [double]$amp, [double[]]$freqs, [double]$phase, [int]$x) {
    $h = 0.0; $i = 1
    foreach ($f in $freqs) { $h += [Math]::Sin($x * $f + $phase * $i) / $i; $i++ }
    return [int]($base - $h * $amp)
}
$layers = @(
    @{ Base = 175.0; Amp = 22.0; F = @(0.013, 0.031, 0.077); P = 1.3; C = '#3d2a63' },
    @{ Base = 200.0; Amp = 18.0; F = @(0.017, 0.043, 0.091); P = 2.7; C = '#271c46' },
    @{ Base = 228.0; Amp = 12.0; F = @(0.021, 0.057, 0.13); P = 4.1; C = '#171230' }
)
foreach ($l in $layers) {
    $col = Col $l.C
    for ($x = 0; $x -lt $W; $x++) {
        $top = Ridge $l.Base $l.Amp $l.F $l.P $x
        for ($y = [Math]::Max(0, $top); $y -lt $H; $y++) { $bmp.SetPixel($x, $y, $col) }
    }
}
# Foreground pine forest.
$fg = Col '#0c0a1a'
for ($x = 0; $x -lt $W; $x++) { $g = 246 + [int]([Math]::Sin($x * 0.05) * 3); for ($y = $g; $y -lt $H; $y++) { $bmp.SetPixel($x, $y, $fg) } }
$tx = 0
while ($tx -lt $W) {
    $th = 14 + $rng.Next(0, 16); $base = 248
    for ($row = 0; $row -lt $th; $row++) {
        $half = [int](($row / [double]$th) * ($th / 3.2)) + 1
        for ($dx = -$half; $dx -le $half; $dx++) { $px = $tx + $dx; if ($px -ge 0 -and $px -lt $W) { $bmp.SetPixel($px, $base - $th + $row, $fg) } }
    }
    $tx += 5 + $rng.Next(0, 9)
}

# Floating islands: grassy top, earthy body tapering down, dangling roots.
function Island([int]$cx, [int]$cy, [int]$w, [int]$depth) {
    $grass = Col '#4f9a4a'; $grassD = Col '#2f6a35'; $dirt = Col '#5a3d2e'; $dirtD = Col '#3a2620'; $stone = Col '#4a4560'
    for ($row = 0; $row -lt $depth; $row++) {
        $half = [int](($w / 2.0) * (1 - [Math]::Pow($row / [double]$depth, 0.8)))
        for ($dx = -$half; $dx -le $half; $dx++) {
            $c = if ($row -eq 0) { $grass } elseif ($row -eq 1) { $grassD } elseif ($row -lt $depth * 0.45) { $dirt } elseif ($row -lt $depth * 0.75) { $dirtD } else { $stone }
            if ($dx -eq $half -and $row -gt 1) { $c = Mix $c (Col '#000000') 0.35 }
            $bmp.SetPixel($cx + $dx, $cy + $row, $c)
        }
    }
    for ($r = 0; $r -lt [int]($w / 6); $r++) {
        $rx = $cx - [int]($w / 3) + $rng.Next(0, [int]($w * 2 / 3)); $len = 3 + $rng.Next(0, 7)
        $startY = $cy + [int]($depth * 0.5)
        for ($k = 0; $k -lt $len; $k++) { $bmp.SetPixel($rx, $startY + $k, (Col '#2f4a2a')) }
    }
    # A tiny tree on top.
    $tx = $cx - [int]($w / 5)
    for ($k = 1; $k -le 4; $k++) { $bmp.SetPixel($tx, $cy - $k, (Col '#4a3020')) }
    for ($dy = -9; $dy -le -4; $dy++) { for ($dx = -3; $dx -le 3; $dx++) { if ([Math]::Abs($dx) + [Math]::Abs($dy + 6.5) -lt 4.5) { $bmp.SetPixel($tx + $dx, $cy + $dy, (Col '#3f8a44')) } } }
}
Island 80 70 46 20
Island 150 112 22 10
Island 305 98 30 13
Island 440 135 26 11
# A waterfall from the big island.
for ($y = 82; $y -lt 150; $y++) { foreach ($dx in 0, 1) { $c = if (($y + $dx) % 3 -eq 0) { Col '#cfe9ff' } else { Col '#7fb6e6' }; $bmp.SetPixel(95 + $dx, $y, (Mix $bmp.GetPixel(95 + $dx, $y) $c (1 - ($y - 82) / 90.0))) } }

# Fireflies.
for ($i = 0; $i -lt 40; $i++) { $x = $rng.Next(0, $W); $y = 200 + $rng.Next(0, 60); $bmp.SetPixel($x, $y, (Col '#ffe680')) }

# Vignette: darker edges, slightly darker centre column so the buttons stay readable.
for ($y = 0; $y -lt $H; $y++) {
    for ($x = 0; $x -lt $W; $x++) {
        $dx = ($x - $W / 2.0) / ($W / 2.0); $dy = ($y - $H / 2.0) / ($H / 2.0)
        $v = [Math]::Min([double]1, ($dx * $dx + $dy * $dy) * 0.35)
        $centre = [Math]::Max([double]0, 1 - [Math]::Abs($dx) * 3.2) * 0.18
        $c = $bmp.GetPixel($x, $y)
        $bmp.SetPixel($x, $y, (Mix $c ([Drawing.Color]::Black) ($v * 0.45 + $centre)))
    }
}
Save-Scaled $bmp 4 'background.png'; $bmp.Dispose()

# ---------- Logo: "GSPack" in golden pixel letters + subtitle (scaled x4) ----------
$lw = 200; $lh = 52
$bmp = New-Object Drawing.Bitmap $lw, $lh
$g = [Drawing.Graphics]::FromImage($bmp); $g.Clear([Drawing.Color]::Transparent)
$g.SmoothingMode = 'None'; $g.TextRenderingHint = 'SingleBitPerPixelGridFit'
$fmt = [Drawing.StringFormat]::GenericTypographic
$tf = New-Object Drawing.Font('Tahoma', 32, [Drawing.FontStyle]::Bold, [Drawing.GraphicsUnit]::Pixel)
$sf = New-Object Drawing.Font('Tahoma', 9, [Drawing.FontStyle]::Bold, [Drawing.GraphicsUnit]::Pixel)
$title = 'GSPack'; $sub = 'TECH  -  MAGIC  -  EXPLORATION'
$ts = $g.MeasureString($title, $tf, 2000, $fmt); $tx = [int](($lw - $ts.Width) / 2); $ty = 2
# Mask of the title so we can outline and gradient-fill it per pixel.
$mask = New-Object Drawing.Bitmap $lw, $lh
$mg = [Drawing.Graphics]::FromImage($mask); $mg.Clear([Drawing.Color]::Transparent); $mg.TextRenderingHint = 'SingleBitPerPixelGridFit'
$mg.DrawString($title, $tf, [Drawing.Brushes]::White, [float]$tx, [float]$ty, $fmt); $mg.Dispose()
$top = Col '#fff1a8'; $mid = Col '#ffc93c'; $bot = Col '#d9741a'; $edge = Col '#3a1e0a'
$inside = { param($x, $y) $x -ge 0 -and $y -ge 0 -and $x -lt $lw -and $y -lt $lh -and $mask.GetPixel($x, $y).A -gt 0 }
for ($y = 0; $y -lt $lh; $y++) { for ($x = 0; $x -lt $lw; $x++) {
    if (& $inside $x $y) {
        $t = ($y - $ty - 4) / 28.0
        $c = if ($t -lt 0.5) { Mix $top $mid ($t * 2) } else { Mix $mid $bot (($t - 0.5) * 2) }
        $bmp.SetPixel($x, $y, $c)
    } elseif ((& $inside ($x - 1) $y) -or (& $inside ($x + 1) $y) -or (& $inside $x ($y - 1)) -or (& $inside $x ($y + 1))) {
        $bmp.SetPixel($x, $y, $edge)
    } elseif ((& $inside ($x - 2) ($y - 2))) {
        $bmp.SetPixel($x, $y, [Drawing.Color]::FromArgb(170, 10, 6, 20))   # drop shadow
    }
} }
$mask.Dispose()
# Subtitle with a thin rule on both sides.
$ss = $g.MeasureString($sub, $sf, 2000, $fmt); $sx = [int](($lw - $ss.Width) / 2); $sy = 40
$g.DrawString($sub, $sf, (New-Object Drawing.SolidBrush ([Drawing.Color]::FromArgb(255, 20, 10, 30))), [float]($sx + 1), [float]($sy + 1), $fmt)
$g.DrawString($sub, $sf, (New-Object Drawing.SolidBrush (Col '#e9dcff')), [float]$sx, [float]$sy, $fmt)
$rule = New-Object Drawing.SolidBrush (Col '#ffc93c')
$g.FillRectangle($rule, 4, $sy + 5, [Math]::Max(0, $sx - 10), 1); $g.FillRectangle($rule, $sx + [int]$ss.Width + 6, $sy + 5, [Math]::Max(0, $lw - ($sx + [int]$ss.Width + 10)), 1)
$g.Dispose()
Save-Scaled $bmp 4 'logo.png'; $bmp.Dispose()
# ---------- Buttons: 200x20 native, used as nine-slice (border 4) so they fit any button width ----------
function Draw-Button([string]$file, [string]$fill, [string]$fillTop, [string]$border, [string]$shine, [int]$alpha) {
    $bw = 200; $bh = 20
    $b = New-Object Drawing.Bitmap $bw, $bh
    $cFill = Col $fill $alpha; $cTop = Col $fillTop $alpha; $cBorder = Col $border; $cShine = Col $shine; $cShadow = Col '#0a0612'
    for ($y = 0; $y -lt $bh; $y++) { for ($x = 0; $x -lt $bw; $x++) {
        $corner = ($x -eq 0 -or $x -eq $bw - 1) -and ($y -eq 0 -or $y -eq $bh - 1)
        if ($corner) { continue }                                           # cut corners
        $edge = $x -eq 0 -or $y -eq 0 -or $x -eq $bw - 1 -or $y -eq $bh - 1
        if ($edge) { $b.SetPixel($x, $y, $cBorder); continue }
        if ($y -eq 1) { $b.SetPixel($x, $y, $cShine); continue }             # top highlight
        if ($y -eq $bh - 2) { $b.SetPixel($x, $y, $cShadow); continue }      # bottom shadow
        $c = Mix $cTop $cFill (($y - 2) / [double]($bh - 4))
        $b.SetPixel($x, $y, [Drawing.Color]::FromArgb($alpha, $c.R, $c.G, $c.B))
    } }
    # Small gold studs at both ends.
    foreach ($sx in 3, ($bw - 4)) { $b.SetPixel($sx, 9, $cBorder); $b.SetPixel($sx, 10, $cBorder) }
    $b.Save((Join-Path $Out $file), [Drawing.Imaging.ImageFormat]::Png); $b.Dispose()
}
Draw-Button 'button_normal.png' '#160f28' '#2a1d4a' '#a9802e' '#4a3a70' 225
Draw-Button 'button_hover.png' '#2a1c4c' '#4a3480' '#ffd25a' '#8f78d0' 240
Draw-Button 'button_inactive.png' '#141218' '#1e1b26' '#4a4452' '#2a2732' 200

"Menu textures written to $Out"
