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
