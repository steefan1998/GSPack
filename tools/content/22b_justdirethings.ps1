Chapter 'justdirethings' 'Just Dire Things' 'justdirethings:gooblock_tier1' 'tech' 'Living goo, four new metals, time crystals, portal guns and handy machines.'

# ===== Goo =====
Q 'goo1' 'Primogel Goo' 'justdirethings:gooblock_tier1' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'It is alive!' -desc @'
&bJust Dire Things&r starts with &eGoo&r: a living block that slowly turns the blocks next to it into something new.

Craft &ePrimogel Goo&r from clay, sugar, rotten flesh and dirt. Place it, put the right block against it and wait. Used goo can become &eExhausted&r. JEI shows every conversion under &eGoo Spreading Recipes&r.

Every tier of goo can transform better blocks.
'@
Q 'goo2' 'Blazebloom Goo' 'justdirethings:gooblock_tier2' 'goo1' 'xp:75' -desc 'Tier 2 goo, upgraded with blaze powder, redstone and nether wart.'
Q 'goo3' 'VoidShimmer Goo' 'justdirethings:gooblock_tier3' 'goo2' 'xp:100;table:uncommon' -desc 'Tier 3 goo, upgraded with ender pearls, end stone and dragon''s breath.'
Q 'goo4' 'Shadowpulse Goo' 'justdirethings:gooblock_tier4' 'goo3' 'xp:150;table:rare' -desc 'Tier 4 goo, upgraded with sculk, a sculk shrieker and echo shards from the Deep Dark.'
Q 'goo_soil' 'Goo Soil' 'justdirethings:goosoil_tier1' 'goo1' 'xp:50' -opt -desc 'Farmland made from goo: crops on it grow faster. Every goo tier has its own soil.'

# ===== Ferricore =====
Q 'ferricore_ore' 'Ferricore' 'justdirethings:raw_ferricore' 'goo1' 'xp:75' -desc 'Primogel Goo (or better) turns an &eiron block&r into Raw Ferricore Ore. Mine it for Raw Ferricore.'
Q 'ferricore_ingot' 'Ferricore Ingot' 'justdirethings:ferricore_ingot*8' 'ferricore_ore' 'xp:75' -desc 'Smelt the raw ferricore. Ferricore Seeds (Seed Codex) can grow it too.'
Q 'ferricore_tools' 'Ferricore Tools' 'justdirethings:ferricore_pickaxe;justdirethings:ferricore_sword' 'ferricore_ingot' 'xp:75' -desc 'Your first Just Dire Things tools. They can hold &eability upgrades&r.'
Q 'ferricore_armor' 'Ferricore Armor' 'justdirethings:ferricore_helmet;justdirethings:ferricore_chestplate;justdirethings:ferricore_leggings;justdirethings:ferricore_boots' 'ferricore_ingot' 'xp:100' -opt -desc 'A full set of Ferricore armor.'
Q 'wrench' 'Ferricore Wrench' 'justdirethings:ferricore_wrench' 'ferricore_ingot' 'xp:50' -opt -desc 'Rotates blocks and picks up Just Dire Things machines.'
Q 'pocket_gen' 'Pocket Generator' 'justdirethings:pocket_generator' 'ferricore_ingot' 'xp:75' -desc 'Burns fuel in your inventory to charge the powered tools you carry.'

# ===== Blazegold =====
Q 'blazegold_ore' 'Blazegold' 'justdirethings:raw_blazegold' 'goo2' 'xp:100' -desc 'Blazebloom Goo (or better) turns a &egold block&r into Raw Blazegold Ore.'
Q 'blazegold_ingot' 'Blazegold Ingot' 'justdirethings:blazegold_ingot*8' 'blazegold_ore' 'xp:100;table:uncommon' -desc 'Smelt the raw blazegold. Blazegold Seeds (Seed Codex) can grow it too.'
Q 'blazegold_tools' 'Blazegold Tools' 'justdirethings:blazegold_pickaxe;justdirethings:blazegold_sword' 'blazegold_ingot,ferricore_tools' 'xp:100' -desc 'Upgrade Ferricore tools with a &eBlazegold Template&r in a Smithing Table, or craft them new. They hold more abilities.'
Q 'blazegold_armor' 'Blazegold Armor' 'justdirethings:blazegold_helmet;justdirethings:blazegold_chestplate;justdirethings:blazegold_leggings;justdirethings:blazegold_boots' 'blazegold_ingot' 'xp:150' -opt -desc 'Fire-proof armor with room for movement upgrades.'
Q 'portalgun' 'Portal Gun' 'justdirethings:portalgun' 'blazegold_ingot' 'xp:150;table:uncommon' -desc 'Shoot two portals and walk between them. Made from blazegold and an eye of ender.'

