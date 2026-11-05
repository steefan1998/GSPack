QGroup 'endgame' 'Endgame'

Chapter 'endgame' 'Endgame: Infinity' 'gspack:infinity_trophy' 'endgame' 'Master every pillar of the pack and craft creative items.'

# Each core unlocks only after the capstone quests of its chapters are done ('chapter/quest' dependencies),
# so this chapter follows your progression through the whole pack.

Q 'intro' 'The Final Goal' 'check' '' 'xp:100' -size 2 -shape 'gear' -icon 'gspack:infinity_trophy' -sub 'Craft the Trophy of Infinity' -desc @'
This is the end goal of &6GSPack&r.

To reach it you need five &ecores&r, one for each pillar of the pack. Each core is made from the hardest items of its pillar, and its recipe draws on the capstones of those mods. This chapter can be started independently.

Combine the five cores in a &dPowah Energizing Orb&r to create a &dCreative Singularity&r. Every &ecreative item&r needs one.

Craft eight creative items and you can make the &6Trophy of Infinity&r.

Creative items are made in an &eElite Crafting Table&r and the trophy in an &eUltimate Crafting Table&r (Extended Crafting).
{@pagebreak}
&eThe five cores&r
- &bTechnological Core&r: Mekanism, Oritech, Applied Energistics 2
- &5Arcane Core&r: Thaumaturge, Apotheosis, Equivox, Occultism
- &aVerdant Core&r: Mystical Agriculture, Productive Trees, Productive Farming, Aquaculture
- &6Dimensional Core&r: The Bumblezone, The Twilight Forest, The Aether II
- &9Cosmic Core&r: Stellaris

All recipes can be found in JEI. Good luck!
'@

# ===== The five cores =====
Q 'core_tech' 'Technological Core' 'gspack:tech_core' 'intro,mekanism/infinite,mekanism/sps,oritech/computing,ae2/adv_ae' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Build the FE multiblock described in Cores: Technological Core. A central Crafting Core and 24 Pedestals combine Mekanism, Oritech, Advanced AE, AE2 and Powah components. The recipe consumes 250,000,000 FE at up to 25,000 FE/t. Check JEI and the dedicated Cores route.
'@
Q 'core_arcane' 'Arcane Core' 'gspack:arcane_core' 'intro,thaumaturge/pearl,apotheosis/pearl,equivox/red_matter,mystical/awakened' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Craft in an Elite Crafting Table (7x7). Required magic mods: Thaumaturge, Occultism, Equivox, Apotheosis, EvilCraft and Roots Classic. The recipe includes a Primordial Pearl, tier-4 Storage Stabilizer, Godforged Pearl, Red Matter, Klein Star Omega, Dark Power Gem Block and Crystal Staff. See Cores: Arcane Core for the full route and JEI for quantities.
'@
Q 'core_verdant' 'Verdant Core' 'gspack:verdant_core' 'intro,mystical/insanium,aquaculture/neptunium' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Craft in an Elite Crafting Table (7x7) with 25 farming and tree ingredients, including Productive Trees, Productive Farming, Mystical Agriculture and Aquaculture. Productive Bees remains optional. Follow Cores: Verdant Core and JEI.
'@
Q 'core_dimensional' 'Dimensional Core' 'gspack:dimensional_core' 'intro,allthemodium/unob_ingot,allthemodium/piglich,twilight/snow_queen,twilight/ur_ghast,aether/gravitite' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Craft in an Elite Crafting Table (7x7) using The Bumblezone, The Aether II and Twilight Forest. Obtain Essence of the Bees, Royal Jelly, Glistering Honey Crystal, Gravitite, Zanite, Valkyrie Wings and Hydra, Ur-Ghast and Snow Queen trophies. Follow Cores: Dimensional Core and JEI.
'@
Q 'core_cosmic' 'Cosmic Core' 'gspack:cosmic_core' 'intro,stellaris/heart,stellaris/star_crawler,stellaris/novite' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Craft in an Elite Crafting Table (7x7) using Stellaris lunar resources, both boss trophies, Autopilot and Shield Modules, Space Station Blueprint, Nitro Energy Cell, Martian Navigation Core and Astrum Vitreus. Follow Cores: Cosmic Core and JEI.
'@

