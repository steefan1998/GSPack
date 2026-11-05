# Chapter groups and reward tables. Table entries: 'spec@weight' (see Reward-Snbt in build-quests.ps1).

QGroup 'tech' 'Technology'
QGroup 'magic' 'Magic'
QGroup 'farming' 'Farming'
QGroup 'explore' 'Exploration & Dimensions'

Table 'common' 'Common Loot' @(
    'minecraft:iron_ingot*8@20', 'minecraft:copper_ingot*16@15', 'minecraft:coal*16@15', 'minecraft:bread*8@15',
    'minecraft:torch*32@10', 'minecraft:arrow*16@8', 'minecraft:experience_bottle*4@10', 'xp:100@7')

Table 'uncommon' 'Uncommon Loot' @(
    'minecraft:gold_ingot*8@20', 'minecraft:redstone*32@18', 'minecraft:lapis_lazuli*16@15', 'minecraft:diamond*1@10',
    'minecraft:ender_pearl*4@10', 'minecraft:golden_carrot*8@10', 'mysticalagriculture:inferium_essence*32@10', 'minecraft:experience_bottle*8@7')

Table 'rare' 'Rare Loot' @(
    'minecraft:diamond*4@20', 'minecraft:emerald*8@15', 'minecraft:golden_apple*2@12', 'minecraft:name_tag*1@6',
    'mysticalagriculture:prudentium_essence*16@12', 'apotheosis:gem_dust*16@10', 'minecraft:blaze_rod*8@10', 'minecraft:experience_bottle*16@10', 'lvl:10@5')

Table 'epic' 'Epic Loot' @(
    'minecraft:netherite_ingot*1@12', 'minecraft:diamond_block*2@15', 'minecraft:enchanted_golden_apple*1@6', 'minecraft:totem_of_undying*1@10',
    'mysticalagriculture:imperium_essence*16@12', 'apotheosis:sigil_of_socketing*2@10', 'minecraft:nether_star*1@5', 'minecraft:elytra*1@3', 'lvl:20@8')

Table 'tech' 'Engineer''s Crate' @(
    'mekanism:basic_control_circuit*4@20', 'mekanism:alloy_infused*8@15', 'alltheores:steel_ingot*8@15', 'mekanism:upgrade_speed*1@6',
    'mekanism:upgrade_energy*1@6', 'ae2:certus_quartz_crystal*16@15', 'ae2:fluix_crystal*8@10', 'ae2:silicon*16@10', 'oritech:plastic_sheet*8@8')

Table 'arcane' 'Arcane Cache' @(
    'apotheosis:gem_dust*8@20', 'apotheosis:mysterious_scrap_metal*4@15', 'apotheosis:luminous_crystal_shard*2@10', 'minecraft:experience_bottle*8@15',
    'mysticalagriculture:inferium_essence*48@15', 'thaumaturge:salis_mundus*4@10', 'thaumaturge:quicksilver*4@8', 'apotheosis:sigil_of_socketing*1@4', 'minecraft:book*8@10')

Table 'angler' 'Angler''s Catch' @(
    'aquaculture:worm*16@20', 'aquaculture:fish_fillet_raw*8@15', 'aquaculture:fishing_line*4@12', 'aquaculture:iron_hook*1@10', 'aquaculture:gold_hook*1@8',
    'aquaculture:box*1@10', 'aquaculture:lockbox*1@6', 'aquaculture:treasure_chest*1@3', 'aquaculture:neptunium_nugget*4@5')

Table 'sky' 'Sky Treasure' @(
    'aether_ii:ambrosium_shard*16@20', 'aether_ii:skyroot_log*16@15', 'aether_ii:zanite_gemstone*4@15', 'aether_ii:blueberry*8@12',
    'aether_ii:cold_aercloud*8@10', 'aether_ii:glint_coin*8@10', 'aether_ii:healing_stone*1@6', 'aether_ii:gravitite_plate*1@3')

Table 'twilight' 'Twilight Spoils' @(
    'twilightforest:ironwood_ingot*4@20', 'twilightforest:steeleaf_ingot*4@20', 'twilightforest:torchberries*8@15', 'twilightforest:raven_feather*4@12',
    'twilightforest:liveroot*8@12', 'twilightforest:armor_shard*8@8', 'twilightforest:knightmetal_ingot*2@6', 'twilightforest:charm_of_life_1*1@3', 'twilightforest:fiery_ingot*1@2')

Table 'space' 'Space Salvage' @(
    'stellaris:titanium_ingot*8@20', 'stellaris:raw_desh*4@15', 'stellaris:desh_ingot*2@12', 'stellaris:fuel_bucket*1@10',
    'stellaris:moon_berries*8@12', 'stellaris:silicon*8@12', 'stellaris:meteorite*2@8', 'stellaris:novite_ingot*1@3')

Table 'atm' 'Allthemodium Hoard' @(
    'allthemodium:allthemodium_nugget*9@20', 'allthemodium:raw_allthemodium*2@12', 'allthemodium:vibranium_nugget*9@12', 'allthemodium:raw_vibranium*1@6',
    'allthemodium:unobtainium_nugget*4@6', 'allthemodium:allthemodium_apple*1@8', 'allthemodium:allthemodium_carrot*2@8', 'minecraft:ancient_debris*2@10')
