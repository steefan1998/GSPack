Chapter 'stellaris' 'Stellaris' 'stellaris:rocket' 'explore' 'Build a space program: fuel, space suits, rockets and the Moon.'

# ===== Ground control =====
Q 'titanium' 'Titanium' 'stellaris:raw_titanium*8;stellaris:titanium_ingot*16' '' 'xp:75;table:space' -size 1.5 -shape 'gear' -sub 'The space program begins' -desc @'
&bStellaris&r takes you into space and to the Moon.

Start by finding &eTitanium ore&r underground (also in deepslate). Titanium is the core material of your space program.
'@
Q 'titanium_tools' 'Titanium Tools' 'stellaris:titanium_pickaxe;stellaris:titanium_sword' 'titanium' 'xp:50' -opt -desc 'Tough tools made from titanium.'
Q 'blocks' 'Space Age Building' 'stellaris:titanium_plating_block*16;stellaris:iron_plating_block*16' 'titanium' 'xp:25' -opt -desc 'Plating blocks make your launch site look the part.'
Q 'base' 'Earth Operation Base' 'struct:stellaris:earth_operation_base' 'titanium' 'xp:150;table:space' -icon 'stellaris:flag' -desc 'Find an abandoned operation base. It may still hold useful supplies.'
Q 'satellite' 'Crashed Satellite' 'struct:stellaris:earth_satellite' 'titanium' 'xp:100' -icon 'stellaris:antenna' -desc 'A satellite fell to Earth. Search the wreck!'
Q 'meteor' 'Meteor' 'struct:stellaris:meteor' 'titanium' 'xp:100;table:space' -icon 'stellaris:meteorite' -desc 'Find a meteor crater. Meteorites hold rare materials.'

# ===== Power & machines =====
Q 'power' 'Coal Generator' 'stellaris:coal_generator;stellaris:cable_t1*16' 'titanium' 'xp:75' -desc 'Power for your machines. Connect everything with cables.'
Q 'solar' 'Solar Panel' 'stellaris:solar_panel*2' 'power' 'xp:75' -desc 'Free power during the day.'
Q 'diesel' 'Diesel Generator' 'stellaris:diesel_generator' 'refinery' 'xp:100' -desc 'Burns diesel for much more power.'
Q 'battery' 'Power Bank' 'stellaris:power_bank_t1' 'power' 'xp:50' -desc 'Stores energy for when you need it.'
Q 'station' 'Engineering Station' 'stellaris:engineering_station' 'power' 'xp:100;table:space' -size 1.5 -desc 'Rocket parts, suits and modules are built here. Check JEI for the recipes.'
Q 'lab' 'Laboratory' 'stellaris:laboratory' 'station' 'xp:100' -desc 'Research and process strange materials.'
Q 'silicon' 'Silicon' 'stellaris:silicon*16' 'titanium' 'xp:50' -desc 'Used in electronics.'
Q 'tablet' 'Tablet' 'stellaris:tablet' 'station' 'xp:50' -opt -desc 'A handheld computer for your space program.'
Q 'pipes' 'Fluid Handling' 'stellaris:pipe_t1*16;stellaris:fluid_tank_t1*2' 'power' 'xp:50' -desc 'Move and store fuel, oil, water and gases.'

# ===== Fuel =====
Q 'oil_finder' 'Find Oil' 'stellaris:oil_finder' 'station' 'xp:75' -desc 'Oil is hidden underground. The Oil Finder tells you where.'
Q 'pumpjack' 'Pumpjack' 'stellaris:pumpjack;stellaris:oil_bucket' 'oil_finder' 'xp:150' -desc 'Pumps oil from an underground deposit.'
Q 'refinery' 'Fuel Refinery' 'stellaris:fuel_refinery;stellaris:fuel_bucket*2' 'pumpjack' 'xp:150;table:space' -desc 'Refines oil into &erocket fuel&r. You will need a lot for each launch.'
Q 'water' 'Water Pump' 'stellaris:water_pump' 'power' 'xp:50' -desc 'Pumps water into your machines.'
Q 'electrolyzer' 'Electrolyzer' 'stellaris:electrolyzer;stellaris:hydrogen_bucket' 'water' 'xp:100' -desc 'Splits water into hydrogen and oxygen.'
Q 'hydrogen_motor' 'Hydrogen Motor' 'stellaris:hydrogen_motor' 'electrolyzer' 'xp:100' -opt -desc 'A cleaner way to power your machines.'

# ===== Life support =====
Q 'suit' 'Space Suit' 'stellaris:space_suit_helmet;stellaris:space_suit_chestplate;stellaris:space_suit_leggings;stellaris:space_suit_boots' 'station,silicon' 'xp:200;table:uncommon' -size 1.5 -desc @'
There is no air in space! A full space suit keeps you alive outside.