# ===== The singularity =====
Q 'singularity' 'Creative Singularity' 'gspack:creative_singularity' 'core_tech,core_arcane,core_verdant,core_dimensional,core_cosmic' 'lvl:50;table:epic' -size 2 -shape 'gear' -desc @'
Use a Powah Energizing Orb with all five cores. The recipe consumes only these five ingredients and 1,000,000,000 FE. Powered Energizing Rods around the Orb supply energy; they are not recipe ingredients and are not consumed. See JEI.
'@

# ===== Extended Crafting tables =====
Q 'ec_elite' 'Elite Crafting Table' 'extendedcrafting:elite_table' 'intro' 'xp:500;table:epic' -size 1.5 -desc @'
Creative items are too big for a normal crafting table: they are crafted in a 7x7 &eElite Crafting Table&r from &bExtended Crafting&r.

Work your way up: &eBasic&r (3x3), &eAdvanced&r (5x5) and &eElite&r (7x7). In GSPack each table needs materials from other mods:
- Basic: a steel block and a Basic Control Circuit
- Advanced: an Imperium Block and an Advanced Control Circuit
- Elite: a Compressed Obsidian block and an Elite Control Circuit

The creative item recipes also use &eBlack Iron Ingots&r, &eElite Components&r and &eCrystaltine Ingots&r. Check JEI!
'@
Q 'ec_ultimate' 'Ultimate Crafting Table' 'extendedcrafting:ultimate_table' 'ec_elite' 'xp:1000;table:epic' -size 1.5 -desc @'
The Trophy of Infinity is crafted in a 9x9 &eUltimate Crafting Table&r.

In GSPack it needs a &5Compressed Vibranium Block&r (All The Compressed) and an &eUltimate Control Circuit&r (Mekanism), on top of the Ultimate Components and Catalyst.
'@
Q 'ec_singularity' 'Ultimate Singularity' 'extendedcrafting:ultimate_singularity' 'ec_ultimate' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
The heart of the Trophy of Infinity: the &dUltimate Singularity&r from Extended Crafting.

In GSPack it has its own recipe in the 9x9 &eUltimate Crafting Table&r:
- All &e19 singularities&r. Each one is compressed from 10,000 of one material in the &eCompressor&r: iron, gold, copper, tin, steel, diamond and more.
- A &dCreative Singularity&r in the middle.
- 4 each of Antimatter Pellets, Insanium Gemstone Blocks, Compressed Unobtainium Blocks and Void Metal.
- 8 &eTriple Compressed Iron Blocks&r (All The Compressed), 16 Black Iron Blocks, 5 Nether Star Blocks, 4 Crystaltine Blocks, 4 Ultimate Components, 4 Ultimate Catalysts and 4 Infinite Control Circuits.

Start your compressors early and automate the materials! Check JEI for the full recipe.
'@

