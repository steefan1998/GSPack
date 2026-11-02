Chapter 'ae2' 'Applied Energistics 2' 'ae2:controller' 'tech' 'Digital storage, channels and automated crafting.'

# ===== Quartz & meteorites =====
Q 'certus' 'Certus Quartz' 'ae2:certus_quartz_crystal*16' '' 'xp:75;table:common' -size 1.5 -shape 'gear' -sub 'The crystal that powers the network' -desc @'
&bApplied Energistics 2&r turns items into data. Instead of chests full of stuff, you get one network that holds everything and can craft for you.

Find &eCertus Quartz&r in &emeteorites&r (craters of sky stone) and in quartz geodes underground.

&6Tip:&r Read the in-game guide! Hold &eG&r while hovering over any AE2 item to open its page.
'@
Q 'meteorite' 'Fallen Star' 'struct:ae2:meteorite' 'certus' 'xp:100;table:tech' -icon 'ae2:sky_stone_block' -desc @'
Find a meteorite. They are big craters full of &eSky Stone&r.

In the middle is a &eMysterious Cube&r with one of the four inscriber presses. Bring a pickaxe, sky stone is very hard!
'@
Q 'compass' 'Meteorite Compass' 'ae2:meteorite_compass' 'certus' 'xp:25' -desc 'Points to the nearest meteorite. Handy if you are having trouble finding one.'
Q 'skystone' 'Sky Stone' 'ae2:sky_stone_block*32' 'meteorite' 'xp:50' -desc 'Used for sky stone chests and tanks, and in the Charger. Smooth sky stone looks great too.'
Q 'budding' 'Budding Quartz' 'ae2:flawed_budding_quartz' 'certus' 'xp:75' -desc @'
Budding certus quartz grows crystals on its sides, just like amethyst.

The budding block slowly decays: flawless -> flawed -> chipped -> damaged. Only flawless budding quartz never decays, and it cannot be moved.
'@
Q 'growth' 'Growth Accelerator' 'ae2:growth_accelerator*2' 'budding,controller' 'xp:100' -desc 'Place it next to budding quartz and power it. Crystals grow many times faster. Combine with an annihilation plane to harvest automatically.'
Q 'charger' 'Charger' 'ae2:charger;ae2:crank' 'certus' 'xp:50' -desc 'Charge certus quartz into &eCharged Certus Quartz&r. Power it with FE, or put a &eCrank&r on top and turn it by hand.'
Q 'charged' 'Charged Certus' 'ae2:charged_certus_quartz_crystal*8' 'charger' 'xp:50' -desc 'Charged certus is needed for fluix crystals.'
Q 'fluix' 'Fluix Crystals' 'ae2:fluix_crystal*16' 'charged' 'xp:75;table:tech' -desc @'
Throw charged certus quartz, redstone and nether quartz into a pool of water. A moment later they turn into &eFluix Crystals&r.

Fluix is used in cables, the controller and many components.
'@
Q 'fluix_tools' 'Fluix Tools' 'ae2:fluix_pickaxe' 'fluix' 'xp:25' -opt -desc 'Fluix tools are a bit faster than iron.'
Q 'knife' 'Cutting Knife' 'ae2:certus_quartz_cutting_knife' 'certus' 'xp:25' -opt -desc 'Used to make name presses and to cut quartz.'
Q 'wrench' 'Certus Wrench' 'ae2:certus_quartz_wrench' 'certus' 'xp:25' -desc 'Rotate and pick up AE2 blocks and parts.'

# ===== Inscriber =====
Q 'presses' 'The Four Presses' 'ae2:calculation_processor_press;ae2:engineering_processor_press;ae2:logic_processor_press;ae2:silicon_press' 'meteorite' 'xp:150;table:tech' -desc @'
Each meteorite holds one press. Collect all four: &eCalculation&r, &eEngineering&r, &eLogic&r and &eSilicon&r.

Once you have one, the Inscriber can make copies from an iron block, so you only need to find each press once.
'@
Q 'inscriber' 'Inscriber' 'ae2:inscriber' 'presses,fluix' 'xp:100' -desc @'
The Inscriber presses circuits. Put the press in the top slot, the material in the middle, and (for processors) the second press in the bottom slot.

&6Tip:&r With automation, use separate inscribers for each step.

