Chapter 'mekanism' 'Mekanism' 'mekanism:metallurgic_infuser' 'tech' 'Ore processing, chemistry, logistics, reactors and the MekaSuit.'

# ===== Start =====
Q 'osmium' 'The Blue Metal' 'mekanism:ingot_osmium*16' '' 'xp:75;table:common' -size 1.5 -shape 'gear' -sub 'Osmium is the heart of Mekanism' -desc @'
Welcome to &bMekanism&r, one of the biggest tech mods in the pack!

Everything starts with &eosmium&r. It generates as ore underground. This pack has both Mekanism and AllTheOres osmium: they are interchangeable in recipes, but the quest needs Mekanism's ingot, so make sure it ends up as &eMekanism Osmium Ingots&r (for example, by smelting Mekanism dust later).

&6Tip:&r Press &eU&r on osmium in JEI to see the huge list of things it is used in.
'@
Q 'infuser' 'Metallurgic Infuser' 'mekanism:metallurgic_infuser' 'osmium' 'xp:100;table:tech' -size 1.5 -desc @'
The &eMetallurgic Infuser&r is the first Mekanism machine. It combines a material with an &finfuse type&r:
- &cRedstone&r makes Infused Alloy and Basic Control Circuits.
- &8Carbon&r (coal or charcoal) makes Steel.
- &bDiamond&r makes Reinforced Alloy.
- &5Refined Obsidian&r makes Atomic Alloy.

It needs power (FE). Any generator in the pack works.
'@
Q 'circuit' 'Basic Control Circuit' 'mekanism:basic_control_circuit*8' 'infuser' 'xp:50' -desc 'Osmium + redstone in the Infuser. Almost every Mekanism machine needs at least one.'
Q 'alloy' 'Infused Alloy' 'mekanism:alloy_infused*8' 'infuser' 'xp:50' -desc 'Iron + redstone. Used in tier 2 parts and many machines.'
Q 'steel' 'Steel' 'mekanism:ingot_steel*16' 'infuser' 'xp:75' -desc @'
Infuse iron with carbon to get &eEnriched Iron&r, then infuse that again for &eSteel Dust&r. Smelt it into ingots.

Steel is everywhere in Mekanism.
'@
Q 'casing' 'Steel Casing' 'mekanism:steel_casing*2' 'steel,circuit' 'xp:100;table:tech' -desc 'Steel + glass + osmium. The frame of nearly every Mekanism machine. Make a few!'
Q 'tools_basic' 'Mekanism Tools' 'mekanismtools:steel_paxel' 'steel' 'xp:50' -opt -desc @'
&bMekanism Tools&r adds tool and armor sets for osmium, bronze, steel, lapis, refined glowstone and refined obsidian.

The &ePaxel&r is a pickaxe, axe and shovel in one!
'@
Q 'refined_obsidian' 'Refined Obsidian' 'mekanism:ingot_refined_obsidian*4' 'crusher' 'xp:150;table:uncommon' -desc 'Crush obsidian into dust, infuse it with diamond, and combine it with osmium in the Osmium Compressor. Needed for atomic alloy and top-tier tools.'
Q 'ro_gear' 'Refined Obsidian Gear' 'mekanismtools:refined_obsidian_pickaxe;mekanismtools:refined_obsidian_chestplate' 'refined_obsidian,tools_basic' 'xp:200;table:rare' -opt -desc 'Some of the toughest non-powered gear in the game.'
Q 'glowstone' 'Refined Glowstone' 'mekanism:ingot_refined_glowstone*4' 'osmium_compressor' 'xp:75' -opt -desc 'Glowstone + osmium in the Osmium Compressor. Refined glowstone tools glow in the dark.'

# ===== Power =====
Q 'heat_gen' 'Heat Generator' 'mekanismgenerators:heat_generator' 'casing' 'mekanism:basic_universal_cable*16' -desc @'
Burns any fuel for power, and makes extra power when placed next to lava (or in it).

