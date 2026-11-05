// FTB Chunks 26.1.2.10 shares its claim GUI texture with the minimap renderer.
// With the FTB minimap disabled for JourneyMap, pending claim refreshes are never
// consumed by MinimapRenderer.render(). Service that flag only while claiming.
const GSPACK_CLAIM_MC = Java.loadClass('net.minecraft.client.Minecraft')
const GSPACK_CLAIM_WRAPPER = Java.loadClass('dev.ftb.mods.ftblibrary.client.gui.IScreenWrapper')
const GSPACK_CLAIM_SCREEN = Java.loadClass('dev.ftb.mods.ftbchunks.client.gui.map.ChunkScreen')
const GSPACK_CLAIM_CLIENT = Java.loadClass('dev.ftb.mods.ftbchunks.client.FTBChunksClient')

ClientEvents.tick(event => {
  let minecraft = GSPACK_CLAIM_MC.getInstance()
  if (minecraft.player == null || minecraft.level == null) return
  let screen = minecraft.screen
  if (!(screen instanceof GSPACK_CLAIM_WRAPPER)) return
  let gui = screen.getGui()
  if (!(gui instanceof GSPACK_CLAIM_SCREEN)) return
  GSPACK_CLAIM_CLIENT.INSTANCE.getMinimapRenderer()
    .refreshMinimapTextureIfNeeded(minecraft.player.position(), gui.getDimension())
})
