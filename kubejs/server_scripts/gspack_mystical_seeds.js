// GSPack: recipes for the extra Mystical Agriculture crops from config/mysticalcustomization/crops.
// Mystical Customization adds the seeds (crafted on the Infusion Altar) and the essence;
// this script turns the essence back into the resource and adds the three Allthemodium Crux blocks.
// Keep the list in sync with the crop files. Higher tiers give less per craft.

ServerEvents.recipes(event => {
  // [crop id, output, tier]
  const crops = [
    ['allthemodium', 'allthemodium:allthemodium_ingot', 5],
    ['vibranium', 'allthemodium:vibranium_ingot', 6],
    ['unobtainium', 'allthemodium:unobtainium_ingot', 6],
    ['titanium', 'stellaris:titanium_ingot', 3],
    ['desh', 'stellaris:desh_ingot', 4],
    ['novite', 'stellaris:novite_ingot', 5],
    ['zanite', 'aether_ii:zanite_gemstone', 3],
    ['arkenium', 'aether_ii:arkenium_plate', 3],
    ['gravitite', 'aether_ii:gravitite_plate', 4],
    ['ambrosium', 'aether_ii:ambrosium_shard', 2],
    ['dark_gem', 'evilcraft:dark_gem', 2],
    ['niobium', 'ltxi:niobium_ingot', 3],
    ['iesnium', 'occultism:iesnium_ingot', 4],
    ['cinnabar', 'alltheores:cinnabar', 2],
    ['ferricore', 'justdirethings:ferricore_ingot', 2],
    ['blazegold', 'justdirethings:blazegold_ingot', 3],
    ['celestigem', 'justdirethings:celestigem', 4],
    ['eclipsealloy', 'justdirethings:eclipsealloy_ingot', 5],
    ['neptunium', 'aquaculture:neptunium_ingot', 5]
  ]
  // tier -> [pattern, count]: 8 essence in a ring for tiers 2-4, a full grid for tiers 5-6
  const yields = {
    2: [['EEE', 'E E', 'EEE'], 6],
    3: [['EEE', 'E E', 'EEE'], 4],
    4: [['EEE', 'E E', 'EEE'], 3],
    5: [['EEE', 'EEE', 'EEE'], 2],
    6: [['EEE', 'EEE', 'EEE'], 1]
  }
  crops.forEach(([id, output, tier]) => {
    const [pattern, count] = yields[tier]
    event.shaped(Item.of(output, count), pattern, { E: `mysticalagriculture:${id}_essence` })
      .id(`gspack:mystical/${id}_essence`)
  })

  // ----- Crux blocks: each one is built around the previous one -----
  event.shaped('gspack:allthemodium_crux', ['ESE', 'SCS', 'ESE'], {
    E: 'mysticalagriculture:supremium_essence',
    S: 'allthemodium:allthemodium_block',
    C: 'mysticalagriculture:supremium_block'
  }).id('gspack:mystical/allthemodium_crux')
  event.shaped('gspack:vibranium_crux', ['ESE', 'SCS', 'ESE'], {
    E: 'mysticalagradditions:insanium_essence',
    S: 'allthemodium:vibranium_block',
    C: 'gspack:allthemodium_crux'
  }).id('gspack:mystical/vibranium_crux')
  event.shaped('gspack:unobtainium_crux', ['ESE', 'SCS', 'ESE'], {
    E: 'mysticalagradditions:insanium_essence',
    S: 'allthemodium:unobtainium_block',
    C: 'gspack:vibranium_crux'
  }).id('gspack:mystical/unobtainium_crux')
})
