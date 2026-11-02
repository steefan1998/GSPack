# GSPack changelog

What changed in each version of GSPack. The exact mod changes (added, removed and updated mods with their versions) are in [MOD-CHANGELOG.md](MOD-CHANGELOG.md).

## 0.5 (in development)

Changes in the GSPack Dev Build that are not released yet.

### Material unification
Many mods make the same materials: silver comes from five mods, steel from six. GSPack now treats them as one:

- **One item per material.** 113 materials (ingots, nuggets, dusts, gems, plates, gears, raw materials and blocks) have a preferred item: Minecraft first, then AllTheOres, then Mekanism, then the mod the material comes from (Twilight Forest for Knightmetal, Stellaris for Titanium). Every recipe gives the preferred item, and every recipe accepts any mod's version as input (`kubejs/server_scripts/gspack_zz_unify.js`).
- **JEI shows one item per material.** The 159 duplicates are hidden (`kubejs/client_scripts/gspack_unify_hide.js`). Raw materials and gems stay visible.
- **Mining gives AllTheOres materials.** 35 ores of other mods (Mekanism, Railcraft, Oritech, LTX Industries, Occultism, More Machines) drop the same as the matching AllTheOres ore, also with Fortune and Silk Touch (`kubejs/data/*/loot_table/blocks`, made by `tools/make-ore-loot.ps1`). Thaumaturge's cinnabar is kept, because quicksilver needs it.
- **Duplicate ores no longer generate.** Ores that AllTheOres also has are turned off for Mekanism (osmium, tin, lead, uranium, fluorite), Railcraft (lead, nickel, silver, sulfur, tin, zinc), Oritech (nickel, platinum, uranium), LTX Industries, Occultism and More Machines (silver). Ores AllTheOres doesn't have keep generating: Titanium, Niobium, Iesnium, Firestone, Saltpeter, Mekanism's salt, Thaumaturge's cinnabar and more. This only affects newly generated chunks; ores already in the world drop AllTheOres materials.
- **Existing worlds are converted.** Duplicate items become the preferred item in your inventory (on login and whenever it changes) and in chests, barrels and other chest-like containers when you open them (`kubejs/server_scripts/gspack_zz_unify_convert.js`). Machines and storage networks are left alone; their items convert as soon as you take them out. Ores and material blocks already placed in the world are replaced by the AllTheOres block when their chunk loads (`kubejs/server_scripts/gspack_zz_unify_blocks.js`; a quick palette check skips chunks without duplicates, and the work is spread over ticks). Titanium ores stay, because AllTheOres has no titanium.
- **Offline world converter.** `tools/convert-world.ps1` converts a whole world while the server is stopped, so no player has to visit every chunk: placed blocks in every dimension, items in chests, machines and other block entities, item entities, player inventories and saved mod data. It refuses to run while the world is in use, copies every file it changes to `<world>/gspack-convert-backup` first, and has a `-DryRun` mode. On a server, pass `-KubeJS <server>/kubejs`; PowerShell 7 (`pwsh`) runs it on Linux too.
- **Quests accept every mod's version.** Every quest task for one of these materials now accepts the whole tag, for example 16 Osmium Ingots from any mod. The quest builder does this automatically.

### More fixes
- **Thaumaturge:** *Vis Crystals* asks for the Vis Crystals you get from breaking the crystals (it asked for the crystal blocks, which never drop). The Primordial Pearl recipe uses Vis Crystals too. *Brass* accepts any mod's brass.
- **Getting Started:** *A Place to Call Home* accepts chests or barrels of any wood and any wooden door (was: 2 chests and an oak door).
- **Mystical Agriculture:** the *Guide Book* quest asked for an item that doesn't exist in this version. It's now *Looking Things Up* (a checkmark) and points to JEI.
- **Apotheosis** no longer puts Tinkers' Construct tools and armor in affix loot (ContinuumConstruct's entries are turned off in `kubejs/data/apotheosis`).
- **Hostile Neural Networks:** the Deep Learner's Curios slot showed a missing texture. The slot icon now points to a texture in the right place.
- **Title screen:** a **GSPack Wiki** button under *Mods* opens the wiki. GitHub and CurseForge moved one row down.

