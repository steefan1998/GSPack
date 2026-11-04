# Builds the GSPack FTB Quests data (config/ftbquests/quests, JSON5 format for FTB Quests 26.1)
# from the chapter scripts in tools/content.
# Usage:  powershell -ExecutionPolicy Bypass -File tools\build-quests.ps1 [-ItemList <file with ns:id per line>]
param([string]$ItemList = '')

$ErrorActionPreference = 'Stop'
$Root = Split-Path $PSScriptRoot -Parent
$Out = Join-Path $Root 'config\ftbquests\quests'
$Inv = [Globalization.CultureInfo]::InvariantCulture
$Utf8 = New-Object System.Text.UTF8Encoding($false)
$Md5 = [Security.Cryptography.MD5]::Create()

$script:Lang = @{}          # lang file -> @{ key = value }
$script:UsedItems = New-Object System.Collections.Generic.List[string]
$script:Tables = [ordered]@{}
$script:Groups = [ordered]@{}
$script:Chapters = New-Object System.Collections.Generic.List[object]
$script:Cur = $null

# Stable 16-hex IDs derived from a seed, so rebuilding never breaks player progress.
# The first digit is kept below 8 so the ID is a positive long. $Small keeps it below 2^52
# (used for reward tables, whose ID is stored as a JSON number in table_id).
function New-Id([string]$seed, [switch]$Small) {
    $h = $Md5.ComputeHash([Text.Encoding]::UTF8.GetBytes($seed))
    $hex = -join ($h[0..7] | ForEach-Object { $_.ToString('X2') })
    if ($Small) { return '000' + $hex.Substring(3) }
    ('{0:X}' -f ([Convert]::ToInt32([string]$hex[0], 16) -band 7)) + $hex.Substring(1)
}

# ---------- JSON5 writer (unquoted keys, trailing commas, like FTB Quests itself) ----------
function Json-Str([string]$s) {
    $sb = New-Object System.Text.StringBuilder('"')
    foreach ($ch in $s.ToCharArray()) {
        switch ($ch) {
            '"' { [void]$sb.Append('\"') } '\' { [void]$sb.Append('\\') }
            "`n" { [void]$sb.Append('\n') } "`r" { } "`t" { [void]$sb.Append('\t') }
            default { if ([int]$ch -lt 32) { [void]$sb.Append(('\u{0:x4}' -f [int]$ch)) } else { [void]$sb.Append($ch) } }
        }
    }
    [void]$sb.Append('"'); $sb.ToString()
}
function Json-Key([string]$k) { if ($k -match '^[A-Za-z_][A-Za-z0-9_]*$') { $k } else { Json-Str $k } }
function To-Json5($v, [string]$ind = '') {
    $in2 = $ind + '  '
    if ($null -eq $v) { return 'null' }
    if ($v -is [System.Collections.IDictionary]) {
        if ($v.Count -eq 0) { return '{ }' }
        $rows = foreach ($k in $v.Keys) { "$in2$(Json-Key $k): $(To-Json5 $v[$k] $in2)," }
        return "{`n$($rows -join "`n")`n$ind}"
    }
    if ($v -is [string]) { return Json-Str $v }
    if ($v -is [bool]) { return $(if ($v) { 'true' } else { 'false' }) }
    if ($v -is [double] -or $v -is [single]) { return ([double]$v).ToString('0.0###', $Inv) }
    if ($v -is [int] -or $v -is [long]) { return $v.ToString($Inv) }
    if ($v -is [System.Collections.IEnumerable]) {
        $items = @($v)
        if ($items.Count -eq 0) { return '[ ]' }
        $rows = foreach ($i in $items) { "$in2$(To-Json5 $i $in2)," }
        return "[`n$($rows -join "`n")`n$ind]"
    }
    throw "Cannot serialize $($v.GetType())"
}

# An item can carry data components: ns:item[component.field=value,...], for example
# thaumaturge:essentia_crystal[thaumaturge:crystal_aspect.aspect=thaumaturge:aer] (an Air Vis Crystal).
function Item-Obj([string]$id) {
    if ($id -notmatch '^([^\[]+)\[(.+)\]$') { $script:UsedItems.Add($id); return [ordered]@{ count = 1; id = $id } }
    $base = $Matches[1]; $script:UsedItems.Add($base)
    $comps = [ordered]@{}
    foreach ($pair in ($Matches[2] -split ',')) {
        $key, $value = $pair -split '=', 2
        $type, $field = $key -split '\.(?=[^.:]+$)', 2
        if ($field) {
            if (-not $comps.Contains($type)) { $comps[$type] = [ordered]@{} }
            $comps[$type][$field] = $value
        } else { $comps[$type] = $value }
    }
    [ordered]@{ count = 1; id = $base; components = $comps }
}
function Split-Count([string]$spec) {
    if ($spec -match '^(.+)\*(\d+)$') { return @($Matches[1], [int]$Matches[2]) }
    return @($spec, 1)
}
function Set-Lang([string]$file, [string]$key, $value) {
    if (-not $script:Lang.ContainsKey($file)) { $script:Lang[$file] = @{} }
    # FTB Quests treats '&' as a formatting code; a literal '&' before whitespace must be written as '\&'.
    $value = if ($value -is [array]) { , @($value | ForEach-Object { $_ -replace '&(?=\s|$)', '\&' }) } else { $value -replace '&(?=\s|$)', '\&' }
    $script:Lang[$file][$key] = $value
}
# Descriptions: one line per text line (here-strings) or '|'; leading/trailing blank lines are dropped.
function Desc-Lines([string]$desc) {
    if (-not $desc) { return , @() }
    $lines = @($desc -split "\r?\n|\|" | ForEach-Object { $_.TrimEnd() })
    while ($lines.Count -and $lines[0] -eq '') { $lines = @($lines | Select-Object -Skip 1) }
    while ($lines.Count -and $lines[-1] -eq '') { $lines = @($lines | Select-Object -SkipLast 1) }
    return , $lines
}
function Use-Id([string]$id) { if ($id -notmatch '^#') { $script:UsedItems.Add($id) } }

