# Discover this installed Dev Build, then regenerate native Potions Master configs.
param([string]$Instance='')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'dev-paths.ps1')
$Instance=Get-GSPackDevInstance -Instance $Instance -NoPicker
Add-Type -AssemblyName System.IO.Compression.FileSystem
$install=Join-Path (Split-Path (Split-Path $Instance -Parent) -Parent) 'Install'
$jars=@((Get-ChildItem (Join-Path $Instance 'mods') -Filter '*.jar').FullName)+@(Join-Path $install 'versions/26.1.2/26.1.2.jar')
$tags=@{};$items=[Collections.Generic.HashSet[string]]::new();$blocks=[Collections.Generic.HashSet[string]]::new()
foreach($jar in $jars){
 $zip=[IO.Compression.ZipFile]::OpenRead($jar)
 try{foreach($entry in $zip.Entries){
  if($entry.FullName -match '^assets/([^/]+)/items/(.+)\.json$'){[void]$items.Add($Matches[1]+':'+$Matches[2])}
  if($entry.FullName -match '^assets/([^/]+)/blockstates/(.+)\.json$'){[void]$blocks.Add($Matches[1]+':'+$Matches[2])}
  if($entry.FullName -match '^data/([^/]+)/tags/block/(.+)\.json$'){
   $id=$Matches[1]+':'+$Matches[2];$reader=[IO.StreamReader]::new($entry.Open())
   try{$value=$reader.ReadToEnd()|ConvertFrom-Json}catch{continue}finally{$reader.Dispose()}
   if(-not $tags.ContainsKey($id)){$tags[$id]=@()};$tags[$id]+=@($value.values)
  }
 }}finally{$zip.Dispose()}
}
$directory=Join-Path $root '.gspack-dev';[void][IO.Directory]::CreateDirectory($directory)
[IO.File]::WriteAllText((Join-Path $directory 'potionsmaster-index.json'),(@{tags=$tags;items=@($items);blocks=@($blocks)}|ConvertTo-Json -Depth 24),[Text.UTF8Encoding]::new($false))
Push-Location $root
try{& node (Join-Path $PSScriptRoot 'make-potionsmaster-sights.mjs');if($LASTEXITCODE){throw 'Sight generation failed.'}}finally{Pop-Location}
