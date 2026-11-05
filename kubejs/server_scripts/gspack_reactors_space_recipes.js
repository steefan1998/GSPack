// Accessible reactor / first-Moon recipes; more advanced space modules feed the Cosmic Core.
ServerEvents.recipes(event => {
  let reactorRecipes = [
    ['reactor_casing', 8, ['SGS','GIG','SGS'], {S:'#c:ingots/steel',G:'colossal_reactors:graphite_ingot',I:'#c:ingots/iron'}],
    ['reactor_controller', 1, ['CGC','RBR','CCC'], {C:'colossal_reactors:reactor_casing',G:'#c:glass_blocks',R:'minecraft:redstone',B:'mekanism:basic_control_circuit'}],
    ['reactor_glass', 4, [' G ','GCG',' G '], {G:'#c:glass_blocks',C:'colossal_reactors:reactor_casing'}],
    ['reactor_rod', 4, ['IGI','IGI','IGI'], {I:'minecraft:iron_bars',G:'colossal_reactors:graphite_ingot'}],
    ['rod_controller', 1, ['IRI','GCG','III'], {I:'#c:ingots/iron',R:'minecraft:redstone',G:'colossal_reactors:graphite_ingot',C:'colossal_reactors:reactor_casing'}],
    ['power_port', 1, ['CRC','RBR','CRC'], {C:'colossal_reactors:reactor_casing',R:'minecraft:redstone',B:'#c:ingots/copper'}],
    ['resource_port', 2, ['ICI','CHC','ICI'], {I:'#c:ingots/iron',C:'colossal_reactors:reactor_casing',H:'minecraft:hopper'}]
  ]
  reactorRecipes.forEach(([name,count,pattern,key]) => {
    event.remove({output:'colossal_reactors:'+name})
    event.shaped(Item.of('colossal_reactors:'+name,count),pattern,key).id('gspack:reactors/'+name)
  })
  let spaceModules = [
    ['autopilot_module', {D:'stellaris:desh_ingot',P:'ae2:engineering_processor',C:'mekanism:advanced_control_circuit',X:'stellaris:autopilot_module'}, ['DCD','CPC','DCD']],
    ['shield_module', {D:'stellaris:desh_ingot',P:'powah:crystal_niotic',C:'mekanism:alloy_reinforced',X:'stellaris:shield_module'}, ['DCD','CPC','DCD']],
    ['space_station_blueprint', {D:'stellaris:desh_ingot',P:'ae2:calculation_processor',C:'minecraft:paper',X:'stellaris:space_station_blueprint'}, ['DCD','CPC','DCD']]
  ]
  spaceModules.forEach(([name,ingredients,pattern]) => {
    let key = { A:'extendedcrafting:advanced_component', B:'extendedcrafting:black_iron_ingot', D:ingredients.D, P:ingredients.P, C:ingredients.C }
    event.remove({output:'stellaris:'+name})
    event.custom({type:'extendedcrafting:shaped_table',pattern:['ABBBA','B'+pattern[0]+'B','B'+pattern[1]+'B','B'+pattern[2]+'B','ABBBA'],key:key,result:{id:'stellaris:'+name,count:1}})
      .id('gspack:space/'+name)
  })
})
