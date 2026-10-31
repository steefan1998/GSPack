// GSPack endgame: tooltips for the endgame components.
// Note: KubeJS's Rhino engine has no rest parameters (...args), so lines are passed as arrays.

ItemEvents.modifyTooltips(event => {
  const tips = {
    'gspack:tech_core': ['Antimatter, AI and quantum processing in one.', 'Endgame component: Technology'],
    'gspack:arcane_core': ['Void metal, red matter and godforged pearls.', 'Endgame component: Magic'],
    'gspack:verdant_core': ['The essence of everything that grows.', 'Endgame component: Farming'],
    'gspack:dimensional_core': ['Trophies and metals from far-away worlds.', 'Endgame component: Exploration'],
    'gspack:cosmic_core': ['Forged from the bosses of the Moon.', 'Endgame component: Space'],
    'gspack:creative_singularity': ['All five cores, collapsed into one point.', 'Used to craft creative items.'],
    'gspack:infinity_trophy': ['Proof that you have mastered every corner of the pack.']
  }
  Object.keys(tips).forEach(id => {
    tips[id].forEach(line => event.add(id, Text.gray(line)))
  })
  event.add('gspack:infinity_trophy', Text.gold('The final goal of GSPack.'))
})
