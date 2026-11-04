Chapter 'aether' 'The Aether II' 'aether_ii:ambrosium_shard' 'explore' 'Floating islands, strange creatures and lost civilisations.'

# ===== Arrival =====
Q 'portal' 'Into the Sky' 'dim:aether_ii:aether_holy_isles' '' 'xp:150;table:sky' -size 1.5 -shape 'gear' -icon 'minecraft:glowstone' -sub 'The Highlands await' -desc @'
&bThe Aether II&r is a dimension of floating islands high above the clouds.

Check JEI for the &eAether portal frame&r and how to activate it, then step through!

&7Note: The Aether II is still in alpha, so some things may still change between updates.&r
'@
Q 'safety' 'Mind the Gap' 'check' 'portal' 'xp:25' -icon 'aether_ii:cold_aercloud' -desc @'
Falling off an island drops you into the void, or back to the Overworld if you are lucky.

Carry &eCold Aerclouds&r to break your fall, and make a &eglider&r as soon as you can.
'@
Q 'skyroot' 'Skyroot' 'aether_ii:skyroot_log*32' 'portal' 'xp:50' -desc 'The most common Aether tree. Skyroot planks make sticks, tools and a skyroot crafting table.'
Q 'skyroot_tools' 'Skyroot Tools' 'aether_ii:skyroot_pickaxe;aether_ii:skyroot_axe' 'skyroot' 'xp:25' -desc 'Your first Aether tools. Aether blocks drop extra items when mined with the right Aether tool.'
Q 'skyroot_bucket' 'Skyroot Bucket' 'aether_ii:skyroot_bucket' 'skyroot' 'xp:25' -opt -desc 'Iron is scarce up here. Skyroot buckets carry water and milk.'
Q 'holystone' 'Holystone' 'aether_ii:holystone*32' 'skyroot_tools' 'xp:25' -desc 'The Aether''s stone.'
Q 'holystone_tools' 'Holystone Tools' 'aether_ii:holystone_pickaxe;aether_ii:holystone_shortsword;aether_ii:holystone_furnace' 'holystone' 'xp:50' -desc 'Better tools, and a furnace that runs on Aether fuel.'
Q 'quicksoil' 'Quicksoil' 'aether_ii:quicksoil*16' 'portal' 'xp:25' -opt -desc 'Slippery sand found at the edges of islands. Smelt it into glass.'
Q 'ambrosium' 'Ambrosium' 'aether_ii:ambrosium_shard*16;aether_ii:ambrosium_torch*16' 'holystone' 'xp:50' -desc 'Ambrosium is the Aether''s fuel and light source. It can also heal you a little.'
Q 'bench' 'Artisan''s Bench' 'aether_ii:artisans_bench' 'skyroot' 'xp:25' -opt -desc 'Craft the many decorative Aether building blocks.'

# ===== Metals =====
Q 'zanite' 'Zanite' 'aether_ii:zanite_gemstone*16' 'holystone_tools' 'xp:100;table:sky' -desc 'A purple gemstone found in holystone. Zanite gear is the first big upgrade.'
Q 'zanite_tools' 'Zanite Tools' 'aether_ii:zanite_pickaxe;aether_ii:zanite_shortsword;aether_ii:zanite_axe' 'zanite' 'xp:100' -desc 'Zanite tools get stronger as they wear down.'
Q 'zanite_armor' 'Zanite Armor' 'aether_ii:zanite_helmet;aether_ii:zanite_chestplate;aether_ii:zanite_leggings;aether_ii:zanite_boots;aether_ii:zanite_gloves' 'zanite' 'xp:150;table:uncommon' -desc 'Do not forget the gloves! Gloves are an armor slot in the Aether.'
Q 'zanite_extra' 'Zanite Extras' 'aether_ii:zanite_shield;aether_ii:zanite_pendant' 'zanite_armor' 'xp:75' -opt -desc 'A shield and a pendant for extra protection.'
Q 'undershale' 'The Undershale' 'aether_ii:undershale*16' 'zanite_tools' 'xp:50' -desc 'Deep inside the islands lies a darker stone layer: the Undershale. The rarer ores are hidden there.'
Q 'arkenium' 'Arkenium' 'aether_ii:arkenium_plate*8;aether_ii:arkenium_forge' 'undershale' 'xp:150;table:sky' -size 1.5 -desc @'
&eArkenium&r ore lies in the Undershale. Process it into plates.