Fill it with &eoxygen&r before you go, and keep an eye on the oxygen bar.
'@
Q 'oxygen' 'Oxygen Module' 'stellaris:space_suit_oxygen_module_tier_1' 'suit,electrolyzer' 'xp:100' -desc 'More oxygen for your suit. Higher tiers last much longer.'
Q 'oxygen2' 'Better Oxygen' 'stellaris:space_suit_oxygen_module_tier_2' 'oxygen,desh' 'xp:150' -opt -desc 'Tier 2 oxygen.'
Q 'protection' 'Damage Protection' 'stellaris:space_suit_damage_protection_module_tier_1' 'suit' 'xp:100' -desc 'Makes your suit tougher.'
Q 'night_vision' 'Night Vision' 'stellaris:space_suit_night_vision_module' 'suit' 'xp:75' -opt -desc 'See in the dark of space.'
Q 'distributor' 'Oxygen Distributor' 'stellaris:oxygen_distributor' 'oxygen' 'xp:150' -desc 'Fills a sealed room with air, so you can take your helmet off inside your base.'
Q 'propagator' 'Oxygen Propagator' 'stellaris:oxygen_propagator' 'distributor' 'xp:100' -opt -desc 'Spreads oxygen further through a large base.'
Q 'jet' 'Jet Module' 'stellaris:space_suit_jet_module_tier_1' 'oxygen,desh' 'xp:150' -desc 'Fly around in low gravity with your space suit.'
Q 'gravity' 'Gravity Manipulator' 'stellaris:gravity_manipulator' 'desh' 'xp:200' -opt -desc 'Change the gravity around you.'

# ===== Rockets =====
Q 'parts' 'Rocket Parts' 'stellaris:rocket_nose_cone;stellaris:rocket_fin*4;stellaris:rocket_engine;stellaris:engine_fan' 'station' 'xp:200;table:space' -desc 'The parts every rocket needs. &6GSPack:&r the Rocket Engine needs an Oritech &eProcessing Unit&r.'
Q 'pad' 'Launch Pad' 'stellaris:rocket_launch_pad*9' 'station' 'xp:100' -desc 'Build a 3x3 launch pad.'
Q 'rocket' 'Rocket' 'stellaris:rocket' 'parts,pad,refinery' 'xp:300;choice:rare' -size 2 -shape 'hexagon' -desc @'
Build your rocket and place it on the launch pad. Fill it with &erocket fuel&r.

Get in, put on your space suit, and launch!
'@
Q 'cargo' 'Cargo Module' 'stellaris:cargo_module' 'rocket' 'xp:100' -opt -desc 'Extra storage in your rocket.'
Q 'autopilot' 'Autopilot' 'stellaris:autopilot_module' 'rocket' 'xp:100' -opt -desc 'Lets your rocket fly without you.'
Q 'shield' 'Shield Module' 'stellaris:shield_module' 'rocket' 'xp:100' -opt -desc 'Protects your rocket.'
Q 'unloader' 'Cargo Unloader' 'stellaris:cargo_unloader' 'cargo' 'xp:75' -opt -desc 'Automatically unloads rockets.'
Q 'skins' 'Rocket Skins' 'stellaris:skin_galaxy' 'rocket' 'xp:50' -opt -desc 'Give your rocket a new look.'

# ===== Space =====
Q 'orbit' 'To Orbit!' 'dim:stellaris:earth_orbit' 'rocket,suit' 'xp:300;table:space' -size 1.5 -icon 'stellaris:earth_globe' -desc 'Launch and reach &eEarth Orbit&r. Look at the view!'
Q 'space_station' 'Space Station' 'stellaris:space_station_blueprint' 'orbit' 'xp:200' -desc 'Build your own space station in orbit.'
Q 'moon' 'One Small Step' 'dim:stellaris:moon' 'orbit' 'xp:500;table:epic' -size 2 -shape 'gear' -icon 'stellaris:moon_globe' -desc @'
Land on the &7Moon&r!

