# Writes the FancyMenu title screen layout for GSPack (config/fancymenu/customization/gspack_title_screen.txt)
# and registers the title screen in config/fancymenu/customizablemenus.txt.
# Textures come from tools/make-menu-textures.ps1. Format follows FancyMenu 3.x layout files.
# Usage:  powershell -ExecutionPolicy Bypass -File tools\make-menu-layout.ps1
$ErrorActionPreference = 'Stop'
$Root = Split-Path $PSScriptRoot -Parent
$Dir = Join-Path $Root 'config\fancymenu'
$Assets = '[source:local]/config/fancymenu/assets/gspack'
$Md5 = [Security.Cryptography.MD5]::Create()

# Stable UUID-style ids so regenerating the layout does not change it.
function Uid([string]$seed) {
    $h = -join ($Md5.ComputeHash([Text.Encoding]::UTF8.GetBytes("gspack-menu:$seed")) | ForEach-Object { $_.ToString('x2') })
    '{0}-{1}-{2}-{3}-{4}-1793500000000' -f $h.Substring(0, 8), $h.Substring(8, 4), $h.Substring(12, 4), $h.Substring(16, 4), $h.Substring(20, 12)
}

# Common element properties (position, fading, loading requirements).
function Common([string]$id, [string]$anchor, [int]$x, [int]$y, [int]$w, [int]$h, [bool]$stay) {
    $req = Uid "$id-req"
    @"
  appearance_delay = no_delay
  appearance_delay_seconds = 1.0
  fade_in_v2 = no_fading
  fade_in_speed = 1.0
  fade_out = no_fading
  fade_out_speed = 1.0
  base_opacity = 1.0
  auto_sizing = false
  auto_sizing_base_screen_width = 0
  auto_sizing_base_screen_height = 0
  sticky_anchor = false
  anchor_point = $anchor
  x = $x
  y = $y
  width = $w
  height = $h
  stretch_x = false
  stretch_y = false
  stay_on_screen = $($stay.ToString().ToLower())
  element_loading_requirement_container_identifier = $req
  [loading_requirement_container_meta:$req] = [groups:][instances:]
"@
}

# A vanilla button with the GSPack texture, placed in the centred column (anchor mid-centered).
function VanillaButton([string]$id, [int]$x = -100, [int]$y = 0, [int]$w = 200, [int]$h = 20) {
    $blk = Uid "$id-block"; $act = Uid "$id-active"
    @"
vanilla_button {
  button_element_executable_block_identifier = $blk
  [executable_block:$blk][type:generic] = [executables:]
  backgroundnormal = $Assets/button_normal.png
  backgroundhovered = $Assets/button_hover.png
  backgroundinactive = $Assets/button_inactive.png
  restartbackgroundanimations = true
  loopbackgroundanimations = true
  nine_slice_custom_background = true
  nine_slice_border_x = 4
  nine_slice_border_y = 4
  navigatable = true
  widget_active_state_requirement_container_identifier = $act
  [loading_requirement_container_meta:$act] = [groups:][instances:]
  element_type = vanilla_button
  instance_identifier = $id
$(Common $id 'mid-centered' $x $y $w $h $false)
  is_hidden = false
  automated_button_clicks = 0
  nine_slice_slider_handle = false
  nine_slice_slider_handle_border_x = 5
  nine_slice_slider_handle_border_y = 5
}
"@
}

# A vanilla widget that is hidden (Minecraft logo, splash text).
function HiddenWidget([string]$id) {
    $blk = Uid "$id-block"; $act = Uid "$id-active"
    @"
vanilla_button {
  button_element_executable_block_identifier = $blk
  [executable_block:$blk][type:generic] = [executables:]
  navigatable = true
  widget_active_state_requirement_container_identifier = $act
  [loading_requirement_container_meta:$act] = [groups:][instances:]
  element_type = vanilla_button
  instance_identifier = $id
$(Common $id 'vanilla' 0 0 100 20 $true)
  is_hidden = true
  automated_button_clicks = 0
}
"@
}

$meta = Uid 'meta'
$bgId = Uid 'background'
$logoId = Uid 'logo'