# ===== Creative items =====
$creative = @(
    @('c_energy_cube', 'Creative Energy Cube', 'mekanism:creative_energy_cube', 'Infinite Energy Cubes and Antimatter around a singularity. Endless power.', $true),
    @('c_fluid_tank', 'Creative Fluid Tank', 'mekanism:creative_fluid_tank', 'Infinite Fluid Tanks and Antimatter. An endless supply of any fluid.', $true),
    @('c_storage_cell', 'Creative Storage Cell', 'ae2:creative_storage_cell', '256k cells and Quantum Storage. An endless supply of any item in your ME network.', $true),
    @('c_energy_cell', 'Creative Energy Cell', 'ae2:creative_energy_cell', 'Dense Energy Cells and Quantum Processors. Your ME network never runs out of power.', $true),
    @('c_oritech_storage', 'Creative Oritech Storage', 'oritech:creative_storage', 'Large Storage blocks and Overcharged Crystals.', $true),
    @('c_powah', 'Creative Energy Cell (Powah)', 'powah:energy_cell_creative', 'Nitro Energy Cells and Nitro Crystals.', $true),
    @('c_essence', 'Creative Essence', 'mysticalagradditions:creative_essence', 'Insanium and Awakened Supremium blocks. Grows any crop instantly.', $true),
    @('c_infinity', 'Infinity Upgrade', 'sophisticatedstorage:infinity_upgrade', 'Omega and tier 8 stack upgrades. A storage block with infinite room.', $true),
    @('c_chemical_tank', 'Creative Chemical Tank', 'mekanism:creative_chemical_tank', 'Infinite Chemical Tanks and Antimatter.', $false),
    @('c_bin', 'Creative Bin', 'mekanism:creative_bin', 'Infinite Bins and Antimatter.', $false),
    @('c_upgrade', 'Creative Upgrade', 'mekanism_extras:upgrade_creative', 'Stack and Speed upgrades. Makes a Mekanism machine absurdly fast.', $false),
    @('c_oritech_tank', 'Creative Oritech Tank', 'oritech:creative_tank', 'Portable Tanks and Super AI Chips.', $false),
    @('c_backpack', 'Backpack Infinity Upgrade', 'sophisticatedbackpacks:infinity_upgrade', 'Omega and tier 7 stack upgrades for your backpack.', $false),
    @('c_drawers', 'Creative Drawer Upgrade', 'storagedrawers:creative_storage_upgrade', 'Emerald and Netherite drawer upgrades.', $false),
    @('c_vending', 'Creative Vending Upgrade', 'storagedrawers:creative_vending_upgrade', 'A drawer that hands out endless copies of an item.', $false),
    @('c_functional', 'Creative Vending (Functional Storage)', 'functionalstorage:creative_vending_upgrade', 'Max Storage and Netherite upgrades.', $false),
    @('c_pipez', 'Infinity Pipe Upgrade', 'pipez:infinity_upgrade', 'Ultimate upgrades and Antimatter. Pipes without limits.', $false)
)
foreach ($ci in $creative) {
    $key, $title, $item, $text, $needed = $ci
    $extra = if ($needed) { '&6Needed for the Trophy of Infinity.&r' } else { '&7Optional: not needed for the trophy.&r' }
    Q $key $title $item 'singularity,ec_elite' 'xp:500;table:epic' -opt:(-not $needed) -desc "&7Recipe (Elite Crafting Table, 7x7):&r a Creative Singularity in the middle. $text Plus 4 double compressed blocks (All The Compressed), 16 Black Iron Ingots, 4 Elite Components and 4 Crystaltine Ingots.||$extra"
}

# ===== The trophy =====
# The trophy needs the capstone item of most mods, so it also waits for those chapters' final quests.
$capstones = 'mekanism/mekasuit,ae2/qcomputer,oritech/black_hole,ltx/master,railcraft/electric,tinkers/queens_slime,thaumaturge/pearl,apotheosis/pearl,equivox/klein_omega,mystical/insanium,evilcraft/infuser,roots/crystal_staff,aether/valkyrie,allthemodium/complete,stellaris/star_crawler,aquaculture/neptunium,twilight/trophies'
Q 'trophy' 'Trophy of Infinity' 'gspack:infinity_trophy' ((@($creative | Where-Object { $_[4] } | ForEach-Object { $_[0] }) + 'ec_ultimate' + 'ec_singularity' + $capstones) -join ',') 'lvl:100' -size 3 -shape 'gear' -desc @'
&6You did it!&r

The Trophy of Infinity is proof that you have mastered every corner of GSPack: technology, magic, farming, exploration and space.
{@pagebreak}
&7Recipe (Ultimate Crafting Table, 9x9), from the outside in:&r
- The eight &2Twilight Forest&r boss trophies, 4 Nether Star Blocks, 4 Crystaltine Blocks, 8 &eDouble Compressed Netherite Blocks&r and 4 &eDouble Compressed Unobtainium-Vibranium Alloy Blocks&r.
- The top item of 20 mods: MekaSuit Bodyarmor, Quantum Core, Black Hole, Infinite Energy Cell Array, Electric Locomotive, Nitro Energy Cell, Queen's Slime Ingot, Primordial Pearl, Godforged Pearl, Klein Star Omega, Insanium Gemstone Block, Dark Power Gem Block, Crystal Staff, Valkyrie Wings, Unobtainium-Vibranium Block, Heart of Luna and Star Crawler trophies, Neptunium Block, Novite Block and Gravitite Block. Plus 4 Creative Singularities and 4 Crystaltine Blocks.
- The eight creative items: Creative Energy Cube, Creative Storage Cell, Creative Oritech Storage, Creative Powah Cell, Creative Essence, Infinity Upgrade, Creative Fluid Tank and Creative Energy Cell. Plus 4 Infinite Control Circuits and 4 &eCompressed Antimatter Blocks&r.
- 4 more Creative Singularities and 4 Ultimate Components.
- In the very middle: the &dUltimate Singularity&r.

That is &d16 Creative Singularities&r in total, counting the ones in the creative items.

Place it somewhere everyone can see it. Thank you for playing GSPack!
'@