The &eArkenium Forge&r is where you upgrade and reinforce your gear.
'@
Q 'arkenium_gear' 'Arkenium Gear' 'aether_ii:arkenium_pickaxe;aether_ii:arkenium_chestplate' 'arkenium' 'xp:150' -desc 'Arkenium tools and armor.'
Q 'glint' 'Glint' 'aether_ii:glint_gemstone*4;aether_ii:glint_coin*16' 'undershale' 'xp:100;table:sky' -desc 'Glint is a precious gem. Glint coins are the currency of the Aether.'
Q 'gravitite' 'Gravitite' 'aether_ii:gravitite_plate*8' 'arkenium' 'xp:250;table:rare' -size 1.5 -desc 'The rarest Aether metal. It defies gravity!'
Q 'gravitite_tools' 'Gravitite Tools' 'aether_ii:gravitite_pickaxe;aether_ii:gravitite_shortsword;aether_ii:gravitite_hammer' 'gravitite' 'xp:250;table:rare' -desc 'Gravitite tools can make blocks float.'
Q 'gravitite_armor' 'Gravitite Armor' 'aether_ii:gravitite_helmet;aether_ii:gravitite_chestplate;aether_ii:gravitite_leggings;aether_ii:gravitite_boots;aether_ii:gravitite_gloves' 'gravitite' 'xp:400;table:epic' -size 1.5 -desc 'The best Aether armor. Wearing the full set lets you jump very high.'
Q 'corrobonite' 'Corrobonite' 'aether_ii:corrobonite_crystal*4' 'undershale' 'xp:100' -opt -desc 'A strange crystal from the deeper layers.'
Q 'weapons' 'Aether Weapons' 'aether_ii:zanite_pike;aether_ii:zanite_crossbow' 'zanite_tools' 'xp:100' -opt -desc 'The Aether has many weapon types: shortswords, pikes, hammers and crossbows. Each has its own strengths.'

# ===== Travel =====
Q 'clouds' 'Aerclouds' 'aether_ii:cold_aercloud*16;aether_ii:blue_aercloud*8' 'portal' 'xp:50' -desc 'Cold aerclouds stop your fall. Blue aerclouds bounce you high into the air. Golden aerclouds are rarer.'
Q 'cloudtwine' 'Cloudtwine' 'aether_ii:cloudtwine*8' 'clouds' 'xp:25' -desc 'String made from clouds.'
Q 'glider' 'Gliding' 'aether_ii:cold_aercloud_glider' 'cloudtwine' 'xp:100;table:sky' -desc 'Glide gently between islands. Never fall into the void again!'
Q 'glider2' 'Better Gliders' 'aether_ii:blue_aercloud_glider;aether_ii:golden_aercloud_glider' 'glider' 'xp:100' -opt -desc 'Other gliders have different abilities, like boosting upwards.'
Q 'skiff' 'Cloud Skiff' 'aether_ii:cloud_skiff' 'glider' 'xp:150' -desc 'A small flying boat for long trips.'

# ===== Food & creatures =====
Q 'food' 'Sky Food' 'aether_ii:blueberry*16;aether_ii:orange*8;aether_ii:wyndberry*8' 'skyroot' 'xp:50' -desc 'Blueberries, oranges and wyndberries grow on the islands.'
Q 'enchanted_food' 'Enchanted Fruit' 'aether_ii:enchanted_blueberry*4' 'food,altar' 'xp:50' -desc 'Enchant fruit at the Altar to make it much more filling.'
Q 'moa' 'Moa' 'kill:aether_ii:moa' 'food' 'xp:75' -icon 'aether_ii:moa_feather' -opt -desc 'Moas are big flightless birds. Wild moas can be hunted, but it is much nicer to raise your own.'
Q 'moa_rider' 'Moa Rider' 'aether_ii:moa_feed*8;aether_ii:moa_saddle' 'food' 'xp:150;table:sky' -desc 'Raise a moa from an egg, feed it, and saddle it. Some moas can even fly!'
Q 'aerbunny' 'Aerbunny' 'aether_ii:aerbunny_bell' 'portal' 'xp:50' -opt -desc 'Aerbunnies are fluffy floating rabbits. Pick one up and it will slow your fall.'
Q 'animals' 'Highland Wildlife' 'kill:aether_ii:highfields_taegore*3;kill:aether_ii:highfields_kirrid*3;kill:aether_ii:highfields_burrukai*3' 'holystone_tools' 'xp:150;table:sky' -icon 'aether_ii:taegore_steak' -desc 'Taegore, kirrid and burrukai roam the Highfields. Their meat and hides are valuable.'
Q 'pelts' 'Beast Pelts' 'aether_ii:beast_pelt*4;aether_ii:burrukai_plate*4' 'animals' 'xp:75' -desc 'Hides and plates for armor.'
Q 'swet' 'Swets' 'kill:aether_ii:blue_swet*5;aether_ii:swet_gel*8' 'portal' 'xp:75' -icon 'aether_ii:swet_gel' -desc 'Swets are slimy creatures. Their gel is used for sweets and medicine.'
Q 'healing' 'Healing Stone' 'aether_ii:healing_stone;aether_ii:bandage*4' 'swet' 'xp:75' -desc 'Heal yourself and cure poison and other status effects.'
Q 'antidote' 'Antidotes' 'aether_ii:antitoxin_vial;aether_ii:antivenom_vial' 'healing' 'xp:75' -opt -desc 'Some Aether creatures are toxic or venomous. Carry the cure!'
Q 'zephyr' 'Zephyr' 'kill:aether_ii:zephyr*3' 'clouds' 'xp:100' -icon 'aether_ii:zephyr_husk' -desc 'Cloud monsters that blow you off islands. Kill them before they push you into the void!'
Q 'cockatrice' 'Cockatrice' 'kill:aether_ii:cockatrice*3' 'zanite_armor' 'xp:150' -icon 'aether_ii:cockatrice_feather' -desc 'Dangerous predatory birds that come out at night. Their darts are toxic.'
Q 'skephid' 'Skephids' 'kill:aether_ii:skephid*5' 'zanite_armor' 'xp:150' -icon 'aether_ii:arkenium_chip' -desc 'Strange creatures of the deep places.'
Q 'aerwhale' 'Aerwhale' 'check' 'clouds' 'xp:50' -opt -icon 'aether_ii:blue_aercloud' -desc 'Look up! Giant aerwhales swim slowly through the sky. Do not hurt them, they are peaceful.'
Q 'mimic' 'Not a Chest' 'kill:aether_ii:mimic' 'outpost' 'xp:150;table:sky' -icon 'aether_ii:eye_of_the_mimic' -desc 'Some chests bite back...'

