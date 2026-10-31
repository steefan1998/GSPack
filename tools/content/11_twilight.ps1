Chapter 'twilight' 'The Twilight Forest' 'twilightforest:naga_trophy' 'explore' 'Eternal twilight: strange creatures, treasures and mighty bosses.'

# ===== Arrival =====
Q 'portal' 'Into the Twilight' 'dim:twilightforest:twilight_forest' '' 'xp:150;table:twilight' -size 1.5 -shape 'gear' -icon 'minecraft:diamond' -sub 'The adventure dimension' -desc @'
Dig a &e2x2 pool of water&r, surround it with &eflowers&r (and grass), and throw a &bdiamond&r in. Lightning strikes and the portal opens!

&2The Twilight Forest&r is full of bosses that must be defeated &ein order&r. Areas you have not unlocked yet are protected by curses, darkness and barriers.
'@
Q 'progression' 'The Path' 'check' 'portal' 'xp:25' -icon 'twilightforest:magic_map_focus' -desc @'
The boss order:
1. &eNaga&r (Naga Courtyard)
2. &eLich&r (Lich Tower)
3. &eMinoshroom&r (Labyrinth, under the swamp)
4. &eHydra&r (Fire Swamp)
5. &eKnight Phantoms&r (Goblin Stronghold)
6. &eUr-Ghast&r (Dark Tower)
7. &eAlpha Yeti&r (Yeti Cave)
8. &eSnow Queen&r (Aurora Palace)
9. The Highlands and the Final Castle...
'@
Q 'quest_grove' 'Quest Grove' 'struct:twilightforest:quest_grove' 'portal' 'xp:100;table:twilight' -icon 'twilightforest:quest_ram_trophy' -desc 'A stone circle with a strange ram. Feed it wool of every colour...'
Q 'quest_ram' 'The Questing Ram' 'twilightforest:quest_ram_trophy' 'quest_grove' 'xp:200;table:rare' -opt -desc 'Feed the Questing Ram one wool of all 16 colours for a great reward.'
Q 'hollow_hill' 'Hollow Hills' 'struct:twilightforest:small_hollow_hill' 'portal' 'xp:100;table:twilight' -icon 'minecraft:spawner' -desc 'Hills hollowed out by monsters, full of ore, spawners and treasure chests.'
Q 'big_hill' 'Large Hollow Hill' 'struct:twilightforest:large_hollow_hill' 'hollow_hill' 'xp:200;table:rare' -icon 'minecraft:spawner' -desc 'The biggest hollow hills have the best loot, and the most monsters.'
Q 'hedge_maze' 'Hedge Maze' 'struct:twilightforest:hedge_maze' 'portal' 'xp:100;table:twilight' -icon 'twilightforest:hedge' -desc 'A maze of thorny hedges with chests and spiders.'
Q 'mushroom_tower' 'Mushroom Tower' 'struct:twilightforest:mushroom_tower' 'portal' 'xp:100' -opt -icon 'minecraft:red_mushroom_block' -desc 'A giant mushroom you can climb.'
Q 'hollow_tree' 'Hollow Tree' 'struct:twilightforest:hollow_tree' 'portal' 'xp:100' -opt -icon 'twilightforest:twilight_oak_drying_rack' -desc 'A huge hollow tree with a secret inside.'
Q 'raven' 'Raven Feathers' 'twilightforest:raven_feather*8' 'portal' 'xp:25' -desc 'Ravens gather near stone obelisks. Their feathers make map foci.'
Q 'magic_map' 'Magic Map' 'twilightforest:magic_map_focus;twilightforest:magic_map' 'raven' 'xp:75' -desc 'A Magic Map shows biomes and the major structures. Very useful for finding boss lairs.'
Q 'maze_map' 'Maze Map' 'twilightforest:maze_map_focus' 'magic_map,minoshroom' 'xp:75' -opt -desc 'A map that shows the labyrinth around you.'
Q 'ore_map' 'Ore Map' 'twilightforest:ore_map' 'maze_map' 'xp:75' -opt -desc 'Shows ores underground.'