### Quest book
- **Items you already carry now count.** FTB Quests only checked item tasks when your inventory changed, so items picked up before a quest unlocked (for example a Prosperity Seed Base before the Seed Codex, or Thaumaturge items) were ignored until you moved something. `kubejs/server_scripts/gspack_quest_detection.js` runs FTB Quests' own inventory check on login and every 5 seconds.
- **Any mod's metal counts.** 11 tasks asked for one mod's version of a metal that several mods make, and refused the others. They now accept the whole tag (any mod): Osmium and Steel (Mekanism), Steel, Electrum, Nickel, Raw Nickel and Raw Platinum (Oritech), Titanium and Raw Titanium (Stellaris), Titanium, Silver and Fluorite (LTX Industries). These are stage tasks given by the generated `kubejs/server_scripts/gspack_quest_tags.js`. Progress is kept.
- **Every chapter is open from the start.** The first quests of Endgame: Infinity (was: after the Ender Dragon), the Seed Codex (was: after the Infusion Altar) and Equivox (was: after an Allthemodium Ingot) no longer wait for another chapter. Later quests in those chapters still do.

### For pack makers
- `build-quests.ps1`: new task type `tag:<item tag>*N@<icon>[|<title>]` for "N of any mod's version"; the build writes the matching stages to `kubejs/server_scripts/gspack_quest_tags.js`. It also warns when a chapter's starting quest depends only on other chapters. Item tasks for a unified material become tag tasks automatically, and items can carry data components: `ns:item[component.field=value]` (matched with `match_components: fuzzy`).

### Configs
- Removed leftover configs of mods that are not in the pack: Amendments, Avaritia Easy, Farmer's Delight, and Xaero's Minimap and World Map (`config/xaero`, `xaerohud.txt`, `xaeropatreon.txt`).

## 0.4 (2026-11-02)

### Mods
**1 removed, 1 updated** (275 → 274 mods). Full list: [MOD-CHANGELOG.md](MOD-CHANGELOG.md).

- **Removed:** ATM X Mystical Ag Support. Its Allthemodium seeds are replaced by GSPack's own crops (see *Mystical Agriculture: new seeds* below).
- **Updated:** Occultism 1.260.4

