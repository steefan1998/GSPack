StartupEvents.registry('item', event => {
  event.create('gspack:martian_research_relic').displayName('Martian Research Relic')
    .rarity('epic').maxStackSize(16).fireResistant().texture('minecraft:item/echo_shard')
  event.create('gspack:martian_navigation_core').displayName('Martian Navigation Core')
    .rarity('epic').maxStackSize(16).fireResistant().texture('minecraft:item/recovery_compass_00')
})
