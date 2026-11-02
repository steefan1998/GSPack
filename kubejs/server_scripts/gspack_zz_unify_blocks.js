// GSPack: replaces duplicate ores and material blocks that are already placed in existing worlds with the
// preferred block (AllTheOres first, see gspack_zz_unify.js). New chunks don't get these ores any more
// (kubejs/data/*/neoforge/biome_modifier), so this only matters for worlds made before 0.5.
//
// When a chunk loads, it is queued. A few queued chunks are handled every tick: each 16x16x16 section is first
// checked against its block palette (cheap), and only sections that hold a duplicate block are scanned and fixed.
// A chunk without duplicates costs almost nothing, so chunks can safely be checked again on every load.

// Ores of other mods -> the AllTheOres ore of the same stone type. Titanium is not listed: AllTheOres has no
// titanium, so those ores stay (their drops are already unified).
const GSPACK_BLOCK_TO = {
  'mekanism:deepslate_fluorite_ore': 'alltheores:deepslate_fluorite_ore',
  'mekanism:fluorite_ore': 'alltheores:fluorite_ore',
  'mekanism:deepslate_lead_ore': 'alltheores:deepslate_lead_ore',
  'mekanism:lead_ore': 'alltheores:lead_ore',
  'railcraft:deepslate_lead_ore': 'alltheores:deepslate_lead_ore',
  'railcraft:lead_ore': 'alltheores:lead_ore',
  'oritech:deepslate_nickel_ore': 'alltheores:deepslate_nickel_ore',
  'oritech:nickel_ore': 'alltheores:nickel_ore',
  'railcraft:deepslate_nickel_ore': 'alltheores:deepslate_nickel_ore',
  'railcraft:nickel_ore': 'alltheores:nickel_ore',
  'mekanism:deepslate_osmium_ore': 'alltheores:deepslate_osmium_ore',
  'mekanism:osmium_ore': 'alltheores:osmium_ore',
  'oritech:deepslate_platinum_ore': 'alltheores:deepslate_platinum_ore',
  'oritech:endstone_platinum_ore': 'alltheores:end_platinum_ore',
  'ltxi:deepslate_silver_ore': 'alltheores:deepslate_silver_ore',
  'ltxi:silver_ore': 'alltheores:silver_ore',
  'mekmm:deepslate_silver_ore': 'alltheores:deepslate_silver_ore',
  'mekmm:silver_ore': 'alltheores:silver_ore',
  'occultism:silver_ore': 'alltheores:silver_ore',
  'occultism:silver_ore_deepslate': 'alltheores:deepslate_silver_ore',
  'railcraft:deepslate_silver_ore': 'alltheores:deepslate_silver_ore',
  'railcraft:silver_ore': 'alltheores:silver_ore',
  'railcraft:deepslate_sulfur_ore': 'alltheores:deepslate_sulfur_ore',
  'railcraft:sulfur_ore': 'alltheores:sulfur_ore',
  'mekanism:deepslate_tin_ore': 'alltheores:deepslate_tin_ore',
  'mekanism:tin_ore': 'alltheores:tin_ore',
  'railcraft:deepslate_tin_ore': 'alltheores:deepslate_tin_ore',
  'railcraft:tin_ore': 'alltheores:tin_ore',
  'mekanism:deepslate_uranium_ore': 'alltheores:deepslate_uranium_ore',
  'mekanism:uranium_ore': 'alltheores:uranium_ore',
  'oritech:deepslate_uranium_ore': 'alltheores:deepslate_uranium_ore',
  'railcraft:deepslate_zinc_ore': 'alltheores:deepslate_zinc_ore',
  'railcraft:zinc_ore': 'alltheores:zinc_ore'
}
// Material blocks (blocks of steel, raw osmium, ...) -> the preferred block, from the unification table.
global.GSPACK_UNIFY.forEach(([tag, preferred, others]) => {
  if (!tag.startsWith('c:storage_blocks/') || preferred.startsWith('stellaris:')) return
  others.forEach(block => { GSPACK_BLOCK_TO[block] = preferred })
})

// Chunks can load on worldgen threads, so the queue is a thread-safe Java queue.
// Work is limited to a few milliseconds per tick so loading a big area doesn't lag the server.
const GSPACK_BLOCK_MS_PER_TICK = 5
const gspackChunkQueue = new (Java.loadClass('java.util.concurrent.ConcurrentLinkedQueue'))()
let gspackBlockConvertFailed = false

NativeEvents.onEvent('net.neoforged.neoforge.event.level.ChunkEvent$Load', event => {
  const level = event.getLevel()
  if (level.isClientSide()) return
  const pos = event.getChunk().getPos()
  gspackChunkQueue.add([level, pos.x(), pos.z()])
})

const GspackBlocks = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries').BLOCK
const GspackIdentifier = Java.loadClass('net.minecraft.resources.Identifier')
const gspackBlockId = state => String(GspackBlocks.getKey(state.getBlock()))
// The default state of each preferred block, looked up once.
const gspackTargetState = {}
function gspackTarget(id) {
  if (!gspackTargetState[id]) gspackTargetState[id] = GspackBlocks.getValue(GspackIdentifier.parse(id)).defaultBlockState()
  return gspackTargetState[id]
}

function gspackIsDuplicate(state) {
  return GSPACK_BLOCK_TO[gspackBlockId(state)] !== undefined
}

function gspackConvertChunk(level, cx, cz) {
  if (!level.hasChunk(cx, cz)) return
  const chunk = level.getChunk(cx, cz)
  const sections = chunk.getSections()
  for (let i = 0; i < sections.length; i++) {
    const section = sections[i]
    if (section.hasOnlyAir() || !section.maybeHas(state => gspackIsDuplicate(state))) continue
    const baseY = chunk.getSectionYFromSectionIndex(i) * 16
    for (let y = 0; y < 16; y++) {
      for (let z = 0; z < 16; z++) {
        for (let x = 0; x < 16; x++) {
          const id = gspackBlockId(section.getBlockState(x, y, z))
          const preferred = GSPACK_BLOCK_TO[id]
          // Flag 2: update clients only, no neighbour updates (an ore swap changes nothing around it).
          if (preferred) level.getBlock(cx * 16 + x, baseY + y, cz * 16 + z).setBlockState(gspackTarget(preferred), 2)
        }
      }
    }
  }
}

ServerEvents.tick(event => {
  if (gspackBlockConvertFailed) return
  const start = Date.now()
  while (!gspackChunkQueue.isEmpty() && Date.now() - start < GSPACK_BLOCK_MS_PER_TICK) {
    const [level, cx, cz] = gspackChunkQueue.poll()
    try {
      gspackConvertChunk(level, cx, cz)
    } catch (e) {
      gspackBlockConvertFailed = true
      console.error(`GSPack block conversion disabled: ${e}`)
    }
  }
})