# ===== Celestigem =====
Q 'celestigem' 'Celestigem' 'justdirethings:celestigem*8' 'goo3' 'xp:150;table:rare' -desc 'VoidShimmer Goo (or better) turns a &ediamond block&r into Raw Celestigem Ore. Celestigem Seeds (Seed Codex) can grow it too.'
Q 'celestigem_tools' 'Celestigem Tools' 'justdirethings:celestigem_pickaxe;justdirethings:celestigem_paxel' 'celestigem,blazegold_tools' 'xp:150' -desc 'Even better tools, including a &ePaxel&r (pickaxe, axe and shovel in one).'
Q 'celestigem_armor' 'Celestigem Armor' 'justdirethings:celestigem_helmet;justdirethings:celestigem_chestplate;justdirethings:celestigem_leggings;justdirethings:celestigem_boots' 'celestigem' 'xp:200' -opt -desc 'Armor that can even hold a flight upgrade.'

# ===== Eclipse Alloy =====
Q 'eclipse_ore' 'Eclipse Alloy' 'justdirethings:raw_eclipsealloy' 'goo4' 'xp:200;table:rare' -desc 'Shadowpulse Goo turns a &enetherite block&r into Raw Eclipse Alloy Ore.'
Q 'eclipse_ingot' 'Eclipse Alloy Ingot' 'justdirethings:eclipsealloy_ingot*4' 'eclipse_ore' 'xp:200;table:epic' -size 1.5 -shape 'hexagon' -desc 'The best metal in Just Dire Things. Eclipse Alloy Seeds (Seed Codex) can grow it too.'
Q 'eclipse_tools' 'Eclipse Alloy Tools' 'justdirethings:eclipsealloy_pickaxe;justdirethings:eclipsealloy_paxel' 'eclipse_ingot,celestigem_tools' 'xp:250;table:epic' -desc 'The strongest tools, with room for every ability.'
Q 'eclipse_armor' 'Eclipse Alloy Armor' 'justdirethings:eclipsealloy_helmet;justdirethings:eclipsealloy_chestplate;justdirethings:eclipsealloy_leggings;justdirethings:eclipsealloy_boots' 'eclipse_ingot' 'xp:300;table:epic' -desc 'The best armor in Just Dire Things.'

# ===== Fuel & fluids =====
Q 'coal1' 'Better Coal' 'justdirethings:coal_t1*16' 'goo1' 'xp:50' -desc 'Goo turns coal (or charcoal) blocks into &eCoal T1&r ore. Its coal burns longer, and every goo tier upgrades it further.'
Q 'coal4' 'Coal T4' 'justdirethings:coal_t4*8' 'coal1,goo4' 'xp:150' -opt -desc 'The best fuel: each tier of coal block is upgraded by the next goo tier.'
Q 'polymorphic' 'Polymorphic Fluid' 'justdirethings:polymorphic_fluid_bucket' 'goo2' 'xp:100' -desc 'Drop a &ePolymorphic Catalyst&r into still water to turn it into Polymorphic Fluid. It is the base of every other Just Dire Things fluid.'
Q 'fuel_fluid' 'Refined Fuel' 'justdirethings:refined_t2_fluid_bucket' 'polymorphic,coal1' 'xp:100' -desc 'Drop Coal T2 into Polymorphic Fluid for unrefined fuel, then let goo refine it. Higher coal tiers make better fuel.'
Q 'fluid_gen' 'Fluid Generator' 'justdirethings:generatorfluidt1' 'fuel_fluid' 'xp:100' -desc 'Burns refined fuel for power.'
Q 'time_crystal' 'Time Crystal' 'justdirethings:time_crystal*4' 'polymorphic' 'xp:150;table:rare' -size 1.5 -desc 'Time Crystals grow from a budding block, like amethyst. Check JEI for how to get the first one.'
Q 'time_fluid' 'Time Fluid' 'justdirethings:time_fluid_bucket' 'time_crystal' 'xp:150' -desc 'Drop a Time Crystal into Polymorphic Fluid.'
Q 'time_wand' 'Time Wand' 'justdirethings:time_wand' 'time_crystal,blazegold_ingot' 'xp:150;table:rare' -desc 'Speeds up the block you point it at, using Time Fluid.'
Q 'portal_fluid' 'Portal Fluid' 'justdirethings:portal_fluid_bucket' 'polymorphic,goo3' 'xp:150' -opt -desc 'Drop a Portal Fluid Catalyst into Polymorphic Fluid, then let VoidShimmer Goo stabilise it. Upgrades the Portal Gun.'
Q 'paradox' 'Paradox Machine' 'justdirethings:paradoxmachine' 'time_fluid,eclipse_ingot' 'lvl:20;table:epic' -size 1.5 -shape 'gear' -desc 'Saves an area and can restore it later. The final machine of Just Dire Things.'

