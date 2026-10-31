Chapter 'allthemodium' 'Allthemodium' 'allthemodium:allthemodium_ingot' 'explore' 'The rarest metals: Allthemodium, Vibranium and Unobtainium.'

# ===== Preparation =====
Q 'start' 'The Hunt Begins' 'minecraft:netherite_pickaxe' '' 'xp:100;table:common' -size 1.5 -shape 'gear' -sub 'Three metals, three dimensions' -desc @'
&6Allthemodium&r adds three extremely rare metals, each harder than the last:
1. &6Allthemodium&r: needs a &enetherite&r pickaxe.
2. &5Vibranium&r: needs an &6Allthemodium&r pickaxe.
3. &dUnobtainium&r: needs a &5Vibranium&r pickaxe.

It also adds three dimensions: the &eMining Dimension&r, &eThe Other&r and &eThe Beyond&r.
'@
Q 'ancient_city' 'Into the Deep Dark' 'struct:minecraft:ancient_city' 'start' 'xp:150;table:atm' -icon 'minecraft:sculk' -desc 'Allthemodium ore can be found in the deepslate layer, and Ancient Cities are a good place to look. Sneak!'
Q 'teleport_pad' 'Teleport Pad' 'allthemodium:teleport_pad' 'start' 'xp:100' -desc @'
The &eTeleport Pad&r is your gateway to the Allthemodium dimensions.

Stand on it and shift (or use it as shown in JEI) to travel. From the Overworld it takes you to the &eMining Dimension&r. Use it again there to come back.
'@
Q 'mining_dim' 'The Mining Dimension' 'dim:allthemodium:mining' 'teleport_pad' 'xp:150;table:atm' -icon 'minecraft:deepslate' -desc @'
A whole world made for mining. Ores are much more common here, and nobody minds if you dig huge holes.

&6Tip:&r Set a waypoint at your teleport pad so you can find it again!
'@
Q 'ores' 'Mining Trip' 'minecraft:raw_iron*64;minecraft:raw_gold*32;minecraft:diamond*8' 'mining_dim' 'xp:150;table:uncommon' -desc 'Bring back a big haul from the Mining Dimension.'

# ===== Allthemodium =====
Q 'atm_ore' 'Allthemodium Ore' 'allthemodium:raw_allthemodium*4' 'mining_dim' 'xp:200' -size 1.5 -desc 'Look deep down in the deepslate, in the Mining Dimension and around Ancient Cities. It glows a bright yellow.'
Q 'atm_ingot' 'Allthemodium Ingot' 'allthemodium:allthemodium_ingot*8' 'atm_ore' 'xp:200;table:atm' -desc 'Smelt the raw ore. Mekanism and Oritech processing work too for extra output!'
Q 'atm_parts' 'Allthemodium Parts' 'allthemodium:allthemodium_plate*2;allthemodium:allthemodium_gear;allthemodium:allthemodium_rod*2' 'atm_ingot' 'xp:100' -opt -desc 'Plates, gears and rods for crafting recipes in other mods.'
Q 'atm_template' 'Upgrade Template' 'allthemodium:allthemodium_upgrade_smithing_template' 'atm_ingot' 'xp:100' -desc 'Like netherite, you upgrade gear in the smithing table with a template. Duplicate templates with the material.'
Q 'atm_tools' 'Allthemodium Tools' 'allthemodium:allthemodium_pickaxe;allthemodium:allthemodium_sword' 'atm_template' 'xp:200' -desc 'Your Allthemodium pickaxe can mine Vibranium.'
Q 'atm_armor' 'Allthemodium Armor' 'allthemodium:allthemodium_helmet;allthemodium:allthemodium_chestplate;allthemodium:allthemodium_leggings;allthemodium:allthemodium_boots' 'atm_template' 'xp:300;table:rare' -desc 'Very strong armor. The full set gives protection against things like fall damage and drowning.'
Q 'apple' 'Golden Treats' 'allthemodium:allthemodium_apple;allthemodium:allthemodium_carrot' 'atm_ingot' 'xp:100' -opt -desc 'Powerful foods made with Allthemodium.'
Q 'atm_block' 'Show Off' 'allthemodium:allthemodium_block' 'atm_ingot' 'xp:150' -opt -desc 'A whole block of Allthemodium. Shiny!'

# ===== The Other =====
Q 'other' 'The Other' 'dim:allthemodium:the_other' 'atm_tools' 'xp:250;table:atm' -size 1.5 -icon 'allthemodium:ancient_stone' -desc @'
A dangerous dimension of ancient forests, soul-sand valleys and deep caves. Get there from the Nether with a Teleport Pad.

