// Thaumaturge applies 0.5..0.9375 horizontal drag in FluxGooFluid.entityInside.
// Compensate part of that drag through the normal synced movement attribute.
// No teleporting, velocity multiplication, permanent bonuses or cleared hazards.
const GSPACK_GOO_REGISTRY = Java.loadClass('net.minecraft.core.registries.BuiltInRegistries')
const GSPACK_GOO_ATTRIBUTES = Java.loadClass('net.minecraft.world.entity.ai.attributes.Attributes')
const GSPACK_GOO_MODIFIER = Java.loadClass('net.minecraft.world.entity.ai.attributes.AttributeModifier')
const GSPACK_GOO_OPERATION = Java.loadClass('net.minecraft.world.entity.ai.attributes.AttributeModifier$Operation')
const GSPACK_GOO_ID = Java.loadClass('net.minecraft.resources.Identifier').parse('gspack:flux_goo_wading')

function gspackGooWadingAmount(amount) {
  // Target roughly 80% of normal movement after the mod's contact drag.
  return 0.8 / (1 - 0.5 * Math.max(1, Math.min(8, amount)) / 8) - 1
}

function gspackUpdateGooWading(player) {
  let attribute = player.getAttribute(GSPACK_GOO_ATTRIBUTES.MOVEMENT_SPEED)
  if (attribute == null) return
  let fluid = player.getLevel().getFluidState(player.blockPosition())
  let id = String(GSPACK_GOO_REGISTRY.FLUID.getKey(fluid.getType()))
  let inGoo = (id === 'thaumaturge:flux_goo' || id === 'thaumaturge:flowing_flux_goo')
    && !player.isSpectator() && !player.getAbilities().flying
  let previous = attribute.getModifier(GSPACK_GOO_ID)
  if (!inGoo) {
    if (previous != null) attribute.removeModifier(GSPACK_GOO_ID)
    return
  }
  let amount = gspackGooWadingAmount(Number(fluid.getAmount()))
  if (previous == null || Math.abs(Number(previous.amount()) - amount) > 0.0001) {
    attribute.addOrUpdateTransientModifier(new GSPACK_GOO_MODIFIER(
      GSPACK_GOO_ID, amount, GSPACK_GOO_OPERATION.ADD_MULTIPLIED_TOTAL))
  }
}
PlayerEvents.loggedIn(event => gspackUpdateGooWading(event.player))
ServerEvents.tick(event => {
  for (let player of event.server.getPlayerList().getPlayers()) gspackUpdateGooWading(player)
})
