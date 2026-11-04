// Keep Occultism ritual mechanics, spirit bindings and pentacles intact.
ServerEvents.recipes(event => {
  const rituals = [
  {
    "id": "occultism:ritual/craft_storage_controller_base",
    "recipe": {
      "type": "occultism:ritual",
      "activation_item": "occultism:book_of_binding_bound_foliot",
      "duration": 60,
      "ingredients": [
        "occultism:otherstone_pedestal",
        "#c:ingots/copper",
        "#c:ingots/copper",
        "thaumaturge:ingot_thaumium"
      ],
      "pentacle_id": "occultism:craft_foliot",
      "result": {
        "id": "occultism:storage_controller_base"
      },
      "ritual_dummy": {
        "id": "occultism:ritual_dummy/craft_storage_controller_base"
      },
      "ritual_type": "occultism:craft"
    }
  },
  {
    "id": "occultism:ritual/craft_infused_lenses",
    "recipe": {
      "type": "occultism:ritual",
      "activation_item": "occultism:book_of_binding_bound_foliot",
      "duration": 60,
      "ingredients": [
        "occultism:lenses",
        "#c:ingots/silver",
        "#c:ingots/silver",
        "thaumaturge:salis_mundus"
      ],
      "pentacle_id": "occultism:craft_foliot",
      "result": {
        "id": "occultism:infused_lenses"
      },
      "ritual_dummy": {
        "id": "occultism:ritual_dummy/craft_infused_lenses"
      },
      "ritual_type": "occultism:craft"
    }
  },
  {
    "id": "occultism:ritual/craft_dimensional_matrix",
    "recipe": {
      "type": "occultism:ritual",
      "activation_item": "occultism:book_of_binding_bound_djinni",
      "duration": 120,
      "ingredients": [
        "minecraft:quartz_block",
        "minecraft:quartz_block",
        "allthemodium:allthemodium_ingot",
        "#c:ender_pearls"
      ],
      "pentacle_id": "occultism:craft_djinni",
      "result": {
        "id": "occultism:dimensional_matrix"
      },
      "ritual_dummy": {
        "id": "occultism:ritual_dummy/craft_dimensional_matrix"
      },
      "ritual_type": "occultism:craft_with_spirit_name"
    }
  }
]
  for (let entry of rituals) {
    event.remove({ id: entry.id })
    event.custom(entry.recipe).id(entry.id)
  }
})