# Task specs: ns:item*N | check | dim:<id> | biome:<id> | kill:<entity>*N | struct:<id or #tag>
#             adv:<advancement> | levels:N | look:<block id>
#             stage:<stage>[@<icon item>][|<title>]   (FTB Quests "gamestage" task, set by KubeJS, see kubejs/server_scripts)
$script:TaskTitles = @{}
$script:TagStages = [ordered]@{}   # stage -> @(item tag, count), written to kubejs/server_scripts/gspack_quest_tags.js

# Unified materials (kubejs/startup_scripts/gspack_unify_table.js): an item task for any of these items accepts every
# mod's version, so it becomes a tag task. item id -> @(tag, preferred item)
$script:UnifyTag = @{}
foreach ($m in [regex]::Matches([IO.File]::ReadAllText((Join-Path $Root 'kubejs\startup_scripts\gspack_unify_table.js')), "\['([^']+)', '([^']+)', \[([^\]]*)\]\]")) {
    $tag = $m.Groups[1].Value; $pref = $m.Groups[2].Value
    foreach ($i in @($pref) + @([regex]::Matches($m.Groups[3].Value, "'([^']+)'") | ForEach-Object { $_.Groups[1].Value })) { $script:UnifyTag[$i] = @($tag, $pref) }
}
# A readable name for a material tag: c:ingots/osmium -> Osmium Ingot(s), c:raw_materials/tin -> Raw Tin, ...
function Tag-Title([string]$tag, [int]$n) {
    $kind, $mat = ($tag -replace '^c:', '') -split '/', 2
    if (-not $mat) { $mat = $kind; $kind = 'material' }
    $name = (($mat -split '_') | ForEach-Object { $_.Substring(0, 1).ToUpper() + $_.Substring(1) }) -join ' '
    $s = if ($n -gt 1) { 's' } else { '' }
    $label = switch ($kind) {
        'ingots' { "$name Ingot$s" } 'nuggets' { "$name Nugget$s" } 'dusts' { "$name Dust" } 'plates' { "$name Plate$s" }
        'gears' { "$name Gear$s" } 'rods' { "$name Rod$s" } 'gems' { $name } 'raw_materials' { "Raw $name" }
        'storage_blocks' { "Block$s of $name" }
        default { $name }
    }
    "$n $label (any mod)"
}
function Task-Obj([string]$spec, [string]$seed) {
    $o = [ordered]@{ id = (New-Id $seed) }
    switch -regex ($spec) {
        '^check$' { $o.type = 'checkmark'; return $o }
        '^stage:([^@|]+)(?:@([^|]+))?(?:\|(.+))?$' {
            $o.type = 'gamestage'; $o.stage = $Matches[1]; $o.team_stage = $false
            if ($Matches[2]) { $o.icon = Item-Obj $Matches[2] }
            if ($Matches[3]) { $script:TaskTitles[$o.id] = $Matches[3] }
            return $o
        }
        # tag:<item tag>*N@<icon>[|<title>]: N items of any mod's version (a KubeJS stage, see gspack_quest_tags.js)
        '^tag:#?([a-z0-9_.-]+:[a-z0-9_/.-]+)(?:\*(\d+))?@([^|]+)(?:\|(.+))?$' {
            $tag = $Matches[1]; $n = $(if ($Matches[2]) { [int]$Matches[2] } else { 1 })
            $stage = 'gspack_tag_' + ($tag -replace '[^a-z0-9]+', '_') + "_$n"
            $script:TagStages[$stage] = @($tag, $n)
            $o.type = 'gamestage'; $o.stage = $stage; $o.team_stage = $false; $o.icon = Item-Obj $Matches[3]
            $script:TaskTitles[$o.id] = $(if ($Matches[4]) { $Matches[4] } else { "${n}x #$tag (any mod)" })
            return $o
        }
        '^dim:(.+)$' { $o.type = 'dimension'; $o.dimension = $Matches[1]; Use-Id $Matches[1]; return $o }
        '^biome:(.+)$' { $o.type = 'biome'; $o.biome = $Matches[1]; Use-Id $Matches[1]; return $o }
        '^kill:(.+)$' { $e, $n = Split-Count $Matches[1]; $o.type = 'kill'; $o.entity = $e; $o.value = [long]$n; Use-Id $e; return $o }
        '^struct:(.+)$' { $o.type = 'structure'; $o.structure = $Matches[1]; Use-Id $Matches[1]; return $o }
        '^adv:(.+)$' { $o.type = 'advancement'; $o.advancement = $Matches[1]; $o.criterion = ''; return $o }
        '^levels:(\d+)$' { $o.type = 'xp'; $o.value = [long]$Matches[1]; $o.points = $false; return $o }
        '^look:(.+)$' { $o.type = 'observation'; $o.observe_type = 'block'; $o.to_observe = $Matches[1]; $o.timer = [long]0; Use-Id $Matches[1]; return $o }
        default {
            $item, $n = Split-Count $spec
            if ($script:UnifyTag.ContainsKey($item)) {
                # A unified material: accept any mod's version.
                $tag, $pref = $script:UnifyTag[$item]
                return Task-Obj "tag:$tag*$n@$pref|$(Tag-Title $tag $n)" $seed
            }
            $o.type = 'item'; $o.item = Item-Obj $item
            if ($n -gt 1) { $o.count = [long]$n }
            # Items with components (ns:item[...]) must match those components; other components are ignored.
            if ($o.item.Contains('components')) { $o.match_components = 'fuzzy' }
            return $o
        }
    }
}

