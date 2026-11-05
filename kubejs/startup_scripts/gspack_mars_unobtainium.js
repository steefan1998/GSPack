// Keep Allthemodium's real protected ore class, XP and properties for this surface variant.
StartupEvents.registry('block', event => {
  let Registries = Java.loadClass('net.minecraft.core.registries.Registries')
  let Blocks = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries').BLOCK
  let Identifier = Java.loadClass('net.minecraft.resources.Identifier')
  let ResourceKey = Java.loadClass('net.minecraft.resources.ResourceKey')
  let Properties = Java.loadClass('net.minecraft.world.level.block.state.BlockBehaviour$Properties')
  let UniformInt = Java.loadClass('net.minecraft.util.valueproviders.UniformInt')
  let Ore = Java.loadClass('net.allthemods.allthemodium.common.blocks.ModiumOreBlock')
  let Optional = Java.loadClass('java.util.Optional')
  event.createCustom('gspack:mars_unobtainium_ore', () => {
    let id = Identifier.parse('gspack:mars_unobtainium_ore')
    let original = Blocks.getValue(Identifier.parse('allthemodium:unobtainium_ore'))
    let properties = Properties.ofFullCopy(original)
      .setId(ResourceKey.create(Registries.BLOCK,id))
      .overrideDescription('block.gspack.mars_unobtainium_ore')
      .overrideLootTable(Optional.of(ResourceKey.create(Registries.LOOT_TABLE,Identifier.parse('gspack:blocks/mars_unobtainium_ore'))))
    return new Ore(UniformInt.of(30,50),properties)
  })
})

StartupEvents.registry('item', event => {
  let Registries = Java.loadClass('net.minecraft.core.registries.Registries')
  let Blocks = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries').BLOCK
  let Identifier = Java.loadClass('net.minecraft.resources.Identifier')
  let ResourceKey = Java.loadClass('net.minecraft.resources.ResourceKey')
  let Properties = Java.loadClass('net.minecraft.world.item.Item$Properties')
  let BlockItem = Java.loadClass('net.minecraft.world.item.BlockItem')
  event.createCustom('gspack:mars_unobtainium_ore', () => {
    let id = Identifier.parse('gspack:mars_unobtainium_ore')
    return new BlockItem(Blocks.getValue(id),new Properties().setId(ResourceKey.create(Registries.ITEM,id)))
  })
})
