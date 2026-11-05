# Package finished artwork as Minecraft sprites and a vanilla animated texture.
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Drawing
$root=Split-Path $PSScriptRoot -Parent
$source=Join-Path $root 'branding/endgame'
$out=Join-Path $root 'kubejs/feature_assets/cores/assets/gspack/textures/item'
function Export-Sprite([string]$name,[string]$destination,[int]$size=64) {
    $image=[Drawing.Image]::FromFile((Join-Path $source "$name.png"))
    $bitmap=[Drawing.Bitmap]::new($size,$size);$g=[Drawing.Graphics]::FromImage($bitmap)
    try { $g.InterpolationMode='NearestNeighbor';$g.PixelOffsetMode='Half';$g.DrawImage($image,0,0,$size,$size);$bitmap.Save($destination,[Drawing.Imaging.ImageFormat]::Png) }
    finally {$g.Dispose();$bitmap.Dispose();$image.Dispose()}
}
foreach($name in 'tech_core','arcane_core','verdant_core','dimensional_core','cosmic_core') { Export-Sprite $name (Join-Path $out "$name.png") 16 }
Export-Sprite 'infinity_trophy_atlas' (Join-Path $root 'kubejs/feature_assets/trophy/assets/gspack/textures/block/infinity_trophy_atlas.png') 16
'Exported original core and trophy artwork; Creative Singularity retained.'
