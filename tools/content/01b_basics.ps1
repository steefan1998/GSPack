Chapter 'basics' 'Getting Started' 'minecraft:iron_pickaxe' '' 'Survive, gear up and conquer the Nether and the End.'

# --- First day ---
Q 'wood' 'Punch a Tree' 'stage:gspack_logs@minecraft:oak_log|16 logs of any kind' '' 'xp:25;minecraft:apple*4' -size 1.5 -shape 'gear' -icon 'minecraft:oak_log' -sub 'Every journey starts with wood' -desc @'
The classic start. Collect &e16 logs&r of any kind: oak, birch, spruce, the trees from Terralith, the Twilight Forest, the Aether... they all count. The quest completes as soon as you carry 16 logs.

Turn logs into planks, planks into sticks and a &eCrafting Table&r. From here you can make your first tools.

&6Tip:&r Terralith and the other worldgen mods make the world much bigger and more varied than vanilla. Take a look around before you settle down!
'@
Q 'table' 'Crafting Table' 'minecraft:crafting_table' 'wood' 'xp:10' -desc 'The 3x3 crafting grid unlocks almost every recipe. Use JEI (press &eR&r on an item) when you do not know a recipe.'
Q 'stone_tools' 'Stone Age' 'minecraft:stone_pickaxe;minecraft:stone_axe;minecraft:stone_sword' 'table' 'xp:25;table:common' -desc @'
Stone tools are cheap and twice as durable as wooden ones.

&6Tip:&r Hold the &eFTB Ultimine&r key while mining to break a whole vein of ore or a whole tree at once. It costs extra hunger, so bring food!
'@
Q 'furnace' 'Furnace' 'minecraft:furnace' 'stone_tools' 'xp:15' -desc 'Smelt ores, cook food and make charcoal from logs. The &eIron Furnaces&r mod has much faster furnaces later on.'
Q 'charcoal' 'Light in the Dark' 'minecraft:torch*32' 'furnace' 'xp:15' -desc 'No coal yet? Smelt a log into &echarcoal&r. Torches keep monsters from spawning around your base.'
Q 'bed' 'Sweet Dreams' 'minecraft:white_bed' 'table' 'xp:25' -desc @'
Sleep through the night and set your spawn point.

Wool comes from sheep. Any colour of bed works for the pack, but the quest asks for a &fwhite&r one. Dye it later if you like.
'@
Q 'food' 'Something to Eat' 'minecraft:cooked_beef*8' 'furnace' 'minecraft:bread*8' -desc @'
Cook some beef. Hunger matters a lot when you start using Ultimine and jetpacks.

&6Tip:&r &bAppleSkin&r shows how much hunger and saturation each food restores.
'@
Q 'farm' 'First Farm' 'minecraft:wheat*32;minecraft:carrot*8;minecraft:potato*8' 'food' 'xp:50;table:common' -desc @'
A farm gives you endless food. Till dirt with a hoe next to water and plant seeds.

Later, &bMystical Agriculture&r lets you grow almost every resource in the same way!
'@
Q 'animals' 'Animal Husbandry' 'adv:minecraft:husbandry/breed_an_animal' 'farm' 'xp:50' -icon 'minecraft:wheat' -desc 'Breed two animals of the same kind by feeding them. Cows, sheep, pigs and chickens all make great farms.'
Q 'shelter' 'A Place to Call Home' 'minecraft:chest*2;minecraft:oak_door' 'bed' 'xp:25;table:common' -desc @'
Build a simple shelter with a door and some storage.

&6Tip:&r Claim your base on the map (&eM&r) so other players cannot grief it. Later, upgrade your storage with &bSophisticated Storage&r.
'@

# --- Iron age ---
Q 'iron' 'Iron Age' 'minecraft:iron_ingot*16' 'furnace' 'xp:50;table:common' -size 1.5 -desc @'
Iron is the backbone of almost every mod in the pack. Find iron ore in caves and on mountains, and smelt it.

&6Tip:&r The worldgen mods add huge caves. Bring torches and a bed, and mark the way back with waypoints.
'@
Q 'iron_tools' 'Iron Tools' 'minecraft:iron_pickaxe;minecraft:iron_axe;minecraft:iron_sword' 'iron' 'xp:50' -desc 'An iron pickaxe can mine diamonds, gold and redstone.'
Q 'iron_armor' 'Suit Up' 'minecraft:iron_helmet;minecraft:iron_chestplate;minecraft:iron_leggings;minecraft:iron_boots' 'iron' 'xp:75;table:common' -desc @'
A full set of iron armor makes the night a lot less scary.

