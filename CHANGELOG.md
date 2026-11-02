# GSPack changelog

What changed in each version of GSPack. The exact mod changes (added, removed and updated mods with their versions) are in [MOD-CHANGELOG.md](MOD-CHANGELOG.md).

## 0.4 (in development)

Changes in the GSPack Dev Build that are not released yet.

### Cross-mod recipes (KubeJS)
**47 items** (49 recipes) now need an ingredient from another mod, so the mods tie together. Each recipe keeps its pattern; usually one ingredient is swapped for something from a mod you reach earlier, so nothing gets locked. Every changed item has a tooltip: *"GSPack: crafted with items from other mods (see JEI)"*.

| Mod | Item | Now needs |
|---|---|---|
| Mekanism | Metallurgic Infuser | 2 Iron Furnaces (instead of furnaces) |
| AE2 | Inscriber | 6 steel ingots (instead of iron) |
| AE2 | Charger | Infused Alloy (instead of copper) |
| AE2 | ME Drive | osmium ingots (instead of iron) |
| AE2 | Energy Acceptor | a Basic Control Circuit (instead of copper) |
| AE2 | Molecular Assembler | a Tinkers' Crafting Station (instead of a crafting table) |
| Applied Flux | Flux Accessor | Powah Dielectric Paste (instead of glowstone dust) |
| Oritech | Basic Generator | a Steel Casing (instead of a furnace) |
| Oritech | Pulverizer (both recipes) | steel ingots (instead of iron) |
| Oritech | Powered Furnace (both recipes) | an Iron Furnace |
| Oritech | Foundry | a Tinkers' Seared Melter (instead of a cauldron) |
| LTX Industries | Machine Housing | a Basic Control Circuit (instead of a titanium gear) |
| Ender IO | Alloy Smelter, Stirling Generator | Iron Furnaces |
| Powah | Starter Energy Cell | steel ingots (instead of iron) |
| Powah | Starter Furnator | an Iron Furnace |
| Railcraft | Coke Oven Bricks | Tinkers' Seared Bricks (instead of bricks) |
| Railcraft | Steam Oven | an Iron Furnace |
| Railcraft | Tunnel Bore | Steel Casings (instead of furnaces) |
| LaserIO | Laser Connector | Quartz Glass (instead of glass) |
| Mining Gadgets | Mining Gadget (both tiers) | a Basic / Advanced Control Circuit (instead of redstone) |
| Hostile Neural Networks | Deep Learner | a Logic Processor (instead of redstone) |
| Hostile Neural Networks | Simulation Chamber | Calculation Processors (instead of ender pearls) |
| Replication | Replicator | a Basic Control Circuit (instead of redstone) |
| Replication | Disintegrator | Quartz Glass (instead of glass) |
| Pylons | Harvester Pylon | an Inferium Block (instead of a hay bale) |
| Immersive Aircraft | Boiler | an Iron Furnace |
| Immersive Aircraft | Propeller | steel ingots (instead of iron) |
| Allthemodium | Teleport Pad | a Zanite Gemstone (instead of an ender pearl) |
| Stellaris | Coal Generator | an Iron Furnace (instead of a blast furnace) |
| Stellaris | Fuel Refinery | a Steel Casing (instead of a furnace) |
| Stellaris | Space Suit Chestplate | HDPE Sheets (instead of titanium) |
| Stellaris | Rocket Engine | a Processing Unit (instead of redstone) |
| Stellaris | Rover | an Advanced Control Circuit (instead of redstone) |
| Equivox | Transmutation Table | 4 Prudentium Essence (instead of stone) |
| Equivox | Alchemical Chest | a Sophisticated Storage chest |
| Equivox | Energy Collector MK1 | an Iron Furnace |
| Roots Classic | Altar | an Inferium Block (instead of a gold block) |
| EvilCraft | Dark Tank | Inferium Ingots (instead of iron) |
| Apotheosis | Simple Reforging Table | a steel ingot (instead of iron) |
| Mystical Agriculture | Awakening Altar | a Thaumium Ingot (instead of wool) |
| Mystical Agriculture | Essence Vessel | a Warded Jar (instead of glass) |

Steel comes from Mekanism, Railcraft, Oritech, Tinkers' and AllTheOres. Script: `kubejs/server_scripts/gspack_crossmod_recipes.js`, tooltips: `kubejs/client_scripts/gspack_crossmod_tooltips.js`.

