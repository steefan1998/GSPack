QGroup 'endgame' 'Endgame'

Chapter 'endgame' 'Endgame: Infinity' 'gspack:infinity_trophy' 'endgame' 'Master every pillar of the pack and craft creative items.'

# Each core unlocks only after the capstone quests of its chapters are done ('chapter/quest' dependencies),
# so this chapter follows your progression through the whole pack.

Q 'intro' 'The Final Goal' 'check' 'basics/dragon' 'xp:100' -size 2 -shape 'gear' -icon 'gspack:infinity_trophy' -sub 'Craft the Trophy of Infinity' -desc @'
This is the end goal of &6GSPack&r.

To reach it you need five &ecores&r, one for each pillar of the pack. Each core is made from the hardest items of its pillar, and its quest only unlocks once you have finished the final quests of those chapters.

Combine the five cores into a &dCreative Singularity&r. Every &ecreative item&r needs one.

Craft eight creative items and you can make the &6Trophy of Infinity&r.
{@pagebreak}
&eThe five cores&r
- &bTechnological Core&r: Mekanism, Oritech, Applied Energistics 2
- &5Arcane Core&r: Thaumaturge, Apotheosis, Equivox, Mystical Agriculture
- &aVerdant Core&r: Mystical Agriculture, Aquaculture, the Seed Codex
- &6Dimensional Core&r: Allthemodium, The Twilight Forest, The Aether II
- &9Cosmic Core&r: Stellaris

All recipes can be found in JEI. Good luck!
'@

# ===== The five cores =====
Q 'core_tech' 'Technological Core' 'gspack:tech_core' 'intro,mekanism/infinite,mekanism/sps,oritech/computing,ae2/adv_ae' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Antimatter, AI and quantum computing in one core.

&7Recipe:&r 4 Antimatter Pellets, 2 Super AI Chips, 2 Quantum Processors and an Infinite Control Circuit in the middle.

Unlocks after: the Infinite tier and the SPS (Mekanism), Advanced Computing (Oritech) and Advanced AE.
'@
Q 'core_arcane' 'Arcane Core' 'gspack:arcane_core' 'intro,thaumaturge/pearl,apotheosis/pearl,equivox/red_matter,mystical/awakened' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
The combined power of every kind of magic in the pack.

&7Recipe:&r 4 Void Metal blocks, 2 Godforged Pearls, 2 Red Matter blocks and a Primordial Pearl in the middle.

Unlocks after: the Primordial Pearl (Thaumaturge), Godforged (Apotheosis), Red Matter (Equivox) and Awakened Supremium (Mystical Agriculture).
'@
Q 'core_verdant' 'Verdant Core' 'gspack:verdant_core' 'intro,mystical/insanium,seeds/s_nether_star,seeds/s_unobtainium,aquaculture/neptunium' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
The essence of everything that grows, and everything that swims.

&7Recipe:&r 4 Insanium Gemstone blocks, 2 Nether Star Seeds, 2 Neptunium blocks and an Unobtainium Seed in the middle.

Unlocks after: Insanium, the Nether Star and Unobtainium seeds (Seed Codex) and Neptunium (Aquaculture).
'@
Q 'core_dimensional' 'Dimensional Core' 'gspack:dimensional_core' 'intro,allthemodium/unob_ingot,allthemodium/piglich,twilight/snow_queen,twilight/ur_ghast,aether/gravitite' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Trophies and metals from the far-away worlds.

&7Recipe:&r 4 Unobtainium-Vibranium blocks, a Snow Queen trophy, an Ur-Ghast trophy, 2 Gravitite blocks and a Piglich Heart block in the middle.

Unlocks after: Unobtainium and the Piglich (Allthemodium), the Ur-Ghast and the Snow Queen (Twilight Forest) and Gravitite (Aether II).
'@
Q 'core_cosmic' 'Cosmic Core' 'gspack:cosmic_core' 'intro,stellaris/heart,stellaris/star_crawler,stellaris/novite' 'xp:1000;table:epic' -size 1.5 -shape 'hexagon' -desc @'
Forged from the bosses of the Moon.

&7Recipe:&r 4 Novite blocks, 2 Heart of Luna trophies, 2 Star Crawler trophies and a Nether Star in the middle.

Unlocks after: the Heart of Luna, the Star Crawler Queen and Novite (Stellaris).
'@

# ===== The singularity =====
Q 'singularity' 'Creative Singularity' 'gspack:creative_singularity' 'core_tech,core_arcane,core_verdant,core_dimensional,core_cosmic' 'lvl:50;table:epic' -size 2 -shape 'gear' -desc @'
All five cores, collapsed into a single point.

&7Recipe:&r the five cores and 4 Nether Stars.

Every creative item needs one Creative Singularity, so you will need several. Automate your pillars!
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
    Q $key $title $item 'singularity' 'xp:500;table:epic' -opt:(-not $needed) -desc "&7Recipe:&r a Creative Singularity in the middle. $text||$extra"
}

# ===== The trophy =====
Q 'trophy' 'Trophy of Infinity' 'gspack:infinity_trophy' (($creative | Where-Object { $_[4] } | ForEach-Object { $_[0] }) -join ',') 'lvl:100' -size 3 -shape 'gear' -desc @'
&6You did it!&r

The Trophy of Infinity is proof that you have mastered every corner of GSPack: technology, magic, farming, exploration and space.

&7Recipe:&r a Creative Singularity in the middle, surrounded by the Creative Energy Cube, Creative Storage Cell, Creative Oritech Storage, Creative Powah Cell, Creative Essence, Infinity Upgrade, Creative Fluid Tank and Creative Energy Cell.

Place it somewhere everyone can see it. Thank you for playing GSPack!
'@