&6GSPack:&r the Inscriber is made with &esteel&r instead of iron. Steel comes from Mekanism (Metallurgic Infuser), Railcraft (Blast Furnace), Oritech or Tinkers'.
'@
Q 'silicon' 'Silicon' 'ae2:silicon*16;ae2:printed_silicon*4' 'inscriber' 'xp:75' -desc 'Smelt certus or nether quartz dust into silicon, then press it with the silicon press.'
Q 'circuits' 'Printed Circuits' 'ae2:printed_logic_processor*4;ae2:printed_calculation_processor*4;ae2:printed_engineering_processor*4' 'inscriber' 'xp:75' -desc 'Gold makes logic circuits, certus makes calculation circuits, and diamond makes engineering circuits.'
Q 'processors' 'Processors' 'ae2:logic_processor*8;ae2:calculation_processor*8;ae2:engineering_processor*8' 'silicon,circuits' 'xp:200;table:uncommon' -size 1.5 -desc 'Printed circuit + printed silicon + redstone = processor. You will need many of each, so think about automating this early!'

# ===== The network =====
Q 'cable' 'Cables' 'ae2:fluix_glass_cable*32' 'fluix' 'xp:25' -desc @'
Glass cables carry &e8 channels&r. Later, &eDense Cables&r carry 32.

&6Tip:&r Colour cables with dye to stop them connecting to each other.
'@
Q 'smart' 'Smart Cables' 'ae2:fluix_smart_cable*16' 'cable' 'xp:25' -desc 'Smart cables show how many channels they use. Great for debugging.'
Q 'dense' 'Dense Cables' 'ae2:fluix_smart_dense_cable*8' 'smart,controller' 'xp:75' -desc 'Carry 32 channels. Use them as the backbone of a large network.'
Q 'controller' 'ME Controller' 'ae2:controller;ae2:energy_acceptor' 'processors,cable' 'xp:250;table:uncommon' -size 1.5 -shape 'hexagon' -desc @'
The heart of the network. Each face of a controller provides &e32 channels&r.

Without a controller, a network can still run with 8 devices (ad-hoc mode). With one, it can grow very large. Controllers can be built as multiblocks up to 7x7x7.

Power it with an &eEnergy Acceptor&r connected to any FE source.
'@
Q 'energy_cell' 'Energy Cells' 'ae2:energy_cell' 'controller' 'xp:50' -desc 'Store power for the network so it keeps running when the generators stop.'
Q 'channels' 'Channels' 'check' 'controller,dense' 'xp:50' -icon 'ae2:fluix_smart_dense_cable' -desc @'
Every device on the network (terminals, buses, interfaces...) uses one &echannel&r.
- Glass/covered/smart cable: 8 channels.
- Dense cable: 32 channels.
- Controller face: 32 channels.

Plan your network as a tree: dense cables from the controller, normal cables to the devices.
'@

# ===== Storage =====
Q 'drive' 'ME Drive' 'ae2:drive' 'controller' 'xp:100' -desc 'Holds up to 10 storage cells.'
Q 'cell1k' 'First Storage Cell' 'ae2:item_storage_cell_1k*2' 'drive' 'xp:100' -desc @'
A cell has a number of &ebytes&r and holds up to &e63 types&r of items.

Each new type costs some bytes, so a few types in big amounts are stored most efficiently.
'@
Q 'workbench' 'Cell Workbench' 'ae2:cell_workbench' 'cell1k' 'xp:50' -desc 'Partition a cell so it only accepts certain items, and add upgrade cards.'
Q 'cells' 'Bigger Cells' 'ae2:item_storage_cell_4k;ae2:item_storage_cell_16k;ae2:item_storage_cell_64k' 'cell1k' 'xp:250;table:rare' -desc 'Each size holds four times as much. Combine the cell component with an item cell housing.'
Q 'cell256' '256k Storage' 'ae2:item_storage_cell_256k*2' 'cells' 'xp:400;table:epic' -desc 'The biggest AE2 storage cell.'
Q 'fluid_cell' 'Fluid Storage' 'ae2:fluid_storage_cell_4k' 'cell1k' 'xp:75' -desc 'AE2 can store fluids too. Use buckets in the terminal, or pipes into an interface.'
Q 'portable' 'Portable Cell' 'ae2:portable_item_cell_1k' 'cell1k' 'xp:50' -opt -desc 'A small storage cell you carry with you.'
Q 'me_chest' 'ME Chest' 'ae2:me_chest' 'cell1k' 'xp:50' -opt -desc 'A single-cell storage block with a built-in terminal.'

