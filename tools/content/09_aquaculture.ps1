Chapter 'aquaculture' 'Aquaculture 2' 'aquaculture:iron_fishing_rod' 'explore' 'Rods, tackle, bait and dozens of fish from every biome.'

# ===== Gear =====
Q 'rod' 'Gone Fishing' 'aquaculture:iron_fishing_rod' '' 'xp:50;table:angler' -size 1.5 -shape 'gear' -sub 'A fish for every biome' -desc @'
&bAquaculture 2&r adds new fishing rods, tackle, and over 30 fish that each live in their own biomes.

Craft an &eIron Fishing Rod&r. Better rods last longer and can hold more tackle.

&6Tip:&r Every fish can be caught alive in a bucket, and most can be filleted for food.
'@
Q 'gold_rod' 'Gold Rod' 'aquaculture:gold_fishing_rod' 'rod' 'xp:50' -desc 'Gold rods are more enchantable.'
Q 'diamond_rod' 'Diamond Rod' 'aquaculture:diamond_fishing_rod' 'gold_rod' 'xp:100;table:uncommon' -desc 'A very durable rod.'
Q 'tackle_box' 'Tackle Box' 'aquaculture:tackle_box' 'rod' 'xp:50' -desc @'
Place your rod in the Tackle Box to change its:
- &eHook&r: special effects.
- &eBait&r: catch fish faster.
- &eFishing Line&r: colour.
- &eBobber&r: colour.
'@
Q 'line' 'Line & Bobber' 'aquaculture:fishing_line*2;aquaculture:bobber*2' 'tackle_box' 'xp:25' -desc 'Dye them for a personal touch.'
Q 'worms' 'Worms' 'aquaculture:worm*16' 'rod' 'xp:25' -desc 'Break dirt or grass and you will sometimes find worms. Bait makes fish bite faster.'
Q 'worm_farm' 'Worm Farm' 'aquaculture:worm_farm' 'worms' 'xp:75' -desc 'Feed it compostable items and it slowly produces worms. Never run out of bait!'
Q 'hooks' 'Hooks' 'aquaculture:iron_hook;aquaculture:gold_hook' 'tackle_box' 'xp:50;table:angler' -desc @'
- &eIron Hook&r: 20% chance not to use rod durability.
- &eGold Hook&r: more luck, for better catches.
'@
Q 'hooks2' 'Light & Heavy' 'aquaculture:light_hook;aquaculture:heavy_hook' 'hooks' 'xp:75' -desc 'A light hook casts further, a heavy hook casts shorter.'
Q 'double' 'Double Hook' 'aquaculture:double_hook' 'hooks2' 'xp:100' -desc 'Has a chance to catch two things at once!'
Q 'special_hooks' 'Special Hooks' 'aquaculture:redstone_hook;aquaculture:note_hook' 'hooks' 'xp:75' -opt -desc 'The redstone hook gives you more time to reel in a fish. The note hook plays an alert when a fish is approaching.'
Q 'diamond_hook' 'Diamond Hook' 'aquaculture:diamond_hook' 'hooks2' 'xp:150;table:rare' -desc 'One of the best hooks: a 50% chance not to use rod durability.'
Q 'star_hook' 'Nether Star Hook' 'aquaculture:nether_star_hook' 'diamond_hook' 'xp:300;table:epic' -desc 'The ultimate hook: a 50% chance not to use rod durability and more luck. It needs a Nether Star.'

# ===== Food =====
Q 'knife' 'Fillet Knife' 'aquaculture:iron_fillet_knife' 'rod' 'xp:25' -desc 'Right-click a fish in your hand (or craft it) to fillet it into more food.'
Q 'fillet' 'Fish Fillets' 'aquaculture:fish_fillet_cooked*16' 'knife' 'xp:50' -desc 'Cook the fillets for a filling meal.'
Q 'sushi' 'Sushi' 'aquaculture:sushi*8' 'fillet,algae' 'xp:50' -desc 'Fillets wrapped in algae. Delicious!'
Q 'turtle_soup' 'Turtle Soup' 'aquaculture:turtle_soup' 'turtles' 'xp:50' -opt -desc 'A hearty soup.'
Q 'algae' 'Algae' 'aquaculture:algae*8' 'rod' 'xp:25' -desc 'Algae grows in swamps and can be fished up.'
Q 'better_knife' 'Neptunium Knife' 'aquaculture:neptunium_fillet_knife' 'neptunium,knife' 'xp:100' -opt -desc 'The best fillet knife gives the most fillets.'

