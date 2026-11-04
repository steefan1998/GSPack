# Keep Extended Crafting easy to find alongside the technology chapters.
$extendedCraftingChapter = $script:Chapters | Where-Object Key -eq 'extendedcrafting'
$ae2Chapter = $script:Chapters | Where-Object Key -eq 'ae2'
if ($extendedCraftingChapter -and $ae2Chapter) {
    [void]$script:Chapters.Remove($extendedCraftingChapter)
    $script:Chapters.Insert($script:Chapters.IndexOf($ae2Chapter) + 1, $extendedCraftingChapter)
}
