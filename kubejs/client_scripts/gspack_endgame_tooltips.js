// GSPack endgame: tooltips for the endgame components.
// Note: KubeJS's Rhino engine has no rest parameters (...args), so lines are passed as arrays.

ItemEvents.modifyTooltips(event => {
  const tips = {
    'gspack:tech_core': ['FE multiblock: Crafting Core and 24 Pedestals.', '250,000,000 FE at 25,000 FE/t; see the Cores quests.', 'Mekanism, Oritech, Advanced AE, AE2 and Powah.'],
    'gspack:arcane_core': ['Elite Crafting Table (7x7): six schools of magic.', 'Thaumaturge, Occultism, Equivox, Apotheosis, EvilCraft and Roots.'],
    'gspack:verdant_core': ['The essence of everything that grows.', 'Endgame component: Farming'],
    'gspack:dimensional_core': ['Elite Crafting Table: Bumblezone, Aether II and Twilight Forest.', 'Dimensional trophies, Essence of the Bees and sky metals.'],
    'gspack:cosmic_core': ['Forged from the bosses of the Moon.', 'Endgame component: Space'],
    'gspack:creative_singularity': ['Powah Energizing: combine the five GSPack cores.', 'Consumes 1,000,000,000 FE and all five cores.', 'Energizing Rods supply power externally and are not consumed.'],
    'gspack:infinity_trophy': ['Proof that you have mastered every corner of the pack.', 'Place in the world to display your achievement.']
  }
  Object.keys(tips).forEach(id => {
    tips[id].forEach(line => event.add(id, Text.gray(line)))
  })
  event.add('gspack:infinity_trophy', Text.gold('The final goal of GSPack.'))
})