A good first generator. Put coal or charcoal in it and pipe the power out with cables.
'@
Q 'solar' 'Solar Generator' 'mekanismgenerators:solar_generator*4' 'heat_gen' 'xp:75' -desc 'Free power while the sun shines. It needs a clear view of the sky.'
Q 'adv_solar' 'Advanced Solar' 'mekanismgenerators:solar_panel*9' 'solar,adv_circuit' 'xp:100' -opt -desc 'Solar panels are the crafting ingredient for the Advanced Solar Generator, which makes much more power.'
Q 'bio' 'Bio-Fuel' 'mekanism:bio_fuel*32;mekanismgenerators:bio_generator' 'crusher' 'xp:75' -desc 'Crush plants, seeds and saplings into Bio-Fuel and burn it in a &eBio-Generator&r. Great with an automatic farm!'
Q 'wind' 'Wind Generator' 'mekanismgenerators:wind_generator*2' 'adv_circuit' 'xp:100' -desc 'Makes more power the higher you place it. Build them on a mountain or a tower.'
Q 'gas_gen' 'Gas-Burning Generator' 'mekanismgenerators:gas_burning_generator' 'separator' 'xp:100' -desc @'
Burns gases for power. Hydrogen works, but &eEthene&r (made from bio-fuel, hydrogen and oxygen in the Pressurized Reaction Chamber) is much better.
'@
Q 'ethene' 'Ethene' 'mekanism:pressurized_reaction_chamber;mekanism:hdpe_pellet*8' 'gas_gen' 'xp:150;table:uncommon' -desc 'The Pressurized Reaction Chamber turns bio-fuel, water and hydrogen into ethene. Ethene also makes HDPE plastic for later items.'
Q 'cable' 'Universal Cables' 'mekanism:basic_universal_cable*16' 'heat_gen' 'xp:25' -desc 'Cables carry power. Use the &eConfigurator&r on a cable to change whether it pulls, pushes or does both.'
Q 'cube' 'Energy Cube' 'mekanism:basic_energy_cube' 'cable' 'xp:75' -desc 'Stores power. Set the input and output sides in the &eSide Configuration&r tab of the GUI.'
Q 'adv_cube' 'Bigger Batteries' 'mekanism:advanced_energy_cube' 'cube,adv_circuit' 'xp:100' -desc 'Each tier holds much more power. Upgrade a cube in the crafting grid to keep its stored energy.'
Q 'induction' 'Induction Matrix' 'mekanism:induction_casing*24;mekanism:induction_port*2;mekanism:basic_induction_cell*2;mekanism:basic_induction_provider' 'adv_cube,ultimate' 'xp:300;table:rare' -size 1.5 -desc @'
A multiblock battery of any size from 3x3x3 to 18x18x18.

- &eInduction Cells&r inside set the capacity.
- &eInduction Providers&r set how fast power goes in and out.
- One &eInduction Port&r for input, one set to output with a Configurator.

Upgrade cells and providers to store ridiculous amounts of power.
'@

# ===== Ore processing =====
Q 'enrich' 'Enrichment Chamber' 'mekanism:enrichment_chamber' 'casing' 'xp:100;table:common' -size 1.5 -sub '2x ore processing' -desc @'
&62x ore processing.&r One ore becomes two dusts. Smelt them into ingots.

It also turns gravel into flint, cobblestone into gravel, and redstone ore into extra redstone.
'@
Q 'crusher' 'Crusher' 'mekanism:crusher' 'casing' 'xp:50' -desc 'Turns ingots into dust, and plants into bio-fuel. Also needed for 3x ore processing.'
Q 'smelter' 'Energized Smelter' 'mekanism:energized_smelter' 'casing' 'xp:50' -desc 'A powered furnace. Pipe the Enrichment Chamber''s output straight into it.'
Q 'osmium_compressor' 'Osmium Compressor' 'mekanism:osmium_compressor' 'enrich' 'xp:75' -desc 'Uses liquid osmium to compress materials, like refined obsidian and refined glowstone.'
Q 'combiner' 'Combiner' 'mekanism:combiner' 'enrich' 'xp:50' -opt -desc 'Combines dusts with cobblestone back into ores. Handy for a few recipes.'
Q 'sawmill' 'Precision Sawmill' 'mekanism:precision_sawmill' 'enrich' 'xp:50' -opt -desc 'Gives more planks per log, plus sawdust.'
Q 'separator' 'Electrolytic Separator' 'mekanism:electrolytic_separator;mekanism:electric_pump' 'enrich' 'xp:100;table:tech' -desc @'
Splits water into &bhydrogen&r and &boxygen&r. These gases power the next ore processing tiers.

