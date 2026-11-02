Chapter 'oritech' 'Oritech' 'oritech:pulverizer' 'tech' 'Animated machines, addons, lasers, augments and particle physics.'

# ===== First steps =====
Q 'start' 'Oritech Begins' 'oritech:basic_generator' '' 'xp:75;table:common' -size 1.5 -shape 'gear' -sub 'Big machines, big ideas' -desc @'
&bOritech&r is a tech mod full of large, animated machines that you upgrade with &eaddon blocks&r.

Start with a &eBasic Generator&r: it burns any furnace fuel for power (RF/FE). Look up every recipe in JEI, many of them are machine-only.

&6Tip:&r Oritech has its own in-game guide. Check the mod's book or the JEI info tabs.

&6GSPack:&r the Basic Generator needs a Mekanism &eSteel Casing&r instead of a furnace, so start Mekanism first.
'@
Q 'nickel' 'Nickel' 'tag:c:raw_materials/nickel*8@alltheores:raw_nickel|8 Raw Nickel (any mod);tag:c:ingots/nickel*8@alltheores:nickel_ingot|8 Nickel Ingots (any mod)' 'start' 'xp:50' -desc 'Nickel is an Oritech staple. AllTheOres nickel can often be used too, but the quest needs Oritech''s.'
Q 'platinum' 'Platinum' 'tag:c:raw_materials/platinum*4@alltheores:raw_platinum|4 Raw Platinum (any mod)' 'nickel' 'xp:75' -opt -desc 'Platinum ore is rarer and found deep underground and in the End. It is needed for advanced parts.'
Q 'motor' 'Motors' 'oritech:motor*4' 'start' 'xp:50' -desc 'A key part for almost every machine.'
Q 'frame' 'Machine Frames' 'oritech:machine_frame*16' 'start' 'xp:50' -desc 'Frame blocks form the area that gantry machines like the Destroyer and Placer move along.'
Q 'pipes' 'Pipes' 'oritech:energy_pipe*16;oritech:item_pipe*16;oritech:fluid_pipe*16' 'start' 'xp:50' -desc @'
Connect your machines with pipes. Right-click a pipe connection with a &eWrench&r to switch between input and output.

&6Tip:&r Framed pipes hide inside a frame block, and pipe ducts merge several pipes into one block.
'@
Q 'wrench' 'Wrench' 'oritech:wrench' 'pipes' 'xp:25' -desc 'Rotate machines and configure pipe connections.'
Q 'storage' 'Energy Storage' 'oritech:large_storage' 'pipes' 'xp:75' -desc 'Store power for your machines.'

# ===== Processing =====
Q 'pulverizer' 'Pulverizer' 'oritech:pulverizer' 'motor' 'xp:100' -desc 'Grinds ores into dust (2 per ore) and items into their powdered form.'
Q 'furnace' 'Powered Furnace' 'oritech:powered_furnace' 'motor' 'xp:50' -desc 'A fast powered furnace.'
Q 'grinder' 'Fragment Forge' 'oritech:fragment_forge' 'pulverizer,alloys' 'xp:150;table:uncommon' -desc 'Breaks ore down into clumps and gems for much more output than the Pulverizer.'
Q 'foundry' 'Foundry' 'oritech:foundry' 'pulverizer' 'xp:150' -desc 'Melts metals together into alloys.'
Q 'alloys' 'First Alloys' 'tag:c:ingots/steel*16@alltheores:steel_ingot|16 Steel Ingots (any mod);tag:c:ingots/electrum*8@alltheores:electrum_ingot|8 Electrum Ingots (any mod)' 'foundry' 'xp:100;table:tech' -desc 'Steel (iron + coal) and electrum (gold + silver/nickel, check JEI) are used in nearly every better machine.'
Q 'centrifuge' 'Centrifuge' 'oritech:centrifuge' 'alloys' 'xp:150' -desc 'Separates materials, and with the &eFluid Addon&r it also processes fluids.'
Q 'assembler' 'Assembler' 'oritech:assembler' 'alloys' 'xp:150' -desc 'Assembles complex components from up to four inputs. Most electronics are made here.'
Q 'silicon' 'Silicon' 'oritech:silicon*16;oritech:silicon_wafer*4' 'centrifuge' 'xp:100' -desc 'Silicon is made from sand and quartz. Wafers are used for processing units.'
Q 'plastic' 'Plastic' 'oritech:plastic_sheet*8' 'refinery' 'xp:100' -desc 'Plastic is made from oil products in the refinery.'
Q 'wire' 'Magnetic Coils' 'oritech:magnetic_coil*8' 'assembler' 'xp:75' -desc 'Magnetic coils go into motors, generators and electronics.'
Q 'chips' 'Processing Units' 'oritech:processing_unit*4' 'assembler,silicon,wire' 'xp:200;table:tech' -size 1.5 -desc 'The brains of advanced Oritech machines and addons.'
Q 'carbon' 'Carbon Fibre' 'oritech:carbon_fibre_strands*8;oritech:reinforced_carbon_sheet*4' 'chips' 'xp:150' -desc 'Light and strong. Used in armor, jetpacks and advanced machines.'

