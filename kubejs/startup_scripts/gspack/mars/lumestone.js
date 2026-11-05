StartupEvents.registry('block', event => {
  event.create('gspack:mars_lumestone').displayName('Martian Lumestone')
    .soundType('stone').hardness(2).resistance(6).requiresTool(true)
    .tagBlock('minecraft:mineable/pickaxe').lightLevel(13/15)
    .texture('gspack:block/mars_lumestone')
})
