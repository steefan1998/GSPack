// GSPack: re-adds mod recipes that fail to load in 26.1.
// Capacitor Additions and Grinding Ball Additions still write ingredients as {"item": "..."}, which 26.1
// no longer reads, so their items had no recipe at all. Same patterns and results as the mods' own files.

ServerEvents.recipes(event => {
  // ----- Capacitor Additions (Ender IO capacitors) -----
  event.shaped('capacitoradditions:allthemodium_capacitor', [' AG', 'ADA', 'GA '], {
    A: 'allthemodium:allthemodium_ingot', D: 'minecraft:diamond', G: 'enderio:grains_of_infinity'
  }).id('gspack:fix/allthemodium_capacitor')
  event.shaped('capacitoradditions:vibranium_capacitor', [' I ', 'ACA', ' I '], {
    A: 'capacitoradditions:allthemodium_capacitor', C: 'enderio:powdered_coal', I: 'allthemodium:vibranium_ingot'
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
})
