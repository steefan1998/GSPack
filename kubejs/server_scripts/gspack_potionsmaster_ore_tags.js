// PotionsMaster 2.0.2's default BlockStore uses these legacy aliases, while
// its own Ores class and NeoForge use netherite_scrap and quartz.
// Both charms and potions use the same Ore Sight scanner.
ServerEvents.tags('block', event => {
  event.add('c:ores/ancient_debris', ['minecraft:ancient_debris', '#c:ores/netherite_scrap'])
  event.add('c:ores/nether_quartz', ['minecraft:nether_quartz_ore', '#c:ores/quartz'])
})