# Reward specs: xp:N | lvl:N | table:<name> (random roll) | choice:<name> (player picks) | ns:item*count
function Reward-Obj([string]$spec, [string]$seed, $Weight = $null) {
    $o = [ordered]@{ id = (New-Id $seed) }
    switch -regex ($spec) {
        '^xp:(\d+)$' { $o.type = 'xp'; $o.xp = [int]$Matches[1] }
        '^lvl:(\d+)$' { $o.type = 'xp_levels'; $o.xp_levels = [int]$Matches[1] }
        '^(table|choice):(.+)$' {
            $t = $script:Tables[$Matches[2]]
            if (-not $t) { throw "Unknown reward table '$($Matches[2])'" }
            $o.type = $(if ($Matches[1] -eq 'table') { 'random' } else { 'choice' })
            $o.table_id = [Convert]::ToInt64($t.Id, 16)
        }
        default {
            $item, $n = Split-Count $spec
            $o.type = 'item'; $o.item = Item-Obj $item
            if ($n -gt 1) { $o.count = [int]$n }
        }
    }
    if ($null -ne $Weight) { $o.weight = [double]$Weight }
    $o
}

function QGroup([string]$key, [string]$title) {
    $id = New-Id "group:$key"
    $script:Groups[$key] = $id
    Set-Lang 'file' "chapter_group.$id.title" $title
}

# Table entries: 'spec@weight', e.g. 'minecraft:diamond*2@10' or 'xp:200@5'
function Table([string]$key, [string]$title, [string[]]$entries, [int]$rolls = 1) {
    $script:Tables[$key] = @{ Key = $key; Id = (New-Id "table:$key" -Small); Title = $title; Entries = $entries; Rolls = $rolls; Order = $script:Tables.Count }
}

# -showlines: draw dependency lines in this chapter (only for hand-placed chapters; the auto layout makes them cross).
function Chapter([string]$key, [string]$title, [string]$icon, [string]$group = '', [string]$sub = '', [switch]$hidelines, [switch]$showlines) {
    $script:Cur = @{ Key = $key; Id = (New-Id "chapter:$key"); Title = $title; Icon = $icon; Group = $group; Sub = $sub; HideLines = [bool]$hidelines; ShowLines = [bool]$showlines; Quests = (New-Object System.Collections.Generic.List[object]); ByKey = @{} }
    $script:Chapters.Add($script:Cur)
}

# Q <key> <title> <tasks ;-separated> <deps ,-separated> <rewards ;-separated> <description, | = new line>
function Q {
    param([string]$key, [string]$title, [string]$tasks, [string]$deps = '', [string]$rewards = '', [string]$desc = '',
        [string]$sub = '', [string]$shape = '', [double]$size = 0, [string]$icon = '', [string]$pos = '', [switch]$opt, [switch]$any, [switch]$hidelines)
    # A standard 16-item collection is a discovery task: one item is enough.
    # Apply only to task specifications, never to reward quantities.
    $tasks = (($tasks -split ';' | ForEach-Object {
        if ($_ -match '\*16(?=@|\||$)') {
            ($_ -replace '\*16(?=@|\||$)', '*1') -replace '\|16 ', '|1 '
        } else { $_ }
    }) -join ';')
    $c = $script:Cur
    if ($c.ByKey.ContainsKey($key)) { throw "Duplicate quest key '$key' in chapter $($c.Key)" }
    # Chapters are self-contained: references to chapter/key must not gate quests.
    $localDeps = @($deps -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -and $_ -notmatch '/' })
    $q = @{ Key = $key; Id = (New-Id "quest:$($c.Key):$key"); Title = $title; Sub = $sub; Desc = $desc; Shape = $shape; Size = $size; Icon = $icon; Opt = $opt; Any = $any; HideLines = $hidelines; ExplicitHideLines = [bool]$hidelines
        Tasks = @($tasks -split ';' | Where-Object { $_ }); Rewards = @($rewards -split ';' | Where-Object { $_ })
        Deps = @($localDeps); OriginalDeps = @($localDeps); Pos = $pos }
    # A dependency is a quest key in this chapter, or 'chapter/key' for a quest in another chapter.
    # They are checked after all content is loaded, so order in the file does not matter.
    $c.Quests.Add($q); $c.ByKey[$key] = $q; $script:AllQuests["$($c.Key)/$key"] = $q
}
$script:AllQuests = @{}
function Dep-Quest($c, [string]$d) { if ($d -match '/') { $script:AllQuests[$d] } else { $c.ByKey[$d] } }