# ===== Addons =====
Q 'addons' 'Machine Addons' 'oritech:machine_speed_addon;oritech:machine_efficiency_addon' 'chips' 'xp:150;table:uncommon' -size 1.5 -desc @'
Oritech machines have &eaddon slots&r around them. Place addon blocks in those spots to upgrade the machine:
- &eSpeed&r: faster, but uses more power.
- &eEfficiency&r: uses less power.
- &eCapacitor&r: bigger energy buffer.
- &eAcceptor&r: faster power input.
- &eYield&r: more output for some machines.

The machine's GUI shows which addons are installed and where the free slots are.
'@
Q 'addons2' 'More Addons' 'oritech:machine_capacitor_addon;oritech:machine_acceptor_addon;oritech:machine_yield_addon' 'addons' 'xp:100' -desc 'Try different combinations. The Yield addon is great on processing machines.'
Q 'extender' 'Machine Extender' 'oritech:machine_extender' 'addons' 'xp:75' -opt -desc 'Extends a machine''s addon area so it can hold more addons.'
Q 'core' 'Machine Cores' 'oritech:machine_core_1*4' 'chips' 'xp:50' -desc 'Big multiblock machines like the Atomic Forge and the Particle Accelerator need machine cores around them. Higher core tiers allow better machines.'
Q 'core_up' 'Better Cores' 'oritech:machine_core_3*4' 'core' 'xp:100' -opt -desc 'Higher tier cores for higher tier machines.'
Q 'inventory_proxy' 'Inventory Proxy' 'oritech:machine_inventory_proxy_addon' 'addons' 'xp:50' -opt -desc 'Lets pipes reach the machine''s inventory from the addon''s position.'

# ===== Power =====
Q 'fuel_gen' 'Fuel Generator' 'oritech:fuel_generator' 'chips,refinery' 'xp:150;table:uncommon' -desc 'Burns liquid fuels from the refinery. Much stronger than the Basic Generator.'
Q 'bio_gen' 'Bio Generator' 'oritech:bio_generator;oritech:biomass*16' 'chips' 'xp:100' -desc 'Burns biomass made from plants. Pairs well with an automated farm.'
Q 'lava_gen' 'Lava Generator' 'oritech:lava_generator' 'chips' 'xp:100' -desc 'Turns lava into power. Pump lava from the Nether!'
Q 'solar' 'Big Solar Panel' 'oritech:big_solar_panel' 'chips' 'xp:150' -desc 'A large solar multiblock. Better cores make it stronger.'
Q 'steam' 'Steam Power' 'oritech:steam_engine;oritech:steam_boiler_addon' 'fuel_gen' 'xp:150' -desc 'Generators with a boiler addon make steam, which steam engines turn into power.'
Q 'battery' 'Batteries' 'oritech:basic_battery;oritech:advanced_battery' 'chips' 'xp:75' -desc 'Portable power for your tools and armor.'
Q 'charger' 'Equipment Charger' 'oritech:equipment_charger' 'battery' 'xp:50' -desc 'Charges your Oritech tools and armor.'
Q 'pole' 'Energy Transmission' 'oritech:energy_transmission_pole*2' 'storage,chips' 'xp:75' -opt -desc 'Send power over long distances without pipes.'
Q 'superconductor' 'Superconductors' 'oritech:superconductor*16' 'exotic' 'xp:150' -desc 'Pipes that carry huge amounts of power.'

