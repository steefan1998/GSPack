# Generate mutually exclusive FancyMenu calendar layouts; no server or clock changes.
param([ValidateRange(2100,2399)][int]$EasterThroughYear = 2399)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root 'config/fancymenu/customization'
$normal = Join-Path $dir 'gspack_title_screen.txt'
$template = [IO.File]::ReadAllText($normal)
$utf8 = New-Object Text.UTF8Encoding($false)
$md5 = [Security.Cryptography.MD5]::Create()
function SeasonalId([string]$seed) {
    $hex = -join ($md5.ComputeHash([Text.Encoding]::UTF8.GetBytes("gspack-seasonal:$seed")) | ForEach-Object { $_.ToString('x2') })
    return '{0}-{1}-{2}-{3}-{4}-1793500000000' -f $hex.Substring(0,8),$hex.Substring(8,4),$hex.Substring(12,4),$hex.Substring(16,4),$hex.Substring(20,12)
}
function DateToken([string]$part) { '{"placeholder":"realtime' + $part + '","values":{"timezone":"system"}}' }
function NumberRule([string]$part,[string]$mode,[int]$value) {
    '["mode":"' + $mode + '","number":"' + (DateToken $part) + '","compare_with":"' + $value + '"]$'
}
function ContainsRule([string]$haystack,[string]$needle) {
    '["mode":"contains","text":"' + $haystack + '","compare_with":"' + $needle + '"]$'
}
# Gregorian computus. Precomputed native FancyMenu date matches avoid any KubeJS
# startup ordering dependency. Extend the supported year range with this parameter.
$easterDates = [Collections.Generic.List[string]]::new()
for ($year=2000; $year -le $EasterThroughYear; $year++) {
    $a=$year%19; $b=[math]::Floor($year/100); $c=$year%100
    $d=[math]::Floor($b/4); $e=$b%4; $f=[math]::Floor(($b+8)/25)
    $g=[math]::Floor(($b-$f+1)/3); $h=(19*$a+$b-$d-$g+15)%30
    $i=[math]::Floor($c/4); $k=$c%4; $l=(32+2*$e+2*$i-$h-$k)%7
    $m=[math]::Floor(($a+11*$h+22*$l)/451)
    $month=[int][math]::Floor(($h+$l-7*$m+114)/31)
    $day=[int](($h+$l-7*$m+114)%31+1)
    $easter=[datetime]::new($year,$month,$day)
    foreach ($offset in -2,-1,0,1) { $easterDates.Add($easter.AddDays($offset).ToString('yyyyMMdd')) }
}
$rules = [ordered]@{
    christmas = @{ Type='number'; Value=(NumberRule month equals 12) }
    halloween = @{ Type='number'; Value=((NumberRule month equals 10)+(NumberRule day bigger-than-or-equals 17)) }
    newyear = @{ Type='number'; Value=((NumberRule month equals 1)+(NumberRule day smaller-than-or-equals 2)) }
    valentine = @{ Type='number'; Value=((NumberRule month equals 2)+(NumberRule day equals 14)) }
    birthday = @{ Type='number'; Value=((NumberRule month equals 11)+(NumberRule day equals 2)) }
    easter = @{ Type='text'; Value=(ContainsRule ('|'+($easterDates -join '|')+'|') ('|'+(DateToken year)+(DateToken month)+(DateToken day)+'|')) }
    spring = @{ Type='text'; Value=(ContainsRule '|03|04|05|' ('|'+(DateToken month)+'|')) }
    summer = @{ Type='text'; Value=(ContainsRule '|06|07|08|' ('|'+(DateToken month)+'|')) }
    autumn = @{ Type='text'; Value=(ContainsRule '|09|10|11|' ('|'+(DateToken month)+'|')) }
    winter = @{ Type='text'; Value=(ContainsRule '|12|01|02|' ('|'+(DateToken month)+'|')) }
}
$events = @('christmas','halloween','newyear','valentine','birthday','easter')
foreach ($rule in $rules.Values) {
    if ($rule.Value.Length -ge 17000) { throw 'FancyMenu rejects requirement values >= 17000 characters.' }
}
function Requirements([string]$name) {
    $selected = [Collections.Generic.List[object]]::new()
    $selected.Add(@{ Name=$name; Mode='if' })
    if ($name -notin $events) { foreach ($eventName in $events) { $selected.Add(@{ Name=$eventName; Mode='if_not' }) } }
    $ids = @($selected | ForEach-Object { SeasonalId "$name-$($_.Name)-$($_.Mode)" })
    $lines = @('  [loading_requirement_container_meta:'+(SeasonalId "$name-meta")+'] = [groups:][instances:'+($ids -join ';')+';]')
    for ($j=0; $j -lt $selected.Count; $j++) {
        $entry=$selected[$j]; $rule=$rules[$entry.Name]
        $lines += '  [loading_requirement:fancymenu_visibility_requirement_is_'+$rule.Type+'][requirement_mode:'+$entry.Mode+'][req_id:'+$ids[$j]+'] = '+$rule.Value
    }
    return $lines -join "`n"
}
# Strip a previous generated calendar condition before rebuilding from the base.
$template = [regex]::Replace($template,'(?s)(layout-meta \{).*?(\n\})', {
    param($match)
    $block=$match.Value
    $block=[regex]::Replace($block,'(?m)^  \[loading_requirement[^\r\n]*\r?\n','')
    return $block.Insert($block.LastIndexOf("`n}"),"`n__CALENDAR_REQUIREMENTS__")
})
$template=$template.Replace('is_enabled = false','is_enabled = true')
foreach ($name in $rules.Keys) {
    $layout=$template.Replace('__CALENDAR_REQUIREMENTS__',(Requirements $name))
    $layout=$layout.Replace('/gspack/background.png',"/gspack/$name/background.png")
    if ($name -in @('christmas','halloween')) {
        $layout=$layout.Replace('/gspack/logo.png',"/gspack/$name/logo.png")
        $logoPath=Join-Path $root "config/fancymenu/assets/gspack/$name/logo.png"
        if (-not (Test-Path -LiteralPath $logoPath)) { throw "Missing seasonal logo: $logoPath" }
        $bytes=[IO.File]::ReadAllBytes($logoPath)
        $widthBytes=[byte[]]$bytes[16..19]; [array]::Reverse($widthBytes)
        $heightBytes=[byte[]]$bytes[20..23]; [array]::Reverse($heightBytes)
        $logoHeight=[int][math]::Round(240 * [BitConverter]::ToUInt32($heightBytes,0) / [BitConverter]::ToUInt32($widthBytes,0))
        $layout=[regex]::Replace($layout,'(?s)element \{\n  source = .*?/logo\.png.*?\n\}', {
            param($match)
            $block=$match.Value.Replace('  height = 62',"  height = $logoHeight")
            return $block.Replace('  y = -110',('  y = '+(-48-$logoHeight)))
        })
    }
    # Vanilla widget identifiers stay unchanged; custom identifiers are namespaced.
    $layout=[regex]::Replace($layout,'[a-f0-9]{8}(?:-[a-f0-9]{4}){3}-[a-f0-9]{12}-1793500000000', {
        param($match) SeasonalId "$name-$($match.Value)"
    })
    [IO.File]::WriteAllText((Join-Path $dir "gspack_title_screen_$name.txt"),$layout.Replace("`r`n","`n"),$utf8)
}
# The original normal menu is a disabled, reproducible template. Seasonal menus
# cover every date; it remains available to switch back manually in the editor.
$template=$template.Replace("`n__CALENDAR_REQUIREMENTS__",'').Replace('is_enabled = true','is_enabled = false')
[IO.File]::WriteAllText($normal,$template.Replace("`r`n","`n"),$utf8)
$md5.Dispose()
"Generated ten calendar layouts (local PC date); Easter years 2000-$EasterThroughYear."
