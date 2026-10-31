# GSPack

A Minecraft **26.1.2 NeoForge** modpack built around tech, magic and exploration: Mekanism, Applied Energistics 2, Oritech, Mystical Agriculture, Apotheosis, Thaumaturge, Equivox, Allthemodium, The Twilight Forest, The Aether II, Stellaris, Aquaculture and more. The full mod list is in [MODS.md](MODS.md).

This repository holds the pack's configuration: everything except the mod jars. The ready-to-import Modrinth packs (`.mrpack`) are in [steefan1998/gspack](https://github.com/steefan1998/gspack).

## What's in here

| Path | Contents |
|---|---|
| `config/` | All mod configs, including the FTB Quests quest book (`config/ftbquests/quests`) |
| `kubejs/` | KubeJS scripts and assets, including the quest book textures (`kubejs/assets/gspack`) |
| `tools/` | Scripts that generate the quest book and sync this repo with a local instance |
| `MODS.md` | Generated list of every mod and version in the pack |

## The quest book

Over 1000 quests in English, in these chapters:

- **Start:** Welcome, Getting Started (vanilla progression)
- **Technology:** Mekanism, Applied Energistics 2, Oritech
- **Magic & Farming:** Mystical Agriculture, Seed Codex (every seed that loads in the pack), Apotheosis, Thaumaturge, Equivox
- **Exploration & Dimensions:** Allthemodium, Aquaculture 2, The Aether II, The Twilight Forest, Stellaris
- **Storage & Building:** Storage, Building

Every chapter has a pixel-art header banner and section labels, rendered by the build script.

### Editing quests

The quest files are **generated**. Do not edit `config/ftbquests/quests` by hand. Edit the chapter scripts in `tools/content/` instead, then rebuild:

```powershell
powershell -ExecutionPolicy Bypass -File tools\build-quests.ps1
```

This writes `config/ftbquests/quests` (FTB Quests 26.1 JSON5 format) and `kubejs/assets/gspack/textures/quests`. Quest IDs are derived from the quest keys, so rebuilding keeps player progress.

Pass `-ItemList <file>` (one `namespace:id` per line, dumped from the mod jars) to check that every item, entity, structure, biome and dimension ID in the quests exists.

### Syncing with an instance

```powershell
# Copy config/kubejs from your instance into this repo and refresh MODS.md
powershell -ExecutionPolicy Bypass -File tools\sync-from-instance.ps1 -Instance "D:\MinecraftModpacks\Instances\GSPack"
```

To install, copy `config/` and `kubejs/` into your instance folder. Then run `/ftbquests reload` in-game, and press F3+T to reload the textures.
