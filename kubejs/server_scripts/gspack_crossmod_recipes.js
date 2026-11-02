// GSPack: cross-mod recipes. Many key items need an ingredient from another mod, so the mods tie together.
//
// Each recipe keeps its original pattern; usually one ingredient is swapped. The new ingredient always comes
// from a mod that is reached earlier in the pack, so nothing is locked. Rough order of the links:
//   early:      Iron Furnaces, Tinkers' Construct, Mystical Agriculture (Inferium), Sophisticated Storage
//   early-mid:  Mekanism (steel, circuits, alloys, casings), Thaumaturge (thaumium), The Aether II (zanite)
//   mid:        AE2, Powah, Oritech, then everything that builds on them
// Steel (#c:ingots/steel, #c:storage_blocks/steel) is made by Mekanism, Railcraft, Oritech, Tinkers' and AllTheOres.
// The patterns are copied from the original recipes; the original recipes are removed.

ServerEvents.recipes(event => {
  // [original recipe id, output, pattern, key, new recipe name, count (optional)]
  const recipes = [
    // ----- Mekanism -----
    ['mekanism:metallurgic_infuser', 'mekanism:metallurgic_infuser', ['I#I', 'ROR', 'I#I'],
      { '#': 'ironfurnaces:iron_furnace', I: '#c:ingots/iron', O: '#c:ingots/osmium', R: '#c:dusts/redstone' }, 'metallurgic_infuser'],

    // ----- Applied Energistics 2 -----
    ['ae2:network/blocks/inscribers', 'ae2:inscriber', ['aba', 'c a', 'aba'],
      { a: '#c:ingots/steel', b: 'minecraft:piston', c: '#c:ingots/copper' }, 'inscriber'],
    ['ae2:network/blocks/crystal_processing_charger', 'ae2:charger', ['aba', 'a  ', 'aba'],
      { a: '#c:ingots/iron', b: '#mekanism:alloys/infused' }, 'charger'],
    ['ae2:network/blocks/storage_drive', 'ae2:drive', ['aba', 'c c', 'aba'],
      { a: '#c:ingots/osmium', b: 'ae2:engineering_processor', c: 'ae2:fluix_glass_cable' }, 'me_drive'],
    ['ae2:network/blocks/energy_energy_acceptor', 'ae2:energy_acceptor', ['aba', 'bcb', 'aba'],
      { a: '#c:ingots/iron', b: 'ae2:quartz_glass', c: '#c:circuits/basic' }, 'energy_acceptor'],
    ['ae2:network/crafting/molecular_assembler', 'ae2:molecular_assembler', ['aba', 'cde', 'aba'],
      { a: '#c:ingots/iron', b: 'ae2:quartz_glass', c: 'ae2:annihilation_core', d: 'tconstruct:crafting_station', e: 'ae2:formation_core' }, 'molecular_assembler'],
    ['appflux:flux_accessor', 'appflux:flux_accessor', ['DPD', 'IMI', 'DPD'],
      { D: 'powah:dielectric_paste', I: '#c:ingots/copper', M: 'ae2:energy_acceptor', P: 'appflux:energy_processor' }, 'flux_accessor'],

    // ----- Oritech -----
    ['oritech:crafting/basicgen', 'oritech:basic_generator', [' s ', 'fbf', ' c '],
      { b: 'mekanism:steel_casing', c: '#c:ingots/copper', f: '#c:ingots/nickel', s: 'oritech:magnetic_coil' }, 'basic_generator'],
    ['oritech:crafting/pulverizer', 'oritech:pulverizer', ['fcf', ' b ', ' s '],
      { b: '#c:storage_blocks/copper', c: '#c:ingots/nickel', f: '#c:ingots/steel', s: 'oritech:motor' }, 'pulverizer'],
    ['oritech:crafting/pulverizeralt', 'oritech:pulverizer', ['fcf', ' b ', ' s '],
      { b: '#oritech:plating', c: '#c:ingots/nickel', f: '#c:ingots/steel', s: 'oritech:motor' }, 'pulverizer_alt'],
    ['oritech:crafting/electricfurnace', 'oritech:powered_furnace', [' s ', 'mbc', 'f f'],
      { b: 'ironfurnaces:iron_furnace', c: '#c:ingots/electrum', f: '#c:ingots/copper', m: '#c:silicon', s: 'oritech:magnetic_coil' }, 'powered_furnace'],
    ['oritech:crafting/electricfurnacealt', 'oritech:powered_furnace', [' s ', 'mbc', 'f f'],
      { b: 'ironfurnaces:iron_furnace', c: '#c:ingots/electrum', f: '#c:ingots/copper', m: '#c:ingots/platinum', s: 'oritech:magnetic_coil' }, 'powered_furnace_alt'],
    ['oritech:crafting/foundry', 'oritech:foundry', ['fbf', ' c ', ' s '],
      { b: 'tconstruct:seared_melter', c: 'oritech:motor', f: '#c:ingots/copper', s: '#c:ingots/electrum' }, 'foundry'],

    // ----- LTX Industries -----
    ['ltxi:shaped_recipes/machine_housing', 'ltxi:machine_housing', ['tgt', 'gcg', 'tgt'],
      { c: 'mekanism:basic_control_circuit', g: '#c:glass_blocks/cheap', t: '#c:ingots/titanium' }, 'machine_housing'],

    // ----- Ender IO -----
    ['enderio:alloy_smelter', 'enderio:alloy_smelter', ['GFG', 'FVF', 'IOI'],
      { F: 'ironfurnaces:iron_furnace', G: '#c:gears/iron', I: '#c:ingots/iron', O: '#c:obsidians', V: 'enderio:void_chassis' }, 'alloy_smelter'],
    ['enderio:stirling_generator', 'enderio:stirling_generator', ['GFG', 'IVI', 'ODO'],
      { D: 'minecraft:deepslate', F: 'ironfurnaces:iron_furnace', G: '#c:gears/iron', I: '#c:ingots/iron', O: '#c:obsidians', V: 'enderio:void_chassis' }, 'stirling_generator'],

    // ----- Powah -----
    ['powah:crafting/energy_cell_starter', 'powah:energy_cell_starter', ['ici', 'cdc', 'ici'],
      { c: 'powah:capacitor_basic_tiny', d: 'powah:dielectric_casing', i: '#c:ingots/steel' }, 'energy_cell_starter'],
    ['powah:crafting/furnator_starter', 'powah:furnator_starter', ['ggg', 'cdc', 'gfg'],
      { c: 'powah:capacitor_basic_tiny', d: 'powah:dielectric_casing', f: 'ironfurnaces:iron_furnace', g: 'powah:dielectric_paste' }, 'furnator_starter'],

    // ----- Railcraft Reborn -----
    ['railcraft:coke_oven_bricks', 'railcraft:coke_oven_bricks', ['aba', 'bcb', 'aba'],
      { a: 'minecraft:sand', b: 'tconstruct:seared_brick', c: 'minecraft:clay' }, 'coke_oven_bricks', 2],
    ['railcraft:steam_oven', 'railcraft:steam_oven', ['aaa', 'aba', 'aaa'],
      { a: '#c:plates/steel', b: 'ironfurnaces:iron_furnace' }, 'steam_oven', 4],
    ['railcraft:tunnel_bore', 'railcraft:tunnel_bore', ['aba', 'cbc', ' d '],
      { a: '#c:storage_blocks/steel', b: 'minecraft:minecart', c: 'mekanism:steel_casing', d: 'minecraft:chest_minecart' }, 'tunnel_bore'],

    // ----- Logistics, gadgets and machines -----
    ['laserio:laser_connector', 'laserio:laser_connector', [' g ', 'rbr', 'iii'],
      { b: 'laserio:logic_chip', g: 'ae2:quartz_glass', i: '#c:ingots/iron', r: '#c:dusts/redstone' }, 'laser_connector'],
    ['mininggadgets:mininggadget_simple', 'mininggadgets:mininggadget_simple', ['dig', 'dur', 'dii'],
      { d: '#c:gems/diamond', g: '#c:ingots/gold', i: '#c:ingots/iron', r: '#c:circuits/basic', u: 'mininggadgets:upgrade_empty' }, 'mininggadget_simple'],
    ['mininggadgets:mininggadget', 'mininggadgets:mininggadget', ['dig', 'dur', 'dig'],
      { d: '#c:gems/diamond', g: '#c:ingots/gold', i: '#c:ingots/iron', r: '#c:circuits/advanced', u: 'mininggadgets:upgrade_empty' }, 'mininggadget'],
    ['hostilenetworks:deep_learner', 'hostilenetworks:deep_learner', ['ORO', 'RGR', 'ODO'],
      { D: 'ae2:logic_processor', G: '#c:glass_panes', O: '#c:obsidians', R: 'minecraft:repeater' }, 'deep_learner'],
    ['hostilenetworks:sim_chamber', 'hostilenetworks:sim_chamber', [' G ', 'EOE', 'MCM'],
      { C: 'minecraft:comparator', E: 'ae2:calculation_processor', G: '#c:glass_panes', M: '#c:gems/lapis', O: '#c:obsidians' }, 'sim_chamber'],
    ['replication:replicator', 'replication:replicator', ['IP ', 'IRM', 'III'],
      { I: 'replication:replica_ingot', M: '#c:ingots/iron', P: 'minecraft:piston', R: '#c:circuits/basic' }, 'replicator'],
    ['replication:disintegrator', 'replication:disintegrator', ['ITG', 'ITG', 'III'],
      { G: 'ae2:quartz_glass', I: 'replication:replica_ingot', T: 'replication:matter_tank' }, 'disintegrator'],
    ['pylons:harvester_pylon', 'pylons:harvester_pylon', ['qqq', 'idi', 'bbb'],
      { b: 'minecraft:polished_blackstone', d: 'mysticalagriculture:inferium_block', i: 'minecraft:iron_bars', q: 'minecraft:quartz_slab' }, 'harvester_pylon'],

    // ----- Extended Crafting tables: more expensive, one tier heavier each -----
    ['extendedcrafting:basic_table', 'extendedcrafting:basic_table', ['BAB', 'CIC', 'BSB'],
      { A: 'extendedcrafting:basic_catalyst', B: 'extendedcrafting:basic_component', C: 'minecraft:crafting_table',
        I: '#c:storage_blocks/steel', S: '#c:circuits/basic' }, 'basic_table'],
    ['extendedcrafting:advanced_table', 'extendedcrafting:advanced_table', ['BAB', 'CIC', 'BSB'],
      { A: 'extendedcrafting:advanced_catalyst', B: 'extendedcrafting:advanced_component', C: ['extendedcrafting:basic_table', 'extendedcrafting:basic_auto_table'],
        I: 'mysticalagriculture:imperium_block', S: 'mekanism:advanced_control_circuit' }, 'advanced_table'],
    ['extendedcrafting:elite_table', 'extendedcrafting:elite_table', ['BAB', 'CIC', 'BSB'],
      { A: 'extendedcrafting:elite_catalyst', B: 'extendedcrafting:elite_component', C: ['extendedcrafting:advanced_table', 'extendedcrafting:advanced_auto_table'],
        I: 'allthecompressed:obsidian_1x', S: 'mekanism:elite_control_circuit' }, 'elite_table'],
    ['extendedcrafting:ultimate_table', 'extendedcrafting:ultimate_table', ['BAB', 'CIC', 'BSB'],
      { A: 'extendedcrafting:ultimate_catalyst', B: 'extendedcrafting:ultimate_component', C: ['extendedcrafting:elite_table', 'extendedcrafting:elite_auto_table'],
        I: 'allthecompressed:vibranium_block_1x', S: 'mekanism:ultimate_control_circuit' }, 'ultimate_table'],

    // ----- Exploration -----
    ['immersive_aircraft:boiler', 'immersive_aircraft:boiler', ['CCC', 'C C', 'CFC'],
      { C: 'minecraft:copper_ingot', F: 'ironfurnaces:iron_furnace' }, 'aircraft_boiler'],
    ['immersive_aircraft:propeller', 'immersive_aircraft:propeller', ['II ', ' I ', ' II'],
      { I: '#c:ingots/steel' }, 'aircraft_propeller'],
    ['allthemodium:teleport_pad', 'allthemodium:teleport_pad', [' n ', 'nan', ' n '],
      { a: 'aether_ii:zanite_gemstone', n: '#c:nuggets/allthemodium' }, 'teleport_pad'],
    ['stellaris:coal_generator', 'stellaris:coal_generator', ['#L#', '#X#', '###'],
      { '#': '#stellaris:titanium_materials', L: '#c:storage_blocks/coal', X: 'ironfurnaces:iron_furnace' }, 'stellaris_coal_generator'],
    ['stellaris:fuel_refinery', 'stellaris:fuel_refinery', ['TBT', 'IFI', 'TBT'],
      { B: '#c:buckets/empty', F: 'mekanism:steel_casing', I: '#c:ingots/iron', T: '#c:ingots/titanium' }, 'fuel_refinery'],
    ['stellaris:space_suit_chestplate', 'stellaris:space_suit_chestplate', ['T T', 'T#T', 'T#T'],
      { '#': 'mekanism:hdpe_sheet', T: '#c:ingots/copper' }, 'space_suit_chestplate'],
    ['stellaris:rocket_engine', 'stellaris:rocket_engine', ['RXR', '# #', '# #'],
      { '#': '#c:ingots/titanium', R: '#c:storage_blocks/iron', X: 'oritech:processing_unit' }, 'rocket_engine'],
    ['stellaris:rover', 'stellaris:rover', ['ICI', 'TWT', 'TRT'],
      { C: 'stellaris:cable_t1', I: '#c:ingots/iron', R: 'mekanism:advanced_control_circuit', T: '#c:ingots/titanium', W: '#c:buckets/empty' }, 'rover'],

    // ----- Magic -----
    ['equivox:transmutation_table', 'equivox:transmutation_table', ['OSO', 'SPS', 'OSO'],
      { O: '#c:obsidians/normal', P: 'equivox:philosophers_stone', S: 'mysticalagriculture:prudentium_essence' }, 'transmutation_table'],
    ['equivox:alchemical_chest', 'equivox:alchemical_chest', ['LMH', 'SDS', 'ICI'],
      { C: 'sophisticatedstorage:chest', D: '#c:gems/diamond', H: 'equivox:high_covalence_dust', I: '#c:ingots/iron',
        L: 'equivox:low_covalence_dust', M: 'equivox:medium_covalence_dust', S: '#c:stones' }, 'alchemical_chest'],
    ['equivox:collector_mk1', 'equivox:collector_mk1', ['GTG', 'GDG', 'GFG'],
      { D: '#c:storage_blocks/diamond', F: 'ironfurnaces:iron_furnace', G: 'minecraft:glowstone', T: 'minecraft:glass' }, 'collector_mk1'],
    // Equivox is made more expensive on purpose: its EMC engine (Philosopher's Stone, Dark and Red Matter,
    // collectors and relays) costs much more, and its tools tie into other mods.
    ['equivox:philosophers_stone', 'equivox:philosophers_stone', ['RGR', 'GDG', 'RGR'],
      { D: 'allthemodium:allthemodium_ingot', G: 'minecraft:glowstone', R: '#c:storage_blocks/redstone' }, 'philosophers_stone'],
    ['equivox:philosophers_stone_alt', 'equivox:philosophers_stone', ['GRG', 'RDR', 'GRG'],
      { D: 'allthemodium:allthemodium_ingot', G: 'minecraft:glowstone', R: '#c:storage_blocks/redstone' }, 'philosophers_stone_alt'],
    ['equivox:dark_matter', 'equivox:dark_matter', ['AAA', 'ADA', 'AAA'],
      { A: 'equivox:aeternalis_fuel', D: 'allthemodium:vibranium_ingot' }, 'dark_matter'],
    ['equivox:red_matter', 'equivox:red_matter', ['AUA', 'DDD', 'AUA'],
      { A: 'equivox:aeternalis_fuel_block', D: 'equivox:dark_matter', U: 'allthemodium:unobtainium_ingot' }, 'red_matter'],
    ['equivox:red_matter_alt', 'equivox:red_matter', ['ADA', 'UDU', 'ADA'],
      { A: 'equivox:aeternalis_fuel_block', D: 'equivox:dark_matter', U: 'allthemodium:unobtainium_ingot' }, 'red_matter_alt'],
    ['equivox:collector_mk2', 'equivox:collector_mk2', ['GUG', 'GPG', 'GGG'],
      { G: 'minecraft:glowstone', P: 'equivox:collector_mk1', U: 'equivox:dark_matter_block' }, 'collector_mk2'],
    ['equivox:collector_mk3', 'equivox:collector_mk3', ['GUG', 'GPG', 'GGG'],
      { G: 'allthecompressed:glowstone_1x', P: 'equivox:collector_mk2', U: 'equivox:red_matter_block' }, 'collector_mk3'],
    ['equivox:relay_mk2', 'equivox:relay_mk2', ['OUO', 'OPO', 'OOO'],
      { O: '#c:obsidians/normal', P: 'equivox:relay_mk1', U: 'equivox:dark_matter_block' }, 'relay_mk2'],
    ['equivox:relay_mk3', 'equivox:relay_mk3', ['OUO', 'OPO', 'OOO'],
      { O: 'allthecompressed:obsidian_1x', P: 'equivox:relay_mk2', U: 'equivox:red_matter_block' }, 'relay_mk3'],
    ['equivox:transmutation_tablet', 'equivox:transmutation_tablet', ['DSD', 'STS', 'DSD'],
      { D: 'equivox:dark_matter_block', S: 'allthemodium:allthemodium_ingot', T: 'equivox:transmutation_table' }, 'transmutation_tablet'],
    ['equivox:transmutation_provider', 'equivox:transmutation_provider', ['GHG', 'DTD', 'GGG'],
      { D: 'minecraft:diamond', G: 'minecraft:glass', H: 'ae2:interface', T: 'equivox:transmutation_table' }, 'transmutation_provider'],
    ['equivox:watch_of_flowing_time', 'equivox:watch_of_flowing_time', ['DGD', 'OCO', 'DGD'],
      { C: 'tiab:time_in_a_bottle', D: 'equivox:dark_matter', G: 'minecraft:glowstone', O: '#c:obsidians/normal' }, 'watch_of_flowing_time'],
    ['equivox:dm_furnace', 'equivox:dm_furnace', ['DDD', 'DFD', 'DDD'],
      { D: 'equivox:dark_matter_block', F: 'ironfurnaces:diamond_furnace' }, 'dm_furnace'],
    ['rootsclassic:altar', 'rootsclassic:altar', ['BFB', 'SGS', ' C '],
      { B: 'rootsclassic:verdant_sprig', C: 'minecraft:chiseled_stone_bricks', F: 'minecraft:poppy', G: 'mysticalagriculture:inferium_block', S: '#c:stones' }, 'roots_altar'],
    ['evilcraft:crafting/dark_tank', 'evilcraft:dark_tank', [' D ', 'IGI', ' D '],
      { D: 'evilcraft:dark_gem', G: '#c:glass_blocks', I: 'mysticalagriculture:inferium_ingot' }, 'dark_tank'],
    ['apotheosis:simple_reforging_table', 'apotheosis:simple_reforging_table', [' I ', 'GEG', 'SSS'],
      { E: 'minecraft:enchanting_table', G: 'apotheosis:gem_dust', I: '#c:ingots/steel', S: 'minecraft:smooth_stone' }, 'simple_reforging_table'],
    ['mysticalagriculture:awakening_altar', 'mysticalagriculture:awakening_altar', ['GCG', ' S ', 'SSS'],
      { C: 'thaumaturge:ingot_thaumium', G: '#c:ingots/gold', S: 'mysticalagriculture:soulstone' }, 'awakening_altar'],
    ['mysticalagriculture:essence_vessel', 'mysticalagriculture:essence_vessel', ['GCG', ' S ', ' S '],
      { C: 'thaumaturge:jar_normal', G: '#c:ingots/gold', S: 'mysticalagriculture:soulstone' }, 'essence_vessel']
  ]

  recipes.forEach(([original, output, pattern, key, name, count]) => {
    event.remove({ id: original })
    event.shaped(Item.of(output, count || 1), pattern, key).id(`gspack:crossmod/${name}`)
  })

  // ----- Late-game items moved to Extended Crafting tables -----
  // The original 3x3 recipe stays in the middle; around it go Extended Crafting components (1),
  // Black Iron Ingots (2) and a cross-mod ingredient (3). Advanced = 5x5, Elite = 7x7.
  // [tier, original recipe id, output, original pattern, original key, extra ingredient, new recipe name]
  const tableRecipes = [
    ['advanced', 'mekanism:teleporter', 'mekanism:teleporter', ['CXC', 'XTX', 'CXC'],
      { C: '#c:circuits/basic', T: 'mekanism:teleportation_core', X: 'mekanism:steel_casing' }, 'waystones:warp_stone', 'teleporter'],
    ['advanced', 'ae2:network/blocks/quantum_ring', 'ae2:quantum_ring', ['aba', 'cde', 'aba'],
      { a: '#c:ingots/iron', b: 'ae2:logic_processor', c: 'ae2:engineering_processor', d: 'ae2:energy_cell', e: '#ae2:smart_dense_cable' }, 'mekanism:alloy_reinforced', 'quantum_ring'],
    ['advanced', 'railcraft:world_spike', 'railcraft:world_spike', ['gog', 'dpd', 'gog'],
      { d: '#c:gems/diamond', g: '#c:ingots/gold', o: 'minecraft:obsidian', p: 'minecraft:ender_pearl' }, 'aether_ii:zanite_gemstone', 'world_spike'],
    ['advanced', 'hostilenetworks:loot_fabricator', 'hostilenetworks:loot_fabricator', [' I ', 'GOG', 'NCN'],
      { C: 'minecraft:comparator', G: '#c:gems/diamond', I: '#c:ingots/netherite', N: '#c:ingots/gold', O: '#c:obsidians' }, 'ae2:engineering_processor', 'loot_fabricator'],
    ['advanced', 'tiab:time_in_a_bottle', 'tiab:time_in_a_bottle', ['GGG', 'DCD', 'LBL'],
      { B: 'minecraft:glass_bottle', C: 'minecraft:clock', D: 'minecraft:diamond', G: 'minecraft:gold_ingot', L: 'minecraft:lapis_lazuli' }, 'thaumaturge:quicksilver', 'time_in_a_bottle'],
    ['advanced', 'equivox:condenser_mk1', 'equivox:condenser_mk1', ['ODO', 'DCD', 'ODO'],
      { C: 'equivox:alchemical_chest', D: '#c:gems/diamond', O: '#c:obsidians/normal' }, 'allthemodium:allthemodium_block', 'condenser_mk1'],
    ['advanced', 'twilightforest:uncrafting_table', 'twilightforest:uncrafting_table', ['###', '#X#', '###'],
      { '#': 'minecraft:crafting_table', X: 'twilightforest:maze_map_focus' }, 'apotheosis:gem_dust', 'uncrafting_table'],
    ['advanced', 'oritech:crafting/atomicforge', 'oritech:atomic_forge', ['fsf', 'mcm', 'bbb'],
      { b: '#oritech:plating', c: 'oritech:enderic_compound', f: 'oritech:flux_gate', m: '#c:plates/plastic', s: 'oritech:duratium_ingot' }, 'mekanism:alloy_atomic', 'atomic_forge'],
    ['elite', 'apotheosis:augmenting_table', 'apotheosis:augmenting_table', [' N ', 'GEG', 'PPP'],
      { E: 'minecraft:enchanting_table', G: 'apotheosis:godforged_pearl', N: 'minecraft:nether_star', P: 'minecraft:polished_blackstone' }, 'thaumaturge:metal_void', 'augmenting_table'],
    ['elite', 'equivox:dm_pedestal', 'equivox:dm_pedestal', ['RDR', 'RDR', 'DDD'],
      { D: 'equivox:dark_matter_block', R: 'equivox:red_matter' }, 'allthemodium:vibranium_block', 'dm_pedestal'],
    ['elite', 'equivox:condenser_mk2', 'equivox:condenser_mk2', ['RDR', 'DCD', 'RDR'],
      { C: 'equivox:condenser_mk1', D: 'equivox:dark_matter_block', R: 'equivox:red_matter_block' }, 'allthecompressed:unobtainium_block_1x', 'condenser_mk2']
  ]

  tableRecipes.forEach(([tier, original, output, p, key, extra, name]) => {
    const pattern = tier === 'advanced'
      ? ['12321', `2${p[0]}2`, `3${p[1]}3`, `2${p[2]}2`, '12321']
      : ['1223221', '2     2', `2 ${p[0]} 2`, `3 ${p[1]} 3`, `2 ${p[2]} 2`, '2     2', '1223221']
    const fullKey = {
      '1': `extendedcrafting:${tier}_component`,
      '2': 'extendedcrafting:black_iron_ingot',
      '3': extra
    }
    Object.keys(key).forEach(k => { fullKey[k] = key[k] })
    event.remove({ id: original })
    event.custom({ type: 'extendedcrafting:shaped_table', pattern: pattern, key: fullKey, result: { id: output, count: 1 } })
      .id(`gspack:table/${name}`)
  })
})
