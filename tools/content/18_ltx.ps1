Chapter 'ltx' 'LTX Industries' 'ltxi:fabricator' 'tech' 'Chemistry, ore processing, fabrication, turrets and Epsilon gear.'

# ===== Getting started =====
Q 'tablet' 'Guide Tablet' 'ltxi:guide_tablet' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'LTX Industries' -desc @'
&bLTX Industries&r is a tech mod with chemistry, a deep ore processing chain, a fabrication system, defensive turrets and powerful Epsilon tools.

The &eGuide Tablet&r is the in-game manual. Read it whenever you are unsure how a machine works. Check JEI for every recipe.
'@
Q 'metals' 'New Metals' 'ltxi:titanium_ingot*8;ltxi:niobium_ingot*4;ltxi:silver_ingot*4' 'tablet' 'xp:75' -desc 'LTX adds titanium, niobium and silver ores. Smelt the raw ores for your first ingots.'
Q 'slatesteel' 'Slatesteel' 'ltxi:slatesteel_ingot*8' 'metals' 'xp:75' -desc 'A tough deepslate-based steel. Used for machine housings and gears.'
Q 'housing' 'Machine Housing' 'ltxi:machine_housing*4' 'slatesteel' 'xp:75' -desc 'The frame of every LTX machine. &6GSPack:&r it needs a Mekanism &eBasic Control Circuit&r instead of a titanium gear.'
Q 'power' 'Power' 'ltxi:portable_generator;ltxi:solar_panel' 'housing' 'xp:100' -desc 'Generators and solar panels power your machines.'
Q 'storage' 'Energy Storage' 'ltxi:small_voltaic_cell;ltxi:energy_cell_array' 'power' 'xp:100' -desc 'Voltaic cells are batteries. Energy Cell Arrays store power for your base.'
Q 'big_cells' 'Bigger Cells' 'ltxi:medium_voltaic_cell;ltxi:large_voltaic_cell' 'storage' 'xp:100' -opt -desc 'More capacity.'
Q 'config_cards' 'IO Config Cards' 'ltxi:items_io_config_card;ltxi:energy_io_config_card;ltxi:fluids_io_config_card' 'housing' 'xp:50' -opt -desc 'Copy input/output settings from one machine to another.'
Q 'digital' 'Digital Furnaces' 'ltxi:digital_furnace;ltxi:digital_blast_furnace;ltxi:digital_smoker' 'housing' 'xp:75' -desc 'Powered versions of the furnace, blast furnace and smoker.'
Q 'garden' 'Digital Garden' 'ltxi:digital_garden' 'digital' 'xp:100' -desc 'Grows plants indoors with power.'

# ===== Ore processing =====
Q 'grinder' 'Grinder' 'ltxi:grinder;ltxi:crushed_iron_ore*4' 'housing' 'xp:100' -size 1.5 -desc @'
LTX has a deep ore processing chain. Each step gives more output:
1. &eGrinder&r: ore -> crushed ore.
2. Washing: crushed ore -> washed ore.
3. Chunks, crystals and solutions for the highest yields.

Check the Guide Tablet and JEI for which machine handles each step.
'@
Q 'washed' 'Washed Ore' 'ltxi:washed_iron_ore*4' 'grinder' 'xp:75' -desc 'Wash crushed ore for more output. The Hydrosieve works with water.'
Q 'chunks' 'Ore Chunks' 'ltxi:iron_ore_chunk*4' 'washed' 'xp:100' -desc 'The next processing step.'
Q 'crystals' 'Ore Crystals' 'ltxi:iron_ore_crystal*4' 'chunks' 'xp:150;table:uncommon' -desc 'Crystallised ore gives even more.'
Q 'solutions' 'Ore Solutions' 'ltxi:iron_ore_solution' 'crystals,chem_lab' 'xp:200;table:rare' -desc 'Dissolve ore in acid for the highest yield of all.'
Q 'centrifuge' 'Electrocentrifuge' 'ltxi:electrocentrifuge' 'grinder' 'xp:100' -desc 'Separates mixtures into their parts.'
Q 'rare_ores' 'Rare Materials' 'ltxi:olivine*4;ltxi:fluorite*4' 'grinder' 'xp:75' -opt -desc 'Olivine, fluorite and other minerals from processing.'