# ===== Fluids & oil =====
Q 'pump' 'Pump' 'oritech:pump' 'chips' 'xp:75' -desc 'Pumps whole lakes of fluid, including oil and lava.'
Q 'oil' 'Black Gold' 'oritech:still_oil_bucket' 'pump' 'xp:100' -desc 'Find oil underground and pump it up. The &eOil Resonator&r can help you find it.'
Q 'refinery' 'Refinery' 'oritech:refinery;oritech:refinery_chamber_module*2' 'oil' 'xp:200;table:uncommon' -desc 'Refines oil into fuel, heavy oil, naphtha and more. Stack refinery modules on top for more output steps.'
Q 'fuel' 'Fuel' 'oritech:still_fuel_bucket;oritech:still_diesel_bucket' 'refinery' 'xp:100' -desc 'Liquid fuels for the Fuel Generator and the jetpack.'
Q 'chiller' 'Industrial Chiller' 'oritech:industrial_chiller' 'refinery' 'xp:75' -opt -desc 'Cools and freezes fluids.'

# ===== Automation =====
Q 'gantry' 'Frame Gantry' 'oritech:destroyer;oritech:placer;oritech:fertilizer' 'frame,chips' 'xp:150' -desc @'
Build a rectangle of &eMachine Frames&r, then place a machine head next to it. The head moves around inside the frame:
- &eDestroyer&r: harvests crops and breaks blocks.
- &ePlacer&r: plants seeds and places blocks.
- &eFertilizer&r: grows crops faster.
'@
Q 'tree' 'Tree Cutter' 'oritech:tree_cutter' 'gantry' 'xp:100' -desc 'Cuts down whole trees, including giant ones. Pair it with a Placer for an automatic tree farm.'
Q 'filters' 'Item Filters' 'oritech:item_filter*2;oritech:smart_splitter' 'pipes,chips' 'xp:50' -opt -desc 'Control which items go where.'
Q 'drone' 'Drone Port' 'oritech:drone_port*2' 'chips,carbon' 'xp:200;table:rare' -desc 'Drones fly items between two drone ports over long distances, even across dimensions.'
Q 'spawner' 'Spawner Controller' 'oritech:spawner_controller;oritech:spawner_cage*8' 'laser' 'xp:200' -opt -desc 'Turn mob souls into a powered spawner.'

# ===== Laser & mining =====
Q 'enderic' 'Enderic Compound' 'oritech:enderic_compound*8;oritech:enderic_lens' 'chips' 'xp:100' -desc 'Made from ender pearls. Needed for lasers and ender tech.'
Q 'laser' 'Enderic Laser' 'oritech:enderic_laser' 'enderic' 'xp:300;choice:rare' -size 1.5 -shape 'hexagon' -desc @'
The &eEnderic Laser&r fires a beam that can:
- mine blocks far away (great for ore veins and resource nodes),
- power machines and the Atomic Forge,
- charge items, and hunt mobs with the Hunter addon.

Aim it with a &eTarget Designator&r.
'@
Q 'designator' 'Target Designator' 'oritech:target_designator' 'laser' 'xp:25' -desc 'Right-click a block to select it, then right-click the laser to aim it there.'
Q 'nodes' 'Resource Nodes' 'oritech:resource_node_resonator' 'laser' 'xp:150;table:uncommon' -desc 'Deep underground there are &eresource nodes&r: special ore blocks that a laser can mine forever. Use the resonator to find them.'
Q 'bedrock' 'Bedrock Extractor' 'oritech:bedrock_extractor' 'nodes' 'xp:300;table:rare' -desc 'Pulls endless ore out of the bedrock layer with a laser.'