Place the &eElectric Pump&r on a water source to feed it. A water source of at least 2 blocks in a row counts as infinite.
'@
Q 'tanks' 'Chemical Tanks' 'mekanism:basic_chemical_tank*2;mekanism:basic_pressurized_tube*16' 'separator' 'xp:50' -desc 'Store gases in Chemical Tanks and move them with Pressurized Tubes.'
Q 'purify' 'Purification Chamber' 'mekanism:purification_chamber' 'separator,crusher' 'xp:150;table:uncommon' -size 1.5 -sub '3x ore processing' -desc @'
&63x ore processing.&r Feed it &eoxygen&r. One ore becomes three &eclumps&r.

Clumps -> Crusher -> dirty dust -> Enrichment Chamber -> dust -> smelt.
'@
Q 'inject' 'Chemical Injection Chamber' 'mekanism:chemical_injection_chamber;mekanism:chemical_oxidizer' 'purify' 'xp:200;table:uncommon' -size 1.5 -sub '4x ore processing' -desc @'
&64x ore processing.&r Feed it &eHydrogen Chloride&r. One ore becomes four &eshards&r, which go into the Purification Chamber.

Make hydrogen chloride by combining hydrogen and chlorine in a &eChemical Infuser&r. Chlorine comes from brine in the separator.
'@
Q 'chem_infuser' 'Chemical Infuser' 'mekanism:chemical_infuser' 'separator' 'xp:75' -desc 'Combines two gases into a new one: hydrogen chloride, sulfuric acid and more.'
Q 'evap' 'Thermal Evaporation Plant' 'mekanism:thermal_evaporation_controller;mekanism:thermal_evaporation_valve*2;mekanism:thermal_evaporation_block*30' 'chem_infuser' 'xp:200;table:uncommon' -desc @'
A multiblock that boils water into &bbrine&r, and brine into &blithium&r. It works faster when hot, so use a Resistive Heater, or build it in the Nether.

Brine -> Electrolytic Separator -> chlorine and sodium.
'@
Q 'dissolve' 'The Big One: 5x' 'mekanism:chemical_dissolution_chamber;mekanism:chemical_washer;mekanism:chemical_crystallizer' 'inject,evap' 'xp:400;choice:rare' -size 2 -shape 'hexagon' -sub '5x ore processing' -desc @'
&65x ore processing!&r The full chain:

1. &eChemical Dissolution Chamber&r: ore + sulfuric acid -> dirty slurry.
2. &eChemical Washer&r: dirty slurry + water -> clean slurry.
3. &eChemical Crystallizer&r: clean slurry -> crystals.
4. Crystals -> Injection -> Purification -> Crusher -> Enrichment -> smelt.
{@pagebreak}
Sulfuric acid: sulfur dioxide (sulfur dust in the Chemical Oxidizer) + oxygen -> sulfur trioxide, then + water vapour in the Chemical Infuser.

It is a big build, but once it runs you will never run out of metal again!
'@

# ===== Upgrades & factories =====
Q 'upgrades' 'Machine Upgrades' 'mekanism:upgrade_speed*2;mekanism:upgrade_energy*2' 'enrich' 'xp:100;table:tech' -desc @'
&eSpeed Upgrades&r make machines faster (and hungrier). &eEnergy Upgrades&r cut the power use and raise the buffer.