# Tree layout: column = dependency depth, row = nearest free slot to the parents' average row.
function Layout($c) {
    # Shared visual language across the book; stable IDs and gameplay are untouched.
    $c.ShowLines = -not $c.HideLines
    foreach ($q in $c.Quests) {
        $q.HideLines = [bool]$c.HideLines -or [bool]$q.ExplicitHideLines
        if ($q.Size -ge 1.25) { $q.Shape = 'gear'; $q.Size = 1.3 }
        elseif (-not $q.Deps.Count) { $q.Shape = 'hexagon'; $q.Size = 1.15 }
        elseif ($q.Opt) { $q.Shape = 'diamond'; $q.Size = 1.0 }
        elseif ($q.Tasks -contains 'check') { $q.Shape = 'circle'; $q.Size = 1.0 }
        else { $q.Shape = $(if ($q.Deps.Count -gt 1) { 'hexagon' } else { 'circle' }); $q.Size = 1.0 }
    }
    foreach ($q in $c.Quests) {
        foreach ($d in $q.Deps) {
            if (-not (Dep-Quest $c $d)) { throw "Quest '$($q.Key)' in chapter $($c.Key) depends on unknown '$d'" }
        }
        # A chapter's starting quests must not wait for another chapter: every chapter is open from the start.
        if ($q.Deps.Count -and -not @($q.Deps | Where-Object { $_ -notmatch '/' }).Count) {
            Write-Warning "Starting quest '$($q.Key)' in chapter $($c.Key) only depends on other chapters ($($q.Deps -join ', '))"
        }
    }
    # Topological order (parents first), keeping file order where possible.
    $ordered = New-Object System.Collections.Generic.List[object]; $state = @{}
    $visit = {
        param($q)
        if ($state[$q.Key] -eq 2) { return }
        if ($state[$q.Key] -eq 1) { throw "Dependency loop at '$($q.Key)' in chapter $($c.Key)" }
        $state[$q.Key] = 1
        foreach ($d in $q.Deps) { if ($d -notmatch '/') { & $visit $c.ByKey[$d] } }
        $state[$q.Key] = 2; $ordered.Add($q)
    }
    foreach ($q in $c.Quests) { & $visit $q }

    $d = $script:Decor[$c.Key]
    $labels = if ($d) { $d.Labels } else { @{} }
    $c.LabelPos = @{}
    if ($c.LayoutVariant) { Layout-Variant $c $ordered $labels; return }
    # Chapters with hand-placed quests (Seed Codex) keep their positions.
    if (@($c.Quests | Where-Object { $_.Pos }).Count -eq $c.Quests.Count) {
        foreach ($q in $c.Quests) { $p = $q.Pos -split ','; $q.X = [double]::Parse($p[0], $Inv); $q.Y = [double]::Parse($p[1], $Inv) }
        if ($c.BranchGroups) {
            foreach ($q in $c.Quests) {
                $q.HideLines = [bool]$q.ExplicitHideLines -or [bool]@($q.Deps | Where-Object { $_ -match '/' -or $c.BranchGroups[$_] -ne $c.BranchGroups[$q.Key] }).Count
            }
        }
        if ($c.Key -eq 'welcome') { $c.ByKey['start'].HideLines = $true }
        return
    }

    # Category trees in two columns. Each tree grows downward and fans out
    # into compact sibling rows; labels have a dedicated gutter on the left.
    $secOf = @{}; $sections = [Collections.Generic.List[string]]::new()
    $sections.Add(''); $current = ''
    foreach ($q in $c.Quests) {
        if ($labels.ContainsKey($q.Key)) { $current = $q.Key; $sections.Add($current) }
        $secOf[$q.Key] = $current
    }
    $c.LabelAnchors = @{}
    $panel = 0; $pairY = 0.0; $pairHeight = 0.0
    foreach ($section in $sections) {
        $members = @($ordered | Where-Object { $secOf[$_.Key] -eq $section })
        if (-not $members.Count) { continue }
        $depths = @{}; $layers = @{}
        foreach ($q in $members) {
            $depth = 0
            foreach ($dep in $q.Deps) {
                if ($dep -notmatch '/' -and $secOf[$dep] -eq $section) {
                    $depth = [Math]::Max($depth, [int]$depths[$dep] + 1)
                }
            }
            $depths[$q.Key] = $depth
            if (-not $layers.ContainsKey($depth)) { $layers[$depth] = [Collections.Generic.List[object]]::new() }
            $layers[$depth].Add($q)
        }
        $centreX = ($panel % 2) * 21.0
        $rowY = $pairY + 1.5
        $left = $centreX
        foreach ($depth in @($layers.Keys | Sort-Object)) {
            $layer = @($layers[$depth])
            for ($i = 0; $i -lt $layer.Count; $i++) {
                $row = [int][Math]::Floor($i / 6)
                $count = [Math]::Min(6, $layer.Count - $row * 6)
                $q = $layer[$i]
                $q.X = $centreX + (($i % 6) - ($count - 1) / 2.0) * 2.2
                $q.Y = $rowY + $row * 2.2
                $left = [Math]::Min($left, $q.X)
            }
            $rowY += [Math]::Ceiling($layer.Count / 6.0) * 2.2
        }
        if ($section) {
            $c.LabelAnchors[$section] = '{0},{1}' -f ($left - 1.1).ToString($Inv), ($pairY + 1.5).ToString($Inv)
        }
        $pairHeight = [Math]::Max($pairHeight, $rowY - $pairY + 2.5)
        $panel++
        if ($panel % 2 -eq 0) { $pairY += $pairHeight; $pairHeight = 0.0 }
    }
    # FTB hides dependency lines per quest, rather than per edge. Hide lines
    # on quests spanning categories so distant prerequisites do not cut across
    # the entire chapter. The dependencies themselves remain fully intact.
    foreach ($q in $c.Quests) {
        $q.HideLines = [bool]$q.ExplicitHideLines -or [bool]@($q.Deps | Where-Object {
            $_ -match '/' -or $secOf[$_] -ne $secOf[$q.Key]
        }).Count
    }
}

