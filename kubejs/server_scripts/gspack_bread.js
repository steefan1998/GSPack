// Three wheat in any crafting-grid arrangement make one bread.
ServerEvents.recipes(event => {
  event.remove({ id: 'minecraft:bread' })
  event.shapeless('minecraft:bread', [
    'minecraft:wheat', 'minecraft:wheat', 'minecraft:wheat'
  ]).id('gspack:bread')
})