# ===== Magic & items =====
Q 'altar' 'Altar' 'aether_ii:altar' 'ambrosium' 'xp:75' -desc 'Use ambrosium to enchant special Aether items, food and tools.'
Q 'charm' 'Charms' 'aether_ii:charm_of_health_1;aether_ii:charm_of_damage_1' 'arkenium' 'xp:150' -desc 'Charms give permanent bonuses while equipped. There are charms for health, damage, defense, speed and more.'
Q 'charms_all' 'Charm Collector' 'aether_ii:charm_of_agility_1;aether_ii:charm_of_defense_1;aether_ii:charm_of_reach_1;aether_ii:charm_of_toughness_1' 'charm' 'xp:200;table:rare' -opt -desc 'Collect more charms.'
Q 'valkyrie_tea' 'Valkyrie Tea' 'aether_ii:valkyrie_tea' 'food' 'xp:50' -opt -desc 'A magical tea brewed from Valkyrie Sprouts.'
Q 'lasso' 'Lasso' 'aether_ii:lasso' 'cloudtwine' 'xp:50' -opt -desc 'Lead animals around.'
Q 'music' 'Sky Music' 'aether_ii:music_player' 'altar' 'xp:50' -opt -desc 'Play the Aether''s beautiful music discs.'

# ===== Exploration =====
Q 'outpost' 'Outpost' 'struct:aether_ii:outpost' 'portal' 'xp:100;table:sky' -icon 'aether_ii:outpost_campfire' -desc 'Small camps and outposts dot the islands. They are good places to rest and find supplies.'
Q 'camps' 'Camping Trip' 'struct:aether_ii:camp_highfields' 'outpost' 'xp:100' -icon 'aether_ii:outpost_campfire' -desc 'Find a camp in the Highfields.'
Q 'watchtower' 'Watchtower' 'struct:aether_ii:watchtower' 'outpost' 'xp:150;table:sky' -icon 'aether_ii:skyroot_beam' -desc 'Climb a watchtower for a great view of the islands.'
Q 'henge' 'Ancient Henge' 'struct:aether_ii:ancient_henge' 'portal' 'xp:150' -icon 'aether_ii:holystone_keystone' -desc 'A mysterious stone circle from long ago.'
Q 'ruins' 'Veradexian Ruins' 'struct:aether_ii:veradexian_ruins_temperate' 'henge' 'xp:200;table:sky' -icon 'aether_ii:veradexian_vase' -desc 'The ruins of an ancient Aether civilisation.'
Q 'library' 'Veradexian Library' 'struct:aether_ii:veradexian_library_temperate' 'ruins' 'xp:250;table:rare' -icon 'aether_ii:guidebook_page' -desc 'A ruined library full of knowledge.'
Q 'aqueduct' 'Veradexian Aqueduct' 'struct:aether_ii:veradexian_aqueduct' 'ruins' 'xp:200' -opt -icon 'aether_ii:holystone_flagstones' -desc 'An ancient aqueduct crossing the sky.'
Q 'brexallen' 'Brexallen Ruins' 'struct:aether_ii:brexallen_ruins' 'ruins' 'xp:200;table:sky' -icon 'aether_ii:brexallen_vase' -desc 'Another lost people left these ruins behind.'
Q 'sentry' 'Sentry Ruins' 'struct:aether_ii:sentry_ruins' 'arkenium' 'xp:250;table:rare' -icon 'aether_ii:sentry_servo' -desc 'Ruins guarded by ancient machines. Watch out for sentries!'
Q 'sentry_golem' 'Sentry Golem' 'kill:aether_ii:sentry_golem' 'sentry' 'xp:250;table:rare' -icon 'aether_ii:sentry_servo' -desc 'A guardian construct of the ancients.'
Q 'mineshaft' 'Undercloud Mineshaft' 'struct:aether_ii:undercloud_mineshaft' 'undershale' 'xp:200;table:sky' -icon 'aether_ii:arkenium_lantern' -desc 'Old mineshafts in the Undershale.'
Q 'guardian_tree' 'Guardian Tree' 'struct:aether_ii:infected_guardian_tree' 'biome_jungle' 'xp:300;table:rare' -icon 'aether_ii:guardian_log' -desc 'A huge, infected Guardian Tree in the contaminated lands.'
Q 'bunker' 'Irradiated Bunker' 'struct:aether_ii:irradiated_bunker_remnants' 'biome_jungle' 'xp:250;table:rare' -icon 'aether_ii:irradiated_dust' -desc 'What happened here?'
Q 'arctic_camp' 'Arctic Camp' 'struct:aether_ii:camp_arctic' 'biome_sierra' 'xp:150' -opt -icon 'aether_ii:arctic_snow_block' -desc 'A camp on the frozen peaks.'

