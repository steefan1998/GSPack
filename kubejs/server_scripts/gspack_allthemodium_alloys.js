// GSPack: fuse Allthemodium metals into their alloys in a crafting table.
// 2 + 2 ingots (or dusts) of two metals make 2 alloy ingots (or dusts); alloy dust smelts into the alloy ingot.

ServerEvents.recipes(event => {
  // [alloy name, metal A, metal B]
  const alloys = [
    ['vibranium_allthemodium_alloy', 'allthemodium', 'vibranium'],
    ['unobtainium_allthemodium_alloy', 'unobtainium', 'allthemodium'],
    ['unobtainium_vibranium_alloy', 'unobtainium', 'vibranium']
  ]

  alloys.forEach(([alloy, a, b]) => {
    event.shapeless(Item.of(`allthemodium:${alloy}_ingot`, 2), [
      `allthemodium:${a}_ingot`, `allthemodium:${a}_ingot`,
      `allthemodium:${b}_ingot`, `allthemodium:${b}_ingot`
    ]).id(`gspack:allthemodium/${alloy}_ingot_fusing`)

    event.shapeless(Item.of(`allthemodium:${alloy}_dust`, 2), [
      `allthemodium:${a}_dust`, `allthemodium:${a}_dust`,
      `allthemodium:${b}_dust`, `allthemodium:${b}_dust`
    ]).id(`gspack:allthemodium/${alloy}_dust_fusing`)

    event.smelting(`allthemodium:${alloy}_ingot`, `allthemodium:${alloy}_dust`).xp(2).id(`gspack:allthemodium/${alloy}_ingot_smelting`)
    event.blasting(`allthemodium:${alloy}_ingot`, `allthemodium:${alloy}_dust`).xp(2).id(`gspack:allthemodium/${alloy}_ingot_blasting`)
  })

  // ----- Alloy tools: no recipe of their own, so GSPack makes them a very hard Extended Crafting recipe -----
  // Elite Crafting Table (7x7): the Unobtainium version of the tool (T) in the middle, wrapped in all three
  // alloys, Compressed Unobtainium-Vibranium Alloy Blocks (C) and Antimatter Pellets (P).
  const alloyKey = {
    '1': 'extendedcrafting:elite_component',
    A: 'allthemodium:unobtainium_vibranium_alloy_ingot',
    B: 'allthemodium:unobtainium_allthemodium_alloy_ingot',
    X: 'allthemodium:vibranium_allthemodium_alloy_ingot',
    C: 'allthecompressed:unobtainium_vibranium_block_1x',
    P: 'mekanism:pellet_antimatter'
  }
  // [alloy tool, tool in the middle]
  const alloyTools = [
    ['sword', 'allthemodium:unobtainium_sword'],
    ['pickaxe', 'allthemodium:unobtainium_pickaxe'],
    ['axe', 'allthemodium:unobtainium_axe'],
    ['shovel', 'allthemodium:unobtainium_shovel'],
    ['mace', 'allthemodium:unobtainium_mace'],
    ['trident', 'minecraft:trident']
  ]
  alloyTools.forEach(([tool, base]) => {
    const key = { T: base }
    Object.keys(alloyKey).forEach(k => { key[k] = alloyKey[k] })
    event.custom({
      type: 'extendedcrafting:shaped_table',
      pattern: [
        '1ABCBA1',
        'A  X  A',
        'B XTX B',
        'C  X  C',
        'B  P  B',
        'A  P  A',
        '1ABCBA1'
      ],
      key: key,
      result: { id: `allthemodium:alloy_${tool}`, count: 1 }
    }).id(`gspack:allthemodium/alloy_${tool}`)
  })

  // The Alloy Paxel: Ultimate Crafting Table (9x9), made from the alloy pickaxe, axe and shovel.
  event.custom({
    type: 'extendedcrafting:shaped_table',
    pattern: [
      '1ABCECBA1',
      'A       A',
      'B   X   B',
      'C  aps  C',
      'E   X   E',
      'C   P   C',
      'B   P   B',
      'A       A',
      '1ABCECBA1'
    ],
    key: {
      '1': 'extendedcrafting:ultimate_component',
      A: 'allthemodium:unobtainium_vibranium_alloy_ingot',
      B: 'allthemodium:unobtainium_allthemodium_alloy_ingot',
      X: 'allthemodium:vibranium_allthemodium_alloy_ingot',
      C: 'allthecompressed:unobtainium_vibranium_block_1x',
      E: 'allthecompressed:unobtainium_vibranium_block_2x',
      P: 'mekanism:pellet_antimatter',
      a: 'allthemodium:alloy_axe',
      p: 'allthemodium:alloy_pickaxe',
      s: 'allthemodium:alloy_shovel'
    },
    result: { id: 'allthemodium:alloy_paxel', count: 1 }
  }).id('gspack:allthemodium/alloy_paxel')
})
