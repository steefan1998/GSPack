// Recognise both existing players' sleep history and new successful bed sleeps.
const GSPACK_SLEEP_STATS = Java.loadClass('net.minecraft.stats.Stats')
function gspackCheckThaumaturgeSleep(player) {
  if (player.stages.has('gspack_thaumaturge_slept')) return
  if (player.getStats().get(GSPACK_SLEEP_STATS.CUSTOM.get(GSPACK_SLEEP_STATS.SLEEP_IN_BED)) > 0) {
    player.stages.add('gspack_thaumaturge_slept')
  }
}
PlayerEvents.loggedIn(event => gspackCheckThaumaturgeSleep(event.player))
ServerEvents.tick(event => {
  if (event.server.tickCount % 100 !== 0) return
  for (let player of event.server.getPlayerList().getPlayers()) gspackCheckThaumaturgeSleep(player)
})
