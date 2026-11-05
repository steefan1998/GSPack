// Refill only native village distributors above protected generated infrastructure.
// No loaded players => exempt villagers consume no oxygen, so stored oxygen remains.
const GspackVillageDistributor = Java.loadClass('org.exodusstudio.stellaris.common.blocks.entities.machines.OxygenDistributorBlockEntity')
const GspackVillageFluids = Java.loadClass('org.exodusstudio.stellaris.common.registries.FluidsRegistry')
const GspackVillageFluidStack = Java.loadClass('dev.architectury.fluid.FluidStack')
const GspackVillageBlocks = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries').BLOCK
let gspackVillageTicks = 0
ServerEvents.tick(event => {
  if (++gspackVillageTicks % 40 !== 0) return
  let visited = {}
  for (let player of event.server.players) {
    let level = player.level
    if (String(level.dimension) !== 'stellaris:mars') continue
    let pcx = player.getBlockX() >> 4
    let pcz = player.getBlockZ() >> 4
    for (let dx=-2;dx<=2;dx++) for (let dz=-2;dz<=2;dz++) {
      let cx=pcx+dx,cz=pcz+dz,key=cx+':'+cz
      if (visited[key] || !level.hasChunk(cx,cz)) continue
      visited[key]=true
      for (let blockEntity of level.getChunk(cx,cz).getBlockEntities().values()) {
        if (!(blockEntity instanceof GspackVillageDistributor)) continue
        let below=level.getBlockState(blockEntity.getBlockPos().below()).getBlock()
        if (String(GspackVillageBlocks.getKey(below)) !== 'gspack:martian_village_life_support') continue
        blockEntity.getEnergy(null).setEnergyStored(12800)
        if (blockEntity.getOxygenTank().getFluidValueInTank() < 9990) {
          blockEntity.getOxygenTank().setFluidInTank(GspackVillageFluidStack.create(GspackVillageFluids.OXYGEN_STILL.get(),10000))
        }
        blockEntity.setChanged()
      }
    }
  }
})
BlockEvents.broken(event => {
  if (String(event.block.level.dimension) !== 'stellaris:mars' || String(event.block.id) !== 'stellaris:oxygen_distributor') return
  let below=event.block.level.getBlockState(event.block.pos.below()).getBlock()
  if (String(GspackVillageBlocks.getKey(below)) === 'gspack:martian_village_life_support') event.cancel()
})
