# Adds the existing pack logo to FancyMenu's normal pause screen.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root 'config\fancymenu'
$title = Get-Content (Join-Path $dir 'customization\gspack_title_screen.txt') -Raw
$image = [regex]::Match($title, '(?s)element \{\s+source = [^\r\n]*logo\.png.*?\n\}').Value
if (-not $image) { throw 'Pack logo element not found in title-screen layout' }
$image = $image.Replace('anchor_point = mid-centered', 'anchor_point = top-centered')
$image = $image.Replace('x = -120', 'x = -66').Replace('y = -110', 'y = 2')
$image = $image.Replace('width = 240', 'width = 132').Replace('height = 62', 'height = 34')
$image = $image.Replace('9662d9e1-56e2-9b82-1e44-c4bda039666a', '36a8e3c1-5713-490c-aecd-78a2d4e17628')
$image = $image.Replace('db55fa70-d35b-be20-7e49-6b7741e9eb11', '4ff71a3f-9d6b-44e4-b86b-b1215fdb32d5')
$layout = @"
type = fancymenu_layout

layout-meta {
  identifier = pause_screen
  render_custom_elements_behind_vanilla = false
  last_edited_time = 1793500000000
  is_enabled = true
  randommode = false
  randomgroup = 1
  randomonlyfirsttime = false
  layout_index = 0
  [loading_requirement_container_meta:214a5347-f247-4970-8c64-dc77c6e7dbd3-1793500000000] = [groups:][instances:]
}

$image
"@
$utf8 = [Text.UTF8Encoding]::new($false)
[IO.File]::WriteAllText((Join-Path $dir 'customization\gspack_pause_screen.txt'), $layout.Replace("`r`n", "`n") + "`n", $utf8)
$menusPath = Join-Path $dir 'customizablemenus.txt'
$menus = Get-Content $menusPath -Raw
if ($menus -notmatch 'net\.minecraft\.client\.gui\.screens\.PauseScreen') {
    [IO.File]::WriteAllText($menusPath, $menus.TrimEnd() + "`n`nnet.minecraft.client.gui.screens.PauseScreen {`n}`n", $utf8)
}
'Pause-screen logo layout written.'