The gravity is low, there is no air, and things live here. Watch your oxygen at all times.
'@
Q 'first_landing' 'First Landing Site' 'struct:stellaris:moon_first_landing' 'moon' 'xp:150;table:space' -icon 'stellaris:flag' -desc 'Somebody was here before you.'
Q 'flag' 'Plant a Flag' 'stellaris:flag' 'moon' 'xp:50' -desc 'Claim the Moon for your team!'
Q 'moonstone' 'Moon Rocks' 'stellaris:moon_stone*32;stellaris:moon_sand*16' 'moon' 'xp:50' -desc 'Take some souvenirs home.'
Q 'moon_ores' 'Lunar Ores' 'stellaris:moon_titanium_ore;stellaris:moon_stone_iron_ore' 'moonstone' 'xp:75' -desc 'The Moon has its own versions of familiar ores.'
Q 'desh' 'Desh' 'stellaris:raw_desh*8;stellaris:desh_ingot*16' 'moon' 'xp:200;table:space' -size 1.5 -desc 'A lunar metal used for better rockets, suits and machines.'
Q 'desh_blocks' 'Desh Building' 'stellaris:desh_plating_block*16' 'desh' 'xp:25' -opt -desc 'Build a lunar base out of desh.'
Q 'novite' 'Novite' 'stellaris:raw_novite*4;stellaris:novite_ingot*4' 'desh' 'xp:300;table:rare' -desc 'A rare and powerful metal.'
Q 'novite_site' 'Novite Deposit' 'struct:stellaris:novite' 'novite' 'xp:150' -opt -icon 'stellaris:novite_ore' -desc 'Find a large novite formation.'
Q 'astrum' 'Astrum Crystals' 'stellaris:astrum_vitreus_cluster' 'moon' 'xp:150' -opt -desc 'Strange glowing crystals.'
Q 'lunar_base' 'Lunar Outpost' 'struct:stellaris:lunar_outpost' 'moon' 'xp:200;table:space' -icon 'stellaris:desh_plating_block' -desc 'An abandoned outpost on the Moon.'
Q 'space_base' 'Moon Space Base' 'struct:stellaris:moon_space_base' 'lunar_base' 'xp:250;table:rare' -icon 'stellaris:electric_light' -desc 'A large base, long abandoned.'
Q 'spaceship' 'Wrecked Spaceship' 'struct:stellaris:moon_destroyed_spaceship' 'moon' 'xp:200;table:space' -icon 'stellaris:rocket_engine' -desc 'A ship crashed here. Search the wreck.'
Q 'moon_village' 'Moon Village' 'struct:stellaris:moon_village' 'moon' 'xp:200;table:rare' -icon 'stellaris:moon_stone_bricks' -desc 'People... on the Moon?'
Q 'destroyed_village' 'Ruined Moon Village' 'struct:stellaris:moon_destroyed_village' 'moon_village' 'xp:150' -opt -icon 'stellaris:cracked_moon_stone_bricks' -desc 'Something attacked this village.'
Q 'aliens' 'Aliens' 'kill:stellaris:alien*3' 'moon_village' 'xp:150' -icon 'stellaris:alien_spawn_egg' -desc 'The Moon''s inhabitants are not always friendly.'
Q 'rover' 'Rover' 'stellaris:rover' 'desh' 'xp:200' -desc 'Drive across the Moon in style.'
Q 'rover_mods' 'Rover Upgrades' 'stellaris:rover_speed_module;stellaris:rover_tank_module' 'rover' 'xp:100' -opt -desc 'Make your rover faster and give it a bigger tank.'

# ===== Lunar forest & the parasites =====
Q 'forest' 'Lunar Forest' 'biome:stellaris:lunar_forest' 'moon' 'xp:100' -icon 'stellaris:lunar_log' -desc 'Yes, there are trees on this Moon.'
Q 'lunar_wood' 'Lunar Wood' 'stellaris:lunar_log*16' 'forest' 'xp:50' -desc 'Strange purple-tinted wood.'
Q 'berries' 'Moon Berries' 'stellaris:moon_berries*16' 'forest' 'xp:50' -desc 'Lunar food. Careful what you eat up here.'
Q 'biomes' 'Lunar Explorer' 'biome:stellaris:lunar_desert;biome:stellaris:moon_craters;biome:stellaris:lunar_blue_lake;biome:stellaris:burnt_forest' 'forest' 'xp:200;table:space' -icon 'minecraft:filled_map' -desc 'Visit the other lunar biomes.'
Q 'parasite' 'Parasites' 'kill:stellaris:lunar_parasite*5;stellaris:lunar_parasite_tooth' 'forest' 'xp:200' -icon 'stellaris:lunar_parasite_tooth' -desc 'Something lives in the lunar forests, and it can infect people...'
Q 'vaccine' 'Vaccine' 'stellaris:vaccine' 'parasite,lab' 'xp:150' -desc 'Cures and protects you from parasite infection.'
Q 'infected' 'Infected Villagers' 'kill:stellaris:parasite_affected_villager*3' 'parasite' 'xp:150' -opt -icon 'stellaris:parasite' -desc 'Poor villagers, taken over by the parasite.'
Q 'shadow' 'Luna Shadow' 'kill:stellaris:luna_shadow*3' 'moon' 'xp:150' -icon 'stellaris:moon_deepslate' -desc 'Shadows that hunt in the dark.'
Q 'dungeon' 'Moon Dungeon' 'struct:stellaris:moon_dungeon' 'parasite' 'xp:250;table:rare' -icon 'stellaris:chiseled_moon_stone' -desc 'A dungeon deep in the Moon. Something big is waiting there.'
Q 'star_crawlers' 'Star Crawlers' 'kill:stellaris:star_crawler*5' 'dungeon' 'xp:200' -icon 'stellaris:lunar_crawler_spike_cluster' -desc 'Crawling creatures from the depths.'

# ===== Bosses =====
Q 'heart' 'Heart of Luna' 'kill:stellaris:heart_of_luna;stellaris:heart_of_luna_trophy' 'dungeon,vaccine' 'xp:600;table:epic' -size 1.5 -shape 'hexagon' -desc 'Defeat the boss hiding in the heart of the Moon and claim its trophy.'
Q 'star_crawler' 'Star Crawler Queen' 'kill:stellaris:star_crawler_boss;stellaris:star_crawler_boss_trophy' 'heart,star_crawlers' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc 'The final challenge of Stellaris. You are a true astronaut!'
