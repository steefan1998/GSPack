// GSPack: makes FTB Quests notice items you already carry.
// FTB Quests only checks item tasks when your inventory changes. Items you picked up before a quest
// unlocked (a seed base before the Seed Codex opens, Thaumaturge crystals before their quest, ...) were
// ignored until you moved something. This script runs FTB Quests' own inventory check on login and
// every 5 seconds, so those quests complete on their own.

const GSPACK_QUEST_CHECK_TICKS = 100
const GspackInventoryListener = Java.loadClass('dev.ftb.mods.ftbquests.util.FTBQuestsInventoryListener')
const GspackEmptyStack = Java.loadClass('net.minecraft.world.item.ItemStack').EMPTY
let gspackQuestTicks = 0
let gspackQuestCheckFailed = false

function gspackCheckQuestItems(player) {
  if (gspackQuestCheckFailed) return
  try {
    GspackInventoryListener.detect(player, GspackEmptyStack, 0)
  } catch (e) {
    gspackQuestCheckFailed = true
    console.error(`GSPack quest item check disabled: ${e}`)
  }
}

PlayerEvents.loggedIn(event => gspackCheckQuestItems(event.player))

ServerEvents.tick(event => {
  if (++gspackQuestTicks < GSPACK_QUEST_CHECK_TICKS) return
  gspackQuestTicks = 0
  event.server.players.forEach(player => gspackCheckQuestItems(player))
})