# ===== Terminals & devices =====
Q 'terminal' 'ME Terminal' 'ae2:terminal' 'controller' 'xp:50' -desc 'See and take every item in your network. Use the search bar, and sort by name, amount or mod.'
Q 'crafting_term' 'Crafting Terminal' 'ae2:crafting_terminal' 'terminal' 'xp:75' -desc 'A terminal with a crafting grid that pulls ingredients straight from storage. JEI''s + button fills it for you.'
Q 'import' 'Import Bus' 'ae2:import_bus*2' 'controller' 'xp:50' -desc 'Pulls items from an inventory into the network.'
Q 'export' 'Export Bus' 'ae2:export_bus*2' 'controller' 'xp:50' -desc 'Pushes chosen items out of the network into an inventory.'
Q 'storage_bus' 'Storage Bus' 'ae2:storage_bus*2' 'import,export' 'xp:75' -desc 'Makes any chest, barrel or drawer part of the network. Also works on Mekanism bins and Sophisticated Storage.'
Q 'interface' 'ME Interface' 'ae2:interface*2' 'import,export' 'xp:100' -desc 'Keeps chosen items in stock and lets machines and pipes talk to the network.'
Q 'level_emitter' 'Level Emitter' 'ae2:level_emitter' 'interface' 'xp:50' -opt -desc 'Gives a redstone signal when an item goes above or below a set amount. Great for "keep 1000 iron in stock" setups.'
Q 'cards' 'Upgrade Cards' 'ae2:speed_card*2;ae2:capacity_card;ae2:fuzzy_card;ae2:redstone_card' 'interface' 'xp:100' -desc @'
- &eSpeed Card&r: faster buses.
- &eCapacity Card&r: more filter slots.
- &eFuzzy Card&r: match damaged tools or ignore components.
- &eRedstone Card&r: control with redstone.
- &eCrafting Card&r: let buses request crafts.
'@
Q 'planes' 'Formation & Annihilation' 'ae2:formation_plane;ae2:annihilation_plane' 'interface' 'xp:75' -opt -desc 'Annihilation planes break blocks in front of them, formation planes place them. Perfect for a cobblestone or quartz farm.'
Q 'io_port' 'ME IO Port' 'ae2:io_port' 'cells' 'xp:75' -opt -desc 'Quickly empty or fill storage cells. Great for moving to bigger cells.'

# ===== Autocrafting =====
Q 'pattern' 'Patterns' 'ae2:pattern_encoding_terminal;ae2:blank_pattern*16' 'crafting_term' 'xp:100' -desc @'
Encode recipes into patterns. There are two kinds:
- &eCrafting&r patterns, for crafting table recipes.
- &eProcessing&r patterns, for machines (furnace, Mekanism, Oritech, ...).

Use JEI's + button in the encoding terminal to fill in a recipe.
'@
Q 'cpu' 'Crafting CPU' 'ae2:crafting_unit*4;ae2:4k_crafting_storage;ae2:crafting_accelerator;ae2:crafting_monitor' 'pattern' 'xp:200;table:uncommon' -desc @'
A crafting CPU is a solid cuboid multiblock of crafting units, at least one crafting storage, and optionally co-processors (accelerators) and a monitor.

Storage sets how big a job can be. Accelerators make it faster.
'@
Q 'provider' 'Pattern Provider' 'ae2:pattern_provider*2' 'cpu' 'xp:100' -desc 'Holds patterns and pushes ingredients into the machine next to it. The machine''s output must go back into the network (an interface or import bus).'
Q 'assembler' 'Molecular Assembler' 'ae2:molecular_assembler*4' 'provider' 'xp:250;choice:rare' -size 1.5 -shape 'hexagon' -desc @'
Put crafting patterns in a &ePattern Provider&r next to &eMolecular Assemblers&r and AE2 crafts anything for you.

Request a craft in the terminal with &eright-click&r (or middle-click) on an item. Welcome to autocrafting!
'@
Q 'access' 'Pattern Access Terminal' 'ae2:pattern_access_terminal' 'provider' 'xp:50' -desc 'Manage the patterns in every provider on the network from one screen.'
Q 'big_cpu' 'Bigger CPUs' 'ae2:64k_crafting_storage;ae2:crafting_accelerator*8' 'assembler' 'xp:300;table:rare' -desc 'Big jobs need big CPUs. Build several CPUs to run crafts in parallel.'
Q 'requester' 'ME Requester' 'merequester:requester' 'assembler' 'xp:100' -opt -desc '&bME Requester&r keeps a set amount of items crafted at all times. Never run out of processors again!'
Q 'polymorphic' 'Polymorphic AE2' 'check' 'assembler' 'xp:25' -opt -icon 'ae2:molecular_assembler' -desc '&bPolymorphic AE2&r makes autocrafting smarter when several recipes share the same ingredients. It works in the background.'

