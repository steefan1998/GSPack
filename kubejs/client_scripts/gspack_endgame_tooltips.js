// GSPack endgame: tooltips for the endgame components.

ItemEvents.modifyTooltips(event => {
  const tip = (id, ...lines) => lines.forEach(line => event.add(id, Text.gray(line)))

  tip('gspack:tech_core', 'Antimatter, AI and quantum processing in one.', 'Endgame component: Technology')
  tip('gspack:arcane_core', 'Void metal, red matter and godforged pearls.', 'Endgame component: Magic')
  tip('gspack:verdant_core', 'The essence of everything that grows.', 'Endgame component: Farming')
  tip('gspack:dimensional_core', 'Trophies and metals from far-away worlds.', 'Endgame component: Exploration')
  tip('gspack:cosmic_core', 'Forged from the bosses of the Moon.', 'Endgame component: Space')
  tip('gspack:creative_singularity', 'All five cores, collapsed into one point.', 'Used to craft creative items.')
  event.add('gspack:infinity_trophy', Text.gold('The final goal of GSPack.'))
  tip('gspack:infinity_trophy', 'Proof that you have mastered every corner of the pack.')
})