# ---------- Chapter images: pixel-style banners rendered to PNG, loaded in-game via kubejs/assets ----------
$RowStep = 1.5                                   # vertical quest spacing
$ColStep = 1.6                                   # horizontal quest spacing
$LabelSpace = 1.2                                # room above a section for its label
$SectionGap = 1.4                                # space between two sections
$LabelHeight = 0.6                               # section label height in quest units
$GridCols = 6                                    # loose quests per row
$TexDir = Join-Path $Root 'kubejs\assets\gspack\textures\quests'
$TexScale = 4                                    # render small, scale up with nearest neighbour = crisp pixels
$script:Decor = @{}
Add-Type -AssemblyName System.Drawing

# Decorate <chapter key> <accent #rrggbb> @{ questKey = 'Label text'; ... }
function Decorate([string]$chapter, [string]$color, [hashtable]$labels = @{}) { $script:Decor[$chapter] = @{ Color = $color; Labels = $labels } }

function Hex-Color([string]$hex, [int]$a = 255) { $c = [Drawing.ColorTranslator]::FromHtml($hex); [Drawing.Color]::FromArgb($a, $c.R, $c.G, $c.B) }
function Shade([Drawing.Color]$c, [double]$f, [int]$a = 255) { [Drawing.Color]::FromArgb($a, [int]($c.R * $f), [int]($c.G * $f), [int]($c.B * $f)) }

function Draw-Panel($g, [int]$w, [int]$h, [Drawing.Color]$accent) {
    $bg = New-Object Drawing.SolidBrush ([Drawing.Color]::FromArgb(232, 18, 18, 26))
    $g.FillRectangle($bg, 1, 1, $w - 2, $h - 2)
    $g.FillRectangle($bg, 2, 0, $w - 4, 1); $g.FillRectangle($bg, 2, $h - 1, $w - 4, 1)
    $edge = New-Object Drawing.SolidBrush $accent
    $dark = New-Object Drawing.SolidBrush (Shade $accent 0.45)
    # Bevelled 1px frame with cut corners, light on top/left and dark on bottom/right.
    $g.FillRectangle($edge, 2, 0, $w - 4, 1); $g.FillRectangle($edge, 0, 2, 1, $h - 4)
    $g.FillRectangle($edge, 1, 1, 1, 1); $g.FillRectangle($edge, $w - 2, 1, 1, 1)
    $g.FillRectangle($dark, 2, $h - 1, $w - 4, 1); $g.FillRectangle($dark, $w - 1, 2, 1, $h - 4)
    $g.FillRectangle($dark, 1, $h - 2, 1, 1); $g.FillRectangle($dark, $w - 2, $h - 2, 1, 1)
    $g.FillRectangle($edge, $w - 1, 2, 1, 1); $g.FillRectangle($dark, 0, $h - 3, 1, 1)
}

function Draw-Text($g, [string]$text, [Drawing.Font]$font, [Drawing.Color]$color, [int]$cx, [int]$y) {
    $sz = $g.MeasureString($text, $font, 2000, [Drawing.StringFormat]::GenericTypographic)
    $x = [int]($cx - $sz.Width / 2)
    $fmt = [Drawing.StringFormat]::GenericTypographic
    $g.DrawString($text, $font, (New-Object Drawing.SolidBrush ([Drawing.Color]::FromArgb(255, 10, 10, 14))), [float]($x + 1), [float]($y + 1), $fmt)
    $g.DrawString($text, $font, (New-Object Drawing.SolidBrush $color), [float]$x, [float]$y, $fmt)
}

