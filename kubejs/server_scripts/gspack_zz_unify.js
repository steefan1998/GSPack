// GSPack: material unification. Several mods make the same metal, dust or plate (silver comes from five mods,
// steel from six). Every recipe now gives one preferred item per material, and every recipe accepts any
// mod's version as input. Preferred: Minecraft, then AllTheOres, then Mekanism, then the mod the material is from.
// The table (global.GSPACK_UNIFY) is in startup_scripts/gspack_unify_table.js; the duplicates are hidden in JEI
// (client_scripts/gspack_unify_hide.js). Raw ores and gems stay visible because ores of every mod still generate.
// This file is named so it loads after the other GSPack recipe scripts and also unifies their recipes.

ServerEvents.recipes(event => {
  global.GSPACK_UNIFY.forEach(([tag, preferred, others]) => {
    others.forEach(item => {
      event.replaceOutput({ output: item }, item, preferred)
      event.replaceInput({ input: item }, item, `#${tag}`)
    })
  })
})
