// GSPack endgame: crafting components for the craftable creative items.
// Artwork is packaged by tools/export-endgame-art.ps1; trophy uses a block model.

const GSPACK_ENDGAME_ITEMS = [
  // id, display name, rarity
  ['tech_core', 'Technological Core', 'epic'],
  ['arcane_core', 'Arcane Core', 'epic'],
  ['verdant_core', 'Verdant Core', 'epic'],
  ['dimensional_core', 'Dimensional Core', 'epic'],
  ['cosmic_core', 'Cosmic Core', 'epic'],
  ['creative_singularity', 'Creative Singularity', 'epic']
]

StartupEvents.registry('item', event => {
  GSPACK_ENDGAME_ITEMS.forEach(([id, name, rarity]) => {
    event.create(`gspack:${id}`)
      .displayName(name)
      .rarity(rarity)
      .maxStackSize(id === 'infinity_trophy' ? 1 : 16)
      .fireResistant()
      .texture(`gspack:item/${id}`)
  })
})

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