function Save-Scaled([Drawing.Bitmap]$bmp, [string]$file) {
    $big = New-Object Drawing.Bitmap ($bmp.Width * $TexScale), ($bmp.Height * $TexScale)
    $g = [Drawing.Graphics]::FromImage($big)
    $g.InterpolationMode = 'NearestNeighbor'; $g.PixelOffsetMode = 'Half'
    $g.DrawImage($bmp, 0, 0, $big.Width, $big.Height)
    $g.Dispose()
    New-Item -ItemType Directory -Force (Split-Path $file) | Out-Null
    $big.Save($file, [Drawing.Imaging.ImageFormat]::Png); $big.Dispose(); $bmp.Dispose()
}

function New-Canvas([int]$w, [int]$h) {
    $bmp = New-Object Drawing.Bitmap $w, $h
    $g = [Drawing.Graphics]::FromImage($bmp)
    $g.Clear([Drawing.Color]::Transparent)
    $g.SmoothingMode = 'None'; $g.TextRenderingHint = 'SingleBitPerPixelGridFit'
    return $bmp, $g
}

# Chapter header: title + subtitle. Returns the aspect ratio (width / height).
function Render-Header([string]$file, [string]$title, [string]$sub, [string]$hex) {
    $accent = Hex-Color $hex
    $w = 384; $h = 46
    $bmp, $g = New-Canvas $w $h
    Draw-Panel $g $w $h $accent
    $tf = New-Object Drawing.Font('Tahoma', 17, [Drawing.FontStyle]::Bold, [Drawing.GraphicsUnit]::Pixel)
    $sf = New-Object Drawing.Font('Tahoma', 11, [Drawing.FontStyle]::Regular, [Drawing.GraphicsUnit]::Pixel)
    Draw-Text $g $title $tf $accent ($w / 2) 5
    # Small accent rule between title and subtitle.
    $g.FillRectangle((New-Object Drawing.SolidBrush (Shade $accent 0.7)), [int]($w / 2 - 60), 26, 120, 1)
    if ($sub.Length -gt 72) { $sub = $sub.Substring(0, 69) + '...' }
    Draw-Text $g $sub $sf ([Drawing.Color]::FromArgb(255, 200, 200, 210)) ($w / 2) 29
    $g.Dispose(); Save-Scaled $bmp $file
    return $w / $h
}

# Section label: one line of text, width fitted to the text. Returns the aspect ratio.
function Render-Label([string]$file, [string]$text, [string]$hex) {
    $accent = Hex-Color $hex
    $f = New-Object Drawing.Font('Tahoma', 11, [Drawing.FontStyle]::Bold, [Drawing.GraphicsUnit]::Pixel)
    $tmp, $tg = New-Canvas 1 1
    $tw = [int][Math]::Ceiling($tg.MeasureString($text, $f, 2000, [Drawing.StringFormat]::GenericTypographic).Width)
    $tg.Dispose(); $tmp.Dispose()
    $w = $tw + 16; $h = 17
    $bmp, $g = New-Canvas $w $h
    Draw-Panel $g $w $h $accent
    $g.FillRectangle((New-Object Drawing.SolidBrush $accent), 3, 3, 2, $h - 6)
    Draw-Text $g $text $f ([Drawing.Color]::FromArgb(255, 235, 235, 240)) ([int]($w / 2 + 2)) 2
    $g.Dispose(); Save-Scaled $bmp $file
    return $w / $h
}

function Image-Obj([string]$file, [double]$x, [double]$y, [double]$width, [double]$height) {
    [ordered]@{ x = $x; y = $y; width = $width; height = $height; rotation = 0.0
        image = "gspack:textures/quests/$file"; color = 16777215; alpha = 255; order = 0; corner = $false }
}

