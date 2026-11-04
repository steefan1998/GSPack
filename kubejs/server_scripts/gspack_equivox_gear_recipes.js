// Upgrade Allthemodium equipment into Dark Matter equipment.
ServerEvents.recipes(event => {
  const recipes = [
    ['sword', 'sword', [' M ', ' M ', ' A ']],
    ['pick', 'pickaxe', ['MMM', ' D ', ' A ']],
    ['axe', 'axe', ['MM ', 'MA ', ' D ']],
    ['shovel', 'shovel', [' M ', ' D ', ' A ']],
    ['hoe', 'hoe', ['MM ', ' A ', ' D ']],
    ['hammer', 'mace', ['MDM', ' A ', ' D ']],
    ['shears', 'axe', [' MS', ' A ', '   ']],
    ['helmet', 'helmet', ['MMM', 'MAM', '   ']],
    ['chestplate', 'chestplate', ['MAM', 'MMM', 'MMM']],
    ['leggings', 'leggings', ['MMM', 'MAM', 'M M']],
    ['boots', 'boots', ['M M', 'MAM', '   ']]
  ]
  recipes.forEach(([piece, base, pattern]) => {
    const key = { M: 'equivox:dark_matter', A: `allthemodium:allthemodium_${base}` }
    if (pattern.join('').indexOf('D') >= 0) key.D = '#c:gems/diamond'
    if (piece === 'shears') key.S = 'minecraft:shears'
    event.remove({ output: `equivox:dm_${piece}`, type: 'minecraft:crafting_shaped' })
    event.shaped(`equivox:dm_${piece}`, pattern, key).id(`gspack:equivox/upgrade_dm_${piece}`)
  })
})