# ===== Chemistry =====
Q 'mixer' 'Mixer' 'ltxi:mixer' 'housing' 'xp:75' -size 1.5 -desc 'Mixes items and fluids into new materials.'
Q 'chem_lab' 'Chem Lab' 'ltxi:chem_lab' 'mixer' 'xp:150;table:uncommon' -desc 'Makes acids, gases and chemicals: sulfuric acid, hydrochloric acid, hydrofluoric acid and more.'
Q 'scrubber' 'Atmospheric Scrubber' 'ltxi:atmospheric_scrubber' 'chem_lab' 'xp:100' -desc 'Pulls gases like nitrogen, oxygen and argon from the air.'
Q 'acids' 'Acids' 'ltxi:sulfuric_acid_bucket;ltxi:hydrochloric_acid_bucket' 'chem_lab' 'xp:100' -desc 'Strong acids for ore solutions and chemistry.'
Q 'polymer' 'Polymers' 'ltxi:polymer_sheet*4;ltxi:fluoropolymer_sheet*2' 'chem_lab' 'xp:100' -desc 'Plastics used in circuits and advanced parts.'
Q 'silicon' 'Silicon' 'ltxi:silicon_ingot*4;ltxi:silicon_plate*4' 'mixer' 'xp:75' -desc 'Silicon for circuit boards.'
Q 'rhenium' 'Rhenium' 'ltxi:rhenium_ingot*4' 'chem_lab' 'xp:200;table:rare' -desc 'A rare metal made through a long chemical chain. Check JEI.'
Q 'tungsten' 'Tungsten Slatesteel' 'ltxi:tungsten_slatesteel_ingot*4' 'rhenium' 'xp:200;table:rare' -desc 'An extremely tough alloy for the best gear.'
Q 'geo' 'Geo Synthesizer' 'ltxi:geo_synthesizer' 'chem_lab' 'xp:150' -opt -desc 'Synthesises minerals.'

# ===== Circuits & fabrication =====
Q 'press' 'Material Press' 'ltxi:material_press;ltxi:titanium_plate*4' 'housing' 'xp:75' -size 1.5 -desc 'Presses ingots into plates.'
Q 'circuit_board' 'Circuit Boards' 'ltxi:circuit_board*4' 'press,silicon' 'xp:100' -desc 'The base for every circuit.'
Q 't1' 'T1 Circuit' 'ltxi:t1_circuit*4' 'circuit_board' 'xp:75' -desc 'The first tier of LTX circuits.'
Q 't2' 'T2 Circuit' 'ltxi:t2_circuit*4' 't1' 'xp:100' -desc 'Tier 2.'
Q 't3' 'T3 Circuit' 'ltxi:t3_circuit*4' 't2,polymer' 'xp:150;table:uncommon' -desc 'Tier 3.'
Q 't4' 'T4 Circuit' 'ltxi:t4_circuit*4' 't3' 'xp:200;table:rare' -desc 'Tier 4.'
Q 't5' 'T5 Circuit' 'ltxi:t5_circuit*2;ltxi:elite_circuit_board' 't4,rhenium' 'xp:300;table:epic' -desc 'The best circuits.'
Q 'logic' 'Logic Cores' 'ltxi:logic_core*2;ltxi:nano_logic_core' 't3' 'xp:150' -desc 'Processing cores for advanced machines.'
Q 'fabricator' 'Fabricator' 'ltxi:fabricator;ltxi:empty_fabrication_blueprint*4' 't2' 'xp:150;table:uncommon' -desc @'
The &eFabricator&r builds complex items from a &eFabrication Blueprint&r. Record a recipe onto a blueprint, then the fabricator crafts it with power.

