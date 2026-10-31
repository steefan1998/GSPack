// GSPack endgame: the Creative Singularity and the craftable creative items.
//
// Five cores, one per pillar of the pack, each made from the hardest items of that pillar:
//   Technological Core  - Mekanism, Oritech, Advanced AE
//   Arcane Core         - Thaumaturge, Apotheosis, Equivox, Mystical Agriculture
//   Verdant Core        - Mystical Agradditions, Aquaculture, ATM seeds
//   Dimensional Core    - Allthemodium, Twilight Forest, Aether II
//   Cosmic Core         - Stellaris
// The five cores make a Creative Singularity; every creative item needs one.

ServerEvents.recipes(event => {
  // ----- Cores -----
  event.shaped('gspack:tech_core', [
    'ABA',
    'CDC',
    'ABA'
  ], {
    A: 'mekanism:pellet_antimatter',
    B: 'oritech:super_ai_chip',
    C: 'advanced_ae:quantum_processor',
    D: 'mekanism_extras:infinite_control_circuit'
  }).id('gspack:endgame/tech_core')

  event.shaped('gspack:arcane_core', [
    'ABA',
    'CDC',
    'ABA'
  ], {
    A: 'thaumaturge:metal_void',
    B: 'apotheosis:godforged_pearl',
    C: 'equivox:red_matter_block',
    D: 'thaumaturge:primordial_pearl'
  }).id('gspack:endgame/arcane_core')

  event.shaped('gspack:verdant_core', [
    'ABA',
    'CDC',
    'ABA'
  ], {
    A: 'mysticalagradditions:insanium_gemstone_block',
    B: 'mysticalagriculture:nether_star_seeds',
    C: 'aquaculture:neptunium_block',
    D: 'atm_xmystical_ag_support:unobtainium_seed'
  }).id('gspack:endgame/verdant_core')

  event.shaped('gspack:dimensional_core', [
    'ABA',
    'CDC',
    'AEA'
  ], {
    A: 'allthemodium:unobtainium_vibranium_block',
    B: 'twilightforest:snow_queen_trophy',
    C: 'aether_ii:gravitite_block',
    D: 'allthemodium:piglich_heart_block',
    E: 'twilightforest:ur_ghast_trophy'
  }).id('gspack:endgame/dimensional_core')

  event.shaped('gspack:cosmic_core', [
    'ACA',
    'BDB',
    'ACA'
  ], {
    A: 'stellaris:novite_block',
    B: 'stellaris:star_crawler_boss_trophy',
    C: 'stellaris:heart_of_luna_trophy',
    D: 'minecraft:nether_star'
  }).id('gspack:endgame/cosmic_core')

  // ----- The singularity -----
  event.shaped('gspack:creative_singularity', [
    'ABA',
    'CDE',
    'AFA'
  ], {
    A: 'minecraft:nether_star',
    B: 'gspack:tech_core',
    C: 'gspack:arcane_core',
    D: 'gspack:dimensional_core',
    E: 'gspack:verdant_core',
    F: 'gspack:cosmic_core'
  }).id('gspack:endgame/creative_singularity')

  // ----- Creative items: a singularity in the middle, the best version of the item around it -----
  // [output, ingredient A (corners), ingredient B (edges), recipe id]
  const creative = [
    ['mekanism:creative_energy_cube', 'mekanism_extras:infinite_energy_cube', 'mekanism:pellet_antimatter', 'mekanism_energy_cube'],
    ['mekanism:creative_fluid_tank', 'mekanism_extras:infinite_fluid_tank', 'mekanism:pellet_antimatter', 'mekanism_fluid_tank'],
    ['mekanism:creative_chemical_tank', 'mekanism_extras:infinite_chemical_tank', 'mekanism:pellet_antimatter', 'mekanism_chemical_tank'],
    ['mekanism:creative_bin', 'mekanism_extras:infinite_bin', 'mekanism:pellet_antimatter', 'mekanism_bin'],
    ['mekanism_extras:upgrade_creative', 'mekanism_extras:upgrade_stack', 'mekanism:upgrade_speed', 'mekanism_upgrade'],
    ['ae2:creative_energy_cell', 'ae2:dense_energy_cell', 'advanced_ae:quantum_processor', 'ae2_energy_cell'],
    ['ae2:creative_storage_cell', 'ae2:item_storage_cell_256k', 'advanced_ae:quantum_storage_256', 'ae2_storage_cell'],
    ['oritech:creative_storage', 'oritech:large_storage', 'oritech:overcharged_crystal', 'oritech_storage'],
    ['oritech:creative_tank', 'oritech:portable_tank', 'oritech:super_ai_chip', 'oritech_tank'],
    ['powah:energy_cell_creative', 'powah:energy_cell_nitro', 'powah:crystal_nitro', 'powah_energy_cell'],
    ['mysticalagradditions:creative_essence', 'mysticalagradditions:insanium_gemstone_block', 'mysticalagriculture:awakened_supremium_ingot_block', 'mystical_essence'],
    ['sophisticatedstorage:infinity_upgrade', 'sophisticatedstorage:stack_upgrade_omega_tier', 'storage_allthemodium_upgrade:stack_upgrade_tier_8', 'storage_infinity'],
    ['sophisticatedbackpacks:infinity_upgrade', 'sophisticatedbackpacks:stack_upgrade_omega_tier', 'backpack_allthemodium_upgrade:stack_upgrade_tier_7', 'backpack_infinity'],
    ['storagedrawers:creative_storage_upgrade', 'storagedrawers:emerald_storage_upgrade', 'storagedrawers:netherite_storage_upgrade', 'drawers_storage'],
    ['storagedrawers:creative_vending_upgrade', 'storagedrawers:creative_storage_upgrade', 'storagedrawers:netherite_storage_upgrade', 'drawers_vending'],
    ['functionalstorage:creative_vending_upgrade', 'functionalstorage:max_storage_upgrade', 'functionalstorage:netherite_upgrade', 'functional_vending'],
    ['pipez:infinity_upgrade', 'pipez:ultimate_upgrade', 'mekanism:pellet_antimatter', 'pipez_infinity']
  ]

  creative.forEach(([output, corner, edge, id]) => {
    event.remove({ output: output })
    event.shaped(output, [
      'ABA',
      'BSB',
      'ABA'
    ], {
      A: corner,
      B: edge,
      S: 'gspack:creative_singularity'
    }).id(`gspack:endgame/creative/${id}`)
  })

  // ----- The final goal -----
  event.shaped('gspack:infinity_trophy', [
    'ABC',
    'DSE',
    'FGH'
  ], {
    A: 'mekanism:creative_energy_cube',
    B: 'ae2:creative_storage_cell',
    C: 'oritech:creative_storage',
    D: 'powah:energy_cell_creative',
    S: 'gspack:creative_singularity',
    E: 'mysticalagradditions:creative_essence',
    F: 'sophisticatedstorage:infinity_upgrade',
    G: 'mekanism:creative_fluid_tank',
    H: 'ae2:creative_energy_cell'
  }).id('gspack:endgame/infinity_trophy')
})