# Images for one chapter (after layout): a header above the quests and a label above each section start.
function Chapter-Images($c) {
    $d = $script:Decor[$c.Key]
    if (-not $d) { return @() }
    $imgs = New-Object System.Collections.ArrayList
    $xs = @($c.Quests | ForEach-Object { $_.X }); $ys = @($c.Quests | ForEach-Object { $_.Y })
    $minX = ($xs | Measure-Object -Minimum).Minimum; $maxX = ($xs | Measure-Object -Maximum).Maximum
    $minY = ($ys | Measure-Object -Minimum).Minimum
    $sub = if ($c.Sub) { ($c.Sub -split '\|')[0] } else { '' }
    $ratio = Render-Header (Join-Path $TexDir "$($c.Key)_header.png") $c.Title $sub $d.Color
    $hw = 12.0; $hh = $hw / $ratio
    $topY = $minY - 0.5
    if ($c.LabelPos.Count) { $topY = [Math]::Min($topY, (($c.LabelPos.Values | Measure-Object -Minimum).Minimum) - $LabelHeight / 2) }
    [void]$imgs.Add((Image-Obj "$($c.Key)_header.png" (($minX + $maxX) / 2) ($topY - 0.5 - $hh / 2) $hw $hh))
    foreach ($k in $d.Labels.Keys) {
        $q = $c.ByKey[$k]
        if (-not $q) { throw "Label for unknown quest '$k' in chapter $($c.Key)" }
        $file = "$($c.Key)_$k.png"
        $ratio = Render-Label (Join-Path $TexDir $file) $d.Labels[$k] $d.Color
        $lw = $LabelHeight * $ratio
        if ($c.LabelAnchors -and $c.LabelAnchors.ContainsKey($k)) {
            $anchor = $c.LabelAnchors[$k] -split ','
            $right = [double]::Parse($anchor[0], $Inv)
            $labelY = [double]::Parse($anchor[1], $Inv)
            [void]$imgs.Add((Image-Obj $file ($right - $lw / 2) $labelY $lw $LabelHeight))
        } elseif ($c.LabelPos.ContainsKey($k)) {
            # Banded layout: label in its own free row, left-aligned with the first column.
            [void]$imgs.Add((Image-Obj $file (-0.6 + $lw / 2) $c.LabelPos[$k] $lw $LabelHeight))
        } else {
            # Hand-placed layout: label to the left of the quest.
            [void]$imgs.Add((Image-Obj $file ($q.X - 0.8 - $lw / 2) $q.Y $lw $LabelHeight))
        }
    }
    foreach ($extra in $c.ExtraImages) {
        [void]$imgs.Add((Image-Obj $extra.File $extra.X $extra.Y $extra.Width $extra.Height))
    }
    return $imgs
}

function Write-File([string]$path, $obj) {
    $full = Join-Path $Out $path
    New-Item -ItemType Directory -Force (Split-Path $full) | Out-Null
    [IO.File]::WriteAllText($full, (To-Json5 $obj) + "`n", $Utf8)
}

# ---------- load content ----------
Get-ChildItem (Join-Path $PSScriptRoot 'content') -Filter *.ps1 | Sort-Object Name | ForEach-Object { . $_.FullName }

if (Test-Path $Out) { Remove-Item -Recurse -Force $Out }
if (Test-Path $TexDir) { Remove-Item -Recurse -Force $TexDir }
$packLogo = Join-Path $Root 'config\fancymenu\assets\gspack\logo.png'
if (Test-Path $packLogo) {
    New-Item -ItemType Directory -Force $TexDir | Out-Null
    Copy-Item -LiteralPath $packLogo -Destination (Join-Path $TexDir 'pack_logo.png')
}

# ---------- reward tables ----------
foreach ($t in $script:Tables.Values) {
    Set-Lang 'file' "reward_table.$($t.Id).title" $t.Title
    $i = 0
    $rewards = New-Object System.Collections.ArrayList
    foreach ($e in $t.Entries) {
        $spec, $w = $e -split '@'
        [void]$rewards.Add((Reward-Obj $spec "table:$($t.Key):$(($i++))" ([double]::Parse($(if ($w) { $w } else { '1' }), $Inv))))
    }
    Write-File "reward_tables\$($t.Key).json5" ([ordered]@{ id = $t.Id; filename = $t.Key; order_index = $t.Order; loot_size = $t.Rolls; rewards = $rewards })
}

# ---------- chapters ----------
$order = 0
foreach ($c in $script:Chapters) {
    Layout $c
    $lf = "chapters/$($c.Key)"
    Set-Lang $lf "chapter.$($c.Id).title" $c.Title
    if ($c.Sub) { Set-Lang $lf "chapter.$($c.Id).chapter_subtitle" (Desc-Lines $c.Sub) }
    $quests = New-Object System.Collections.ArrayList
    foreach ($q in $c.Quests) {
        Set-Lang $lf "quest.$($q.Id).title" $q.Title
        if ($q.Sub) { Set-Lang $lf "quest.$($q.Id).quest_subtitle" $q.Sub }
        if ($q.Desc) { Set-Lang $lf "quest.$($q.Id).quest_desc" (Desc-Lines $q.Desc) }
        $o = [ordered]@{ id = $q.Id; x = [double]$q.X; y = [double]$q.Y }
        if ($q.Shape) { $o.shape = $q.Shape }
        if ($q.Size) { $o.size = [double]$q.Size }
        if ($q.Icon) { $o.icon = Item-Obj $q.Icon }
        if ($q.Deps.Count) { $o.dependencies = @($q.Deps | ForEach-Object { (Dep-Quest $c $_).Id }) }
        if ($q.Any) { $o.dependency_requirement = 'one_completed' }
        if ($q.Opt) { $o.optional = $true }
        if ($q.HideLines) { $o.hide_dependency_lines = $true }
        if ($q.LineControlPoints -and $q.LineControlPoints.Count) { $o.dep_control_pts = $q.LineControlPoints }
        $i = if ($q.TaskSeedOffset) { [int]$q.TaskSeedOffset } else { 0 }
        $o.tasks = @(foreach ($t in $q.Tasks) { Task-Obj $t "task:$($q.Id):$(($i++))" })
        foreach ($t in $o.tasks) { if ($script:TaskTitles[$t.id]) { Set-Lang $lf "task.$($t.id).title" $script:TaskTitles[$t.id] } }
        $i = 0; $o.rewards = @(foreach ($r in $q.Rewards) { Reward-Obj $r "reward:$($q.Id):$(($i++))" })
        [void]$quests.Add($o)
    }
    Write-File "chapters\$($c.Key).json5" ([ordered]@{
            id = $c.Id; group = $(if ($c.Group) { $script:Groups[$c.Group] } else { '' }); order_index = $(($order++)); filename = $c.Key
            icon = (Item-Obj $c.Icon); default_quest_shape = ''; default_hide_dependency_lines = (-not $c.ShowLines)   # lines off unless -showlines: the auto layout makes them cross
            quests = $quests; quest_links = @(); images = @(Chapter-Images $c)
            autofocus_id = $(if ($c.Key -eq 'welcome') { $c.ByKey['welcome'].Id } else { '' })
        })
}

