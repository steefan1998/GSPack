Chapter 'tinkers' 'Tinkers'' Construct' 'tconstruct:smeltery_controller' 'tech' 'Melt metals, cast parts and build tools that grow with you.'

# ===== Getting started =====
Q 'book' 'Materials and You' 'tconstruct:materials_and_you' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'Tinkers'' Construct (Continuum Construct)' -desc @'
&bTinkers' Construct&r (here as &bContinuum Construct&r) lets you build tools from parts. Every material gives different stats and &etraits&r.

The guide books explain everything:
- &eMaterials and You&r: tools and materials.
- &ePuny Smelting&r: the Smeltery.
- &eMighty Smelting&r: alloys and advanced smelting.
- &eFantastic Foundry&r: the Foundry.
- &eTinkers' Gadgetry&r: gadgets and extras.

Craft &eMaterials and You&r from a &eBook&r and a &ePattern&r. In GSPack you don't get it automatically when you join a world.
'@
Q 'books' 'The Library' 'tconstruct:puny_smelting;tconstruct:mighty_smelting;tconstruct:fantastic_foundry;tconstruct:tinkers_gadgetry' 'book' 'xp:50' -opt -desc 'Collect all the guide books.'
Q 'pattern' 'Patterns' 'tconstruct:pattern*8' 'book' 'xp:25' -desc 'Blank patterns are made from planks and sticks. The Part Builder uses them to make tool parts.'
Q 'part_builder' 'Part Builder' 'tconstruct:part_builder' 'pattern' 'xp:50' -desc 'Make tool parts from wood, stone, flint, bone and other simple materials.'
Q 'tinker_station' 'Tinker Station' 'tconstruct:tinker_station' 'part_builder' 'xp:50' -desc 'Put parts together into tools here, and add modifiers.'
Q 'first_tool' 'First Tinker Tool' 'tconstruct:pickaxe' 'tinker_station' 'xp:75;table:common' -desc 'Build a pickaxe from parts. Try different heads, handles and bindings to see how the stats change.'
Q 'crafting_station' 'Crafting Station' 'tconstruct:crafting_station' 'book' 'xp:25' -opt -desc 'A crafting table that remembers its contents and connects to nearby chests.'

# ===== The Smeltery =====
Q 'grout' 'Grout' 'tconstruct:grout*16' '' 'xp:50' -size 1.5 -desc 'Sand, gravel and clay. Smelt it into &eSeared Bricks&r.'
Q 'seared' 'Seared Bricks' 'tconstruct:seared_brick*32' 'grout' 'xp:50' -desc 'The building blocks of the Smeltery.'
Q 'melter' 'Seared Melter' 'tconstruct:seared_melter;tconstruct:seared_heater' 'seared' 'xp:75' -desc 'A small melter for early game. It melts ores and metals into molten metal. Put it on a heater (or lava tank).'
Q 'casting' 'Casting' 'tconstruct:seared_table;tconstruct:seared_basin;tconstruct:seared_faucet' 'melter' 'xp:75' -desc @'
Pour molten metal from a faucet into a &eCasting Table&r (with a cast) or a &eCasting Basin&r (for blocks).

Right-click the faucet to start pouring.
'@
Q 'casts' 'Casts' 'tconstruct:ingot_cast;tconstruct:pick_head_cast' 'casting' 'xp:50' -desc 'Cast a tool part in gold to make a reusable cast for it. Sand casts are cheap, single-use casts.'
Q 'smeltery' 'The Smeltery' 'tconstruct:smeltery_controller;tconstruct:seared_drain;tconstruct:seared_fuel_tank' 'casting' 'xp:200;table:uncommon' -size 1.5 -shape 'hexagon' -desc @'
Build a hollow box of seared bricks with a floor, put the &eSmeltery Controller&r in a wall, and add a &eDrain&r and a &eFuel Tank&r filled with lava.

The Smeltery melts many items at once, doubles ore output, and makes &ealloys&r automatically.
'@
Q 'smeltery_more' 'Smeltery Upgrades' 'tconstruct:seared_ingot_gauge;tconstruct:seared_casting_tank;tconstruct:seared_chute' 'smeltery' 'xp:75' -opt -desc 'Gauges show the contents, chutes and ducts automate input and output.'
Q 'foundry' 'The Foundry' 'tconstruct:foundry_controller;tconstruct:scorched_brick*32' 'smeltery,netherite' 'xp:300;table:rare' -desc 'The Nether version of the Smeltery. It gives byproducts when melting ores, and works with scorched bricks.'
Q 'alloyer' 'Alloyer' 'tconstruct:scorched_alloyer' 'foundry' 'xp:100' -opt -desc 'A small machine for making alloys without a full Smeltery.'
Q 'netherite' 'Into the Nether' 'dim:minecraft:the_nether' 'smeltery' 'xp:25' -icon 'tconstruct:nether_grout' -desc 'Nether grout and scorched bricks come from the Nether.'