# A custom button in the top-left corner that opens a link.
function LinkButton([string]$key, [string]$label, [string]$desc, [string]$url, [int]$x, [int]$w) {
    $id = Uid $key; $blk = Uid "$key-block"; $act = Uid "$key-action"; $active = Uid "$key-active"
    @"
element {
  button_element_executable_block_identifier = $blk
  [executable_action_instance:$act][action_type:openlink] = $url
  [executable_block:$blk][type:generic] = [executables:$act;]
  backgroundnormal = $Assets/button_normal.png
  backgroundhovered = $Assets/button_hover.png
  restartbackgroundanimations = true
  loopbackgroundanimations = true
  nine_slice_custom_background = true
  nine_slice_border_x = 4
  nine_slice_border_y = 4
  label = $label
  description = $desc
  navigatable = true
  widget_active_state_requirement_container_identifier = $active
  [loading_requirement_container_meta:$active] = [groups:][instances:]
  element_type = custom_button
  instance_identifier = $id
$(Common $key 'top-left' $x 4 $w 20 $false)
}
"@
}

$layout = @"
type = fancymenu_layout

layout-meta {
  identifier = title_screen
  render_custom_elements_behind_vanilla = false
  last_edited_time = 1793500000000
  is_enabled = true
  randommode = false
  randomgroup = 1
  randomonlyfirsttime = false
  layout_index = 0
  [loading_requirement_container_meta:$meta] = [groups:][instances:]
}

menu_background {
  instance_identifier = $bgId
  image_path = $Assets/background.png
  slide = false
  repeat_texture = false
  background_type = image
}

customization {
  action = backgroundoptions
  keepaspectratio = true
}

element {
  source = $Assets/logo.png
  repeat_texture = false
  nine_slice_texture = false
  nine_slice_texture_border_x = 5
  nine_slice_texture_border_y = 5
  image_tint = #FFFFFF
  restart_animated_on_menu_load = false
  element_type = image
  instance_identifier = $logoId
$(Common 'logo' 'mid-centered' -120 -104 240 62 $false)
}

$(LinkButton 'github' 'GitHub' 'Visit steefan1998 on GitHub' 'https://github.com/steefan1998' 4 60)
$(LinkButton 'curseforge' 'CurseForge' 'View steef_an''s projects on CurseForge' 'https://www.curseforge.com/members/steef_an/projects' 68 76)

$(HiddenWidget 'minecraft_logo_widget')
$(HiddenWidget 'minecraft_splash_widget')
$(HiddenWidget 'mc_titlescreen_realms_button')
$(HiddenWidget 'minecraft_realms_notification_icons_widget')
$(HiddenWidget 'mc_titlescreen_language_button')
$(HiddenWidget 'mc_titlescreen_accessibility_button')
$(VanillaButton 'mc_titlescreen_singleplayer_button' -100 -30)
$(VanillaButton 'mc_titlescreen_multiplayer_button' -100 -6)
$(VanillaButton 'forge_titlescreen_mods_button' -100 18)
$(VanillaButton 'mc_titlescreen_options_button' -100 50 98 20)
$(VanillaButton 'mc_titlescreen_quit_button' 2 50 98 20)
"@

$utf8 = New-Object System.Text.UTF8Encoding($false)
New-Item -ItemType Directory -Force (Join-Path $Dir 'customization') | Out-Null
[IO.File]::WriteAllText((Join-Path $Dir 'customization\gspack_title_screen.txt'), $layout.Replace("`r`n", "`n"), $utf8)

# FancyMenu only applies layouts to screens listed in customizablemenus.txt.
$cm = Join-Path $Dir 'customizablemenus.txt'
$text = if (Test-Path $cm) { [IO.File]::ReadAllText($cm) } else { "type = customizablemenus`n" }
if ($text -notmatch 'net\.minecraft\.client\.gui\.screens\.TitleScreen') {
    $text = $text.TrimEnd() + "`n`nnet.minecraft.client.gui.screens.TitleScreen {`n}`n"
    [IO.File]::WriteAllText($cm, $text, $utf8)
}
"Layout written: config\fancymenu\customization\gspack_title_screen.txt"