### Extended Crafting endgame
- **Creative items** are now crafted in an **Elite Crafting Table** (7x7): the singularity, the same corner and edge items as before, plus 16 Black Iron Ingots, 4 Elite Components and 4 Crystaltine Ingots.
- **Trophy of Infinity** is crafted in an **Ultimate Crafting Table** (9x9) and is now many times more expensive. You need to have done most of the pack:
  - the **capstone item of 20 mods** (MekaSuit Bodyarmor, Quantum Core, Black Hole, Infinite Energy Cell Array, Electric Locomotive, Nitro Energy Cell, Queen's Slime Ingot, Primordial Pearl, Godforged Pearl, Klein Star Omega, Insanium Gemstone Block, Dark Power Gem Block, Crystal Staff, Valkyrie Wings, Unobtainium-Vibranium Block, Heart of Luna and Star Crawler trophies, Neptunium Block, Novite Block, Gravitite Block)
  - all **eight Twilight Forest boss trophies**
  - the eight creative items and **8 more Creative Singularities** (16 in total)
  - the Extended Crafting **Ultimate Singularity** (one of every singularity)
  - 24 Crystaltine Blocks, 4 Nether Star Blocks, 4 Ultimate Components and 4 Infinite Control Circuits
- The trophy quest now also waits for the final quests of those chapters. A new quest covers the **Ultimate Singularity**.
- The **Ultimate Singularity** has its own GSPack recipe (9x9, Ultimate Crafting Table) instead of Extended Crafting's default: all 19 singularities, a Creative Singularity in the middle, 4 each of Antimatter Pellets, Insanium Gemstone Blocks, Unobtainium Blocks and Void Metal, plus 24 Black Iron Blocks, 5 Nether Star Blocks, 4 Crystaltine Blocks, 4 Ultimate Components, 4 Ultimate Catalysts and 4 Infinite Control Circuits. With the trophy that makes 17 Creative Singularities in total.

### Uncraftable items are now craftable
These items had no recipe at all (boss trophies, rare drops, LTX's infinite blocks), so the Trophy of Infinity depended on luck and repeat boss kills, and two quests could not be completed. They now also have an Extended Crafting recipe made from their own mod's materials (the drops and boss kills still work too):

| Table | Item | Core of the recipe |
|---|---|---|
| Advanced | Naga Trophy | Naga Scales, Nether Star |
| Advanced | Lich Trophy | the four scepters, Ironwood Blocks, Nether Star |
| Advanced | Minoshroom Trophy | Meef Stroganoff, Maze Map Focus, Nether Star |
| Advanced | Hydra Trophy | Fiery Blood, Hydra Chops, Nether Star |
| Advanced | Knight Phantom Trophy | Knightmetal Blocks, Armor Shard Clusters, Nether Star |
| Advanced | Ur-Ghast Trophy | Fiery Tears, Carminite Blocks, Nether Star |
| Advanced | Alpha Yeti Trophy | Alpha Yeti Fur, Ice Bombs, Nether Star |
| Advanced | Snow Queen Trophy | Aurora Blocks, Blue Ice, Nether Star |
| Advanced | Heart of Luna Trophy | Desh Blocks, Vaccines, Novite Block |
| Advanced | Star Crawler Trophy | Lunar Parasite Teeth, Crawler Spike Clusters, Novite Block |
| Advanced | Valkyrie Wings | Moa Feathers, Gravitite Blocks, Golden Amber Block |
| Advanced | Infinite Water / Lava Tank (LTX) | T4 Circuits, water / lava buckets, Portable Tank |
| Elite | Primordial Pearl | the six primal crystals, Primal Charm, Void Metal |
| Elite | Godforged Pearl | Luminous Crystal Shards, Sigils of Supremacy, Nether Star |
| Elite | Black Hole (Oritech) | Strange Matter, Superconductors, Fluxite Blocks |
| Elite | Infinite Energy Cell Array (LTX) | Large Voltaic Cells, T5 Circuits, Energy Cell Array |

Each recipe is framed by Extended Crafting components, Black Iron Ingots and an extra material from the same mod. The *Event Horizon* (Oritech), *Infinite Tanks* and *LTX Engineer* quests can now be completed.

### Equivox is more expensive
Equivalent exchange is very strong, so its EMC engine costs much more now:

| Item | Change |
|---|---|
| Philosopher's Stone (both recipes) | redstone → redstone blocks, glowstone dust → glowstone, diamond → Salis Mundus (Thaumaturge) |
| Dark Matter | diamond block → Refined Obsidian Block (Mekanism) |
| Red Matter (both recipes) | Aeternalis Fuel → Aeternalis Fuel Blocks (9 times as much) |
| Collector MK2 / MK3, Relay MK2 / MK3 | one Dark / Red Matter → a Dark / Red Matter Block (4 times as much) |
| Condenser MK2 | now in an Elite Crafting Table, with 4 Antimatter Pellets (Mekanism) |
| Transmutation Tablet | stone → Imperium Essence (Mystical Agriculture) |
| Transmutation Interface | hopper → ME Interface (AE2) |
| Watch of Flowing Time | clock → Time in a Bottle |
| Dark Matter Furnace | furnace → Diamond Furnace (Iron Furnaces) |

Together with the earlier changes (Transmutation Table, Alchemical Chest, Collector MK1, Condenser MK1 in the Advanced table, Dark Matter Pedestal in the Elite table), most of Equivox now ties into other mods.

### Late-game items moved to Extended Crafting tables
The original recipe stays in the middle; around it go Extended Crafting components, Black Iron Ingots and a cross-mod ingredient.

| Table | Item | Extra ingredient (4) |
|---|---|---|
| Advanced (5x5) | Teleporter (Mekanism) | Warp Stone (Waystones) |
| Advanced (5x5) | Quantum Ring (AE2) | Reinforced Alloy (Mekanism) |
| Advanced (5x5) | World Spike (Railcraft) | Zanite Gemstone (The Aether II) |
| Advanced (5x5) | Loot Fabricator (Hostile Neural Networks) | Engineering Processor (AE2) |
| Advanced (5x5) | Time in a Bottle | Quicksilver (Thaumaturge) |
| Advanced (5x5) | Energy Condenser MK1 (Equivox) | Thaumium Ingot (Thaumaturge) |
| Advanced (5x5) | Uncrafting Table (Twilight Forest) | Gem Dust (Apotheosis) |
| Advanced (5x5) | Atomic Forge (Oritech) | Atomic Alloy (Mekanism) |
| Elite (7x7) | Augmenting Table (Apotheosis) | Void Metal (Thaumaturge) |
| Elite (7x7) | Dark Matter Pedestal (Equivox) | Supremium Block (Mystical Agriculture) |

These items have a tooltip saying which table they need.
- **The tables cost more**, one tier heavier each:

| Table | Middle (was) | Bottom (was Black Iron Slate) |
|---|---|---|
| Basic | Steel Block (iron block) | Basic Control Circuit |
| Advanced | Imperium Block (gold block) | Advanced Control Circuit |
| Elite | Refined Obsidian Block (diamond block) | Elite Control Circuit |
| Ultimate | Vibranium Block (emerald block) | Ultimate Control Circuit |

- The Endgame chapter has two new quests, **Elite Crafting Table** and **Ultimate Crafting Table**; creative items need the Elite one, the trophy needs the Ultimate one.

### Quest book
- **Punch a Tree** accepts **16 logs of any kind** (everything in `#minecraft:logs`, including the wood of The Aether II, Twilight Forest, Thaumaturge and other mods), not just oak. A KubeJS player stage (`kubejs/server_scripts/gspack_quest_stages.js`) completes the new stage task; progress is kept.
- **Tinkers' Construct:** the first quest explains how to craft *Materials and You* (Book + Pattern).
- **Aquaculture 2:** the fish quests now match where each fish really bites (from the mod's fishing table):
  - *Cold Waters* (was Cold Rivers): Blackfish only bite in cold oceans and on cold beaches.
  - *Ocean Fish* / *Halibut*: Atlantic Cod, Pollock and Pacific Halibut need a cold ocean.
  - *Big Ocean Fish* (was Warm Water Fish): Red Grouper and Tuna bite in any ocean.
  - *Lake Fish* (was Swamp Dwellers): Gar, Catfish and Largemouth Bass live in any temperate fresh water.
  - New *Swamp Dwellers* quest for the **Leech**, which only bites in swamps.
  - *Turtles*: the Starshell Turtle is fished in the Twilight Forest, not on beaches.
  - *Goldfish* is caught as junk in any biome and crafts into a gold nugget.
  - *Master Angler* now also needs the Lake Fish, Leech and African Waters quests.
  - Hooks: removed the *Nether Hooks* and *Obsidian Hook* quests and the glowstone hook. Those hooks (glowstone, quartz, soul sand, obsidian, double obsidian, obsidian note) have no recipe in this Aquaculture version; they belong to Nether and lava fishing, which is empty. The other hook descriptions now match the mod's tooltips (for example: the iron hook saves durability, the light hook casts further, the redstone hook gives more time to reel in).

### Configs
- Tinkers' Construct no longer gives new players its book when they join a world (`shouldSpawnWithTinkersBook = false`).

### For pack makers
- `build-quests.ps1` supports stage tasks (FTB Quests type `gamestage`): `stage:<name>[@<icon>][|<title>]`.

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