# ===== Biomes =====
Q 'biome_highfields' 'Flourishing Fields' 'biome:aether_ii:flourishing_field' 'portal' 'xp:50' -icon 'aether_ii:aether_grass_block' -desc 'The gentle, flower-covered heart of the Highfields.'
Q 'biome_woods' 'Verdant Woods' 'biome:aether_ii:verdant_woods' 'biome_highfields' 'xp:50' -icon 'aether_ii:skyroot_sapling' -desc 'Thick skyroot forests.'
Q 'biome_shrouded' 'Shrouded Forest' 'biome:aether_ii:shrouded_forest' 'biome_woods' 'xp:75' -icon 'aether_ii:greatroot_log' -desc 'A dark, shadowy forest of greatroot trees.'
Q 'biome_violet' 'Violet Highwoods' 'biome:aether_ii:violet_highwoods' 'biome_woods' 'xp:75' -icon 'aether_ii:wisproot_log' -desc 'Tall purple-tinted woods.'
Q 'biome_magnetic' 'Magnetic Scar' 'biome:aether_ii:magnetic_scar' 'biome_shrouded' 'xp:100' -icon 'aether_ii:magnetic_shroom' -desc 'A strange, metallic landscape where magnets pull at your gear.'
Q 'biome_sierra' 'Frigid Sierra' 'biome:aether_ii:frigid_sierra' 'biome_magnetic' 'xp:100' -icon 'aether_ii:icestone' -desc 'Icy peaks high above the clouds. Bring warm clothes.'
Q 'biome_tundra' 'Sheer Tundra' 'biome:aether_ii:sheer_tundra' 'biome_sierra' 'xp:75' -icon 'aether_ii:arctic_snow_block' -desc 'Wide frozen plains.'
Q 'biome_jungle' 'Contaminated Jungle' 'biome:aether_ii:contaminated_jungle' 'biome_magnetic' 'xp:150;table:sky' -icon 'aether_ii:irradiated_dust' -desc 'Something has gone very wrong here. The land itself is sick.'
Q 'biome_swamp' 'Glistening Swamp' 'biome:aether_ii:glistening_swamp' 'biome_jungle' 'xp:100' -icon 'aether_ii:shimmering_silt' -desc 'A shimmering swamp.'
Q 'biome_battle' 'Battleground Wastes' 'biome:aether_ii:battleground_wastes' 'biome_jungle' 'xp:150' -icon 'aether_ii:arkenium_shortsword' -desc 'The scarred remains of an ancient battle.'
Q 'explorer' 'Highlands Explorer' 'check' 'biome_violet,biome_tundra,biome_swamp,biome_battle' 'lvl:15;table:rare' -size 1.5 -shape 'hexagon' -icon 'minecraft:filled_map' -desc 'You have visited every major region of the Highlands!'

# ===== Final =====
Q 'valkyrie' 'Valkyrie Wings' 'aether_ii:valkyrie_wings' 'gravitite_armor,explorer' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc 'Claim a pair of mighty &eValkyrie Wings&r. You are a true sky explorer!'
Q 'neptune' 'Neptune Armor' 'aether_ii:neptune_chestplate' 'gravitite' 'xp:300;table:epic' -opt -desc 'A rare armor set found deep in the Aether.'
