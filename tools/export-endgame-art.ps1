# Package finished artwork as Minecraft sprites and a vanilla animated texture.
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Drawing
$root=Split-Path $PSScriptRoot -Parent
$source=Join-Path $root 'branding/endgame'
$out=Join-Path $root 'kubejs/assets/gspack/textures/item'
function Export-Sprite([string]$name,[string]$destination,[int]$size=64) {
    $image=[Drawing.Image]::FromFile((Join-Path $source "$name.png"))
    $bitmap=[Drawing.Bitmap]::new($size,$size);$g=[Drawing.Graphics]::FromImage($bitmap)
    try { $g.InterpolationMode='NearestNeighbor';$g.PixelOffsetMode='Half';$g.DrawImage($image,0,0,$size,$size);$bitmap.Save($destination,[Drawing.Imaging.ImageFormat]::Png) }
    finally {$g.Dispose();$bitmap.Dispose();$image.Dispose()}
}
foreach($name in 'tech_core','arcane_core','verdant_core','dimensional_core','cosmic_core') { Export-Sprite $name (Join-Path $out "$name.png") 16 }
Export-Sprite 'infinity_trophy_atlas' (Join-Path $root 'kubejs/assets/gspack/textures/block/infinity_trophy_atlas.png') 16
$image=[Drawing.Image]::FromFile((Join-Path $source 'creative_singularity.png'))
$sheet=[Drawing.Bitmap]::new(16,512);$g=[Drawing.Graphics]::FromImage($sheet)
try {
    $g.InterpolationMode='NearestNeighbor';$g.PixelOffsetMode='Half'
    for($frame=0;$frame -lt 32;$frame++) {
        $state=$g.Save();$g.SetClip([Drawing.Rectangle]::new(0,16*$frame,16,16))
        $g.TranslateTransform(8,16*$frame+8);$g.RotateTransform([single]($frame*360/32))
        $g.DrawImage($image,-8,-8,16,16);$g.Restore($state)
    }
    $sheet.Save((Join-Path $out 'creative_singularity.png'),[Drawing.Imaging.ImageFormat]::Png)
} finally {$g.Dispose();$sheet.Dispose();$image.Dispose()}
[IO.File]::WriteAllText((Join-Path $out 'creative_singularity.png.mcmeta'),'{"animation":{"frametime":2,"interpolate":false,"width":16,"height":16}}'+"`n",[Text.UTF8Encoding]::new($false))
'Exported five crisp 16px cores, trophy atlas and a 32-frame Creative Singularity animation.'
