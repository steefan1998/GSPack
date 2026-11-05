// Keep native raid bookkeeping and wave buffs; substitute only non-pillager Mars raiders.
const GspackMarsRaider = Java.loadClass('net.minecraft.world.entity.raid.Raider')
const GspackMarsEntityType = Java.loadClass('net.minecraft.world.entity.EntityType')
const GspackMarsSpawnReason = Java.loadClass('net.minecraft.world.entity.EntitySpawnReason')
EntityEvents.spawned(event => {
  let entity=event.entity,level=entity.level
  if (String(level.dimension) !== 'stellaris:mars' || String(entity.type) === 'minecraft:pillager') return
  if (!(entity instanceof GspackMarsRaider)) return
  let raid=entity.getCurrentRaid()
  if (raid === null) return
  let replacement=GspackMarsEntityType.PILLAGER.create(level,GspackMarsSpawnReason.EVENT)
  if (replacement === null) return
  let wave=entity.getWave(),position=entity.blockPosition(),leader=entity.isPatrolLeader()
  event.cancel()
  raid.removeFromRaid(level,entity,true)
  if (leader) raid.setLeader(wave,replacement)
  raid.joinRaid(level,wave,replacement,position,false)
})