# ===== Fish by biome =====
Q 'freshwater' 'Freshwater Fish' 'aquaculture:smallmouth_bass;aquaculture:bluegill;aquaculture:brown_trout;aquaculture:perch' 'rod' 'xp:100;table:angler' -size 1.5 -desc 'Common fish of temperate rivers and lakes (plains, forests).'
Q 'carp' 'Carp & Minnow' 'aquaculture:carp;aquaculture:minnow' 'freshwater' 'xp:50' -desc 'Also found in temperate waters. Minnows make great bait for bigger fish.'
Q 'cold_rivers' 'Cold Waters' 'aquaculture:rainbow_trout;aquaculture:blackfish' 'freshwater' 'xp:75' -desc 'Blackfish only bite in &ecold oceans&r and on &ecold beaches&r. Rainbow trout live there too, and also in rivers outside hot biomes.'
Q 'pike' 'Muskellunge' 'aquaculture:muskellunge' 'cold_rivers' 'xp:100' -desc 'A big, rare predatory fish of rivers and lakes. It bites in fresh water anywhere except hot biomes, deserts and jungles.'
Q 'ocean' 'Ocean Fish' 'aquaculture:atlantic_cod;aquaculture:atlantic_herring;aquaculture:pollock' 'freshwater' 'xp:100;table:angler' -desc 'Atlantic herring bite in any ocean that is not hot. Atlantic cod and pollock only bite in &ecold oceans&r and on cold beaches.'
Q 'halibut' 'Halibut' 'aquaculture:atlantic_halibut;aquaculture:pacific_halibut' 'ocean' 'xp:100' -desc 'Big flat fish. Atlantic halibut bite in oceans and on beaches that are not hot; Pacific halibut only in &ecold oceans&r and on cold beaches.'
Q 'salmon' 'Pink Salmon' 'aquaculture:pink_salmon' 'cold_rivers' 'xp:75' -desc 'Found in cold waters: cold rivers, beaches and oceans.'
Q 'warm' 'Big Ocean Fish' 'aquaculture:red_grouper;aquaculture:tuna' 'ocean' 'xp:100' -desc 'Red grouper and tuna bite in &eany ocean&r and on beaches. Tuna are rare, so keep at it!'
Q 'jelly' 'Jellyfish' 'aquaculture:jellyfish' 'warm' 'xp:50' -desc 'Not really a fish, but it counts! Jellyfish can be caught in any ocean or on a beach.'
Q 'jungle' 'Jungle Rivers' 'aquaculture:piranha;aquaculture:arapaima;aquaculture:tambaqui' 'freshwater' 'xp:150;table:angler' -desc 'Jungle rivers and lakes. Watch your fingers!'
Q 'swamp' 'Lake Fish' 'aquaculture:gar;aquaculture:catfish;aquaculture:largemouth_bass' 'freshwater' 'xp:150' -desc 'Bigger freshwater fish of rivers, lakes and swamps. They do not bite in deserts, snowy biomes or jungles, and largemouth bass also avoid cold biomes. Catfish are rare.'
Q 'leech' 'Swamp Dwellers' 'aquaculture:leech' 'freshwater' 'xp:100' -desc 'The &eLeech&r (and the Box Turtle) can only be fished in &eswamps&r.'
Q 'savanna' 'African Waters' 'aquaculture:boulti;aquaculture:bayad;aquaculture:synodontis;aquaculture:capitaine' 'freshwater' 'xp:150;table:angler' -desc 'These fish live in savanna and desert rivers and lakes.'
Q 'mushroom' 'Shroomas' 'aquaculture:red_shrooma;aquaculture:brown_shrooma' 'freshwater' 'xp:200;table:rare' -desc 'These strange fungal fish live around mushroom islands. Finding one is the hard part!'
Q 'turtles' 'Turtles' 'aquaculture:box_turtle;aquaculture:arrau_turtle;aquaculture:starshell_turtle' 'leech,jungle,twilight/portal' 'xp:200;table:rare' -desc 'Box turtles are fished in swamps, arrau turtles in jungles, and starshell turtles in &2The Twilight Forest&r. All three are rare.'
Q 'goldfish' 'Goldfish' 'aquaculture:goldfish' 'junk' 'xp:250;table:rare' -size 1.5 -desc 'Goldfish are not caught like normal fish: they turn up as &ejunk&r, in any biome. Keep fishing! A goldfish can be crafted into a gold nugget, or shown off in a fish mount.'
Q 'bucket' 'Catch and Release' 'aquaculture:bluegill_bucket' 'freshwater' 'xp:50' -opt -desc 'Scoop a live fish into a bucket. Put it in an aquarium!'
Q 'mount' 'Fish Mount' 'aquaculture:fish_mount*2' 'goldfish' 'xp:75' -desc 'Show off your best catches on the wall.'
Q 'all_fish' 'Master Angler' 'check' 'carp,pike,halibut,salmon,jelly,mushroom,turtles,goldfish,warm,swamp,leech,savanna' 'lvl:20;table:epic' -size 1.5 -shape 'hexagon' -icon 'aquaculture:goldfish' -desc 'You have caught every type of fish. A true Master Angler!'