# ===== Wireless & P2P =====
Q 'wireless' 'Wireless Access Point' 'ae2:wireless_access_point;ae2:wireless_booster*4' 'terminal' 'xp:150;table:uncommon' -desc 'Gives wireless coverage around it. Wireless Boosters increase the range.'
Q 'wireless_term' 'Wireless Terminal' 'ae2:wireless_terminal' 'wireless' 'xp:100' -desc 'Link it in the Access Point''s slot, and access your network anywhere in range.'
Q 'wireless_craft' 'Wireless Crafting Terminal' 'ae2:wireless_crafting_terminal' 'wireless_term,crafting_term' 'xp:100' -desc '&bAE2 Wireless Terminals&r adds more terminals and an upgrade for infinite range with a Quantum Bridge singularity.'
Q 'p2p' 'P2P Tunnels' 'ae2:me_p2p_tunnel*2;ae2:memory_card' 'channels' 'xp:150' -desc @'
A P2P tunnel sends something through a single channel: &eME channels&r (32 at once through one!), items, fluids, energy, redstone or light.

Link the two ends with a &eMemory Card&r (shift-click the input, then click the output).
'@
Q 'p2p_types' 'P2P Variety' 'ae2:fe_p2p_tunnel*2;ae2:item_p2p_tunnel*2;ae2:fluid_p2p_tunnel*2' 'p2p' 'xp:75' -opt -desc 'Right-click an ME P2P tunnel with an item to change its type (for example a cable for FE, a chest for items).'
Q 'quantum' 'Quantum Bridge' 'ae2:quantum_ring*16;ae2:quantum_link*2;ae2:quantum_entangled_singularity*2' 'p2p' 'xp:250;table:rare' -desc 'Two quantum rings with a pair of entangled singularities connect networks across any distance, even across dimensions.'
Q 'spatial' 'Spatial Storage' 'ae2:spatial_io_port;ae2:spatial_pylon*8;ae2:spatial_storage_cell_2' 'quantum' 'xp:200' -opt -desc 'Store a whole area of the world in a cell and put it back somewhere else. You can even move your base!'

# ===== Add-ons =====
Q 'chem_cell' 'Chemical Storage' 'appmek:chemical_cell_housing;appmek:chemical_storage_cell_4k' 'cell1k' 'xp:100;table:tech' -desc '&bApplied Mekanistics&r lets your ME network store Mekanism &echemicals&r: gases, infuse types, pigments and slurries. Pattern providers can also push chemicals into Mekanism machines.'
Q 'chem_p2p' 'Chemical P2P' 'appmek:chemical_p2p_tunnel*2' 'chem_cell,p2p' 'xp:75' -opt -desc 'Move Mekanism chemicals through your ME cables.'
Q 'oritech_link' 'Applied Oritech' 'applied_oritech:me_interface_addon;applied_oritech:me_pattern_provider_addon' 'assembler' 'xp:150;table:tech' -desc '&bApplied Oritech&r adds ME addons for Oritech machines. Attach them to an Oritech machine to connect it straight to your network.'
Q 'adv_ae' 'Advanced AE' 'advanced_ae:quantum_processor*4;advanced_ae:quantum_alloy*4' 'assembler' 'xp:200;table:rare' -size 1.5 -desc @'
&bAdvanced AE&r adds quantum tech: much faster crafting, huge storage and the Quantum Armor.

Quantum Alloy and the other materials are made in the &eReaction Chamber&r.
'@
Q 'reaction' 'Reaction Chamber' 'advanced_ae:reaction_chamber' 'adv_ae' 'xp:150' -desc 'A fast processing machine for Advanced AE materials. It needs power, fluids and items.'
Q 'adv_provider' 'Advanced Pattern Provider' 'advanced_ae:small_adv_pattern_provider' 'adv_ae' 'xp:100' -desc 'Sends each ingredient of a pattern to a specific side of a machine. Great for machines with several inputs.'
Q 'qstorage' 'Quantum Storage' 'advanced_ae:quantum_storage_256' 'adv_ae' 'xp:300;table:epic' -opt -desc 'Quantum computer storage blocks hold enormous crafting jobs.'
Q 'qcomputer' 'Quantum Computer' 'advanced_ae:quantum_core;advanced_ae:quantum_unit*8;advanced_ae:quantum_structure*16;advanced_ae:quantum_accelerator*2' 'adv_ae' 'xp:400;table:epic' -size 1.5 -desc 'A huge crafting CPU multiblock that can run many crafting jobs at once, with multi-threading.'
Q 'qarmor' 'Quantum Armor' 'advanced_ae:quantum_helmet;advanced_ae:quantum_chestplate;advanced_ae:quantum_leggings;advanced_ae:quantum_boots' 'reaction' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc @'
Armor powered by your ME network, with upgrade cards for flight, speed, step assist, magnet, regeneration and much more.

