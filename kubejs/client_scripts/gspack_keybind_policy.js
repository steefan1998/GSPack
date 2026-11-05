// Apply the requested pack hotkey policy once per client startup.
// Backpack B and JourneyMap J/Ctrl+J/N are retained; conflicting auxiliary
// bindings are unassigned. Other settings and vanilla controls are untouched.
const GSPACK_KEYS_MC = Java.loadClass('net.minecraft.client.Minecraft')
const GSPACK_KEYS_MAPPING = Java.loadClass('net.minecraft.client.KeyMapping')
const GSPACK_KEYS_INPUT = Java.loadClass('com.mojang.blaze3d.platform.InputConstants')
const GSPACK_DISABLED_KEYS = [
  'key.journeymap.create_waypoint', 'key.journeymap.fullscreen_create_waypoint',
  'key.sophisticatedbackpacks.inventory_interaction',
  'key.toms_storage.open_terminal', 'key.mekanism.feet_mode',
  'key.railcraft.loco.whistle', 'key.occultism.backpack',
  'key.immersive_aircraft.boost', 'justzoom.keybinds.keybind.open_options',
  'key.mekanism.legs_mode', 'key.toastcontrol.clear',
  'key.advanced_ae.quantum_auto_stock_upgrade',
  'key.mekanism.mode', 'key.railcraft.loco.reverse',
  'key.occultism.storage_remote', 'key.thaumaturge.thaumonomicon'
]
let gspackKeyPolicyApplied = false
ClientEvents.tick(event => {
  if (gspackKeyPolicyApplied) return
  let minecraft = GSPACK_KEYS_MC.getInstance()
  if (minecraft.options == null) return
  let changed = 0
  for (let binding of minecraft.options.keyMappings) {
    let name = String(binding.getName())
    if (name.startsWith('iris.keybind.') || name.startsWith('key.ftbchunks.keys.') || GSPACK_DISABLED_KEYS.indexOf(name) >= 0) {
      if (!binding.isUnbound()) {
        binding.setKey(GSPACK_KEYS_INPUT.UNKNOWN)
        changed++
      }
    }
  }
  if (changed > 0) {
    GSPACK_KEYS_MAPPING.resetMapping()
    minecraft.options.save()
  }
  gspackKeyPolicyApplied = true
  console.info('[GSPack keys] Disabled ' + changed + ' conflicting/map/shader hotkeys. Backpack and JourneyMap primary keys retained.')
})