# ===== Resources =====
Q 'torch' 'Torchberries' 'twilightforest:torchberries*16' 'portal' 'xp:25' -desc 'Torchberry plants hang from cave ceilings. They glow!'
Q 'liveroot' 'Liveroot' 'twilightforest:liveroot*16' 'portal' 'xp:25' -desc 'Found in the roots underground. Used to make Ironwood.'
Q 'ironwood' 'Ironwood' 'twilightforest:ironwood_ingot*8' 'liveroot' 'xp:75' -desc 'Craft iron, moss and liveroot into raw ironwood, then smelt it. Ironwood tools and armor repair themselves.'
Q 'ironwood_gear' 'Ironwood Gear' 'twilightforest:ironwood_pickaxe;twilightforest:ironwood_chestplate' 'ironwood' 'xp:100' -desc 'Comes pre-enchanted!'
Q 'steeleaf' 'Steeleaf' 'twilightforest:steeleaf_ingot*8' 'portal' 'xp:75' -desc 'Dropped by leafy Twilight creatures and found in chests.'
Q 'steeleaf_gear' 'Steeleaf Gear' 'twilightforest:steeleaf_sword;twilightforest:steeleaf_chestplate' 'steeleaf' 'xp:100' -desc 'Also pre-enchanted.'
Q 'canopy' 'Canopy Trees' 'twilightforest:canopy_drying_rack' 'portal' 'xp:25' -opt -desc 'The Twilight Forest has many unique woods: twilight oak, canopy, mangrove, darkwood and the magic trees.'
Q 'magic_trees' 'Magic Trees' 'twilightforest:time_log_core;twilightforest:transformation_log_core;twilightforest:mining_log_core;twilightforest:sorting_log_core' 'portal' 'xp:300;table:rare' -desc @'
Four rare magic trees have a powerful core:
- &eTree of Time&r: speeds up things around it.
- &eTree of Transformation&r: turns the biome into Enchanted Forest.
- &eMinewood&r: mines ores nearby.
- &eSortingwood&r: sorts items into chests.
'@
Q 'uncrafting' 'Uncrafting Table' 'twilightforest:uncrafting_table' 'portal' 'xp:100' -desc 'Takes crafted items apart, keeping enchantments as books (for a cost in XP).'
Q 'wildlife' 'Twilight Wildlife' 'kill:twilightforest:deer*2;kill:twilightforest:boar*2;kill:twilightforest:bighorn_sheep*2' 'portal' 'xp:75' -icon 'twilightforest:raw_venison' -desc 'Hunt the forest''s animals for food.'
Q 'meef' 'Meef Stroganoff' 'twilightforest:meef_stroganoff' 'minoshroom' 'xp:50' -desc 'Made from minotaur meat. It raises your maximum health for a while.'
Q 'hostiles' 'Forest Dangers' 'kill:twilightforest:redcap*5;kill:twilightforest:skeleton_druid*3;kill:twilightforest:hostile_wolf*3' 'portal' 'xp:100;table:twilight' -icon 'twilightforest:steeleaf_sword' -desc 'Redcaps, skeleton druids and twilight wolves roam the forest. Clear a few out.'

# ===== Bosses =====
Q 'naga_court' 'Naga Courtyard' 'struct:twilightforest:naga_courtyard' 'portal' 'xp:100' -icon 'twilightforest:nagastone_head' -desc 'A ruined stone courtyard, home of the Naga.'
Q 'naga' 'The Naga' 'kill:twilightforest:naga;twilightforest:naga_trophy' 'naga_court' 'xp:300;table:twilight' -size 1.5 -shape 'hexagon' -desc 'A giant serpent. Dodge its charges and strike its head. It drops Naga Scales.'
Q 'naga_armor' 'Naga Armor' 'twilightforest:naga_scale*11;twilightforest:naga_chestplate;twilightforest:naga_leggings' 'naga' 'xp:150' -desc 'Strong armor made from Naga Scales.'
Q 'charm_life' 'Charm of Life' 'twilightforest:charm_of_life_1' 'naga' 'xp:100' -desc 'Saves you from death once.'
Q 'charm_keeping' 'Charm of Keeping' 'twilightforest:charm_of_keeping_1' 'charm_life' 'xp:100' -opt -desc 'Keeps some of your items when you die.'
Q 'lich_tower' 'Lich Tower' 'struct:twilightforest:lich_tower' 'naga' 'xp:150' -icon 'twilightforest:lich_tower_miniature_structure' -desc 'A tall tower full of spawners. The Lich waits at the top.'
Q 'lich' 'The Lich' 'kill:twilightforest:lich;twilightforest:lich_trophy' 'lich_tower' 'xp:400;table:rare' -size 1.5 -shape 'hexagon' -desc @'
The Lich hides behind shields and throws fireballs. Hit the fireballs back at him!