**Quest book: 1,337 → 1,484 quests, 26 → 29 chapters.** Existing quest progress is kept. All 2,123 item IDs in the quests were checked against the mods in the pack.

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
- **Creative items** are now crafted in an **Elite Crafting Table** (7x7): the singularity, the same corner and edge items as before, plus 4 double compressed blocks that match the item (osmium for Mekanism, fluix for AE2, steel for Oritech, nitro crystal for Powah, emerald, diamond, gold or Allthemodium for the others), 16 Black Iron Ingots, 4 Elite Components and 4 Crystaltine Ingots.
- **Trophy of Infinity** is crafted in an **Ultimate Crafting Table** (9x9) and is now many times more expensive. You need to have done most of the pack:
  - the **capstone item of 20 mods** (MekaSuit Bodyarmor, Quantum Core, Black Hole, Infinite Energy Cell Array, Electric Locomotive, Nitro Energy Cell, Queen's Slime Ingot, Primordial Pearl, Godforged Pearl, Klein Star Omega, Insanium Gemstone Block, Dark Power Gem Block, Crystal Staff, Valkyrie Wings, Unobtainium-Vibranium Block, Heart of Luna and Star Crawler trophies, Neptunium Block, Novite Block, Gravitite Block)
  - all **eight Twilight Forest boss trophies**
  - the eight creative items and **8 more Creative Singularities** (16 in total)
  - the Extended Crafting **Ultimate Singularity** (one of every singularity)
  - compressed blocks from All The Compressed: 8 Double Compressed Netherite Blocks, 4 Double Compressed Unobtainium-Vibranium Alloy Blocks and 4 Compressed Antimatter Blocks
  - 8 Crystaltine Blocks, 4 Nether Star Blocks, 4 Ultimate Components and 4 Infinite Control Circuits
- **All The Compressed fixes** (`kubejs/server_scripts/gspack_compressed_fixes.js`): the **Antimatter Block** had no recipe, so Compressed Antimatter could not be made. 9 Antimatter Pellets now make one (and it breaks back into 9 pellets). Compressed Osmium and Steel Blocks now take any osmium or steel block (Mekanism, Railcraft, Tinkers', ...), not only the AllTheOres one.
- The trophy quest now also waits for the final quests of those chapters. A new quest covers the **Ultimate Singularity**.
- The **Ultimate Singularity** has its own GSPack recipe (9x9, Ultimate Crafting Table) instead of Extended Crafting's default: all 19 singularities, a Creative Singularity in the middle, 4 each of Antimatter Pellets, Insanium Gemstone Blocks, Compressed Unobtainium Blocks and Void Metal, plus 8 Triple Compressed Iron Blocks, 16 Black Iron Blocks, 5 Nether Star Blocks, 4 Crystaltine Blocks, 4 Ultimate Components, 4 Ultimate Catalysts and 4 Infinite Control Circuits. With the trophy that makes 17 Creative Singularities in total.

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
| Philosopher's Stone (both recipes) | redstone → redstone blocks, glowstone dust → glowstone, diamond → an Allthemodium Ingot |
| Dark Matter | diamond block → a Vibranium Ingot (Allthemodium) |
| Red Matter (both recipes) | Aeternalis Fuel → Aeternalis Fuel Blocks (9 times as much), plus 2 Unobtainium Ingots |
| Collector MK2 / MK3, Relay MK2 / MK3 | one Dark / Red Matter → a Dark / Red Matter Block (4 times as much) |
| Collector MK3 / Relay MK3 | glowstone / obsidian → Compressed Glowstone / Compressed Obsidian (All The Compressed) |
| Condenser MK2 | now in an Elite Crafting Table, with 4 Compressed Unobtainium Blocks |
| Transmutation Tablet | stone → Allthemodium Ingots |
| Transmutation Interface | hopper → ME Interface (AE2) |
| Watch of Flowing Time | clock → Time in a Bottle |
| Dark Matter Furnace | furnace → Diamond Furnace (Iron Furnaces) |

Together with the earlier changes (Transmutation Table, Alchemical Chest, Collector MK1, Condenser MK1 in the Advanced table, Dark Matter Pedestal in the Elite table), most of Equivox now ties into other mods. Equivox's progression follows **Allthemodium**: the Philosopher's Stone needs Allthemodium, Dark Matter needs Vibranium and Red Matter needs Unobtainium (the quests wait for those ingots too).

### Late-game items moved to Extended Crafting tables
The original recipe stays in the middle; around it go Extended Crafting components, Black Iron Ingots and a cross-mod ingredient.

| Table | Item | Extra ingredient (4) |
|---|---|---|
| Advanced (5x5) | Teleporter (Mekanism) | Warp Stone (Waystones) |
| Advanced (5x5) | Quantum Ring (AE2) | Reinforced Alloy (Mekanism) |
| Advanced (5x5) | World Spike (Railcraft) | Zanite Gemstone (The Aether II) |
| Advanced (5x5) | Loot Fabricator (Hostile Neural Networks) | Engineering Processor (AE2) |
| Advanced (5x5) | Time in a Bottle | Quicksilver (Thaumaturge) |
| Advanced (5x5) | Energy Condenser MK1 (Equivox) | Allthemodium Block |
| Advanced (5x5) | Uncrafting Table (Twilight Forest) | Gem Dust (Apotheosis) |
| Advanced (5x5) | Atomic Forge (Oritech) | Atomic Alloy (Mekanism) |
| Elite (7x7) | Augmenting Table (Apotheosis) | Void Metal (Thaumaturge) |
| Elite (7x7) | Dark Matter Pedestal (Equivox) | Vibranium Block (Allthemodium) |

These items have a tooltip saying which table they need.
- **The tables cost more**, one tier heavier each:

| Table | Middle (was) | Bottom (was Black Iron Slate) |
|---|---|---|
| Basic | Steel Block (iron block) | Basic Control Circuit |
| Advanced | Imperium Block (gold block) | Advanced Control Circuit |
| Elite | Compressed Obsidian (diamond block) | Elite Control Circuit |
| Ultimate | Compressed Vibranium Block (emerald block) | Ultimate Control Circuit |

- The Endgame chapter has two new quests, **Elite Crafting Table** and **Ultimate Crafting Table**; creative items need the Elite one, the trophy needs the Ultimate one.

### Allthemodium alloy tools
The alloy tools (Sword, Pickaxe, Axe, Shovel, Mace, Trident, Paxel) had no recipe at all. They now have a very hard Extended Crafting recipe:
- **Elite Crafting Table** (7x7) for each tool: the Unobtainium version of the tool (a Trident for the Alloy Trident) in the middle, wrapped in all three alloy ingots, 4 Compressed Unobtainium-Vibranium Alloy Blocks, 2 Antimatter Pellets and 4 Elite Components.
- **Ultimate Crafting Table** (9x9) for the **Alloy Paxel**: the Alloy Pickaxe, Axe and Shovel, all three alloys, Compressed and Double Compressed Unobtainium-Vibranium Alloy Blocks, Antimatter and 4 Ultimate Components.

### Mystical Agriculture: new seeds (Mystical Customization)
The *ATM x Mystical Ag Support* mod was removed. GSPack now adds its own crops with Mystical Customization (`config/mysticalcustomization/crops`), and a KubeJS script turns their essence back into the resource (`kubejs/server_scripts/gspack_mystical_seeds.js`). Seeds are made on the Infusion Altar as usual.

- **Allthemodium** (tier 5), **Vibranium** and **Unobtainium** (tier 6). Each one needs its own **Crux block** under the farmland: the new **Allthemodium, Vibranium and Unobtainium Crux** (KubeJS blocks). Each crux is crafted around the one before it, with Allthemodium / Vibranium / Unobtainium blocks and Supremium or Insanium Essence.
- **16 ores from other mods**, many of them useful for the endgame: Titanium, Desh and Novite (Stellaris), Zanite, Arkenium, Gravitite and Ambrosium (The Aether II), Dark Gem (EvilCraft), Niobium (LTX Industries), Iesnium (Occultism), Cinnabar (AllTheOres), Ferricore, Blazegold, Celestigem and Eclipse Alloy (Just Dire Things) and Neptunium (Aquaculture).
- Higher tiers give less per craft: 8 essence makes 6 / 4 / 3 (tier 2 / 3 / 4), 9 essence makes 2 / 1 (tier 5 / 6).
- The **Verdant Core** now needs Unobtainium Seeds from this set.
- **Seed Codex:** the Allthemodium section shows the three new seeds (the old Total Oreium seed is gone) and a new section **Ores From Other Mods** has the other 16. The *Crux Blocks* quest mentions the new crux blocks.

### Quest book
- **New chapter: GSPack Progression** (after Getting Started, 27 quests): a hand-placed map of the pack with dependency lines. A shared start (iron, Smeltery, Nether, diamonds) splits into three roads (Technology, Magic, Exploration, with Equivox after Allthemodium) that meet again at Extended Crafting and lead to the Trophy of Infinity. The milestones complete when you have the item.
- **New chapter: Just Dire Things** (Technology, 56 quests): the four goo tiers and what they transform (iron, gold, diamond and netherite blocks into Ferricore, Blazegold, Celestigem and Eclipse Alloy), the tools and armor of each metal, better coal, Polymorphic, fuel, time and portal fluids, the Time Wand, Portal Gun and Paradox Machine, the machines, ability upgrades, and the wands and gadgets.
- **New chapter: Trophy Checklist** (Endgame, 46 quests): every ingredient of the Trophy of Infinity with the amount needed, laid out as a target like the 9x9 recipe: materials, creative items, the capstones of 20 mods and the Twilight Forest trophies on four rings around the trophy.
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

### Broken mod recipes fixed
- **Capacitor Additions** (Allthemodium, Vibranium and Unobtainium Capacitor) and **Grinding Ball Additions** (Allthemodium, Vibranium, Unobtainium and Infinite Grinding Ball) could not be crafted: their recipes use an ingredient format that Minecraft 26.1 no longer reads. KubeJS re-adds them with the same patterns (`kubejs/server_scripts/gspack_broken_recipe_fixes.js`).
- Not fixed: the Dark Utilities rune templates (font changes for item names) need the Bookshelf library, which is not in the pack.

### Configs
- Occultism: config updated for 1.260.4 (new lumberjack spirit settings, defaults kept).
- Tinkers' Construct no longer gives new players its book when they join a world (`shouldSpawnWithTinkersBook = false`).

### For pack makers
- `build-quests.ps1`: new `-showlines` switch for `Chapter` to draw dependency lines in a hand-placed chapter (lines stay hidden everywhere else).
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
