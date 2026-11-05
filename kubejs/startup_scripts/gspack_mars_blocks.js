// Stellaris includes Mars art but does not register Mars blocks in this version.
// Use distinct GSPack IDs, retaining the mod's existing texture assets.
StartupEvents.registry('block', event => {
  ['mars_stone','mars_regolith','mars_sand'].forEach(name => {
    event.create('gspack:'+name)
      .displayName(name === 'mars_stone' ? 'Mars Stone' : name === 'mars_regolith' ? 'Mars Regolith' : 'Mars Sand')
      .hardness(name === 'mars_stone' ? 1.5 : 0.6)
      .resistance(name === 'mars_stone' ? 6 : 0.6)
      .soundType(name === 'mars_stone' ? 'stone' : 'sand')
      .tagBlock(name === 'mars_stone' ? 'minecraft:mineable/pickaxe' : 'minecraft:mineable/shovel')
      .texture('stellaris:block/'+name)
  })
  // Distinct surface variants: loot/tags retain the original ore's material rules.
  ;['iron','copper','gold','osmium','uranium'].forEach(name => {
    event.create('gspack:mars_'+name+'_ore')
      .displayName('Mars '+name.charAt(0).toUpperCase()+name.slice(1)+' Ore')
      .hardness(3).resistance(3).requiresTool(true)
      .soundType('stone').tagBlock('minecraft:mineable/pickaxe')
      .texture('gspack:block/mars_'+name+'_ore')
  })
})
