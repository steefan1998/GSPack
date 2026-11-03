// GSPack: converts duplicate materials in existing worlds to the preferred item (table: startup_scripts/gspack_unify_table.js).
// Items picked up, crafted or carried from an older version of the pack become the preferred item:
//   - the player's inventory, on login and whenever it changes;
//   - a chest, barrel or other chest-like container, when a player opens it.
// Only plain chest inventories are converted on purpose: machine and terminal menus can have output or "ghost"
// slots that must not be written to. Items stored elsewhere convert as soon as a player takes them out.

const GSPACK_UNIFY_TO = {}
global.GSPACK_UNIFY.forEach(([tag, preferred, others]) => {
  others.forEach(item => { GSPACK_UNIFY_TO[item] = preferred })
})

// Replaces duplicates in a container; returns how many stacks changed.
function gspackConvertContainer(container) {
  let changed = 0
  for (let i = 0; i < container.getContainerSize(); i++) {
    let stack = container.getItem(i)
    if (stack.isEmpty()) continue
    let preferred = GSPACK_UNIFY_TO[stack.id]
    if (!preferred) continue
    container.setItem(i, Item.of(preferred, stack.count))
    changed++
  }
  return changed
}

PlayerEvents.loggedIn(event => gspackConvertContainer(event.player.inventory))

PlayerEvents.inventoryChanged(event => {
  if (GSPACK_UNIFY_TO[event.item.id]) gspackConvertContainer(event.player.inventory)
})

PlayerEvents.chestOpened(event => {
  if (gspackConvertContainer(event.inventory) > 0) event.inventoryContainer.broadcastChanges()
})
