Chapter 'trophy' 'Trophy Checklist' 'gspack:infinity_trophy' 'endgame' 'Everything the Trophy of Infinity needs, ring by ring, just like its 9x9 recipe.'

# A target-shaped layout: the trophy in the middle, its ingredients on four rings around it.
# The rings follow the recipe (Ultimate Crafting Table), from the centre out:
#   ring 1: the Extended Crafting and compressed materials
#   ring 2: the eight creative items
#   ring 3: the capstone item of 20 mods
#   ring 4: the eight Twilight Forest boss trophies
# Keep the counts in sync with the trophy recipe in kubejs/server_scripts/gspack_endgame_recipes.js.

function Ring-Pos([int]$i, [int]$n, [double]$r, [double]$turn = 0) {
    $a = 2 * [Math]::PI * ($i / $n + $turn) - [Math]::PI / 2   # start at the top, go clockwise
    '{0},{1}' -f ([Math]::Round($r * [Math]::Cos($a), 2)).ToString([Globalization.CultureInfo]::InvariantCulture),
        ([Math]::Round($r * [Math]::Sin($a), 2)).ToString([Globalization.CultureInfo]::InvariantCulture)
}

# [key, title, item*count, where to get it]
$rings = @(
    @{ R = 2.7; Shape = 'hexagon'; Table = 'rare'; Name = 'Ring 1: materials'; Items = @(
        @('m_ultimate_singularity', 'Ultimate Singularity', 'extendedcrafting:ultimate_singularity', 'The very centre of the recipe. All 19 singularities and a Creative Singularity (Endgame: Infinity).'),
        @('m_creative_singularity', 'Creative Singularities', 'gspack:creative_singularity*8', 'Eight of them, from the five cores (Endgame: Infinity). The creative items need eight more.'),
        @('m_ultimate_component', 'Ultimate Components', 'extendedcrafting:ultimate_component*4', 'Extended Crafting components.'),
        @('m_control_circuit', 'Infinite Control Circuits', 'mekanism_extras:infinite_control_circuit*4', 'The best circuit from Mekanism Extras.'),
        @('m_antimatter', 'Compressed Antimatter', 'allthecompressed:antimatter_block_1x*4', '9 Antimatter Pellets make an Antimatter Block, 9 of those make one Compressed Antimatter Block (All The Compressed).'),
        @('m_crystaltine', 'Crystaltine Blocks', 'extendedcrafting:crystaltine_block*8', 'Crystaltine from Extended Crafting.'),
        @('m_nether_star', 'Nether Star Blocks', 'extendedcrafting:nether_star_block*4', 'Nine Nether Stars each.'),
        @('m_netherite', 'Double Compressed Netherite', 'allthecompressed:netherite_block_2x*8', '81 Netherite Blocks each (All The Compressed).'),
        @('m_unob_vib', 'Double Compressed Unobtainium-Vibranium', 'allthecompressed:unobtainium_vibranium_block_2x*4', '81 Unobtainium-Vibranium Alloy Blocks each (Allthemodium alloys, All The Compressed).')
    ) },
    @{ R = 4.9; Shape = 'diamond'; Table = 'epic'; Name = 'Ring 2: creative items'; Items = @(
        @('c_energy_cube', 'Creative Energy Cube', 'mekanism:creative_energy_cube', 'Mekanism. Elite Crafting Table (Endgame: Infinity).'),
        @('c_storage_cell', 'Creative Storage Cell', 'ae2:creative_storage_cell', 'Applied Energistics 2. Elite Crafting Table (Endgame: Infinity).'),
        @('c_oritech_storage', 'Creative Oritech Storage', 'oritech:creative_storage', 'Oritech. Elite Crafting Table (Endgame: Infinity).'),
        @('c_powah', 'Creative Energy Cell (Powah)', 'powah:energy_cell_creative', 'Powah. Elite Crafting Table (Endgame: Infinity).'),
        @('c_essence', 'Creative Essence', 'mysticalagradditions:creative_essence', 'Mystical Agradditions. Elite Crafting Table (Endgame: Infinity).'),
        @('c_infinity', 'Infinity Upgrade', 'sophisticatedstorage:infinity_upgrade', 'Sophisticated Storage. Elite Crafting Table (Endgame: Infinity).'),
        @('c_fluid_tank', 'Creative Fluid Tank', 'mekanism:creative_fluid_tank', 'Mekanism. Elite Crafting Table (Endgame: Infinity).'),
        @('c_energy_cell', 'Creative Energy Cell', 'ae2:creative_energy_cell', 'Applied Energistics 2. Elite Crafting Table (Endgame: Infinity).')
    ) },
    @{ R = 7.4; Shape = ''; Table = 'rare'; Name = 'Ring 3: one capstone per mod'; Items = @(
        @('p_mekasuit', 'MekaSuit Bodyarmor', 'mekanism:mekasuit_bodyarmor', 'Mekanism.'),
        @('p_quantum_core', 'Quantum Core', 'advanced_ae:quantum_core', 'Advanced AE.'),
        @('p_black_hole', 'Black Hole', 'oritech:black_hole', 'Oritech. Also craftable in an Elite Crafting Table.'),
        @('p_ltx', 'Infinite Energy Cell Array', 'ltxi:infinite_energy_cell_array', 'LTX Industries. Also craftable in an Elite Crafting Table.'),
        @('p_locomotive', 'Electric Locomotive', 'railcraft:electric_locomotive', 'Railcraft Reborn.'),
        @('p_powah', 'Nitro Energy Cell', 'powah:energy_cell_nitro', 'Powah.'),
        @('p_queens_slime', 'Queen''s Slime Ingot', 'tconstruct:queens_slime_ingot', 'Tinkers'' Construct.'),
        @('p_primordial', 'Primordial Pearl', 'thaumaturge:primordial_pearl', 'Thaumaturge. Also craftable in an Elite Crafting Table.'),
        @('p_godforged', 'Godforged Pearl', 'apotheosis:godforged_pearl', 'Apotheosis. Also craftable in an Elite Crafting Table.'),
        @('p_klein', 'Klein Star Omega', 'equivox:klein_star_omega', 'Equivox.'),
        @('p_insanium', 'Insanium Gemstone Block', 'mysticalagradditions:insanium_gemstone_block', 'Mystical Agradditions.'),
        @('p_dark_power', 'Dark Power Gem Block', 'evilcraft:dark_power_gem_block', 'EvilCraft.'),
        @('p_crystal_staff', 'Crystal Staff', 'rootsclassic:crystal_staff', 'Roots Classic.'),
        @('p_valkyrie', 'Valkyrie Wings', 'aether_ii:valkyrie_wings', 'The Aether II. Also craftable in an Advanced Crafting Table.'),
        @('p_unob_vib', 'Unobtainium-Vibranium Block', 'allthemodium:unobtainium_vibranium_block', 'Allthemodium alloys.'),
        @('p_luna', 'Heart of Luna Trophy', 'stellaris:heart_of_luna_trophy', 'Stellaris boss. Also craftable in an Advanced Crafting Table.'),
        @('p_crawler', 'Star Crawler Trophy', 'stellaris:star_crawler_boss_trophy', 'Stellaris boss. Also craftable in an Advanced Crafting Table.'),
        @('p_neptunium', 'Neptunium Block', 'aquaculture:neptunium_block', 'Aquaculture 2. Neptunium Seeds work too (Seed Codex).'),
        @('p_novite', 'Novite Block', 'stellaris:novite_block', 'Stellaris. Novite Seeds work too (Seed Codex).'),
        @('p_gravitite', 'Gravitite Block', 'aether_ii:gravitite_block', 'The Aether II. Gravitite Seeds work too (Seed Codex).')
    ) },
    @{ R = 10.0; Shape = 'gear'; Table = 'twilight'; Name = 'Ring 4: Twilight Forest trophies'; Turn = 0.0625; Items = @(
        @('t_naga', 'Naga Trophy', 'twilightforest:naga_trophy', 'Defeat the Naga, or craft it in an Advanced Crafting Table.'),
        @('t_lich', 'Lich Trophy', 'twilightforest:lich_trophy', 'Defeat the Twilight Lich, or craft it in an Advanced Crafting Table.'),
        @('t_minoshroom', 'Minoshroom Trophy', 'twilightforest:minoshroom_trophy', 'Defeat the Minoshroom, or craft it in an Advanced Crafting Table.'),
        @('t_hydra', 'Hydra Trophy', 'twilightforest:hydra_trophy', 'Defeat the Hydra, or craft it in an Advanced Crafting Table.'),
        @('t_knight', 'Knight Phantom Trophy', 'twilightforest:knight_phantom_trophy', 'Defeat the Knight Phantoms, or craft it in an Advanced Crafting Table.'),
        @('t_ur_ghast', 'Ur-Ghast Trophy', 'twilightforest:ur_ghast_trophy', 'Defeat the Ur-Ghast, or craft it in an Advanced Crafting Table.'),
        @('t_yeti', 'Alpha Yeti Trophy', 'twilightforest:alpha_yeti_trophy', 'Defeat the Alpha Yeti, or craft it in an Advanced Crafting Table.'),
        @('t_snow_queen', 'Snow Queen Trophy', 'twilightforest:snow_queen_trophy', 'Defeat the Snow Queen, or craft it in an Advanced Crafting Table.')
    ) }
)

