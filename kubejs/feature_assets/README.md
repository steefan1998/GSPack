# Feature artwork

`mars/`, `cores/` and `trophy/` contain readable resource-pack sources, preserving their original Minecraft resource identifiers. `tools/pack-feature-assets.ps1` builds the three native KubeJS ZIP resource packs before forward Dev Build syncs. Do not omit those generated ZIPs from player/server overrides.

Scripts use matching groups under `kubejs/startup_scripts/gspack/` and `kubejs/server_scripts/gspack/`. Native datapack registry paths stay under `kubejs/data/` so saved biome/block/structure IDs remain stable. The crux textures are unchanged.

The explicit moved-file manifest retires only the old flat paths after backup and replacement verification, preventing duplicate startup registrations. Never restore the old script copies alongside the grouped scripts.
