// The existing item ID is retained as a block item, so old stacks/quests still resolve.
StartupEvents.registry('block', event => {
  event.create('gspack:infinity_trophy')
    .displayName('Trophy of Infinity')
    .soundType('metal')
    .hardness(3)
    .resistance(1200)
    .opaque(false)
    .fullBlock(false)
    .box(2, 0, 2, 14, 16, 14, true)
    // A model callback keeps the collision box from replacing the cup geometry.
    .modelGenerator(model => model.parent('gspack:block/infinity_trophy_shape'))
    .item(item => item.rarity('epic').maxStackSize(1).fireResistant())
})
