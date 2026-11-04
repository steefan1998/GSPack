# Universal compact branching style. Protected collection layouts are untouched.
($script:Chapters | Where-Object Key -eq 'aether').ByKey['portal'].TaskSeedOffset = 1
foreach ($c in $script:Chapters) {
    if ($c.Key -notin @('seeds','trophy')) { $c.LayoutVariant = 'compact_branches' }
}

function Layout-Variant($c, $ordered, $labels) {
    if ($c.Key -in @('seeds','trophy')) { throw 'Protected chapter layout' }
    $sectionOf = @{}; $sections = [Collections.Generic.List[string]]::new()
    if ($c.BranchGroups) {
        foreach ($q in $c.Quests) { $sectionOf[$q.Key] = 'group_' + $c.BranchGroups[$q.Key] }
        foreach ($index in @($c.BranchGroups.Values | Sort-Object -Unique)) { $sections.Add('group_' + $index) }
    } else {
        $sections.Add(''); $section = ''
        foreach ($q in $c.Quests) {
            if ($labels.ContainsKey($q.Key)) { $section = $q.Key; $sections.Add($section) }
            $sectionOf[$q.Key] = $section
        }
    }
    $c.LabelAnchors = @{}; $shelfX = 0.0; $shelfY = 0.0; $shelfHeight = 0.0; $panel = 0
    foreach ($section in $sections) {
        $members = @($ordered | Where-Object { $sectionOf[$_.Key] -eq $section })
        if (-not $members.Count) { continue }
        $depths = @{}; $layers = @{}
        foreach ($q in $members) {
            $depth = 0
            foreach ($dep in $q.Deps) {
                if ($dep -notmatch '/' -and $sectionOf[$dep] -eq $section) {
                    $depth = [Math]::Max($depth, [int]$depths[$dep] + 1)
                }
            }
            $depths[$q.Key] = $depth
            if (-not $layers.ContainsKey($depth)) { $layers[$depth] = [Collections.Generic.List[object]]::new() }
            $layers[$depth].Add($q)
        }
        $axis = 0.0
        foreach ($depth in @($layers.Keys | Sort-Object)) {
            $layer = @($layers[$depth]); $columns = [int][Math]::Ceiling($layer.Count / 4.0)
            for ($i = 0; $i -lt $layer.Count; $i++) {
                $column = [int][Math]::Floor($i / 4)
                $count = [Math]::Min(4, $layer.Count - $column * 4)
                $forward = $axis + $column * 1.8
                $side = (($i % 4) - ($count - 1) / 2.0) * 1.8
                # Alternate the direction of category branches, as in a hand-drawn tech tree.
                if ($panel % 3 -eq 1) { $layer[$i].X = $side; $layer[$i].Y = $forward }
                else { $layer[$i].X = $forward; $layer[$i].Y = $side }
            }
            $axis += $columns * 1.8
        }
        $minX = ($members | Measure-Object X -Minimum).Minimum
        $maxX = ($members | Measure-Object X -Maximum).Maximum
        $minY = ($members | Measure-Object Y -Minimum).Minimum
        $maxY = ($members | Measure-Object Y -Maximum).Maximum
        $width = $maxX - $minX + 8.0; $height = $maxY - $minY + 3.2
        if ($shelfX -gt 0 -and $shelfX + $width -gt 34) {
            $shelfX = 0.0; $shelfY += $shelfHeight; $shelfHeight = 0.0
        }
        foreach ($q in $members) { $q.X += $shelfX - $minX; $q.Y += $shelfY - $minY }
        $labelYs = [Collections.Generic.List[double]]::new()
        foreach ($q in $members) {
            if (-not $labels.ContainsKey($q.Key)) { continue }
            $labelY = $q.Y
            while (@($labelYs | Where-Object { [Math]::Abs($_ - $labelY) -lt 0.8 }).Count) { $labelY += 0.8 }
            $labelYs.Add($labelY)
            $c.LabelAnchors[$q.Key] = '{0},{1}' -f ($shelfX - 0.9).ToString($Inv), $labelY.ToString($Inv)
            $height = [Math]::Max($height, $labelY - $shelfY + 2.0)
        }
        $shelfX += $width; $shelfHeight = [Math]::Max($shelfHeight, $height); $panel++
    }
    foreach ($q in $c.Quests) {
        $q.HideLines = [bool]$q.ExplicitHideLines -or [bool]@($q.Deps | Where-Object {
            $_ -match '/' -or $sectionOf[$_] -ne $sectionOf[$q.Key]
        }).Count
        # Straight connections are rendered 4% too long by this FTB Quests
        # version. Endpoint controls retain a straight path but split it into
        # small Bezier segments, keeping the overdraw underneath the icons.
        $q.LineControlPoints = [ordered]@{}
        foreach ($depKey in $q.Deps) {
            if ($depKey -match '/') { continue }
            $dep = $c.ByKey[$depKey]
            $q.LineControlPoints[$dep.Id] = @([double]$dep.X, [double]$dep.Y, [double]$q.X, [double]$q.Y)
        }
    }
    if ($c.Key -eq 'welcome') {
        $c.ByKey['start'].HideLines = $true
        $c.ExtraImages[0].X = (($c.Quests | Measure-Object X -Minimum).Minimum + ($c.Quests | Measure-Object X -Maximum).Maximum) / 2
        $c.ExtraImages[0].Y = ($c.Quests | Measure-Object Y -Minimum).Minimum - 4.2
    }
}