Later in the fight, he summons minions and comes at you with his sword.
'@
Q 'scepters' 'Scepters' 'twilightforest:twilight_scepter;twilightforest:lifedrain_scepter;twilightforest:zombie_scepter;twilightforest:fortification_scepter' 'lich' 'xp:200;table:rare' -desc 'The Lich drops one of four magic scepters. Collect them all!'
Q 'transform' 'Transformation Powder' 'twilightforest:transformation_powder*8' 'lich' 'xp:50' -opt -desc 'Turns some creatures into their Twilight versions.'
Q 'labyrinth' 'Labyrinth' 'struct:twilightforest:labyrinth' 'lich' 'xp:150' -icon 'twilightforest:mazestone_border' -desc 'Below the swamp lies a huge stone labyrinth.'
Q 'mazebreaker' 'Mazebreaker' 'twilightforest:mazebreaker_pickaxe' 'labyrinth' 'xp:100' -opt -desc 'A pickaxe made for breaking mazestone.'
Q 'minoshroom' 'The Minoshroom' 'kill:twilightforest:minoshroom;twilightforest:minoshroom_trophy' 'labyrinth' 'xp:400;table:rare' -size 1.5 -shape 'hexagon' -desc 'A mushroom minotaur that charges at you. Dodge, then hit back!'
Q 'axe' 'Minotaur Axe' 'twilightforest:diamond_minotaur_axe' 'minoshroom' 'xp:100' -desc 'Deals extra damage when you charge with it.'
Q 'hydra_lair' 'Hydra Lair' 'struct:twilightforest:hydra_lair' 'minoshroom' 'xp:150' -icon 'twilightforest:fire_jet' -desc 'In the fire swamp, deep in a cave, lives the Hydra. Fire resistance is a must!'
Q 'hydra' 'The Hydra' 'kill:twilightforest:hydra;twilightforest:hydra_trophy' 'hydra_lair' 'xp:500;table:rare' -size 1.5 -shape 'hexagon' -desc 'A three-headed fire beast. Hit its heads when they open their mouths. Each head has its own health.'
Q 'fiery' 'Fiery Ingots' 'twilightforest:fiery_blood;twilightforest:fiery_ingot*4' 'hydra' 'xp:200' -desc 'Fiery tools set things on fire and auto-smelt what they mine.'
Q 'fiery_gear' 'Fiery Gear' 'twilightforest:fiery_pickaxe;twilightforest:fiery_chestplate' 'fiery' 'xp:200;table:rare' -desc 'Fiery armor burns attackers.'
Q 'hydra_chop' 'Hydra Chop' 'twilightforest:hydra_chop' 'hydra' 'xp:50' -opt -desc 'A huge meal from the Hydra.'
Q 'stronghold' 'Goblin Stronghold' 'struct:twilightforest:knight_stronghold' 'hydra' 'xp:150' -icon 'twilightforest:stronghold_shield' -desc 'A huge underground stronghold full of goblin knights.'
Q 'goblins' 'Goblin Knights' 'kill:twilightforest:upper_goblin_knight*5;kill:twilightforest:block_and_chain_goblin*3' 'stronghold' 'xp:150' -icon 'twilightforest:armor_shard' -desc 'The stronghold''s soldiers. They drop armor shards.'
Q 'knight' 'Knight Phantoms' 'kill:twilightforest:knight_phantom*6;twilightforest:knight_phantom_trophy' 'goblins' 'xp:500;table:rare' -size 1.5 -shape 'hexagon' -desc 'Six phantom knights guard the heart of the stronghold. Defeat them all!'
Q 'knightmetal' 'Knightmetal' 'twilightforest:armor_shard*18;twilightforest:knightmetal_ingot*8' 'goblins' 'xp:200' -desc 'Knightmetal is made from armor shards. Knightmetal gear is very strong.'
Q 'knight_gear' 'Knightmetal Gear' 'twilightforest:knightmetal_sword;twilightforest:knightmetal_chestplate;twilightforest:knightmetal_shield' 'knightmetal' 'xp:200;table:rare' -desc 'Some of the toughest gear in the Twilight Forest.'
Q 'phantom' 'Phantom Armor' 'twilightforest:phantom_helmet;twilightforest:phantom_chestplate' 'knight' 'xp:200' -desc 'Phantom armor stays with you when you die.'
Q 'dark_tower' 'Dark Tower' 'struct:twilightforest:dark_tower' 'knight' 'xp:150' -icon 'twilightforest:tower_key' -desc 'A huge tower of towerwood in the Dark Forest, full of carminite ghasts and traps.'
Q 'carminite' 'Carminite' 'twilightforest:carminite*8' 'dark_tower' 'xp:100' -desc 'Dropped by the tower''s creatures. Used for magical machines.'
Q 'carminite_tech' 'Carminite Machines' 'twilightforest:carminite_reactor;twilightforest:carminite_builder;twilightforest:ghast_trap' 'carminite' 'xp:150' -opt -desc 'The Dark Tower''s magical devices: a builder, a reactor and the ghast trap.'
Q 'ur_ghast' 'The Ur-Ghast' 'kill:twilightforest:ur_ghast;twilightforest:ur_ghast_trophy' 'dark_tower' 'xp:600;table:epic' -size 1.5 -shape 'hexagon' -desc 'At the top of the Dark Tower floats the Ur-Ghast. Use the ghast traps to bring it down!'
Q 'tears' 'Fiery Tears' 'twilightforest:fiery_tears*2' 'ur_ghast' 'xp:100' -desc 'Combine with iron for more fiery ingots.'
Q 'yeti_cave' 'Yeti Cave' 'struct:twilightforest:yeti_cave' 'ur_ghast' 'xp:150' -icon 'minecraft:packed_ice' -desc 'In the snowy forest, an icy cave holds the Alpha Yeti.'
Q 'yeti' 'The Alpha Yeti' 'kill:twilightforest:alpha_yeti;twilightforest:alpha_yeti_trophy' 'yeti_cave' 'xp:600;table:epic' -size 1.5 -shape 'hexagon' -desc 'Dodge the falling ice and hit the Yeti when it is tired.'
Q 'yeti_armor' 'Yeti Armor' 'twilightforest:alpha_yeti_fur*8;twilightforest:yeti_chestplate' 'yeti' 'xp:150' -desc 'Freezes attackers.'
Q 'ice_bomb' 'Ice Bomb' 'twilightforest:ice_bomb*4' 'yeti' 'xp:50' -opt -desc 'Freezes everything around where it lands.'
Q 'aurora' 'Aurora Palace' 'struct:twilightforest:aurora_palace' 'yeti' 'xp:150' -icon 'twilightforest:aurora_block' -desc 'A shimmering palace on the glacier.'
Q 'snow_queen' 'The Snow Queen' 'kill:twilightforest:snow_queen;twilightforest:snow_queen_trophy' 'aurora' 'xp:700;table:epic' -size 1.5 -shape 'hexagon' -desc 'The ruler of the Aurora Palace, surrounded by ice crystals.'
Q 'triple_bow' 'Bows of the Queen' 'twilightforest:triple_bow;twilightforest:seeker_bow;twilightforest:ice_bow;twilightforest:ender_bow' 'snow_queen' 'xp:200;table:rare' -desc 'The Twilight Forest''s bows: triple-shot, homing, freezing and teleporting.'
Q 'troll_cave' 'Troll Caves' 'struct:twilightforest:troll_cave' 'snow_queen' 'xp:200' -icon 'twilightforest:trollsteinn' -desc 'Deep in the Highlands lie caves full of trolls and giants.'
Q 'giant_house' 'Giant''s House' 'struct:twilightforest:giant_house' 'troll_cave' 'xp:200;table:rare' -icon 'twilightforest:giant_cobblestone' -desc 'Up in the clouds stand the houses of the giants.'
Q 'giants' 'Giant Tools' 'twilightforest:giant_pickaxe;twilightforest:giant_sword' 'giant_house' 'xp:300;table:rare' -desc 'The giants drop enormous tools that give you more reach.'
Q 'lamp' 'Lamp of Cinders' 'twilightforest:lamp_of_cinders' 'troll_cave' 'xp:300;table:epic' -desc 'The Lamp of Cinders burns away the thorns that block the way to the Final Castle.'
Q 'final_castle' 'The Final Castle' 'struct:twilightforest:final_castle' 'lamp' 'lvl:30;table:epic' -size 2 -shape 'gear' -icon 'twilightforest:mystic_crown' -desc @'
At the very top of the Highlands stands the &5Final Castle&r. It is the end of your journey through the Twilight Forest... for now.

