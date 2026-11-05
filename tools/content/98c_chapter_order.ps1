# Presentation order only; stable quest, task, reward and chapter IDs remain.
$chapterOrder = Get-Content (Join-Path $PSScriptRoot '../content-data/chapter-order.json') -Raw | ConvertFrom-Json
$orderedGroups = [ordered]@{}
foreach ($group in $chapterOrder.groups) { $orderedGroups[$group.key] = $script:Groups[$group.key] }
$script:Groups = $orderedGroups
$orderedChapters = [Collections.Generic.List[object]]::new()
foreach ($key in $chapterOrder.ungrouped) {
    $chapter = $script:Chapters | Where-Object Key -eq $key
    if (-not $chapter) { throw "Missing chapter in presentation order: $key" }
    $chapter.Group = ''; $orderedChapters.Add($chapter)
}
foreach ($group in $chapterOrder.groups) {
    foreach ($key in $group.chapters) {
        $chapter = $script:Chapters | Where-Object Key -eq $key
        if (-not $chapter) { throw "Missing chapter in presentation order: $key" }
        $chapter.Group = $group.key; $orderedChapters.Add($chapter)
    }
}
if ($orderedChapters.Count -ne $script:Chapters.Count) { throw 'Update chapter-order.json for new chapters.' }
$script:Chapters = $orderedChapters