# ===== Machines =====
Q 'generator' 'Coal Generator' 'justdirethings:generatort1' 'ferricore_ingot' 'xp:75' -desc 'Burns coal for Forge Energy. Better coal tiers give more power.'
Q 'breaker' 'Block Breaker' 'justdirethings:blockbreakert1' 'ferricore_ingot' 'xp:75' -desc 'Breaks the block in front of it. The tier 2 versions use power and can work on an area.'
Q 'placer' 'Block Placer' 'justdirethings:blockplacert1' 'ferricore_ingot' 'xp:75' -desc 'Places blocks in front of it.'
Q 'clicker' 'Clicker' 'justdirethings:clickert1' 'ferricore_ingot' 'xp:75' -desc 'Right- or left-clicks like a player.'
Q 'sensor' 'Sensor' 'justdirethings:sensort1' 'ferricore_ingot' 'xp:75' -desc 'Gives a redstone signal when it sees a certain block or entity.'
Q 'item_collector' 'Item Collector' 'justdirethings:itemcollector' 'ferricore_ingot' 'xp:50' -desc 'Picks up items around it.'
Q 'fluid_machines' 'Fluid Machines' 'justdirethings:fluidcollectort1;justdirethings:fluidplacert1' 'ferricore_ingot' 'xp:75' -opt -desc 'Pick up and place fluids automatically.'
Q 'tier2_machines' 'Powered Machines' 'justdirethings:blockbreakert2;justdirethings:blockplacert2' 'breaker,placer,blazegold_ingot' 'xp:150;table:uncommon' -desc 'Tier 2 machines run on power, work faster and can be set to an area.'
Q 'energy_transmitter' 'Energy Transmitter' 'justdirethings:energytransmitter' 'generator,blazegold_ingot' 'xp:100' -desc 'Sends power wirelessly to machines around it.'
Q 'xp_holder' 'Experience Holder' 'justdirethings:experienceholder' 'ferricore_ingot' 'xp:100' -opt -desc 'Stores experience, and can collect it from the ground.'

# ===== Abilities =====
Q 'upgrade_blank' 'Blank Upgrade' 'justdirethings:upgrade_blank' 'ferricore_tools' 'xp:50' -desc @'
Just Dire Things tools and armor get &eabilities&r from upgrades. Each upgrade starts as a &eBlank Upgrade&r.

Combine a tool with an upgrade to unlock that ability (check JEI for each one). Better metals unlock more abilities.
'@
Q 'upgrade_mining' 'Mining Abilities' 'justdirethings:upgrade_oreminer;justdirethings:upgrade_hammer' 'upgrade_blank' 'xp:100' -desc 'Ore Miner mines a whole vein (from Ferricore), Hammer mines a 3x3 area (from Blazegold).'
Q 'upgrade_smelter' 'Auto Smelt' 'justdirethings:upgrade_smelter' 'upgrade_blank' 'xp:75' -opt -desc 'Smelts what you mine.'
Q 'upgrade_treefeller' 'Tree Feller' 'justdirethings:upgrade_treefeller' 'upgrade_blank' 'xp:75' -opt -desc 'Chops down a whole tree at once.'
Q 'upgrade_move' 'Movement Abilities' 'justdirethings:upgrade_walkspeed;justdirethings:upgrade_jumpboost;justdirethings:upgrade_stepheight' 'upgrade_blank' 'xp:100' -opt -desc 'For leggings and boots: walk faster, jump higher and step up full blocks.'
Q 'upgrade_flight' 'Flight' 'justdirethings:upgrade_flight' 'upgrade_move,eclipse_ingot' 'xp:200;table:rare' -desc 'Creative-style flight for an Eclipse Alloy chestplate.'
Q 'upgrade_protection' 'Death Protection' 'justdirethings:upgrade_deathprotection' 'upgrade_blank,eclipse_ingot' 'xp:200;table:epic' -opt -desc 'Saves you from dying once in a while. Eclipse Alloy chestplate only.'

# ===== Wands =====
Q 'voidshift' 'Voidshift Wand' 'justdirethings:voidshift_wand' 'goo3' 'xp:100' -desc 'Walk through walls: shift a few blocks through solid ground.'
Q 'polymorphic_wand' 'Polymorphic Wand' 'justdirethings:polymorphic_wand' 'polymorphic' 'xp:100' -opt -desc 'Swaps blocks in the world for other blocks, like a building gadget.'
Q 'blazejet' 'Blazejet Wand' 'justdirethings:blazejet_wand' 'blazegold_ingot' 'xp:100' -opt -desc 'Launches you forward in a burst of fire.'
Q 'eclipsegate' 'Eclipse Gate Wand' 'justdirethings:eclipsegate_wand' 'eclipse_ingot' 'xp:150' -opt -desc 'Temporarily removes blocks to open a passage, then puts them back.'
Q 'creature_catcher' 'Creature Catcher' 'justdirethings:creaturecatcher' 'ferricore_ingot' 'xp:75' -opt -desc 'Catch a mob and release it somewhere else.'
Q 'totem' 'Totem of Death Recall' 'justdirethings:totem_of_death_recall' 'blazegold_ingot' 'xp:100' -opt -desc 'Takes you back to where you last died.'