Install the cards in the Quantum Armor workbench menu.
'@

# ===== AE2 Add-ons =====
Q 'ex_start' 'ExtendedAE' 'extendedae:ex_pattern_provider' 'provider' 'xp:150;table:tech' -size 1.5 -sub 'Bigger and better ME devices' -desc @'
&bExtendedAE&r adds extended versions of the AE2 devices you already know, with more slots and more features:
- &eExtended Pattern Provider&r: many more pattern slots.
- &eExtended Interface&r, &eExtended Drive&r and &eExtended I/O Port&r.
- New buses and emitters: tag, threshold, precise and mod filters.

Press U on any AE2 device in JEI to see its extended version.
'@
Q 'ex_devices' 'Extended Devices' 'extendedae:ex_interface;extendedae:ex_drive' 'ex_start' 'xp:100' -desc 'The extended interface and drive hold much more than the normal ones. Great for big networks.'
Q 'ex_assembler' 'Assembler Matrix' 'extendedae:assembler_matrix_frame;extendedae:assembler_matrix_crafter;extendedae:assembler_matrix_pattern' 'ex_start' 'xp:250;table:rare' -desc @'
The &eAssembler Matrix&r is a multiblock that runs a huge number of crafting patterns at the same time. It replaces walls of Molecular Assemblers.

Check JEI for the parts and how to build it.
'@
Q 'ex_wireless' 'Wireless Connector' 'extendedae:wireless_connect*2;extendedae:wireless_tool' 'ex_start' 'xp:75' -opt -desc 'Two Wireless Connectors link parts of a network without cables. Pair them with the Wireless Setup Kit.'
Q 'entro' 'Entro Crystals' 'extendedae:entro_crystal*8' 'ex_start' 'xp:75' -opt -desc 'A crystal used in many ExtendedAE recipes. JEI shows how to grow and harvest it.'
Q 'appflux' 'Applied Flux' 'appflux:flux_accessor;appflux:fe_1k_cell' 'drive' 'xp:150;table:tech' -desc @'
&bApplied Flux&r stores &eFE energy&r in your ME network, in FE storage cells inside an ME Drive.

The &eFlux Accessor&r lets machines take energy from the network and put it back. One network can now hold both your items and your power.
'@
Q 'infinity_card' 'Infinity Booster' 'aeinfinitybooster:infinity_card' 'wireless_term' 'xp:150;table:rare' -desc @'
Put an &eInfinity Card&r in a Wireless Access Point and your wireless terminals work at any distance in that dimension.

The &eDimension Card&r goes one step further and works across dimensions.
'@
Q 'ender_drives' 'Ender Drives' 'enderdrives:ender_disk_1k' 'cell1k' 'xp:100' -opt -desc 'Ender disks share their contents by frequency, so two networks (even in other dimensions) can use the same storage.'
Q 'replication' 'Replication' 'replication:raw_replica*4;replication:replica_ingot*4' 'cell1k' 'xp:150;table:tech' -desc @'
&bReplication&r copies items out of &ematter&r.

Find &eReplica ore&r deep underground and smelt it into Replica ingots. They are used to build the machines.
'@
Q 'replicator' 'The Replicator' 'replication:identification_chamber;replication:disintegrator;replication:replicator;replication:memory_chip' 'replication' 'xp:250;table:rare' -desc @'
How it works:
1. The &eIdentification Chamber&r scans an item and saves it on a &eMemory Chip&r.
2. The &eDisintegrator&r breaks items down into matter.
3. The &eReplicator&r uses that matter to build copies of scanned items.

Connect them with Matter Network Pipes.
'@
Q 'apprep' 'Applied Replicatics' 'apprep:replication_connector;apprep:matter_cell_1k' 'replicator' 'xp:150' -desc 'Connects Replication to your ME network and stores matter in ME cells.'
Q 'app_thaum' 'Applied Thaumaturge' 'appliedthaumaturge:essentia_cell_1k;appliedthaumaturge:essentia_terminal' 'cell1k,thaumaturge/jars' 'xp:150;table:arcane' -desc @'
&bApplied Thaumaturge&r stores &dessentia&r in your ME network, in essentia cells, and lets you see it in the Essentia Terminal.

It also adds arcane crafting and infusion helpers for automation. Check JEI!
'@
