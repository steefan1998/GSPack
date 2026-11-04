// Allow otherwise aspect-less modded blocks to be recorded by the Thaumometer.
// Native scans keep their original aspect requirements and rewards. This fallback
// only supplies the canonical scanned/item research key, never free aspects.
const GSPACK_SCAN_MANAGER = Java.loadClass('com.leclowndu93150.thaumaturge.api.research.scan.ScanningManager')
const GSPACK_SCAN_SUBJECT = Java.loadClass('com.leclowndu93150.thaumaturge.api.research.scan.IScannable')
const GSPACK_SCAN_KEYS = Java.loadClass('com.leclowndu93150.thaumaturge.api.research.scan.ScanKeys')
const GSPACK_SCAN_REGISTRY = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries')
const GSPACK_SCAN_BLOCK_ITEM = Java.loadClass('net.minecraft.world.item.BlockItem')

GSPACK_SCAN_MANAGER.register(new JavaAdapter(GSPACK_SCAN_SUBJECT, {
  matches(player, target) {
    let stack = GSPACK_SCAN_MANAGER.stackOf(player, target)
    if (stack.isEmpty()) return false
    let item = stack.getItem()
    let namespace = String(GSPACK_SCAN_REGISTRY.ITEM.getKey(item).getNamespace())
    if (namespace === 'minecraft' || namespace === 'thaumaturge') return false
    if (!(item instanceof GSPACK_SCAN_BLOCK_ITEM) && namespace !== 'alltheores') return false
    return GSPACK_SCAN_MANAGER.aspectsOf(player, target).isEmpty()
  },
  research(player, target) {
    return GSPACK_SCAN_KEYS.item(GSPACK_SCAN_MANAGER.stackOf(player, target).getItem())
  },
  onScanned(player, target) {},
  rescannable(player, target) { return false },
  refusal(player, target) { return null }
}))