A machine takes up to 8 of each. Install them in the upgrade tab of the machine.
'@
Q 'muffler' 'Peace and Quiet' 'mekanism:upgrade_muffling' 'upgrades' 'xp:25' -opt -desc 'Machines too loud? Muffling Upgrades silence them.'
Q 'adv_circuit' 'Advanced Circuits & Reinforced Alloy' 'mekanism:advanced_control_circuit*4;mekanism:alloy_reinforced*4' 'circuit,alloy' 'xp:150;table:tech' -desc 'Reinforced alloy is infused alloy infused with &bdiamond&r. Advanced circuits unlock the advanced tier.'
Q 'installer' 'Tier Installers' 'mekanism:basic_tier_installer' 'upgrades,adv_circuit' 'xp:75' -desc 'Right-click a basic machine with a Tier Installer to turn it into a &eFactory&r that works on several items at once.'
Q 'factory' 'Factories' 'mekanism:basic_smelting_factory;mekanism:basic_enriching_factory' 'installer' 'xp:150;table:uncommon' -desc 'A basic factory has 3 slots, advanced 5, elite 7, ultimate 9. Upgrade step by step with the next tier installer.'
Q 'elite' 'Elite Tier' 'mekanism:elite_control_circuit*4;mekanism:elite_tier_installer' 'factory,refined_obsidian' 'xp:200;table:rare' -desc 'Elite circuits use reinforced alloy. Elite factories have 7 slots.'
Q 'ultimate' 'Ultimate Tier' 'mekanism:ultimate_control_circuit*4;mekanism:alloy_atomic*4;mekanism:ultimate_tier_installer' 'elite' 'xp:300;table:epic' -desc 'Atomic alloy is reinforced alloy infused with refined obsidian. The ultimate tier is the best in base Mekanism.'
Q 'extras' 'Mekanism Extras' 'mekanism_extras:absolute_control_circuit*2;mekanism_extras:absolute_tier_installer' 'ultimate' 'xp:400;table:epic' -desc @'
&bMekanism Extras&r goes beyond ultimate with &eAbsolute&r, &eSupreme&r, &eCosmic&r and &eInfinite&r tiers, new alloys, and the &eNaquadah&r reactor.

Check JEI for each new alloy.
'@
Q 'supreme' 'Supreme Tier' 'mekanism_extras:supreme_control_circuit*2;mekanism_extras:supreme_tier_installer' 'extras' 'xp:500;table:epic' -desc 'Keep climbing.'
Q 'cosmic' 'Cosmic Tier' 'mekanism_extras:cosmic_control_circuit*2;mekanism_extras:cosmic_tier_installer' 'supreme,sps' 'xp:600;table:epic' -desc 'Cosmic parts need antimatter-based alloys.'
Q 'infinite' 'To Infinity' 'mekanism_extras:infinite_control_circuit;mekanism_extras:infinite_tier_installer' 'cosmic,fusion' 'lvl:50;table:epic' -size 2 -shape 'gear' -desc 'Reach the Infinite tier. You have truly mastered Mekanism!'
Q 'naquadah' 'Naquadah' 'mekanism_extras:ingot_naquadah*4' 'extras' 'xp:300;table:rare' -opt -desc 'A new ore from Mekanism Extras. It powers the Naquadah reactor.'
Q 'naquadah_reactor' 'Naquadah Reactor' 'mekanism_extras:naquadah_reactor_controller;mekanism_extras:naquadah_reactor_casing*16' 'naquadah,fusion' 'xp:600;table:epic' -opt -desc 'An even stronger fusion-style reactor from Mekanism Extras.'

# ===== Logistics =====
Q 'transporter' 'Logistical Transporters' 'mekanism:basic_logistical_transporter*16' 'casing' 'xp:50' -desc 'Item pipes. Colour them with a Configurator to control where items go.'
Q 'sorter' 'Logistical Sorter' 'mekanism:logistical_sorter' 'transporter' 'xp:75' -desc 'Pulls items out of an inventory and sends them to the right place using filters (by item, tag, mod or material).'
Q 'restrictive' 'Diversion & Restriction' 'mekanism:diversion_transporter*4;mekanism:restrictive_transporter*4' 'transporter' 'xp:50' -opt -desc 'Diversion transporters turn on and off with redstone. Restrictive ones are only used when no other path exists.'
Q 'configurator' 'The Configurator' 'mekanism:configurator' 'casing' 'xp:50' -desc @'
Shift + scroll to switch modes:
- Configurate: change the side configuration of a machine.
- Empty: empty a machine's tanks.
- Rotate and Wrench: turn or pick up machines.
'@
Q 'card' 'Configuration Card' 'mekanism:configuration_card' 'configurator' 'xp:25' -opt -desc 'Copy the settings of one machine onto another.'
Q 'bin' 'Bins' 'mekanism:basic_bin*2' 'casing' 'xp:50' -desc 'A bin holds a huge stack of one item. Great for cobblestone and ores.'
Q 'qio' 'QIO Storage' 'mekanism:qio_drive_array;mekanism:qio_dashboard;mekanism:qio_drive_base*2' 'teleporter' 'xp:300;table:rare' -size 1.5 -desc @'
&eQuantum Item Orchestration&r is Mekanism's wireless storage system.