Congratulations, adventurer!
'@
Q 'trophies' 'Trophy Room' 'twilightforest:naga_trophy;twilightforest:lich_trophy;twilightforest:minoshroom_trophy;twilightforest:hydra_trophy;twilightforest:knight_phantom_trophy;twilightforest:ur_ghast_trophy;twilightforest:alpha_yeti_trophy;twilightforest:snow_queen_trophy' 'snow_queen' 'lvl:20;table:epic' -size 1.5 -icon 'twilightforest:trophy_pedestal' -desc 'Collect the trophy of every boss. Put them on display in your base!'

# ===== Equipment =====
Q 'ore_magnet' 'Ore Magnet' 'twilightforest:ore_magnet' 'carminite' 'xp:100' -desc 'Pulls ore veins towards you.'
Q 'crumble_horn' 'Crumble Horn' 'twilightforest:crumble_horn' 'ur_ghast' 'xp:100' -opt -desc 'Crumbles stone and wood around you.'
Q 'peacock_fan' 'Peacock Feather Fan' 'twilightforest:peacock_feather_fan' 'ur_ghast' 'xp:100' -opt -desc 'Blows enemies (and you) away, and lets you glide.'
Q 'cube' 'Cube of Annihilation' 'twilightforest:cube_of_annihilation' 'knight' 'xp:150' -opt -desc 'Destroys blocks and enemies in its path.'
Q 'pocket_watch' 'Moon Dial & Watch' 'twilightforest:moon_dial;twilightforest:pocket_watch' 'portal' 'xp:50' -opt -desc 'Keep track of the moon phase and the time.'
