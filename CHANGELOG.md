# GSPack changelog

What changed in each version of GSPack. The exact mod changes (added, removed and updated mods with their versions) are in [MOD-CHANGELOG.md](MOD-CHANGELOG.md).

## 0.3 (2026-11-02)

### Mods
**1 added, 6 updated** (274 → 275 mods). Full list: [MOD-CHANGELOG.md](MOD-CHANGELOG.md).

- **New:** Clarity Shader: vibrant visuals (bloom, god rays, water reflections, color grading). It starts **off**: press **F6** to switch between the Off, Low, Medium, High, Max and Auto profiles. Auto adjusts the quality to reach a target frame rate.
- **Updated:** Applied Oritech 1.0.6, Farming for Blockheads 26.1.2.6, FTB Teams 26.1.2.5, Resourceful Lib 4.0.2, TrashSlot 26.1.2.5, Waystones 26.1.2.17

### Quest book
**1,316 → 1,337 quests, 25 → 26 chapters.** Existing quest progress is kept.

- **New chapter: Wildlife** (Exploration, 17 quests). Living Things: the Lexicon, savanna animals, ostrich eggs, bananas, crabs, sharks, seahorses, penguins, Shroomies and the Baby Ender Dragon. Variants & Ventures: the Gelid, Murk, Thicket and Verdant, ending with **Monster Hunter**.
- **Utilities:** new section **Potions Master** (3 quests): the Mortar & Pestle, and the remedies that cure Poison, Wither and Mining Fatigue.
- **Building:** new quest for the wind chimes and glass bells of **Chimes**.

All 2,009 IDs in the quests and the 74 in the KubeJS recipes were checked against the mods in the pack.

### KubeJS
No changes.

## 0.2 (2026-11-01)

### Mods
**36 added, 2 removed, 3 updated** (240 → 274 mods). Full list: [MOD-CHANGELOG.md](MOD-CHANGELOG.md).

- **New tech:** Railcraft Reborn, ExtendedAE, Applied Flux, AE Infinity Booster, Ender Drives, Replication and Applied Replicatics, Applied Thaumaturge, DimStorage, All The Compressed, Pylons, Dark Utilities, Time In A Bottle, Energy Meter
- **New magic:** Roots Classic, EvilCraft, Potions Master
- **New world & mobs:** Living Things, Variants & Ventures, Chimes
- **Quality of life:** Corail Tombstone (graves keep your items when you die), Leaderboards
- **Map:** JourneyMap replaces Xaero's Minimap and World Map
- **Updated:** Applied Oritech 1.0.5 (adds the ME Dock and extended addons), KubeJS 8.0.8, NotEnoughAnimations 1.12.7

### Quest book
**1,236 → 1,316 quests, 21 → 25 chapters.** Existing quest progress is kept.

New chapters:
- **Railcraft Reborn** (Technology, 19 quests): coke oven and blast furnace, steel, rolling machine, tracks and track kits, loaders, steam boiler, steam and electric locomotives, signals, tunnel bore, World Spike.
- **Utilities** (Technology, 9 quests): Time in a Bottle, Energy Meter, Pylons, Dark Utilities plates and filters.
- **Roots Classic** (Magic, 16 quests): bark and herbs, mortar and pestle, spell powder and staffs, rituals and standing stones, living tools, Sylvan and Wildwood armor.
- **EvilCraft** (Magic, 18 quests): dark gems, the Origins of Darkness, blood and the Blood Infuser, spirits and the Spirit Furnace, werewolves, the Environmental Accumulator, the broom.

Changed chapters:
- **Allthemodium:** Unobtainium now comes from the **End Highlands**. The Beyond is an empty void dimension, so its quest is now optional. Vibranium no longer needs The Other first (it is also in the Nether). The Teleport Pad quest matches the mod (sneak + right-click) and lists where each pad leads.
- **Applied Energistics 2:** new section **AE2 Add-ons** (12 quests): ExtendedAE, Assembler Matrix, Applied Flux, Infinity Booster, Ender Drives, Replication, Applied Replicatics, Applied Thaumaturge.
- **Storage:** new section **Dimensional & Compressed** (5 quests): DimStorage chest, tank and tablet; All The Compressed.
- **Welcome:** map tips for JourneyMap (J, Ctrl+J, B, N) and FTB Chunks (M). New quest about Corail Tombstone graves.
- **Equivox:** removed the "Read the Manual" quest; the manual cannot be obtained.

Every item, mob, structure, biome and dimension in the quests (1,977 IDs) was checked against the mods in the pack.

### KubeJS
No changes. The endgame recipes and the Allthemodium alloys work with all new mods (all 74 item IDs checked).

### For pack makers
- New `tools/sync-to-instance.ps1` installs the quest book and KubeJS into an instance.
- `sync-from-instance.ps1` and `track-mods.ps1` use the GSPack Dev Build instance by default.

## 0.1 (2026-11-01)

First release: 240 mods and a quest book with 1,236 quests in 21 chapters.
