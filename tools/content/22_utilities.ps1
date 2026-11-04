Chapter 'utilities' 'Utilities' 'tiab:time_in_a_bottle' 'tech' 'Handy gadgets: time bottles, pylons, mob plates and energy meters.'
Q 'start' 'Choose Your Utility' 'check' '' 'xp:25' -icon 'minecraft:compass' -desc 'Pick the mod category you need. Time in a Bottle, Energy Meter, Pylons, Dark Utilities, Potions Master, Compasses, Waystones and Simple Magnets are independent branches.'


# ===== Gadgets =====
Q 'tiab' 'Time in a Bottle' 'tiab:time_in_a_bottle' 'start' 'xp:100;table:uncommon' -size 1.5 -shape 'gear' -sub 'Time is on your side' -desc @'
The &eTime in a Bottle&r stores up time while it sits in your inventory (its tooltip shows how much).

Right-click a machine, crop or other ticking block to spend that time and make it run faster for a while.
'@
Q 'energy_meter' 'Energy Meter' 'energymeter:meter' 'start' 'xp:50' -desc 'Place it between two cables to measure how much energy flows through. Open its built-in guide for all the settings.'

# ===== Pylons =====
Q 'harvester' 'Harvester Pylon' 'pylons:harvester_pylon' 'start' 'xp:100;table:tech' -desc @'
Harvests crops in a range around it (3x3 up to 9x9 blocks) and puts the harvest in an inventory above it.

Place the pylon in the water block of your farm.
'@
Q 'infusion' 'Infusion Pylon' 'pylons:infusion_pylon;pylons:potion_filter' 'harvester' 'xp:150;table:rare' -desc 'Gives you the effects of activated &ePotion Filters&r from any distance. By default it also keeps its own chunk loaded.'
Q 'interdiction' 'Interdiction Pylon' 'pylons:interdiction_pylon;pylons:mob_filter' 'harvester' 'xp:100' -desc 'Stops the mobs in its &eMob Filters&r from spawning in a range of 1x1 up to 5x5 chunks.'
Q 'expulsion' 'Expulsion Pylon' 'pylons:expulsion_pylon' 'harvester' 'xp:100' -opt -desc 'Keeps other players out of a range of 1x1 up to 5x5 chunks. Allow friends in with a &ePlayer Filter&r.'

# ===== Dark Utilities =====
Q 'vector' 'Vector Plates' 'darkutils:vector_plate*4' 'start' 'xp:50' -desc 'Plates that push mobs around. Faster versions push harder. Use them to move mobs into your farm.'
Q 'damage' 'Damage Plates' 'darkutils:damage_plate*4' 'vector' 'xp:75' -desc 'Hurts anything that walks on it. The Smite and Bane plates do extra damage to undead and arthropods.'
Q 'filters' 'Mob Filters' 'darkutils:filter_hostile;darkutils:filter_player' 'vector' 'xp:75' -desc 'Blocks that only certain mobs can pass through, for example only hostile mobs or only players. Perfect for mob farms.'

# ===== Potions Master =====
Q 'pm_mortar' 'Mortar & Pestle' 'potionsmaster:tile_mortar;potionsmaster:pestle' 'start' 'xp:50' -desc 'The tools of &bPotions Master&r: grind ingredients into powders. Ender Powder, for example, is an Ender Pearl ground with the Pestle in the Mortar.'
Q 'pm_cures' 'Remedies' 'potionsmaster:bezoar;potionsmaster:activated_charcoal' 'pm_mortar' 'xp:100;table:uncommon' -desc @'
Potions Master adds items that cure bad effects:
- &eBezoar&r: cures Poison.
- &eActivated Charcoal&r: cures Wither.
- &ePolar Bear Gall Bladder&r: cures Mining Fatigue.

Check JEI for how to get each one.
'@
Q 'pm_bladder' 'Gall Bladder' 'potionsmaster:gallbladder' 'pm_cures' 'xp:75' -opt -desc 'Cures Mining Fatigue. Very useful against Elder Guardians in ocean monuments.'

Q 'compass' 'Natures Compass' 'naturescompass:naturescompass' 'start' 'xp:50' -desc 'Search for biomes. Open the compass interface and select a biome.'
Q 'structures' 'Explorers Compass' 'explorerscompass:explorerscompass' 'compass' 'xp:50' -opt -desc 'Search for supported structures. Search range and availability depend on the installed configuration.'
Q 'waystone' 'Waystone Network' 'waystones:andesite_waystone' 'start' 'xp:50' -desc 'Activate waystones and give them useful names. Teleport costs depend on the server settings.'
Q 'warpstone' 'Portable Warp Stone' 'waystones:warp_stone' 'waystone' 'xp:50' -desc 'Use a Warp Stone to access your available waystones. GSPack may change the recipe.'
Q 'warpscroll' 'Warp Scrolls' 'waystones:warp_scroll*3' 'waystone' 'xp:50' -opt -desc 'Prepare consumable scrolls for travel.'
Q 'warpplate' 'Warp Plates' 'waystones:warp_plate' 'waystone' 'xp:50' -opt -desc 'Consult the Waystones interface and JEI for linking and transport setup.'
Q 'magnet' 'Basic Magnet' 'simplemagnets:basicmagnet' 'start' 'xp:50' -desc 'Toggle the magnet to collect nearby dropped items. Respect other players and farms.'
Q 'advanced_magnet' 'Advanced Magnet' 'simplemagnets:advancedmagnet' 'magnet' 'xp:50' -desc 'Use the stronger magnet and configure its filtering options.'
Q 'demagnetizer' 'Keep Drops in Place' 'simplemagnets:basic_demagnetization_coil' 'magnet' 'xp:50' -opt -desc 'Place a demagnetization coil near systems where items should stay on the ground.'
