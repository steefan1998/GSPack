# KubeJS 8 natively loads ZIP resource packs in kubejs/assets. Keep readable feature sources.
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$root=Split-Path $PSScriptRoot -Parent
$features=Join-Path $root 'kubejs/feature_assets'
if(-not(Test-Path $features)){return}
$utf8=[Text.UTF8Encoding]::new($false)
foreach($name in @('mars','cores','trophy')){
 $source=Join-Path $features $name
 if(-not(Test-Path $source)){continue}
 $meta=@{pack=@{description="GSPack $name assets";min_format=@(84,0);max_format=@(84,0);pack_format=84}}|ConvertTo-Json -Depth 6
 [IO.File]::WriteAllText((Join-Path $source 'pack.mcmeta'),$meta+"`n",$utf8)
 $destination=Join-Path $root "kubejs/assets/gspack_$name.zip"
 $temporary=Join-Path $root ".gspack-dev/feature-$name.zip"
 [void][IO.Directory]::CreateDirectory((Split-Path $temporary))
 if(Test-Path $temporary){Remove-Item -LiteralPath $temporary}
 [IO.Compression.ZipFile]::CreateFromDirectory($source,$temporary,[IO.Compression.CompressionLevel]::Optimal,$false)
 # ZipFile preserves per-file mtimes; compare contents, not archive timestamps.
 $same=Test-Path $destination
 if($same){
  $old=[IO.Compression.ZipFile]::OpenRead($destination);$new=[IO.Compression.ZipFile]::OpenRead($temporary)
  try{
   $same=$old.Entries.Count -eq $new.Entries.Count
   foreach($entry in $new.Entries){$previous=$old.GetEntry($entry.FullName);if(-not $previous -or $previous.Length -ne $entry.Length){$same=$false;break};$a=$entry.Open();$b=$previous.Open();try{$sha=[Security.Cryptography.SHA256]::Create();$same=[Convert]::ToBase64String($sha.ComputeHash($a)) -eq [Convert]::ToBase64String($sha.ComputeHash($b));$sha.Dispose()}finally{$a.Dispose();$b.Dispose()};if(-not $same){break}}
  }finally{$old.Dispose();$new.Dispose()}
 }
 if(-not $same){Copy-Item -LiteralPath $temporary -Destination $destination -Force}
 Remove-Item -LiteralPath $temporary
}
'Packed native KubeJS Mars, Cores and Trophy asset archives; resource identifiers preserved.'
