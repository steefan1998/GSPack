// GSPack: player stages for quest tasks that FTB Quests cannot check on its own.
// FTB XMod Compat links these KubeJS stages to the quest book's stage tasks ("stage:<name>" in tools/content).
//
//   gspack_logs: 16 logs of any kind (#minecraft:logs) in the inventory -> Getting Started, "Punch a Tree"

PlayerEvents.inventoryChanged(event => {
  const player = event.player
  if (player.stages.has('gspack_logs')) return
  if (player.inventory.count('#minecraft:logs') >= 16) {
    player.stages.add('gspack_logs')
  }
})