$allKeys = @()
foreach ($ring in $rings) {
    $n = $ring.Items.Count
    $turn = if ($ring.Turn) { $ring.Turn } else { 0.0 }
    for ($i = 0; $i -lt $n; $i++) {
        $key, $title, $item, $how = $ring.Items[$i]
        $count = if ($item -match '\*(\d+)$') { [int]$Matches[1] } else { 1 }
        $need = if ($count -gt 1) { "The trophy needs &e$count&r of these." } else { 'The trophy needs &eone&r of these.' }
        Q $key $title $item '' "xp:100;table:$($ring.Table)" -shape $ring.Shape -sub $ring.Name -pos (Ring-Pos $i $n $ring.R $turn) -desc "$need||$how"
        $allKeys += $key
    }
}

Q 'ready' 'Trophy of Infinity' 'gspack:infinity_trophy' ($allKeys -join ',') 'lvl:5' -size 3 -shape 'gear' -pos '0,0' -desc @'
This chapter is a &echecklist&r for the &dTrophy of Infinity&r. It is laid out like the recipe: the closer to the middle, the closer to the centre of the 9x9 grid.

- &bRing 1:&r Extended Crafting and compressed materials
- &dRing 2:&r the eight creative items
- &6Ring 3:&r the top item of 20 mods
- &2Ring 4:&r the eight Twilight Forest boss trophies

Each quest completes when you hold the full amount. When they are all done, craft the trophy in an &eUltimate Crafting Table&r!
'@