The &eAuto Fabricator&r does it automatically.
'@
Q 'auto_fab' 'Auto Fabricator' 'ltxi:auto_fabricator' 'fabricator,t3' 'xp:200;table:rare' -desc 'Automatic fabrication.'
Q 'assembler' 'Assembler' 'ltxi:assembler' 't2' 'xp:100' -desc 'Assembles tech parts from components.'
Q 'tech_parts' 'Tech Parts' 'ltxi:impulse_tech_part;ltxi:laser_tech_part;ltxi:optical_tech_part' 'assembler' 'xp:150' -desc 'Parts for turrets, tools and armor.'
Q 'arc_furnace' 'Arc Furnace' 'ltxi:arc_furnace' 't3' 'xp:150' -desc 'A powerful furnace for the toughest materials.'
Q 'injector' 'Voltaic Injector' 'ltxi:voltaic_injector' 't3' 'xp:150' -opt -desc 'Infuses items with energy.'

# ===== Gear & defense =====
Q 'upgrades' 'Upgrade Modules' 'ltxi:upgrade_station;ltxi:empty_upgrade_module*2' 't2' 'xp:100' -size 1.5 -desc 'Install upgrade modules into machines and gear at the &eUpgrade Station&r.'
Q 'epsilon' 'Epsilon Tools' 'ltxi:epsilon_drill;ltxi:epsilon_sword;ltxi:epsilon_axe' 'tech_parts' 'xp:250;table:rare' -desc 'Powered high-tech tools. Upgrade them with modules.'
Q 'epsilon_more' 'Epsilon Toolkit' 'ltxi:epsilon_shovel;ltxi:epsilon_hoe;ltxi:epsilon_shears;ltxi:epsilon_wrench' 'epsilon' 'xp:150' -opt -desc 'Complete your Epsilon set.'
Q 'wonderland' 'Wonderland Armor' 'ltxi:wonderland_head;ltxi:wonderland_body;ltxi:wonderland_legs;ltxi:wonderland_feet' 'epsilon,t4' 'xp:400;table:epic' -desc 'The armor of LTX Industries. Add modules for even more power.'
Q 'turrets' 'Turrets' 'ltxi:arc_turret' 'tech_parts' 'xp:200;table:uncommon' -desc 'Defend your base! The Arc Turret zaps nearby monsters.'
Q 'turrets2' 'Heavy Defense' 'ltxi:railgun_turret;ltxi:rocket_turret' 'turrets,t4' 'xp:300;table:rare' -desc 'Railgun and rocket turrets for serious threats.'
Q 'repair' 'Repair Station' 'ltxi:repair_station' 'epsilon' 'xp:100' -desc 'Repairs your gear.'
Q 'neon' 'Neon Lights' 'ltxi:ltx_lime_neon_light*8;ltxi:energy_blue_neon_light*8' 'housing' 'xp:25' -opt -desc 'Colourful neon lights for your base.'
Q 'fireworks' 'Light Show' 'ltxi:hanabi;ltxi:aurora' 'chem_lab' 'xp:50' -opt -desc 'Special chemicals for spectacular effects.'
Q 'infinite' 'Infinite Tanks' 'ltxi:infinite_water_tank;ltxi:infinite_lava_tank' 't4' 'xp:200;table:rare' -desc 'Never run out of water or lava. &6GSPack:&r both tanks are crafted in an &eAdvanced Crafting Table&r (Extended Crafting) from T4 circuits, portable tanks and buckets.'
Q 'master' 'LTX Engineer' 'ltxi:infinite_energy_cell_array' 't5,wonderland,auto_fab' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc 'An Infinite Energy Cell Array. You have mastered LTX Industries! &6GSPack:&r it is crafted in an &eElite Crafting Table&r (Extended Crafting) from Large Voltaic Cells, T5 circuits, an Energy Cell Array and Nano Logic Cores.'
