# Compatibility sprites for Allthemodium 4.2.0's legacy smithing-slot IDs.
# Copy existing vanilla art without changing its pixels.
param([string]$MinecraftJar = 'D:\CurseForge\Install\libraries\net\neoforged\minecraft-client-patched\26.1.2.125\minecraft-client-patched-26.1.2.125.jar')
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$root = Split-Path $PSScriptRoot -Parent
$target = Join-Path $root 'kubejs\assets\minecraft\textures\gui\sprites\item'
New-Item -ItemType Directory -Force $target | Out-Null
$zip = [IO.Compression.ZipFile]::OpenRead($MinecraftJar)
try {
    foreach ($name in @('ingot','helmet','chestplate','leggings','boots','hoe','axe','sword','shovel','pickaxe')) {
        $entry = $zip.GetEntry("assets/minecraft/textures/gui/sprites/container/slot/$name.png")
        if (-not $entry) { throw "Missing vanilla slot sprite: $name" }
        $alias = if ($name -in @('helmet','chestplate','leggings','boots')) { "empty_armor_slot_$name.png" } else { "empty_slot_$name.png" }
        [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, (Join-Path $target $alias), $true)
    }
} finally { $zip.Dispose() }
'Generated 10 smithing GUI compatibility sprites.'
