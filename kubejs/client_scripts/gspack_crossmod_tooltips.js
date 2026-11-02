// GSPack: tooltip on every item whose recipe was changed in server_scripts/gspack_crossmod_recipes.js.
// Keep this list in sync with that script.

ItemEvents.modifyTooltips(event => {
  const crossmod = [
    'ae2:charger', 'ae2:drive', 'ae2:energy_acceptor', 'ae2:inscriber', 'ae2:molecular_assembler',
    'allthemodium:teleport_pad', 'apotheosis:simple_reforging_table', 'appflux:flux_accessor',
    'enderio:alloy_smelter', 'enderio:stirling_generator',
    'equivox:alchemical_chest', 'equivox:collector_mk1', 'equivox:transmutation_table', 'evilcraft:dark_tank',
    'equivox:philosophers_stone', 'equivox:dark_matter', 'equivox:red_matter', 'equivox:collector_mk2', 'equivox:collector_mk3',
    'equivox:relay_mk2', 'equivox:relay_mk3', 'equivox:transmutation_tablet', 'equivox:transmutation_provider',
    'equivox:watch_of_flowing_time', 'equivox:dm_furnace',
    'extendedcrafting:basic_table', 'extendedcrafting:advanced_table', 'extendedcrafting:elite_table', 'extendedcrafting:ultimate_table',
    'hostilenetworks:deep_learner', 'hostilenetworks:sim_chamber', 'immersive_aircraft:boiler', 'immersive_aircraft:propeller',
    'laserio:laser_connector', 'ltxi:machine_housing', 'mekanism:metallurgic_infuser',
    'mininggadgets:mininggadget', 'mininggadgets:mininggadget_simple',
    'mysticalagriculture:awakening_altar', 'mysticalagriculture:essence_vessel',
    'oritech:basic_generator', 'oritech:foundry', 'oritech:powered_furnace', 'oritech:pulverizer',
    'powah:energy_cell_starter', 'powah:furnator_starter', 'pylons:harvester_pylon',
    'railcraft:coke_oven_bricks', 'railcraft:steam_oven', 'railcraft:tunnel_bore',
    'replication:disintegrator', 'replication:replicator', 'rootsclassic:altar',
    'stellaris:coal_generator', 'stellaris:fuel_refinery', 'stellaris:rocket_engine', 'stellaris:rover', 'stellaris:space_suit_chestplate'
  ]
  crossmod.forEach(id => event.add(id, Text.darkAqua('GSPack: crafted with items from other mods (see JEI)')))

  // Items moved to an Extended Crafting table (the tableRecipes list in the same script)
  const advanced = [
    'mekanism:teleporter', 'ae2:quantum_ring', 'railcraft:world_spike', 'hostilenetworks:loot_fabricator',
    'tiab:time_in_a_bottle', 'equivox:condenser_mk1', 'twilightforest:uncrafting_table', 'oritech:atomic_forge'
  ]
  // plus the Allthemodium alloy tools (server_scripts/gspack_allthemodium_alloys.js)
  const elite = ['apotheosis:augmenting_table', 'equivox:dm_pedestal', 'equivox:condenser_mk2',
    'allthemodium:alloy_sword', 'allthemodium:alloy_pickaxe', 'allthemodium:alloy_axe', 'allthemodium:alloy_shovel',
    'allthemodium:alloy_mace', 'allthemodium:alloy_trident']
  event.add('allthemodium:alloy_paxel', Text.darkAqua('GSPack: crafted in an Ultimate Crafting Table (Extended Crafting)'))
  advanced.forEach(id => event.add(id, Text.darkAqua('GSPack: crafted in an Advanced Crafting Table (Extended Crafting)')))
  elite.forEach(id => event.add(id, Text.darkAqua('GSPack: crafted in an Elite Crafting Table (Extended Crafting)')))
  event.add('extendedcrafting:ultimate_singularity', Text.darkAqua('GSPack: own recipe in the Ultimate Crafting Table (see JEI)'))

  // Items that had no recipe and are now craftable (newTableRecipes in server_scripts/gspack_endgame_recipes.js)
  const craftableAdvanced = [
    'twilightforest:naga_trophy', 'twilightforest:lich_trophy', 'twilightforest:minoshroom_trophy', 'twilightforest:hydra_trophy',
    'twilightforest:knight_phantom_trophy', 'twilightforest:ur_ghast_trophy', 'twilightforest:alpha_yeti_trophy', 'twilightforest:snow_queen_trophy',
    'stellaris:heart_of_luna_trophy', 'stellaris:star_crawler_boss_trophy', 'aether_ii:valkyrie_wings',
    'ltxi:infinite_water_tank', 'ltxi:infinite_lava_tank'
  ]
  const craftableElite = ['thaumaturge:primordial_pearl', 'apotheosis:godforged_pearl', 'oritech:black_hole', 'ltxi:infinite_energy_cell_array']
  craftableAdvanced.forEach(id => event.add(id, Text.darkAqua('GSPack: also craftable in an Advanced Crafting Table (see JEI)')))
  craftableElite.forEach(id => event.add(id, Text.darkAqua('GSPack: also craftable in an Elite Crafting Table (see JEI)')))
})