Later you will find much better armor: Mekanism, Allthemodium, Twilight Forest, Aether II, Equivox...
'@
Q 'shield' 'Shield' 'minecraft:shield' 'iron' 'xp:25' -desc 'Block arrows, creeper explosions and melee hits by holding right-click.'
Q 'bucket' 'Buckets' 'minecraft:bucket;minecraft:water_bucket' 'iron' 'xp:25' -desc 'Carry water and lava. A water bucket can save you from a fatal fall!'
Q 'copper' 'Copper' 'minecraft:copper_ingot*16' 'iron' 'xp:25' -opt -desc 'Copper is used in many tech recipes, from Mekanism cables to Oritech machines.'
Q 'zombies' 'Night Watch' 'kill:minecraft:zombie*20' 'iron_tools' 'xp:75;table:common' -icon 'minecraft:rotten_flesh' -desc 'Defeat 20 zombies. Apotheosis can give monsters affixes, so watch out for ones with coloured names!'
Q 'skeletons' 'Bone Collector' 'kill:minecraft:skeleton*15;minecraft:bone*16' 'iron_tools' 'xp:75' -icon 'minecraft:bone' -desc 'Skeletons drop bones and arrows. Bone meal speeds up your crops.'
Q 'creepers' 'That''s a Nice Base...' 'kill:minecraft:creeper*10;minecraft:gunpowder*8' 'iron_armor' 'xp:75;table:uncommon' -icon 'minecraft:gunpowder' -desc 'Kill creepers before they reach your walls. Gunpowder is needed for TNT, rockets and more.'
Q 'village' 'Neighbours' 'struct:#minecraft:village' 'iron_tools' 'xp:75;minecraft:emerald*4' -icon 'minecraft:emerald' -desc @'
Find a village. Villagers trade emeralds for all kinds of goods.

&6Tip:&r With &bEasy Villagers&r you can pick villagers up and put them in a block, and &bTrade Cycling&r lets you reroll their trades.
'@
Q 'trade' 'Let''s Make a Deal' 'adv:minecraft:adventure/trade' 'village' 'xp:50' -icon 'minecraft:emerald' -desc 'Trade with a villager. Librarians can sell enchanted books!'

# --- Diamonds and enchanting ---
Q 'diamonds' 'Diamonds!' 'minecraft:diamond*5' 'iron_tools' 'xp:100;table:uncommon' -size 1.5 -shape 'hexagon' -desc @'
Diamonds are found deep underground, most commonly around &eY -58&r.

Use them for tools, the enchanting table, and countless machine recipes.
'@
Q 'diamond_gear' 'Diamond Gear' 'minecraft:diamond_pickaxe;minecraft:diamond_sword' 'diamonds' 'xp:75' -desc 'A diamond pickaxe is needed to mine obsidian.'
Q 'obsidian' 'Obsidian' 'minecraft:obsidian*14' 'diamond_gear,bucket' 'xp:50' -desc 'Pour water onto still lava to make obsidian. You need at least 10 for a Nether portal.'
Q 'enchanting' 'Magic Words' 'minecraft:enchanting_table;minecraft:bookshelf*15' 'diamonds' 'xp:100;minecraft:lapis_lazuli*32' -desc @'
The enchanting table is the start of the &bApotheosis&r chapter. It works very differently in this pack: bookshelves give &eEterna&r, &eQuanta&r and &eArcana&r stats.

Check the Apotheosis chapter for the details.
'@
Q 'anvil' 'Anvil' 'minecraft:anvil' 'iron' 'xp:25' -opt -desc 'Combine and repair enchanted gear, and rename items.'

# --- Nether ---
Q 'nether' 'Into the Nether' 'dim:minecraft:the_nether' 'obsidian' 'xp:150;table:uncommon' -size 1.5 -shape 'gear' -icon 'minecraft:flint_and_steel' -desc @'
Build a portal frame of obsidian (at least 4x5) and light it with &eFlint and Steel&r.

The Nether is hot and dangerous. Bring fire resistance if you can, and never dig straight down!
'@
Q 'quartz' 'Nether Quartz' 'minecraft:quartz*32' 'nether' 'xp:50' -desc 'Used in AE2, Mekanism and many other mods.'
Q 'gold' 'Gold Rush' 'minecraft:gold_ingot*16' 'nether' 'xp:50' -desc 'Mine nether gold ore or trade with piglins. Wear gold armor so piglins stay friendly.'
Q 'fortress' 'Nether Fortress' 'struct:minecraft:fortress' 'nether' 'xp:100;table:uncommon' -icon 'minecraft:nether_bricks' -desc 'Find a Nether Fortress. YUNG''s Better Nether Fortresses makes them much bigger and more dangerous.'
Q 'blaze' 'Blaze Rods' 'minecraft:blaze_rod*8' 'fortress' 'xp:100' -desc 'Blazes spawn in fortresses. Blaze rods make brewing stands and Eyes of Ender.'
Q 'wither_skulls' 'Wither Skeleton Skulls' 'minecraft:wither_skeleton_skull*3' 'fortress' 'xp:150;table:rare' -desc 'Wither skeletons sometimes drop their skull. You need three to summon the Wither.'
Q 'brewing' 'Potion Brewing' 'minecraft:brewing_stand;minecraft:nether_wart*8' 'blaze' 'xp:75' -desc 'Nether wart grows in fortresses and is the base of almost every potion.'
Q 'fire_res' 'Fire Resistance' 'minecraft:magma_cream*4' 'brewing' 'xp:50' -opt -desc 'Magma cream makes fire resistance potions. Very useful in the Nether and for the Hydra in the Twilight Forest.'
Q 'bastion' 'Bastion Remnant' 'struct:minecraft:bastion_remnant' 'gold' 'xp:150;table:rare' -icon 'minecraft:gilded_blackstone' -desc 'Bastions are full of piglins and great loot, including netherite upgrade templates.'
Q 'debris' 'Ancient Debris' 'minecraft:ancient_debris*4' 'nether' 'xp:150;table:rare' -desc 'Found deep in the Nether, near the lava ocean level. It does not burn in lava.'
Q 'netherite' 'Netherite' 'minecraft:netherite_ingot;minecraft:netherite_upgrade_smithing_template' 'debris,bastion' 'xp:200;table:rare' -desc 'Upgrade diamond gear to netherite in a smithing table. A netherite pickaxe is needed for Allthemodium!'
Q 'netherite_gear' 'Netherite Gear' 'minecraft:netherite_pickaxe;minecraft:netherite_chestplate' 'netherite' 'xp:200;table:epic' -desc 'Netherite gear does not burn and keeps you safe in the Nether.'

