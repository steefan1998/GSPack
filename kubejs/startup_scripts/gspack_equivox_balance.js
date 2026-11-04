// GSPack progression: Dark Matter > Allthemodium; Red Matter > Unobtainium;
// Gem Armor > Red Matter Armor. Modify defaults, retaining EMC/charge/abilities.
const GSPACK_EQ_ATTRIBUTES = Java.loadClass('net.minecraft.world.entity.ai.attributes.Attributes')
const GSPACK_EQ_MODIFIER = Java.loadClass('net.minecraft.world.entity.ai.attributes.AttributeModifier')
const GSPACK_EQ_OPERATION = Java.loadClass('net.minecraft.world.entity.ai.attributes.AttributeModifier$Operation')
const GSPACK_EQ_SLOT = Java.loadClass('net.minecraft.world.entity.EquipmentSlotGroup')
const GSPACK_EQ_ID = Java.loadClass('net.minecraft.resources.Identifier')
const GSPACK_EQ_COMPONENTS = Java.loadClass('net.minecraft.core.component.DataComponents')
const GSPACK_EQ_TOOL = Java.loadClass('net.minecraft.world.item.component.Tool')
const GSPACK_EQ_RULE = Java.loadClass('net.minecraft.world.item.component.Tool$Rule')
const GSPACK_EQ_LIST = Java.loadClass('java.util.ArrayList')
const GSPACK_EQ_OPTIONAL = Java.loadClass('java.util.Optional')
const GSPACK_EQ_FLOAT = Java.loadClass('java.lang.Float')

function gspackEquivoxAttribute(item, attribute, target, slot, name) {
  let current = 0
  for (let entry of item.getAttributeModifiers().modifiers()) {
    if (entry.attribute().equals(attribute) && entry.modifier().operation().equals(GSPACK_EQ_OPERATION.ADD_VALUE)) {
      current += entry.modifier().amount()
    }
  }
  item.addAttributeModifier(attribute, new GSPACK_EQ_MODIFIER(
    GSPACK_EQ_ID.parse(`gspack:equivox_${name}`), target - current, GSPACK_EQ_OPERATION.ADD_VALUE
  ), slot)
}

function gspackEquivoxMining(item, speed) {
  let old = item.get(GSPACK_EQ_COMPONENTS.TOOL)
  if (old == null) return
  let rules = new GSPACK_EQ_LIST()
  for (let rule of old.rules()) {
    let ruleSpeed = rule.speed()
    if (ruleSpeed.isPresent() && ruleSpeed.get() > 1.5) {
      ruleSpeed = GSPACK_EQ_OPTIONAL.of(GSPACK_EQ_FLOAT.valueOf(String(speed)))
    }
    rules.add(new GSPACK_EQ_RULE(rule.blocks(), ruleSpeed, rule.correctForDrops()))
  }
  item.setTool(new GSPACK_EQ_TOOL(rules, old.defaultMiningSpeed(), old.damagePerBlock(), old.canDestroyBlocksInCreative()))
}

ItemEvents.modification(event => {
  // Values are total uncharged attack damage, including the player's base 1.
  const damage = { sword: 24, axe: 22, pick: 20, shovel: 20, hammer: 22, hoe: 18, shears: 18 }
  ;['dm', 'rm'].forEach(tier => {
    Object.keys(damage).forEach(tool => {
      event.modify(`equivox:${tier}_${tool}`, item => {
        item.setAttackDamage(damage[tool] + (tier === 'rm' ? 24 : 0) - 1)
        gspackEquivoxMining(item, tier === 'rm' ? 38 : 22)
      })
    })
  })
  event.modify('equivox:rm_katar', item => { item.setAttackDamage(59); gspackEquivoxMining(item, 38) })
  event.modify('equivox:rm_morning_star', item => { item.setAttackDamage(55); gspackEquivoxMining(item, 38) })
  const slots = ['helmet', 'chestplate', 'leggings', 'boots']
  const equipmentSlots = [GSPACK_EQ_SLOT.HEAD, GSPACK_EQ_SLOT.CHEST, GSPACK_EQ_SLOT.LEGS, GSPACK_EQ_SLOT.FEET]
  const armor = {
    dm: { defense: [6, 11, 9, 6], toughness: 10, knockback: 0.6 },
    rm: { defense: [10, 16, 13, 10], toughness: 20, knockback: 1.0 },
    gem: { defense: [14, 20, 17, 14], toughness: 28, knockback: 1.0 }
  }
  Object.keys(armor).forEach(tier => {
    slots.forEach((piece, i) => {
      event.modify(`equivox:${tier}_${piece}`, item => {
        const stats = armor[tier]
        gspackEquivoxAttribute(item, GSPACK_EQ_ATTRIBUTES.ARMOR, stats.defense[i], equipmentSlots[i], `${tier}_${piece}_armor`)
        gspackEquivoxAttribute(item, GSPACK_EQ_ATTRIBUTES.ARMOR_TOUGHNESS, stats.toughness, equipmentSlots[i], `${tier}_${piece}_toughness`)
        gspackEquivoxAttribute(item, GSPACK_EQ_ATTRIBUTES.KNOCKBACK_RESISTANCE, stats.knockback, equipmentSlots[i], `${tier}_${piece}_knockback`)
      })
    })
  })
})