# ---------- tag tasks: KubeJS gives the stage once the player holds enough of the tag ----------
$masteryDir = Join-Path $Root 'kubejs\data\gspack'
New-Item -ItemType Directory -Force $masteryDir | Out-Null
$masteryCatalog = @($script:Chapters | ForEach-Object { [ordered]@{ key = $_.Key; id = $_.Id; title = $_.Title } })
[IO.File]::WriteAllText((Join-Path $masteryDir 'mastery_chapters.json'), ($masteryCatalog | ConvertTo-Json -Depth 4) + "`n", $Utf8)
$tagJs = @(
    '// GENERATED by tools/build-quests.ps1 from the tag:<tag>*N tasks in tools/content. Do not edit by hand.',
    '// An item task only accepts one item id. For materials that several mods make (steel, osmium, titanium, ...)',
    '// the quest uses a stage task instead, and this script gives the stage when the inventory holds N of the tag.',
    '',
    'const GSPACK_TAG_STAGES = ['
) + @($script:TagStages.Keys | ForEach-Object { "  ['$_', '#$($script:TagStages[$_][0])', $($script:TagStages[$_][1])]," }) + @(
    ']',
    '',
    'PlayerEvents.inventoryChanged(event => {',
    '  const player = event.player',
    '  GSPACK_TAG_STAGES.forEach(([stage, tag, count]) => {',
    '    if (!player.stages.has(stage) && player.inventory.count(tag) >= count) player.stages.add(stage)',
    '  })',
    '})'
)
[IO.File]::WriteAllText((Join-Path $Root 'kubejs\server_scripts\gspack_quest_tags.js'), ($tagJs -join "`n") + "`n", $Utf8)

# ---------- groups, data, lang ----------
Write-File 'chapter_groups.json5' ([ordered]@{ chapter_groups = @($script:Groups.Values | ForEach-Object { [ordered]@{ id = $_ } }) })
Set-Lang 'file' 'file.0000000000000001.title' 'GSPack Quests'
Write-File 'data.json5' ([ordered]@{
        version = 13; default_reward_team = $false; default_consume_items = $false; default_autoclaim_rewards = 'disabled'
        default_quest_shape = 'circle'; default_quest_disable_jei = $false; emergency_items_cooldown = 300; drop_loot_crates = $false
        loot_crate_no_drop = [ordered]@{ passive = 4000; monster = 600; boss = 0 }
        disable_gui = $false; grid_scale = 0.5; pause_game = $false; lock_message = ''; progression_mode = 'linear'; detection_delay = 20
        show_lock_icons = $false; drop_book_on_death = $false; hide_excluded_quests = $false; fallback_locale = 'en_us'; verify_on_load = $false
    })

# Translations live in lang/<locale>/ (every .json5 below it is loaded and combined).
foreach ($f in $script:Lang.Keys) {
    $tbl = [ordered]@{}
    foreach ($k in ($script:Lang[$f].Keys | Sort-Object)) { $tbl[$k] = $script:Lang[$f][$k] }
    Write-File "lang\en_us\$($f -replace '/', '\').json5" $tbl
}

# ---------- report ----------
$total = ($script:Chapters | ForEach-Object { $_.Quests.Count } | Measure-Object -Sum).Sum
"Chapters: $($script:Chapters.Count)  Quests: $total  Reward tables: $($script:Tables.Count)"
foreach ($c in $script:Chapters) { "  {0,-14} {1,3} quests" -f $c.Key, $c.Quests.Count }
if ($ItemList -and (Test-Path $ItemList)) {
    # Only namespaces present in the list are checked; vanilla and other mods are reported as unchecked.
    $known = @{}; $spaces = @{}
    Get-Content $ItemList | ForEach-Object { $i = $_.Trim(); $known[$i] = $true; $spaces[($i -split ':')[0]] = $true }
    $used = $script:UsedItems | Sort-Object -Unique
    $checked = $used | Where-Object { $spaces[($_ -split ':')[0]] }
    $missing = $checked | Where-Object { -not $known[$_] }
    "Unchecked namespaces: " + (($used | Where-Object { -not $spaces[($_ -split ':')[0]] } | ForEach-Object { ($_ -split ':')[0] } | Sort-Object -Unique) -join ', ')
    if ($missing) { "MISSING item IDs:"; $missing | ForEach-Object { "  $_" } } else { "All $(@($checked).Count) checked item IDs exist in the mod jars." }
}