Put QIO drives in a Drive Array. Every QIO block on the same &efrequency&r shares the same storage, even across dimensions. Add Importers, Exporters and a Portable Dashboard.
'@
Q 'qio_more' 'QIO Automation' 'mekanism:qio_importer;mekanism:qio_exporter' 'qio' 'xp:150' -desc 'Importers and exporters move items between QIO and machines automatically.'
Q 'teleporter' 'Teleportation' 'mekanism:teleporter;mekanism:teleporter_frame*12;mekanism:teleportation_core' 'adv_circuit' 'xp:200;table:uncommon' -desc 'Build a frame around a Teleporter and give it a frequency. Two teleporters on the same frequency connect, across any distance.'
Q 'portable_tp' 'Portable Teleporter' 'mekanism:portable_teleporter' 'teleporter' 'xp:150' -desc 'Teleport to any of your teleporters from anywhere.'
Q 'miner' 'Digital Miner' 'mekanism:digital_miner' 'elite,sorter' 'xp:400;choice:rare' -size 1.5 -shape 'hexagon' -desc @'
The &eDigital Miner&r mines a huge radius without leaving a mess, and only takes what you tell it to.

Add filters (for example the tag &7c:ores&r) and plenty of Speed Upgrades. It needs a LOT of power.

&6Tip:&r Put the miner in a chunk that stays loaded, or claim and force-load it with FTB Chunks.
'@

# ===== Gear =====
Q 'disassembler' 'Atomic Disassembler' 'mekanism:atomic_disassembler' 'adv_circuit' 'xp:150' -desc 'A powered pickaxe, axe, shovel and hoe in one. It even has a vein-mining mode.'
Q 'jetpack' 'Jetpack' 'mekanism:jetpack' 'separator' 'xp:150;table:uncommon' -desc 'Fill it with hydrogen and fly! Switch between normal, hover and off with the mode key.'
Q 'scuba' 'Scuba Gear' 'mekanism:scuba_mask;mekanism:scuba_tank' 'separator' 'xp:75' -opt -desc 'Fill the tank with oxygen to breathe underwater.'
Q 'free_runners' 'Free Runners' 'mekanism:free_runners' 'adv_circuit' 'xp:75' -opt -desc 'Walk up full blocks and take no fall damage.'
Q 'robit' 'Robit' 'mekanism:robit' 'adv_circuit' 'xp:100' -opt -desc 'A little robot friend that follows you, picks up items, and can smelt and craft.'
Q 'hazmat' 'Hazmat Suit' 'mekanism:hazmat_mask;mekanism:hazmat_gown;mekanism:hazmat_pants;mekanism:hazmat_boots' 'dissolve' 'mekanism:geiger_counter;mekanism:dosimeter' -desc @'
&cRadiation is deadly.&r Uranium, nuclear waste and some gases are radioactive. A full hazmat suit protects you.

Use the &eGeiger Counter&r and &eDosimeter&r to keep an eye on radiation levels.
'@
Q 'modstation' 'Modification Station' 'mekanism:modification_station' 'ultimate' 'xp:150' -desc 'Install modules into the Meka-Tool and MekaSuit here.'
Q 'mekatool' 'Meka-Tool' 'mekanism:meka_tool;mekanism:module_base*4' 'modstation' 'xp:400;table:epic' -desc 'A fully modular tool: excavation, vein mining, attack, teleportation, silk touch and much more.'
Q 'mekasuit' 'MekaSuit' 'mekanism:mekasuit_helmet;mekanism:mekasuit_bodyarmor;mekanism:mekasuit_pants;mekanism:mekasuit_boots' 'mekatool,sps' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc @'
The best armor Mekanism has to offer. It runs on power and takes modules for flight, radiation shielding, magnet, gravitational modulation, auto-feeding and more.

Once you are wearing a full MekaSuit, very little in this world can hurt you.
'@