# ===== Tools =====
Q 'tools_set' 'The Toolkit' 'tconstruct:pickaxe;tconstruct:hand_axe;tconstruct:mattock;tconstruct:sword' 'first_tool,smeltery' 'xp:100;table:uncommon' -size 1.5 -desc 'A full set of Tinkers tools. Metal parts from the Smeltery make them much stronger.'
Q 'heavy' 'Heavy Tools' 'tconstruct:sledge_hammer;tconstruct:vein_hammer;tconstruct:excavator;tconstruct:broad_axe' 'tools_set' 'xp:200;table:rare' -desc 'Big tools mine a 3x3 area (or whole trees). They need tough handles and large plates.'
Q 'weapons' 'Weapons' 'tconstruct:cleaver;tconstruct:dagger;tconstruct:scythe' 'tools_set' 'xp:150' -desc 'Cleavers behead, daggers are fast, and scythes sweep.'
Q 'ranged' 'Bows' 'tconstruct:longbow;tconstruct:crossbow' 'tools_set' 'xp:150' -desc 'Tinkers bows use limbs, grips and bowstrings. Arrows are built from parts too.'
Q 'armor' 'Plate Armor' 'tconstruct:plate_helmet;tconstruct:plate_chestplate;tconstruct:plate_leggings;tconstruct:plate_boots' 'tools_set' 'xp:200;table:rare' -desc 'Modular armor made of metal plating and maille.'
Q 'travelers' 'Traveler''s Gear' 'tconstruct:travelers_helmet;tconstruct:travelers_chestplate;tconstruct:travelers_leggings;tconstruct:travelers_boots' 'tools_set' 'xp:150' -opt -desc 'Light leather armor with more modifier slots.'
Q 'modifiers' 'Modifiers' 'tconstruct:modifier_worktable' 'tools_set' 'xp:100' -desc @'
Modifiers add abilities to your tools: redstone for speed, lapis for luck, quartz for sharpness and many more.

Tools gain extra modifier slots as you level them up by using them.
'@
Q 'reinforce' 'Reinforcements' 'tconstruct:iron_reinforcement;tconstruct:obsidian_reinforcement' 'modifiers' 'xp:75' -desc 'Reinforcements make your tools much more durable.'
Q 'repair' 'Repair Kit' 'tconstruct:repair_kit' 'tools_set' 'xp:50' -desc 'Repair tools with a repair kit of their material.'
Q 'anvil' 'Tinker''s Anvil' 'tconstruct:tinkers_anvil' 'modifiers,cobalt' 'xp:150' -desc 'The upgraded Tinker Station. It has more slots and is needed for some modifiers.'
Q 'crystal' 'Modifier Crystal' 'tconstruct:modifier_crystal' 'anvil' 'xp:200;table:rare' -opt -desc 'Stores a modifier so you can move it to another tool.'

# ===== Slime & alloys =====
Q 'slime' 'Slime Islands' 'tconstruct:sky_slime_ball*8;tconstruct:ender_slime_ball*4' '' 'xp:100;table:common' -size 1.5 -desc @'
Slime islands float in the sky, in the ocean, in the Nether and in the End. They have their own slime, trees and congealed slime.

Check the &eDungeons & Structures&r chapter to find them all.
'@
Q 'slimesling' 'Slime Gear' 'tconstruct:slime_boots' 'slime' 'xp:75' -desc 'Slime boots let you bounce instead of taking fall damage.'
Q 'slimestaff' 'Slime Staffs' 'tconstruct:sky_staff' 'slime' 'xp:100' -opt -desc 'Staffs cast slime magic.'
Q 'slime_crystal' 'Slime Crystals' 'tconstruct:sky_slime_crystal*4' 'slime' 'xp:50' -opt -desc 'Slime geodes grow crystals used for modifiers.'
Q 'slimesteel' 'Slimesteel' 'tconstruct:slimesteel_ingot*4' 'slime,smeltery' 'xp:100' -desc 'Iron, sky slime and seared stone alloyed in the Smeltery. Very durable.'
Q 'rose_gold' 'Rose Gold' 'tconstruct:rose_gold_ingot*4' 'smeltery' 'xp:75' -desc 'Copper + gold. Gives tools the &eEnhanced&r trait (more modifier slots).'
Q 'amethyst_bronze' 'Amethyst Bronze' 'tconstruct:amethyst_bronze_ingot*4' 'smeltery' 'xp:75' -desc 'Copper + amethyst.'
Q 'pig_iron' 'Pig Iron' 'tconstruct:pig_iron_ingot*4' 'smeltery' 'xp:75' -opt -desc 'Iron, blood and clay. Tools made of it are... tasty.'
Q 'cobalt' 'Cobalt' 'tconstruct:raw_cobalt*4;tconstruct:cobalt_ingot*8' 'netherite' 'xp:200;table:uncommon' -desc 'Found in the Nether. Cobalt tools are very fast.'
Q 'manyullyn' 'Manyullyn' 'tconstruct:manyullyn_ingot*4' 'cobalt' 'xp:300;table:rare' -desc 'Cobalt + Ancient Debris. One of the strongest tool materials.'
Q 'hepatizon' 'Hepatizon' 'tconstruct:hepatizon_ingot*4' 'cobalt' 'xp:250;table:rare' -desc 'Copper, cobalt and quartz.'
Q 'queens_slime' 'Queen''s Slime' 'tconstruct:queens_slime_ingot*4' 'cobalt,slime' 'xp:250;table:rare' -desc 'Cobalt, gold and magma.'
Q 'knightslime' 'Knightslime' 'tconstruct:knightslime_ingot*4' 'slimesteel' 'xp:150' -opt -desc 'A heavy slimy metal.'
Q 'soulsteel' 'Soulsteel' 'tconstruct:soulsteel_ingot*4' 'foundry' 'xp:200' -opt -desc 'Forged with the souls of the Nether.'
Q 'master' 'Master Tinker' 'tconstruct:vein_hammer' 'manyullyn,heavy,anvil' 'lvl:20;table:epic' -size 2 -shape 'gear' -desc 'Build a Vein Hammer with Manyullyn parts. You have mastered Tinkers'' Construct!'
