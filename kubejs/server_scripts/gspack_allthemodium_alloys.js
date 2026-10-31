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
})
