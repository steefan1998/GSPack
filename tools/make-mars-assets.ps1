# Reproducible pixel assets using the installed pack's stone/ore art.
param([string]$Instance='')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'dev-paths.ps1')
$Instance=Get-GSPackDevInstance -Instance $Instance -NoPicker
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Read-PixelTexture([string]$Jar,[string]$Entry){
 $zip=[IO.Compression.ZipFile]::OpenRead($Jar)
 try{$zipEntry=$zip.GetEntry($Entry);if(-not $zipEntry){throw "Missing texture: $Entry"};$stream=$zipEntry.Open();try{$image=[Drawing.Bitmap]::new($stream);try{return [Drawing.Bitmap]::new($image)}finally{$image.Dispose()}}finally{$stream.Dispose()}}finally{$zip.Dispose()}
}
$mods=Join-Path $Instance 'mods'
$stellaris=(Get-ChildItem $mods -Filter 'stellaris-*.jar'|Select-Object -First 1).FullName
$ato=(Get-ChildItem $mods -Filter 'alltheores-*.jar'|Select-Object -First 1).FullName
$atm=(Get-ChildItem $mods -Filter 'allthemodium-*.jar'|Select-Object -First 1).FullName
$install=Join-Path (Split-Path (Split-Path $Instance -Parent) -Parent) 'Install'
$minecraft=Join-Path $install 'versions/26.1.2/26.1.2.jar'
$mars=Read-PixelTexture $stellaris 'assets/stellaris/textures/block/mars_stone.png'
$stone=Read-PixelTexture $minecraft 'assets/minecraft/textures/block/stone.png'
$output=Join-Path $root 'kubejs/assets/gspack/textures/block'
[void][IO.Directory]::CreateDirectory($output)
try{foreach($name in @('iron','copper','gold','osmium','uranium','unobtainium')){
 $namespace=if($name -in @('osmium','uranium')){'alltheores'}elseif($name -eq 'unobtainium'){'allthemodium'}else{'minecraft'}
 $jar=if($namespace -eq 'alltheores'){$ato}elseif($namespace -eq 'allthemodium'){$atm}else{$minecraft}
 $ore=Read-PixelTexture $jar "assets/$namespace/textures/block/${name}_ore.png"
 $result=[Drawing.Bitmap]::new(16,$ore.Height)
 try{
  if($ore.Width -ne 16 -or $mars.Width -ne 16){throw 'Expected native 16px textures.'}
  for($y=0;$y -lt $ore.Height;$y++){for($x=0;$x -lt 16;$x++){
   $pixel=$ore.GetPixel($x,$y);$base=$stone.GetPixel($x,$y%16);$result.SetPixel($x,$y,$mars.GetPixel($x,$y%16))
   $saturation=[Math]::Max($pixel.R,[Math]::Max($pixel.G,$pixel.B))-[Math]::Min($pixel.R,[Math]::Min($pixel.G,$pixel.B))
   $difference=[Math]::Abs($pixel.R-$base.R)+[Math]::Abs($pixel.G-$base.G)+[Math]::Abs($pixel.B-$base.B)
   if(($name -ne 'unobtainium' -and $saturation -gt 12 -and $difference -gt 24) -or ($name -eq 'unobtainium' -and $pixel.B -gt $pixel.R+12 -and $pixel.B -gt $pixel.G+12)){$result.SetPixel($x,$y,$pixel)}
  }}
  $result.Save((Join-Path $output "mars_${name}_ore.png"),[Drawing.Imaging.ImageFormat]::Png)
  if($name -eq 'unobtainium'){
   [IO.File]::WriteAllText((Join-Path $output 'mars_unobtainium_ore.png.mcmeta'),'{"animation":{"interpolate":false,"frametime":2}}'+"`n",[Text.UTF8Encoding]::new($false))
  }
 }finally{$ore.Dispose();$result.Dispose()}
}}finally{$mars.Dispose();$stone.Dispose()}
$celestial=Join-Path $root 'kubejs/assets/gspack/textures/environment/celestial'
[void][IO.Directory]::CreateDirectory($celestial)
# Tiny irregular, cratered silhouettes; symbolic Minecraft moons, not orbit simulations.
foreach($name in @('phobos','deimos')){
 $image=[Drawing.Bitmap]::new(16,16)
 try{for($y=0;$y -lt 16;$y++){for($x=0;$x -lt 16;$x++){
  $dx=($x-7.5)/6.6;$dy=($y-7.5)/5.3
  $edge=1+0.1*[Math]::Sin($x*1.7+$y*0.6)
  if($dx*$dx+$dy*$dy -gt $edge){continue}
  $shade=[int](145-($x*3)+(($x*13+$y*7)%19))
  if(($x-6)*($x-6)+($y-6)*($y-6) -le 5 -or ($x-11)*($x-11)+($y-9)*($y-9) -le 2){$shade-=40}
  if($name -eq 'deimos'){$shade+=20}
  $image.SetPixel($x,$y,[Drawing.Color]::FromArgb(255,$shade+12,$shade+5,$shade))
 }};$image.Save((Join-Path $celestial "$name.png"),[Drawing.Imaging.ImageFormat]::Png)}finally{$image.Dispose()}
}
'Generated six 16px Mars ore textures and two transparent moon sprites.'
