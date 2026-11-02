// GSPack: re-adds mod recipes that fail to load in 26.1.
// Capacitor Additions, Grinding Ball Additions and Hostile Neural Networks' Twilight Living Matter recipes still
// write ingredients as {"item": "..."}, which 26.1 no longer reads, so those recipes never loaded.
// Same patterns and results as the mods' own files.

ServerEvents.recipes(event => {
  // ----- Capacitor Additions (Ender IO capacitors) -----
  event.shaped('capacitoradditions:allthemodium_capacitor', [' AG', 'ADA', 'GA '], {
    A: 'allthemodium:allthemodium_ingot', D: 'minecraft:diamond', G: 'enderio:grains_of_infinity'
  }).id('gspack:fix/allthemodium_capacitor')
  event.shaped('capacitoradditions:vibranium_capacitor', [' I ', 'ACA', ' I '], {
    A: 'capacitoradditions:allthemodium_capacitor', C: '#c:dusts/coal', I: 'allthemodium:vibranium_ingot'
  }).id('gspack:fix/vibranium_capacitor')
  event.shaped('capacitoradditions:unobtainium_capacitor', [' I ', 'CGC', ' I '], {
    C: 'capacitoradditions:vibranium_capacitor', G: 'enderio:grains_of_infinity', I: 'allthemodium:unobtainium_ingot'
  }).id('gspack:fix/unobtainium_capacitor')

  // ----- Grinding Ball Additions (Ender IO SAG Mill grinding balls) -----
  ;['allthemodium', 'vibranium', 'unobtainium'].forEach(metal => {
    event.shaped(Item.of(`grindingballadditions:${metal}_grindingball`, 64), [' M ', 'MMM', ' M '], {
      M: `allthemodium:${metal}_ingot`
    }).id(`gspack:fix/${metal}_grindingball`)
  })
  event.shaped('grindingballadditions:infinite_grindingball', ['GEG', 'EEE', 'GEG'], {
    E: 'allthemodium:unobtainium_vibranium_alloy_ingot', G: 'enderio:grains_of_infinity'
  }).id('gspack:fix/infinite_grindingball')

  // ----- Hostile Neural Networks: Twilight Living Matter (Twilight Prediction) -----
  // [output, count, predictions, extra ingredient]
  const twilight = [
    ['twilightforest:cicada', 8, 2, 'minecraft:note_block'],
    ['twilightforest:firefly', 8, 2, 'minecraft:torch'],
    ['twilightforest:liveroot', 8, 4, 'minecraft:stick'],
    ['twilightforest:moonworm', 8, 2, 'minecraft:soul_torch'],
    ['twilightforest:raven_feather', 4, 1, 'minecraft:feather'],
    ['twilightforest:steeleaf_ingot', 8, 4, '#minecraft:leaves'],
    ['twilightforest:torchberries', 8, 1, 'minecraft:sweet_berries']
  ]
  twilight.forEach(([output, count, predictions, extra]) => {
    const inputs = [extra]
    for (let i = 0; i < predictions; i++) inputs.push('hostilenetworks:twilight_prediction')
    event.shapeless(Item.of(output, count), inputs).id(`gspack:fix/living_matter_${output.split(':')[1]}`)
  })
})
