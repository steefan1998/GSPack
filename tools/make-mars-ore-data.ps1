# Preserve native loot and ore/tool tags for Mars surface variants.
param([string]$Instance='')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'dev-paths.ps1')
$Instance=Get-GSPackDevInstance -Instance $Instance -NoPicker
Add-Type -AssemblyName System.IO.Compression.FileSystem
$install=Join-Path (Split-Path (Split-Path $Instance -Parent) -Parent) 'Install'
$vanilla=Join-Path $install 'versions/26.1.2/26.1.2.jar'
$ato=(Get-ChildItem (Join-Path $Instance 'mods') -Filter 'alltheores-*.jar'|Select-Object -First 1).FullName
$atm=(Get-ChildItem (Join-Path $Instance 'mods') -Filter 'allthemodium-*.jar'|Select-Object -First 1).FullName
$tags=@{}
function Write-Data([string]$relative,$value){$p=Join-Path $root "kubejs/data/$relative";[void][IO.Directory]::CreateDirectory((Split-Path $p));[IO.File]::WriteAllText($p,($value|ConvertTo-Json -Depth 60)+"`n",[Text.UTF8Encoding]::new($false))}
foreach($name in @('iron','copper','gold','osmium','uranium','unobtainium')){
 $ns=if($name -in @('osmium','uranium')){'alltheores'}elseif($name -eq 'unobtainium'){'allthemodium'}else{'minecraft'}
 $jar=if($ns -eq 'alltheores'){$ato}elseif($ns -eq 'allthemodium'){$atm}else{$vanilla}
 $old="${ns}:${name}_ore";$id="gspack:mars_${name}_ore"
 $zip=[IO.Compression.ZipFile]::OpenRead($jar)
 try{
  $entry=$zip.GetEntry("data/$ns/loot_table/blocks/${name}_ore.json")
  $reader=[IO.StreamReader]::new($entry.Open());try{$loot=$reader.ReadToEnd().Replace('"'+$old+'"','"'+$id+'"')|ConvertFrom-Json}finally{$reader.Dispose()}
  Write-Data "gspack/loot_table/blocks/mars_${name}_ore.json" $loot
  foreach($entry in $zip.Entries|Where-Object FullName -Match '^data/[^/]+/tags/(block|item)/.*\.json$'){
   $reader=[IO.StreamReader]::new($entry.Open());try{$tag=$reader.ReadToEnd()|ConvertFrom-Json}finally{$reader.Dispose()}
   if($name -eq 'unobtainium' -and $entry.FullName -match '/ores_in_ground/end_stone.json$'){continue}
   if($tag.values -contains $old){$path=$entry.FullName.Substring(5);if(-not $tags.ContainsKey($path)){$tags[$path]=[Collections.Generic.List[string]]::new()};$tags[$path].Add($id)}
  }
 }finally{$zip.Dispose()}
 # Convention tags supplement native tags for machine processing.
 foreach($kind in @('item','block')){foreach($tag in @('ores',"ores/$name",'ores_in_ground/stone')){$p="c/tags/$kind/$tag.json";if(-not $tags.ContainsKey($p)){$tags[$p]=[Collections.Generic.List[string]]::new()};$tags[$p].Add($id)}}
 $featurePath=Join-Path $root "kubejs/data/gspack/worldgen/configured_feature/mars_${name}.json"
 $feature=Get-Content $featurePath -Raw|ConvertFrom-Json;$feature.config.targets[0].state.Name=$id
 Write-Data "gspack/worldgen/configured_feature/mars_${name}.json" $feature
}
foreach($p in $tags.Keys){
 $existing=Join-Path $root "kubejs/data/$p";$values=@()
 if(Test-Path $existing){$values=@((Get-Content $existing -Raw|ConvertFrom-Json).values)}
 Write-Data $p @{replace=$false;values=@(@($values)+@($tags[$p])|Sort-Object -Unique)}
}
$feature=@{type='minecraft:ore';config=@{size=2;discard_chance_on_air_exposure=0.5;targets=@(@{target=@{predicate_type='minecraft:block_match';block='gspack:mars_stone'};state=@{Name='gspack:mars_unobtainium_ore'}})}}
Write-Data 'gspack/worldgen/configured_feature/mars_unobtainium.json' $feature
$placed=@{feature='gspack:mars_unobtainium';placement=@(@{type='minecraft:rarity_filter';chance=8},@{type='minecraft:in_square'},@{type='minecraft:height_range';height=@{type='minecraft:uniform';min_inclusive=@{absolute=-48};max_inclusive=@{absolute=16}}},@{type='minecraft:biome'})}
Write-Data 'gspack/worldgen/placed_feature/mars_unobtainium.json' $placed
$biomePath=Join-Path $root 'kubejs/data/gspack/worldgen/biome/mars.json'
$biome=Get-Content $biomePath -Raw|ConvertFrom-Json
$biome.features[6]=@(@($biome.features[6])+@('gspack:mars_unobtainium')|Select-Object -Unique)
Write-Data 'gspack/worldgen/biome/mars.json' $biome
'Generated six Mars ore variants; rare protected Unobtainium below Y=17 (one placement attempt per eight chunks, vein size 2).'
