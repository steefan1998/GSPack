Chapter 'utilities' 'Utilities' 'tiab:time_in_a_bottle' 'tech' 'Handy gadgets: time bottles, pylons, mob plates and energy meters.'

# ===== Gadgets =====
Q 'tiab' 'Time in a Bottle' 'tiab:time_in_a_bottle' '' 'xp:100;table:uncommon' -size 1.5 -shape 'gear' -sub 'Time is on your side' -desc @'
The &eTime in a Bottle&r stores up time while it sits in your inventory (its tooltip shows how much).

Right-click a machine, crop or other ticking block to spend that time and make it run faster for a while.
'@
Q 'energy_meter' 'Energy Meter' 'energymeter:meter' 'tiab' 'xp:50' -desc 'Place it between two cables to measure how much energy flows through. Open its built-in guide for all the settings.'

# ===== Pylons =====
Q 'harvester' 'Harvester Pylon' 'pylons:harvester_pylon' 'tiab' 'xp:100;table:tech' -desc @'
Harvests crops in a range around it (3x3 up to 9x9 blocks) and puts the harvest in an inventory above it.

Place the pylon in the water block of your farm.
'@
Q 'infusion' 'Infusion Pylon' 'pylons:infusion_pylon;pylons:potion_filter' 'harvester' 'xp:150;table:rare' -desc 'Gives you the effects of activated &ePotion Filters&r from any distance. By default it also keeps its own chunk loaded.'
Q 'interdiction' 'Interdiction Pylon' 'pylons:interdiction_pylon;pylons:mob_filter' 'harvester' 'xp:100' -desc 'Stops the mobs in its &eMob Filters&r from spawning in a range of 1x1 up to 5x5 chunks.'
Q 'expulsion' 'Expulsion Pylon' 'pylons:expulsion_pylon' 'harvester' 'xp:100' -opt -desc 'Keeps other players out of a range of 1x1 up to 5x5 chunks. Allow friends in with a &ePlayer Filter&r.'

# ===== Dark Utilities =====
Q 'vector' 'Vector Plates' 'darkutils:vector_plate*4' 'tiab' 'xp:50' -desc 'Plates that push mobs around. Faster versions push harder. Use them to move mobs into your farm.'
Q 'damage' 'Damage Plates' 'darkutils:damage_plate*4' 'vector' 'xp:75' -desc 'Hurts anything that walks on it. The Smite and Bane plates do extra damage to undead and arthropods.'
Q 'filters' 'Mob Filters' 'darkutils:filter_hostile;darkutils:filter_player' 'vector' 'xp:75' -desc 'Blocks that only certain mobs can pass through, for example only hostile mobs or only players. Perfect for mob farms.'
