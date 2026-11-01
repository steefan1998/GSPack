# GSPack changelog: next version (work in progress)

Temporary changelog for the **GSPack Dev Build** instance. It lists everything that has changed since **GSPack 0.1** and will become the changelog of the next release. When that version is released, run `tools/track-mods.ps1` for the official mod changes in [MOD-CHANGELOG.md](MOD-CHANGELOG.md) and remove this file.

## Mods

**36 added, 2 removed, 3 updated** (240 → 274 mods).

### Added
| Mod | Version | What it adds |
|---|---|---|
| ExtendedAE | 1.0.5 | Extended AE2 devices, Assembler Matrix, new buses |
| AppliedFlux | 1.0.4 | FE energy storage in the ME network |
| AE Infinity Booster | 2.1.0 | Unlimited and cross-dimension wireless range for AE2 |
| Ender Drives | 1.5.23 | ME storage disks shared by frequency |
| Replication | 1.2.8 | Copy items from matter |
| Applied Replicatics | 1.0.0 | Replication matter in the ME network |
| Applied Thaumaturge | 1.0.0 | Essentia storage and arcane automation for AE2 |
| AppliedJS | 1.0.0 | KubeJS support for AE2 |
| Railcraft Reborn | 1.4.9 | Steel, tracks, signals and locomotives |
| Roots Classic | 1.6.7 | Nature magic: herbs, spells and rituals |
| EvilCraft | 1.2.109 | Blood magic, spirits, werewolves and brooms |
| DimStorage | 10.0.2 | Chests and tanks shared by frequency, across dimensions |
| AllTheCompressed | 5.0.1 | Compressed blocks up to 9x |
| Dark Utilities | 26.1.2.2 | Mob plates, filters and runes |
| Pylons | 6.0.1 | Harvester, infusion, interdiction, expulsion and protection pylons |
| Time In A Bottle | 8.0.0 | Speed up machines and crops with stored time |
| Energy Meter | 0.6.0 | Measure energy flow |
| Potions Master | 2.0.1 | Potion ingredients and powders |
| Corail Tombstone | 9.8.5 | Graves that keep your items when you die |
| JourneyMap | 6.0.10 | Minimap and world map (replaces Xaero's) |
| Living Things | 2.3.2 | New animals |
| Variants & Ventures | 1.0.29 | New mob variants |
| Chimes | 2.1.2 | Wind chimes |
| Leaderboards | 2.0.4 | Player leaderboards |
| FTB XMod Compat | 26.1.2.5 | FTB mod compatibility |
| Nyctography, PigPen, Runelic | 26.1.2.x | Decorative rune fonts (used by Dark Utilities) |
| Libraries | | Bookshelf, Cyclops Core, EdivadLib, Glodium, KotlinLangForge, Resourceful Lib, Bad Packets, BaguetteLib |

### Removed
- Xaero's Minimap
- Xaero's World Map

### Updated
| Mod | From | To |
|---|---|---|
| Applied Oritech | 1.0.4 | 1.0.5 (adds ME Dock and extended addons) |
| KubeJS | 8.0.7 | 8.0.8 |
| NotEnoughAnimations | 1.12.5 | 1.12.7 |

## Quest book

**1,236 → 1,316 quests, 21 → 25 chapters.** Quest IDs of existing quests are unchanged, so progress is kept.

### New chapters
- **Railcraft Reborn** (Technology, 19 quests): coke oven and blast furnace, steel, rolling machine, tracks and track kits, loaders, steam boiler, steam and electric locomotives, signals, tunnel bore, World Spike.
- **Utilities** (Technology, 9 quests): Time in a Bottle, Energy Meter, Pylons, Dark Utilities plates and filters.
- **Roots Classic** (Magic, 16 quests): bark and herbs, mortar and pestle, spell powder and staffs, rituals and standing stones, living tools, Sylvan and Wildwood armor.
- **EvilCraft** (Magic, 18 quests): dark gems, the Origins of Darkness, blood and the Blood Infuser, spirits and the Spirit Furnace, werewolves, the Environmental Accumulator, the broom.

### Changed chapters
- **Allthemodium:** Unobtainium now comes from the **End Highlands**. The Beyond is a void dimension, so it is now an optional quest. Vibranium no longer needs The Other first. Teleport Pad text matches the mod (sneak + right-click). *(already on `main`)*
- **Applied Energistics 2:** new section **AE2 Add-ons** (12 quests): ExtendedAE, Assembler Matrix, Applied Flux, Infinity Booster, Ender Drives, Replication, Applied Replicatics, Applied Thaumaturge.
- **Storage:** new section **Dimensional & Compressed** (5 quests): DimStorage chest, tank and tablet; All The Compressed.
- **Welcome:** map tips use JourneyMap (J, Ctrl+J, B, N) and FTB Chunks (M). New quest about Corail Tombstone graves.
- **Equivox:** removed the "Read the Manual" quest; the manual cannot be obtained.

### Checked
- Every item, mob, structure, biome and dimension ID in the quests (1,977) exists in the Dev Build mods.

## KubeJS
- No script changes. All 74 item IDs used by the recipes exist in the Dev Build mods, so the endgame recipes and Allthemodium alloys still work.

## Repository & tools
- README shows the GSPack logo. *(already on `main`)*
- New `tools/sync-to-instance.ps1`: installs the quest book and KubeJS from the repo into the Dev Build instance.
- `tools/sync-from-instance.ps1` now uses the Dev Build instance by default.

## Still to do
- Test the new chapters in-game.
- Quests for the remaining new mods if wanted (Potions Master, Living Things, Variants & Ventures, Chimes).