&cBe well prepared!&r Bring food, healing and your best armor.
'@
Q 'ancient' 'Ancient Wood' 'allthemodium:ancient_log_0*16;allthemodium:ancient_stone*32' 'other' 'xp:75' -desc 'Collect some of The Other''s ancient blocks.'
Q 'herbs' 'Strange Herbs' 'allthemodium:ancient_herb;allthemodium:soul_berries*4' 'other' 'xp:75' -opt -desc 'Plants that only grow in The Other.'
Q 'pyramid' 'Ancient Pyramid' 'struct:allthemodium:ancient_pyramid' 'other' 'xp:200;table:atm' -icon 'allthemodium:ancient_stone_bricks' -desc 'Ancient pyramids hide treasure. Watch out for traps.'
Q 'dungeon' 'ATM Dungeon' 'struct:allthemodium:dungeon' 'other' 'xp:200;table:atm' -icon 'allthemodium:ancient_stone_bricks' -desc 'Find one of the Allthemodium dungeons.'
Q 'piglin_village' 'Piglin Village' 'struct:allthemodium:piglin_village' 'other' 'xp:200;table:rare' -icon 'minecraft:gold_block' -desc 'A village full of piglins in The Other.'
Q 'piglich' 'The Piglich' 'kill:allthemodium:piglich' 'piglin_village' 'xp:400;table:epic' -size 1.5 -icon 'allthemodium:piglich_heart' -desc 'A mighty undead piglin lord. Its heart is a rare crafting material.'
Q 'piglich_heart' 'Piglich Heart' 'allthemodium:piglich_heart' 'piglich' 'xp:200' -desc 'The heart of the Piglich.'

# ===== Vibranium =====
Q 'vib_ore' 'Vibranium' 'allthemodium:raw_vibranium*4' 'other' 'xp:300' -size 1.5 -desc 'Found in &eThe Other&r and deep in the Nether. You need an Allthemodium pickaxe.'
Q 'vib_ingot' 'Vibranium Ingot' 'allthemodium:vibranium_ingot*8' 'vib_ore' 'xp:300;table:atm' -desc 'The second rare metal.'
Q 'vib_template' 'Vibranium Template' 'allthemodium:vibranium_upgrade_smithing_template' 'vib_ingot' 'xp:100' -desc 'Upgrade your Allthemodium gear to Vibranium.'
Q 'vib_tools' 'Vibranium Tools' 'allthemodium:vibranium_pickaxe;allthemodium:vibranium_sword' 'vib_template' 'xp:300' -desc 'Your Vibranium pickaxe can mine Unobtainium.'
Q 'vib_armor' 'Vibranium Armor' 'allthemodium:vibranium_helmet;allthemodium:vibranium_chestplate;allthemodium:vibranium_leggings;allthemodium:vibranium_boots' 'vib_template' 'xp:400;table:rare' -desc 'Stronger still.'
Q 'vib_shield' 'Vibranium Shield' 'allthemodium:vibranium_shield' 'vib_ingot' 'xp:150' -opt -desc 'Only fitting.'

# ===== The Beyond =====
Q 'beyond' 'The Beyond' 'dim:allthemodium:the_beyond' 'vib_tools' 'xp:300;table:atm' -size 1.5 -icon 'minecraft:end_stone' -desc 'An End-like dimension. Use a Teleport Pad in the End to get there.'
Q 'unob_ore' 'Unobtainium' 'allthemodium:raw_unobtainium*4' 'beyond' 'xp:400' -size 1.5 -desc 'Found in the End and in The Beyond. You need a Vibranium pickaxe.'
Q 'unob_ingot' 'Unobtainium Ingot' 'allthemodium:unobtainium_ingot*8' 'unob_ore' 'xp:400;table:epic' -desc 'The rarest of the three metals.'
Q 'unob_template' 'Unobtainium Template' 'allthemodium:unobtainium_upgrade_smithing_template' 'unob_ingot' 'xp:150' -desc 'The final smithing upgrade.'
Q 'unob_tools' 'Unobtainium Tools' 'allthemodium:unobtainium_pickaxe;allthemodium:unobtainium_sword' 'unob_template' 'xp:400;table:epic' -desc 'The top tier of Allthemodium tools.'
Q 'unob_armor' 'Unobtainium Armor' 'allthemodium:unobtainium_helmet;allthemodium:unobtainium_chestplate;allthemodium:unobtainium_leggings;allthemodium:unobtainium_boots' 'unob_template' 'xp:500;table:epic' -desc 'The best armor of the three metals.'

# ===== Alloys =====
Q 'alloys' 'Mythic Alloys' 'allthemodium:vibranium_allthemodium_alloy_ingot;allthemodium:unobtainium_allthemodium_alloy_ingot;allthemodium:unobtainium_vibranium_alloy_ingot' 'unob_ingot,vib_ingot,atm_ingot' 'lvl:30;table:epic' -size 1.5 -shape 'hexagon' -desc 'Combine the rare metals into the three alloys. Check JEI for how to make them; you will need machines from other mods.'
Q 'alloy_tools' 'Alloy Paxel' 'allthemodium:alloy_paxel' 'alloys' 'lvl:30;table:epic' -desc 'A pickaxe, axe and shovel in one, made of the best alloys.'
Q 'alloy_weapons' 'Alloy Arsenal' 'allthemodium:alloy_sword;allthemodium:alloy_mace;allthemodium:alloy_trident' 'alloys' 'lvl:30;table:epic' -opt -desc 'The ultimate weapons.'
Q 'upgrades' 'Storage Upgrades' 'check' 'unob_ingot' 'xp:100' -icon 'allthemodium:unobtainium_block' -desc 'Allthemodium storage and backpack upgrades exist for &bSophisticated Storage&r and &bSophisticated Backpacks&r. Check JEI!'
Q 'complete' 'Allthemodium Master' 'allthemodium:allthemodium_block;allthemodium:vibranium_block;allthemodium:unobtainium_block' 'alloy_tools,unob_armor' 'lvl:50;table:epic' -size 2 -shape 'gear' -desc 'A block of each metal. You have conquered Allthemodium!'
