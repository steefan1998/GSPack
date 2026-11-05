# Export generated atlas references onto exact native UV grids with indexed colors.
param([string]$Instance='')
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression.FileSystem
$root=Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'dev-paths.ps1');$Instance=Get-GSPackDevInstance -Instance $Instance -NoPicker
$install=Join-Path (Split-Path (Split-Path $Instance -Parent) -Parent) 'Install'
$zip=[IO.Compression.ZipFile]::OpenRead((Join-Path $install 'versions/26.1.2/26.1.2.jar'))
$hex=@('211A1D','3B2221','633326','88432A','AE5934','D57747','F1A367','F4E9D6','C7BCAC','97948F','454750','192B46','3B6B95','A86C4E','527044','7B9569','A5B591','329E99')
$colors=@($hex|ForEach-Object{[Drawing.ColorTranslator]::FromHtml('#'+$_)})
try{foreach($name in @('creeper','enderman','villager','pillager')){
 $relative=switch($name){pillager{'illager/pillager'}default{"$name/$name"}}
 $stream=$zip.GetEntry("assets/minecraft/textures/entity/$relative.png").Open()
 $native=[Drawing.Bitmap]::new($stream);$source=[Drawing.Bitmap]::new((Join-Path $root "branding/mars-mobs/$name-master.png"))
 $result=[Drawing.Bitmap]::new($native.Width,$native.Height)
 try{for($y=0;$y -lt $native.Height;$y++){for($x=0;$x -lt $native.Width;$x++){
  $base=$native.GetPixel($x,$y);if($base.A -eq 0){continue}
  $sx=[Math]::Min($source.Width-1,[int][Math]::Floor(($x+0.5)*$source.Width/$native.Width))
  $sy=[Math]::Min($source.Height-1,[int][Math]::Floor(($y+0.5)*$source.Height/$native.Height))
  $pixel=$source.GetPixel($sx,$sy)
  if($pixel.A -lt 100){$pixel=if($name -eq 'pillager'){$colors[15]}elseif($name -eq 'villager'){$colors[7]}else{$colors[2]}}
  if($name -eq 'creeper' -and $x -ge 8 -and $x -lt 16 -and $y -ge 8 -and $y -lt 16 -and ($base.R+$base.G+$base.B) -lt 120){$pixel=$colors[0]}
  $best=$colors[0];$distance=[double]::PositiveInfinity
  foreach($color in $colors){$d=($pixel.R-$color.R)*($pixel.R-$color.R)+($pixel.G-$color.G)*($pixel.G-$color.G)+($pixel.B-$color.B)*($pixel.B-$color.B);if($d -lt $distance){$distance=$d;$best=$color}}
  $result.SetPixel($x,$y,[Drawing.Color]::FromArgb(255,$best.R,$best.G,$best.B))
 }}
 $folder=Join-Path $root ('kubejs/feature_assets/mars/assets/minecraft/optifine/random/entity/'+(Split-Path $relative -Parent))
 [void][IO.Directory]::CreateDirectory($folder)
 $result.Save((Join-Path $folder "${name}2.png"),[Drawing.Imaging.ImageFormat]::Png)
 [IO.File]::WriteAllText((Join-Path $folder "$name.properties"),"# The installed ETF checks the dimension TYPE key.`nskins.1=2`ndimension.1=gspack:mars`nskins.2=1`n",[Text.UTF8Encoding]::new($false))
 }finally{$result.Dispose();$source.Dispose();$native.Dispose();$stream.Dispose()}
}}finally{$zip.Dispose()}
# Suppress the plain robe/profession overlays on Mars, so the spaceman suit is visible.
foreach($relative in @('villager/type/plains','villager/profession/cartographer')){
 $folder=Join-Path $root ('kubejs/feature_assets/mars/assets/minecraft/optifine/random/entity/'+(Split-Path $relative -Parent));[void][IO.Directory]::CreateDirectory($folder)
 $name=Split-Path $relative -Leaf;$image=[Drawing.Bitmap]::new(64,64)
 try{$image.Save((Join-Path $folder "${name}2.png"),[Drawing.Imaging.ImageFormat]::Png)}finally{$image.Dispose()}
 [IO.File]::WriteAllText((Join-Path $folder "$name.properties"),"skins.1=2`ndimension.1=gspack:mars`nskins.2=1`n",[Text.UTF8Encoding]::new($false))
}
'Exported four Mars-only native-resolution entity skins with an 18-color palette and original alpha masks.'