# ===== Advanced materials =====
Q 'forge' 'Atomic Forge' 'oritech:atomic_forge' 'core,laser' 'xp:300;table:rare' -size 1.5 -desc 'A laser-powered multiblock forge. It makes the exotic materials.'
Q 'exotic' 'Exotic Metals' 'oritech:adamant_ingot*4;oritech:biosteel_ingot*4;oritech:duratium_ingot*4;oritech:energite_ingot*4' 'forge' 'xp:300;table:epic' -desc @'
Each exotic metal has its own chain:
- &eAdamant&r: tough and heavy.
- &eBiosteel&r: grown from biomass.
- &eDuratium&r: extremely durable.
- &eEnergite&r: stores energy.

Check JEI for each one.
'@
Q 'fluxite' 'Fluxite' 'oritech:fluxite*8;oritech:overcharged_crystal' 'forge' 'xp:200' -desc 'An energy crystal used for top-tier power items.'
Q 'computing' 'Advanced Computing' 'oritech:advanced_computing_engine;oritech:super_ai_chip' 'exotic' 'xp:400;table:epic' -desc 'The best Oritech electronics.'
Q 'enchanter' 'Stabilized Enchanter' 'oritech:stabilized_enchanter' 'forge' 'xp:200' -opt -desc 'Enchant items with a chosen enchantment using power and catalysts.'

# ===== Gear =====
Q 'tools' 'Powered Tools' 'oritech:hand_drill;oritech:chainsaw' 'battery' 'xp:150' -desc 'Electric mining tools.'
Q 'exo' 'Exosuit' 'oritech:exo_helmet;oritech:exo_chestplate;oritech:exo_leggings;oritech:exo_boots' 'tools,carbon' 'xp:300;table:rare' -desc 'Powered armor. The Exo Jetpack combines a jetpack with the chestplate.'
Q 'jetpack' 'Jetpack' 'oritech:jetpack' 'fuel,carbon' 'xp:150' -desc 'Fly using fuel and power.'
Q 'jetpack_elytra' 'Jetpack Elytra' 'oritech:jetpack_elytra' 'jetpack' 'xp:200' -opt -desc 'A jetpack with built-in elytra wings.'
Q 'railgun' 'Enderic Railgun' 'oritech:enderic_railgun' 'laser,exotic' 'xp:300;table:rare' -opt -desc 'A very powerful long-range weapon.'
Q 'augments' 'Cybernetic Augments' 'oritech:cybernetic_research_station;oritech:cybernetic_augmentation_center' 'computing' 'xp:400;table:epic' -desc @'
Research and install permanent &eaugments&r into your body: more health, speed, night vision, flight and much more.

Research augments at the &eResearch Station&r, then apply them at the &eAugmentation Center&r.
'@

# ===== Endgame =====
Q 'reactor' 'Nuclear Reactor' 'oritech:nuclear_reactor_controller;oritech:reactor_wall*24;oritech:reactor_rod*4;oritech:reactor_heat_pipe*4;oritech:reactor_energy_port' 'computing' 'xp:500;table:epic' -size 1.5 -shape 'hexagon' -desc @'
A configurable reactor. Rods produce heat and power, heat pipes and vents move the heat away.

&cPlan your cooling carefully!&r Too much heat damages the reactor.
'@
Q 'accelerator' 'Particle Accelerator' 'oritech:particle_accelerator;oritech:accelerator_ring*32;oritech:accelerator_sensor' 'computing,superconductor' 'xp:400;table:epic' -size 1.5 -desc 'Smash particles together to create materials you cannot get anywhere else. Bigger rings mean faster particles.'
Q 'strange' 'Strange Matter' 'oritech:still_strange_matter_bucket' 'accelerator' 'xp:400;table:epic' -desc 'Liquid strange matter, one of the strangest products of the particle accelerator.'
Q 'black_hole' 'Event Horizon' 'oritech:black_hole' 'strange' 'lvl:40;table:epic' -size 2 -shape 'gear' -desc 'You have created a &5black hole&r. There is nothing left to learn from Oritech! &6GSPack:&r the Black Hole is crafted in an &eElite Crafting Table&r (Extended Crafting) from strange matter, superconductors, fluxite blocks and Super AI Chips.'
