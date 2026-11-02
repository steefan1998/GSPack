// GSPack: makes every All The Compressed block that the endgame recipes use craftable.
//   - The Antimatter Block (the base of Compressed Antimatter) has no recipe without All The Tweaks:
//     9 Mekanism Antimatter Pellets make one, and it breaks back into 9 pellets.
//   - Compressed Osmium and Steel only took the AllTheOres block. They now take any osmium or steel block
//     (Mekanism, Railcraft, ...), and a compressed block always breaks back into the AllTheOres block.

ServerEvents.recipes(event => {
  event.shaped('allthecompressed:antimatter_block', ['PPP', 'PPP', 'PPP'], { P: 'mekanism:pellet_antimatter' })
    .id('gspack:compressed/antimatter_block')
  event.shapeless(Item.of('mekanism:pellet_antimatter', 9), ['allthecompressed:antimatter_block'])
    .id('gspack:compressed/antimatter_block_to_pellets')

  ;['osmium', 'steel'].forEach(metal => {
    event.remove({ id: `allthecompressed:compress/${metal}_block_1x` })
    event.shaped(`allthecompressed:${metal}_block_1x`, ['BBB', 'BBB', 'BBB'], { B: `#c:storage_blocks/${metal}` })
      .id(`gspack:compressed/${metal}_block_1x`)
  })
})
