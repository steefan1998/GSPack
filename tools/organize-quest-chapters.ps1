# Change presentation metadata only; preserve saved chapter layouts and IDs.
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$definition=Get-Content (Join-Path $PSScriptRoot 'content-data/chapter-order.json') -Raw | ConvertFrom-Json
$dir=Join-Path $root 'config/ftbquests/quests'
$utf8=[Text.UTF8Encoding]::new($false)
$md5=[Security.Cryptography.MD5]::Create()
function GroupId([string]$key) {
    $hex=-join($md5.ComputeHash([Text.Encoding]::UTF8.GetBytes("group:$key"))[0..7] | ForEach-Object {$_.ToString('X2')})
    return ('{0:X}' -f ([Convert]::ToInt32([string]$hex[0],16) -band 7))+$hex.Substring(1)
}
$entries=[Collections.Generic.List[object]]::new()
foreach($key in $definition.ungrouped){$entries.Add(@{Key=$key;Group=''})}
$groups=@()
$langPath=Join-Path $dir 'lang/en_us/file.json5'
$lang=Get-Content -LiteralPath $langPath -Raw | ConvertFrom-Json
foreach($group in $definition.groups) {
    $id=GroupId $group.key; $groups+=@{id=$id}
    $lang | Add-Member -NotePropertyName "chapter_group.$id.title" -NotePropertyValue $group.title -Force
    foreach($key in $group.chapters){$entries.Add(@{Key=$key;Group=$id})}
}
$actual=@(Get-ChildItem (Join-Path $dir 'chapters') -Filter '*.json5')
if($actual.Count -ne $entries.Count){throw 'Chapter count differs from presentation definition.'}
$plans=@();$index=0
foreach($entry in $entries) {
    $path=Join-Path $dir "chapters/$($entry.Key).json5"
    $before=[IO.File]::ReadAllText($path)
    $after=[regex]::Replace($before,'(?m)^(\s*"?group"?\s*:\s*)"[^"]*"', {param($m) $m.Groups[1].Value+'"'+$entry.Group+'"'})
    $after=[regex]::Replace($after,'(?m)^(\s*"?order_index"?\s*:\s*)\d+', {param($m) $m.Groups[1].Value+[string]$index})
    $strip={param($s) [regex]::Replace($s,'(?m)^\s*"?(group|order_index)"?\s*:[^\r\n]*','')}
    if((& $strip $before) -cne (& $strip $after)){throw "Unexpected quest change: $($entry.Key)"}
    $plans+=@{Path=$path;Text=$after};$index++
}
foreach($plan in $plans){[IO.File]::WriteAllText($plan.Path,$plan.Text,$utf8)}
[IO.File]::WriteAllText((Join-Path $dir 'chapter_groups.json5'),(@{chapter_groups=$groups}|ConvertTo-Json -Depth 8)+"`n",$utf8)
[IO.File]::WriteAllText($langPath,($lang|ConvertTo-Json -Depth 20)+"`n",$utf8)
$masteryPath=Join-Path $root 'kubejs/data/gspack/mastery_chapters.json'
if(Test-Path -LiteralPath $masteryPath) {
    $mastery=Get-Content -LiteralPath $masteryPath -Raw | ConvertFrom-Json
    $sorted=@(foreach($entry in $entries){$mastery | Where-Object key -eq $entry.Key})
    if($sorted.Count -ne $mastery.Count){throw 'Mastery catalogue differs from chapter list.'}
    [IO.File]::WriteAllText($masteryPath,($sorted|ConvertTo-Json -Depth 8)+"`n",$utf8)
}
$md5.Dispose()
"Organized $($entries.Count) chapters in seven categories. Only group/order metadata changed; Cores and Endgame are last."