# --- The End ---
Q 'eyes' 'Eyes of Ender' 'minecraft:ender_eye*12' 'blaze' 'xp:100' -desc 'Combine blaze powder with ender pearls. Throw an eye and follow it to the stronghold.'
Q 'stronghold' 'Stronghold' 'struct:minecraft:stronghold' 'eyes' 'xp:150;table:uncommon' -icon 'minecraft:end_portal_frame' -desc 'Follow the Eyes of Ender to the stronghold. YUNG''s Better Strongholds makes them a real dungeon!'
Q 'end' 'The End' 'dim:minecraft:the_end' 'stronghold' 'xp:200;table:rare' -size 1.5 -shape 'gear' -icon 'minecraft:end_stone' -desc @'
Fill the portal frame with Eyes of Ender and jump in.

&cThe Ender Dragon is waiting.&r Bring blocks, a good bow, food and water buckets.
'@
Q 'dragon' 'Free the End' 'kill:minecraft:ender_dragon' 'end' 'lvl:15;table:epic' -size 2 -shape 'hexagon' -icon 'minecraft:dragon_head' -desc @'
Destroy the End Crystals on the pillars first, then defeat the &5Ender Dragon&r.

Afterwards, End gateways lead to the outer islands.
'@
Q 'end_city' 'End City' 'struct:minecraft:end_city' 'dragon' 'xp:200;table:rare' -icon 'minecraft:purpur_block' -desc 'End cities hold shulkers, great loot and sometimes an End Ship.'
Q 'elytra' 'Wings' 'minecraft:elytra' 'end_city' 'xp:250;table:epic' -desc 'Found on End Ships. Fly with fireworks!'
Q 'shulker' 'Shulker Boxes' 'minecraft:shulker_box' 'end_city' 'xp:100' -desc 'Portable storage that keeps its items when broken.'
Q 'wither' 'The Wither' 'kill:minecraft:wither' 'wither_skulls,netherite_gear' 'lvl:20;table:epic' -size 1.5 -icon 'minecraft:nether_star' -desc @'
Build the Wither out of 4 soul sand and 3 wither skeleton skulls. Fight it underground or far from your base!

The Nether Star is needed for beacons and many endgame recipes.
'@
Q 'beacon' 'Beacon' 'minecraft:beacon' 'wither' 'xp:200;table:rare' -desc 'Place it on a pyramid of iron, gold, emerald, diamond or netherite blocks for powerful effects.'

# --- Exploration ---
Q 'ancient_city' 'Ancient City' 'struct:minecraft:ancient_city' 'diamond_gear' 'xp:200;table:rare' -icon 'minecraft:sculk' -desc @'
Deep below, in the Deep Dark, lie ancient cities with amazing loot.

&cBe very quiet.&r Sneak everywhere and do not wake the Warden.
'@
Q 'trial' 'Trial Chambers' 'struct:minecraft:trial_chambers' 'iron_armor' 'xp:150;table:uncommon' -icon 'minecraft:trial_key' -desc 'Fight waves of monsters for trial keys and vault loot.'
Q 'waystone' 'Waystones' 'waystones:warp_stone' 'village' 'xp:50;waystones:return_scroll*2' -desc @'
&bWaystones&r appear in villages and in the wild. Activate one and you can teleport to it from any other waystone.

The &eWarp Stone&r lets you open the waystone menu from anywhere. Return Scrolls take you back to your bed.
'@
Q 'backpack' 'Pack Your Bags' 'sophisticatedbackpacks:backpack' 'shelter' 'xp:50' -desc 'A backpack gives you extra storage on the go. Upgrade it to iron, gold, diamond and netherite tiers.'
Q 'backpack_upgrade' 'Backpack Upgrades' 'sophisticatedbackpacks:pickup_upgrade;sophisticatedbackpacks:magnet_upgrade' 'backpack' 'xp:75' -opt -desc 'Upgrades can pick items up, pull them in, sort, compact, feed you and much more.'