# ===== Nuclear =====
Q 'dyntank' 'Dynamic Tank' 'mekanism:dynamic_tank*26;mekanism:dynamic_valve*2' 'adv_circuit' 'xp:150' -desc 'A hollow multiblock tank for fluids or gases, from 3x3x3 up to 18x18x18.'
Q 'boiler' 'Thermoelectric Boiler' 'mekanism:boiler_casing*32;mekanism:boiler_valve*2;mekanism:superheating_element*4;mekanism:pressure_disperser*9' 'dyntank' 'xp:300;table:rare' -desc 'Heats water into steam with superheated sodium or resistive heaters. Feeds the Industrial Turbine.'
Q 'turbine' 'Industrial Turbine' 'mekanismgenerators:turbine_casing*40;mekanismgenerators:turbine_rotor*4;mekanismgenerators:turbine_blade*8;mekanismgenerators:rotational_complex;mekanismgenerators:electromagnetic_coil*4;mekanismgenerators:saturating_condenser*8' 'dyntank' 'xp:400;choice:rare' -size 1.5 -desc @'
Turns &bsteam&r into huge amounts of power. The taller the turbine, the more blades and power.

Use &bJust Enough Mekanism Multiblocks&r (in JEI) to see exactly how to build it.
'@
Q 'uranium' 'Yellow Cake' 'mekanism:yellow_cake_uranium*8' 'dissolve' 'xp:150' -desc 'Process uranium ore into yellow cake, then into uranium oxide and uranium hexafluoride.'
Q 'centrifuge' 'Isotopic Centrifuge' 'mekanism:isotopic_centrifuge' 'uranium' 'xp:150' -desc 'Separates uranium hexafluoride into &efissile fuel&r, and also processes nuclear waste.'
Q 'fission' 'Fission Reactor' 'mekanismgenerators:fission_reactor_casing*48;mekanismgenerators:fission_fuel_assembly*4;mekanismgenerators:control_rod_assembly;mekanismgenerators:fission_reactor_port*4;mekanismgenerators:fission_reactor_logic_adapter' 'centrifuge,hazmat,turbine' 'xp:600;table:epic' -size 2 -shape 'hexagon' -desc @'
Burns fissile fuel and makes enormous amounts of heat, which becomes steam for your turbine.

&cSafety rules:&r
- Always cool it with water or sodium.
- Use a &eLogic Adapter&r to SCRAM the reactor when it gets too hot or damaged.
- Never let waste pile up.
- Start with a very low burn rate!
{@pagebreak}
A meltdown destroys a large area and leaves radiation behind for a long time.
'@
Q 'waste' 'Nuclear Waste' 'mekanism:radioactive_waste_barrel*2' 'fission' 'xp:100' -desc 'Store waste in Radioactive Waste Barrels, or better, process it into plutonium and polonium.'
Q 'plutonium' 'Plutonium & Polonium' 'mekanism:pellet_plutonium*4;mekanism:pellet_polonium*4;mekanism:solar_neutron_activator' 'waste' 'xp:300;table:rare' -desc 'The Isotopic Centrifuge makes plutonium. The Solar Neutron Activator makes polonium.'
Q 'sps' 'Supercritical Phase Shifter' 'mekanism:sps_casing*48;mekanism:sps_port*2;mekanism:supercharged_coil;mekanism:pellet_antimatter' 'plutonium' 'xp:600;table:epic' -size 1.5 -desc 'The SPS turns polonium into &dantimatter&r using massive amounts of power. Antimatter is needed for the best gear.'
Q 'fusion' 'Fusion Reactor' 'mekanismgenerators:fusion_reactor_controller;mekanismgenerators:fusion_reactor_frame*60;mekanismgenerators:fusion_reactor_port*4;mekanismgenerators:laser_focus_matrix*12;mekanismgenerators:hohlraum' 'fission,laser' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc @'
The ultimate Mekanism power plant.

Fuel: &edeuterium&r (from heavy water) and &etritium&r (from lithium in the fission reactor). Ignite it with a fully charged &eLaser Amplifier&r and a filled &eHohlraum&r.

Once running, it makes so much power you will not know what to do with it.
'@
Q 'laser' 'Lasers' 'mekanism:laser;mekanism:laser_amplifier' 'ultimate' 'xp:150' -desc 'Lasers carry power through the air and are needed to ignite the fusion reactor.'
Q 'antiprotonic' 'Antiprotonic Nucleosynthesizer' 'mekanism:antiprotonic_nucleosynthesizer' 'sps' 'xp:400;table:epic' -opt -desc 'Uses antimatter to transmute items into rare materials.'
