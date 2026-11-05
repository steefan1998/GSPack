// Actual Stellaris equipment; no new entity registry entries or replacement AI.
const GspackMarsEquipmentSlot = Java.loadClass('net.minecraft.world.entity.EquipmentSlot')
const GspackMarsMobSettings = JSON.parse(JsonIO.readString('config/gspack-mars.json'))
const GspackMarsTankChance = Math.max(0,Math.min(1,Number(GspackMarsMobSettings.oxygenTankDropChance ?? 0.01)))

EntityEvents.spawned(event => {
  let entity = event.entity
  if (String(entity.level.dimension) !== 'stellaris:mars' || String(entity.type) !== 'minecraft:zombie') return
  if (entity.persistentData.gspackMarsSpaceSuit) return
  let equipment = [
    [GspackMarsEquipmentSlot.HEAD,'stellaris:space_suit_helmet'],
    [GspackMarsEquipmentSlot.CHEST,'stellaris:space_suit_chestplate'],
    [GspackMarsEquipmentSlot.LEGS,'stellaris:space_suit_leggings'],
    [GspackMarsEquipmentSlot.FEET,'stellaris:space_suit_boots']
  ]
  equipment.forEach(([slot,item]) => {
    entity.setItemSlot(slot,Item.of(item))
    entity.setDropChance(slot,0)
  })
  entity.persistentData.gspackMarsSpaceSuit = true
})

EntityEvents.death(event => {
  let entity = event.entity
  if (String(entity.level.dimension) !== 'stellaris:mars' || String(entity.type) !== 'minecraft:zombie') return
  if (!entity.persistentData.gspackMarsSpaceSuit || GspackMarsMobSettings.oxygenTankDropsEnabled === false) return
  if (entity.level.random.nextFloat() < GspackMarsTankChance) {
    entity.block.popItem(Item.of(GspackMarsMobSettings.oxygenTankDropItem || 'stellaris:space_suit_oxygen_module_tier_1'))
  }
})
