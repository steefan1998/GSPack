# Author sprites directly on the final pixel grid: no scaling, filtering or rotation.
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Drawing
$root=Split-Path $PSScriptRoot -Parent
$out=Join-Path $root 'kubejs/feature_assets/cores/assets/gspack/textures/item'
$palette=@{
 ink='171425';edge='34304F';metal='62647D';light='C8D7E8';white='F5FFFF';
 gold='CF8A28';goldLight='FFDA69';brown='6E422B';green='347843';leaf='81C64C';
 cyan='36C7CE';blue='3478BE';deepBlue='243E73';purple='7845B0';violet='B778E2'
}
$colors=@{};foreach($k in $palette.Keys){$colors[$k]=[Drawing.ColorTranslator]::FromHtml('#'+$palette[$k])}
function Pixel($image,[int]$x,[int]$y,[string]$color){if($x -ge 0 -and $x -lt 16 -and $y -ge 0 -and $y -lt $image.Height){$image.SetPixel($x,$y,$colors[$color])}}
foreach($name in @('tech_core','arcane_core','verdant_core','dimensional_core','cosmic_core')){
 $b=[Drawing.Bitmap]::new(16,16)
 try{
  $tone=switch($name){tech_core{'cyan'}arcane_core{'purple'}verdant_core{'green'}dimensional_core{'blue'}cosmic_core{'violet'}}
  for($y=2;$y -le 13;$y++){for($x=2;$x -le 13;$x++){
   $d=[Math]::Abs($x-7.5)+[Math]::Abs($y-7.5)
   if($d -gt 8){continue}
   $c=if($d -gt 6){'ink'}elseif($d -gt 5){'metal'}elseif($d -gt 4){$tone}else{'edge'}
   Pixel $b $x $y $c
  }}
  switch($name){
   tech_core {
    for($i=5;$i -le 10;$i++){Pixel $b $i 5 'light';Pixel $b $i 10 'deepBlue';Pixel $b 5 $i 'light';Pixel $b 10 $i 'deepBlue'}
    for($y=6;$y -le 9;$y++){for($x=6;$x -le 9;$x++){Pixel $b $x $y 'cyan'}}
    foreach($i in @(4,7,10)){Pixel $b $i 3 'gold';Pixel $b $i 12 'gold';Pixel $b 3 $i 'gold';Pixel $b 12 $i 'gold'}
    Pixel $b 6 6 'white';Pixel $b 7 6 'white'
   }
   arcane_core {
    # A readable cut crystal and gold socket, authored one pixel at a time.
    for($y=3;$y -le 12;$y++){for($x=3;$x -le 12;$x++){
     $d=[Math]::Abs($x-7.5)+[Math]::Abs($y-7.5)
     if($d -gt 6){continue}
     $c=if($d -gt 5){'ink'}elseif($d -gt 4){'gold'}elseif($x -lt 8){'violet'}else{'purple'}
     Pixel $b $x $y $c
    }}
    foreach($p in @(@(6,4),@(5,5),@(4,6),@(7,3))){Pixel $b $p[0] $p[1] 'goldLight'}
    foreach($p in @(@(6,6),@(7,5),@(8,6),@(7,7),@(6,8),@(7,9),@(8,8))){Pixel $b $p[0] $p[1] 'ink'}
    Pixel $b 6 5 'white';Pixel $b 7 4 'light';Pixel $b 9 10 'deepBlue'
   }
   verdant_core {
    foreach($p in @(@(6,5),@(7,5),@(8,5),@(9,5),@(5,6),@(6,6),@(7,6),@(8,6),@(9,6),@(10,6),@(6,7),@(7,7),@(8,7),@(9,7))){Pixel $b $p[0] $p[1] 'leaf'}
    for($y=7;$y -le 11;$y++){Pixel $b 7 $y 'brown';Pixel $b 8 $y 'gold'}
    Pixel $b 6 5 'goldLight';Pixel $b 5 10 'green';Pixel $b 6 11 'leaf';Pixel $b 10 10 'leaf'
   }
   dimensional_core {
    for($y=4;$y -le 11;$y++){for($x=5;$x -le 10;$x++){Pixel $b $x $y $(if($x -eq 5 -or $x -eq 10 -or $y -eq 4 -or $y -eq 11){'cyan'}else{'deepBlue'})}}
    foreach($p in @(@(6,5),@(7,6),@(8,6),@(8,7),@(7,8),@(7,9),@(8,10))){Pixel $b $p[0] $p[1] 'purple'}
    Pixel $b 6 5 'white';Pixel $b 9 10 'violet'
   }
   cosmic_core {
    for($y=5;$y -le 10;$y++){for($x=5;$x -le 10;$x++){Pixel $b $x $y 'deepBlue'}}
    foreach($p in @(@(4,9),@(5,8),@(6,8),@(7,7),@(8,7),@(9,6),@(10,6),@(11,5))){Pixel $b $p[0] $p[1] 'violet'}
    Pixel $b 7 7 'white';Pixel $b 8 7 'goldLight';Pixel $b 8 8 'gold';Pixel $b 5 5 'light';Pixel $b 10 10 'cyan'
   }
  }
  $b.Save((Join-Path $out "$name.png"),[Drawing.Imaging.ImageFormat]::Png)
 }finally{$b.Dispose()}
}
# Four existing UV material quadrants: gold, dark base, purple jewel, highlights.
$atlas=[Drawing.Bitmap]::new(16,16)
try{for($y=0;$y -lt 16;$y++){for($x=0;$x -lt 16;$x++){
 $c=if($x -lt 8 -and $y -lt 8){if(($x+$y)%7 -eq 0){'goldLight'}else{'gold'}}elseif($x -ge 8 -and $y -lt 8){if(($x*3+$y)%9 -eq 0){'edge'}else{'ink'}}elseif($x -lt 8){if(($x+$y)%5 -eq 0){'violet'}else{'purple'}}else{if(($x+$y)%6 -eq 0){'white'}else{'goldLight'}}
 Pixel $atlas $x $y $c
}};$atlas.Save((Join-Path $root 'kubejs/feature_assets/trophy/assets/gspack/textures/block/infinity_trophy_atlas.png'),[Drawing.Imaging.ImageFormat]::Png)}finally{$atlas.Dispose()}
$sheet=[Drawing.Bitmap]::new(16,512)
try{for($frame=0;$frame -lt 32;$frame++){
 $dy=$frame*16
 for($y=1;$y -lt 15;$y++){for($x=1;$x -lt 15;$x++){
  $d=($x-7.5)*($x-7.5)+($y-7.5)*($y-7.5)
  if($d -gt 46 -or $d -lt 24){continue}
  Pixel $sheet $x ($y+$dy) $(if($d -gt 38){'ink'}elseif(($x+$y+[int]($frame/4))%4 -eq 0){'cyan'}else{'purple'})
 }}
 for($y=5;$y -le 10;$y++){for($x=5;$x -le 10;$x++){Pixel $sheet $x ($y+$dy) 'ink'}}
 Pixel $sheet 7 (7+$dy) 'white';Pixel $sheet 8 (7+$dy) 'cyan';Pixel $sheet 7 (8+$dy) 'violet';Pixel $sheet 8 (8+$dy) 'white'
 foreach($phase in @(0,8,16,24)){$angle=($frame+$phase)*[Math]::PI/16;$x=[int][Math]::Round(7.5+6*[Math]::Cos($angle));$y=[int][Math]::Round(7.5+6*[Math]::Sin($angle));Pixel $sheet $x ($y+$dy) 'white'}
};$sheet.Save((Join-Path $out 'creative_singularity.png'),[Drawing.Imaging.ImageFormat]::Png)}finally{$sheet.Dispose()}
[IO.File]::WriteAllText((Join-Path $out 'creative_singularity.png.mcmeta'),'{"animation":{"frametime":2,"interpolate":false,"width":16,"height":16}}'+"`n",[Text.UTF8Encoding]::new($false))
'Authored five native 16px core sprites, four-material trophy atlas and 32 pixel-drawn Singularity frames; 15-color palette, alpha 0/255 only.'
