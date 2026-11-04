// Equivox 1.4 custom_emc supports zero; pe_custom_conversions values do not.
// Build the exclusion tag before Equivox's Custom EMC Mapper solves recipes.
const GSPACK_EMC_POLICY = JSON.parse(JsonIO.readString('kubejs/data/gspack/emc_policy.json'))
const GSPACK_EMC_REGISTRY = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries')
const GSPACK_EMC_BLOCK_ITEM = Java.loadClass('net.minecraft.world.item.BlockItem')
const GSPACK_EMC_ENTITY_BLOCK = Java.loadClass('net.minecraft.world.level.block.EntityBlock')
const GSPACK_EMC_COMPONENTS = Java.loadClass('net.minecraft.core.component.DataComponents')
const GSPACK_EMC_MAPPING = Java.loadClass('com.yaskulsky.equivox.emc.EMCMappingHandler')
const GSPACK_EMC_INFO = Java.loadClass('com.yaskulsky.equivox.api.ItemInfo')
const GSPACK_EMC_COMMANDS = Java.loadClass('net.minecraft.commands.Commands')
const GSPACK_EMC_MAP = Java.loadClass('it.unimi.dsi.fastutil.objects.Object2LongOpenHashMap')
const GSPACK_EMC_TEXT = Java.loadClass('net.minecraft.network.chat.Component')
const GSPACK_EMC_EQUIPMENT = new RegExp(GSPACK_EMC_POLICY.equipmentPattern)
const GSPACK_EMC_MACHINES = new RegExp(GSPACK_EMC_POLICY.machinePattern)

function gspackEmcExcluded(item, checkComponents) {
  let id = String(GSPACK_EMC_REGISTRY.ITEM.getKey(item))
  let namespace = id.split(':')[0]
  let path = id.split(':')[1]
  if (GSPACK_EMC_POLICY.excludedNamespaces.indexOf(namespace) >= 0) return true
  if (GSPACK_EMC_POLICY.endgameItems.indexOf(id) >= 0) return true
  if (/^mystical(agriculture|agradditions)$/.test(namespace) && /(^|_)seeds?(_|$)/.test(path)) return true
  if (/(^|_)(ore|creative|infinite|infinity|singularity|trophy)(_|$)/.test(path)) return true
  if (/^minecraft:raw_(iron|gold|copper)(_block)?$/.test(id)) return true
  if (/^(alltheores|mekanism|oritech|stellaris|allthemodium|occultism|mekanism_extras|ltxi|tconstruct)$/.test(namespace) && /^raw_/.test(path)) return true
  if (namespace === 'allthemodium' && /(allthemodium|vibranium|unobtainium|piglich)/.test(path)) return true
  if (namespace === 'equivox' && /^klein_star_/.test(path)) return true
  if (GSPACK_EMC_EQUIPMENT.test(path) || GSPACK_EMC_MACHINES.test(path)) return true
  // Tag loading precedes registry component binding on Minecraft 26.1.
  // Only inspect components during the later remap/audit phase.
  if (checkComponents !== false) {
    let stack = item.getDefaultInstance()
    if (stack.has(GSPACK_EMC_COMPONENTS.TOOL) || stack.has(GSPACK_EMC_COMPONENTS.WEAPON) || stack.has(GSPACK_EMC_COMPONENTS.EQUIPPABLE)) return true
  }
  if (item instanceof GSPACK_EMC_BLOCK_ITEM && item.getBlock() instanceof GSPACK_EMC_ENTITY_BLOCK) {
    // Ordinary vanilla storage/decorations remain useful transmutation supplies.
    if (namespace === 'minecraft' && (GSPACK_EMC_POLICY.passiveVanillaBlocks.indexOf(path) >= 0 || /(_sign|_hanging_sign|_banner|_shulker_box|_head|_skull|_bed)$/.test(path))) return false
    return true
  }
  return false
}

ServerEvents.tags('item', event => {
  let excluded = []
  for (let item of GSPACK_EMC_REGISTRY.ITEM) {
    if (gspackEmcExcluded(item, false)) excluded.push(String(GSPACK_EMC_REGISTRY.ITEM.getKey(item)))
  }
  if (excluded.length) event.add('gspack:emc_excluded', excluded)
  console.info('[GSPack EMC] Excluded ' + excluded.length + ' registered items, plus ore/equipment tags.')
})

// Read-only audit: zero arbitrary fallback prices, no changes to player EMC.
ServerEvents.commandRegistry(event => {
  event.register(GSPACK_EMC_COMMANDS.literal('gspackemc').requires(source => true)
    .then(GSPACK_EMC_COMMANDS.literal('audit').executes(ctx => {
      let mapped = 0
      let excluded = 0
      let missing = []
      for (let item of GSPACK_EMC_REGISTRY.ITEM) {
        let id = String(GSPACK_EMC_REGISTRY.ITEM.getKey(item))
        if (id === 'minecraft:air') continue
        if (gspackEmcExcluded(item)) { excluded++; continue }
        if (GSPACK_EMC_MAPPING.getStoredEmcValue(GSPACK_EMC_INFO.fromStack(item.getDefaultInstance())) > 0) mapped++
        else missing.push(id)
      }
      ctx.getSource().sendSuccess(GSPACK_EMC_TEXT.literal('GSPack EMC: ' + mapped + ' valued, ' + excluded + ' excluded, ' + missing.length + ' without a derived value.').withColor(0xFFAA00), false)
      if (missing.length) ctx.getSource().sendSuccess(GSPACK_EMC_TEXT.literal('Unmapped examples: ' + missing.slice(0, 12).join(', ')), false)
      return 1
    })))
})

// Enforce exclusions after every map, including pregenerated/admin remaps.
// Equivox's own seed-value mappers may otherwise overwrite a custom zero.
NativeEvents.onEvent('com.yaskulsky.equivox.api.event.EMCRemapEvent', event => {
  let mapped = GSPACK_EMC_MAPPING.getMappedItems()
  let clean = new GSPACK_EMC_MAP()
  let removed = 0
  for (let info of mapped) {
    if (gspackEmcExcluded(info.getItem().value())) { removed++; continue }
    // addTo has one (Object, long) signature; put has ambiguous boxed/primitive overloads.
    // Each mapped ItemInfo is unique and the new map defaults to zero.
    clean.addTo(info, GSPACK_EMC_MAPPING.getStoredEmcValue(info))
  }
  if (removed > 0) {
    GSPACK_EMC_MAPPING.updateEmcValues(clean)
    console.info('[GSPack EMC] Removed ' + removed + ' excluded entries after EMC remapping.')
  }
})