# ===== Junk & treasure =====
Q 'junk' 'Junk' 'aquaculture:driftwood;aquaculture:tin_can;aquaculture:fish_bones' 'rod' 'xp:50' -desc 'Not everything you catch is a fish. Some junk can be crafted into useful things.'
Q 'bottle' 'Message in a Bottle' 'aquaculture:message_in_a_bottle' 'junk' 'xp:50' -desc 'Read it! Who sent this?'
Q 'boxes' 'Boxes' 'aquaculture:box;aquaculture:lockbox' 'junk' 'xp:100;table:angler' -desc 'Boxes found while fishing hold loot. Right-click them to open.'
Q 'treasure' 'Treasure Chest' 'aquaculture:treasure_chest' 'boxes' 'xp:200;table:rare' -desc 'A rare catch with great loot inside.'
Q 'neptunes' 'Neptune''s Bounty' 'aquaculture:neptunes_bounty' 'treasure' 'xp:250;table:rare' -desc 'The rarest catch of all. It holds &bNeptunium&r!'
Q 'neptunium' 'Neptunium' 'aquaculture:neptunium_ingot*8' 'neptunes' 'xp:250;table:epic' -size 1.5 -desc 'A sea metal used for powerful gear.'
Q 'nep_rod' 'Neptunium Rod' 'aquaculture:neptunium_fishing_rod' 'neptunium,diamond_hook' 'xp:300;table:epic' -size 1.5 -shape 'gear' -desc 'The best fishing rod in the game.'
Q 'nep_tools' 'Neptunium Tools' 'aquaculture:neptunium_pickaxe;aquaculture:neptunium_sword;aquaculture:neptunium_axe' 'neptunium' 'xp:200' -desc 'Strong tools that work well underwater.'
Q 'nep_bow' 'Neptunium Bow' 'aquaculture:neptunium_bow' 'neptunium' 'xp:150' -opt -desc 'Fires arrows that fly straight underwater.'
Q 'nep_armor' 'Neptunium Armor' 'aquaculture:neptunium_helmet;aquaculture:neptunium_chestplate;aquaculture:neptunium_leggings;aquaculture:neptunium_boots' 'neptunium' 'xp:300;table:epic' -desc 'Breathe and move freely underwater.'
