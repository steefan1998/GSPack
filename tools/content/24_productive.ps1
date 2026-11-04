# Item IDs and guide instructions checked against the Dev Build jars.
Chapter 'productivebees' 'Productive Bees' 'productivebees:advanced_oak_beehive' 'magic' 'Build an apiary, breed resource bees and automate their harvest.' -showlines
Q 'start' 'A Productive Apiary' 'productivebees:book' '' 'xp:50;table:common' -size 1.5 -desc 'Productive Bees builds on vanilla bees. Read this guide and use JEI for bee breeding, conversion and flowering requirements. Solitary bees use nests; hive bees use advanced hives.'
Q 'honey' 'Honey and Combs' 'minecraft:honey_bottle;minecraft:honeycomb' 'start' 'xp:25' -desc 'Begin with a vanilla bee nest. Use a campfire safely below a vanilla nest before collecting honey or combs. Honey helps you craft your first cages.'
Q 'cage' 'Bring a Bee Home' 'productivebees:bee_cage' 'honey' 'xp:50' -desc 'Right-click a bee to capture it. Right-click the ground to release it. Keep spare cages when exploring; a cage alone does not prove a particular bee species is inside.'
Q 'sturdy' 'Sturdy Cages' 'productivebees:sturdy_bee_cage' 'cage' 'xp:50' -opt -desc 'A sturdier alternative for moving your bees. Check JEI for its recipe.'
Q 'locator' 'Find the Nests' 'productivebees:nest_locator' 'cage' 'xp:50' -opt -desc 'Use the Nest Locator and JEI to find solitary bees. Different bees prefer different nest materials and environments.'
Q 'wood_nest' 'Woodland Residents' 'productivebees:oak_wood_nest' 'cage' 'xp:50' -desc 'Prepare a wooden nest. JEI shows which bee it attracts, the required location and which treat to use.'
Q 'stone_nest' 'Mining Bees' 'productivebees:stone_nest' 'cage' 'xp:50' -opt -desc 'Stone nests attract a different family of bees. Read the nest spawning page in JEI before placing it.'
Q 'treat' 'Honey Treats' 'productivebees:honey_treat' 'honey' 'xp:50' -desc 'Honey Treats are used throughout bee keeping. Their uses include attracting bees to compatible nests; JEI documents the exact interaction.'
Q 'hive' 'The Advanced Hive' 'productivebees:advanced_oak_beehive' 'cage' 'xp:100;table:uncommon' -size 1.5 -desc 'House hive bees in an Advanced Hive. Its GUI shows residents and outputs. Unlike a vanilla hive, it does not require a campfire for harvesting.'
Q 'expansion' 'Room for Five' 'productivebees:expansion_box_oak' 'hive' 'xp:75' -desc 'Attach the matching expansion box above your advanced hive. The guide describes increased capacity and upgrade slots.'
Q 'flowers' 'The Right Flower' 'check' 'hive' 'xp:25' -icon 'minecraft:poppy' -desc 'Every resource bee has a flowering requirement. It may need a material block rather than a flower. Check its JEI flowering page and place that block within reach.'
Q 'feeder' 'Feeding Slab' 'productivebees:feeder' 'hive' 'xp:50' -desc 'The Feeding Slab supplies compatible flowering materials. Check the guide for placement, especially before using a simulated hive.'
Q 'centrifuge' 'Process the Combs' 'productivebees:centrifuge' 'hive' 'xp:100;table:uncommon' -size 1.5 -desc 'Process resource combs in a Centrifuge. JEI shows the resources, honey and wax produced by each comb.'
Q 'wax' 'Useful Beeswax' 'productivebees:wax' 'centrifuge' 'xp:25' -desc 'Keep the wax from processing. It is useful for hive upgrades and other recipes.'
Q 'powered' 'Powered Processing' 'productivebees:powered_centrifuge' 'centrifuge' 'xp:100' -desc 'Supply FE and automate comb input and resource output. Check the machine GUI for configuration.'
Q 'heated' 'Heated Centrifuge' 'productivebees:heated_centrifuge' 'powered' 'xp:150;table:rare' -desc 'Expand processing with a Heated Centrifuge. Check JEI for recipes that use it and its power needs.'
Q 'breeding' 'Breed New Species' 'productivebees:breeding_chamber' 'hive' 'xp:100;table:uncommon' -desc 'Automate compatible bee breeding. JEI lists the parent species and breeding food; not every pair produces a new bee.'
Q 'incubator' 'The Next Generation' 'productivebees:incubator' 'breeding' 'xp:75' -desc 'Use an Incubator for the offspring supported by its recipes. Check its inventory and the guide for input requirements.'
Q 'genes' 'Bee Genetics' 'productivebees:gene_bottle' 'breeding' 'xp:75' -opt -desc 'Genes describe traits such as productivity and activity. Follow the genetics guide before extracting traits from valuable bees.'
Q 'indexer' 'Organise Your Genes' 'productivebees:gene_indexer' 'genes' 'xp:100' -opt -desc 'Store and organise the genetic material used in your breeding programme.'
Q 'upgrade' 'Hive Upgrades' 'productivelib:upgrade_base' 'expansion' 'xp:75' -desc 'Productive Lib supplies the shared upgrade items. Use JEI to inspect productivity, speed, range and simulation upgrades.'
Q 'productivity' 'More per Trip' 'productivelib:upgrade_productivity' 'upgrade' 'xp:100' -opt -desc 'Install a Productivity Upgrade in a compatible hive or machine. Read its tooltip: effects depend on the machine.'
Q 'simulation' 'A Simulated Apiary' 'productivelib:upgrade_simulator' 'upgrade' 'xp:150;table:rare' -opt -desc 'Simulation keeps production inside the hive. Follow the guide for feeding-slab placement and the bee-specific flowering material.'
foreach ($bee in @('iron','gold','diamond','emerald','redstone','coal','obsidian','blazing')) {
    Q "bee_$bee" ("Specialist: " + (Get-Culture).TextInfo.ToTitleCase($bee)) 'check' 'breeding' 'xp:50' -opt -icon 'productivebees:bee_cage' -desc "Use JEI to obtain a $bee bee, give it the required flowering material and verify that its combs are being produced. Tick this after your setup works. This is a guided milestone, not automatic species detection."
}
Q 'automation' 'A Working Resource Apiary' 'check' 'powered,breeding' 'xp:200;table:rare' -size 1.5 -desc 'Automate comb extraction, centrifuging and storage. Protect your bees, keep their flowering materials available and provide enough power. Tick this once your apiary produces resources without manual transfers.'

Chapter 'productivetrees' 'Productive Trees' 'productivetrees:silver_lime_sapling' 'magic' 'Pollinate trees, discover new species and build a productive orchard.' -showlines
Q 'start' 'Grow Your Collection' 'check' '' 'xp:50;table:common' -size 1.5 -icon 'minecraft:oak_sapling' -desc 'Grow compatible trees close to bees and keep flowers nearby. Productive Trees uses pollination to discover new species. JEI shows the parent combinations; a Spyglass helps reveal pollinated leaves.'
Q 'spyglass' 'Look at the Leaves' 'minecraft:spyglass' 'start' 'xp:25' -opt -desc 'Use a Spyglass to identify pollinated leaves. Collect the resulting saplings and save a spare before experimenting.'
Q 'pollen' 'Collect Pollen' 'productivetrees:pollen' 'start' 'xp:50' -desc 'Use species-specific pollen on compatible leaves to pollinate them manually. Look up both parents in JEI instead of guessing combinations.'
Q 'sieve' 'Pollen from Your Apiary' 'productivelib:upgrade_pollen_sieve' 'pollen' 'xp:75' -opt -desc 'Install a Pollen Sieve Upgrade in an expanded advanced hive. Nearby trees supply pollen; range upgrades extend the collection area. Additional sieve upgrades do not increase yield.'
Q 'hybrid' 'Your First Hybrid' 'productivetrees:silver_lime_sapling' 'start' 'xp:100;table:uncommon' -size 1.5 -desc 'Use the Tree Pollination recipes in JEI to discover Silver Lime. Keep parent trees close enough to the hive and make sure bees can work.'
Q 'alder' 'Alder' 'productivetrees:alder_sapling' 'hybrid' 'xp:50' -desc 'Discover Alder through the combination shown in JEI. Plant and label a specimen in your collection.'
Q 'sawmill' 'Timber Processing' 'productivetrees:sawmill' 'hybrid' 'xp:75' -desc 'The Sawmill processes wood. Check JEI and its GUI for compatible inputs and outputs.'
Q 'stripper' 'Remove the Bark' 'productivetrees:stripper' 'sawmill' 'xp:50' -desc 'The Stripper removes bark from wood and requires an axe to operate.'
Q 'wood_worker' 'Wood Workshop' 'productivetrees:wood_worker' 'sawmill' 'xp:75' -desc 'Use the Wood Worker for the wood-processing recipes available in JEI.'
foreach ($tree in @(
    @('walnut','Walnut'), @('sweet_chestnut','Sweet Chestnut'), @('banana','Banana'),
    @('lemon','Lemon'), @('orange','Orange'), @('sugar_maple','Sugar Maple'),
    @('rubber_tree','Rubber Tree'), @('red_maple','Red Maple'), @('mahogany','Mahogany'),
    @('teak','Teak'), @('balsa','Balsa'), @('black_ember','Black Ember'),
    @('soul_tree','Soul Tree'), @('time_traveller','Time Traveller')
)) {
    Q ("tree_" + $tree[0]) $tree[1] ("productivetrees:" + $tree[0] + '_sapling') 'hybrid' 'xp:75' -opt -desc ("Discover " + $tree[1] + ' using the parent species and pollination conditions shown in JEI. Save a spare sapling and plant a labelled specimen.')
}
Q 'fruit' 'Orchard Harvest' 'productivetrees:banana;productivetrees:lemon;productivetrees:orange' 'hybrid' 'xp:100;table:uncommon' -desc 'Harvest fruit from your orchard. Inspect each tree in JEI to learn which produce it supplies.'
Q 'nuts' 'Nuts for the Pantry' 'productivetrees:walnut;productivetrees:roasted_walnut' 'tree_walnut' 'xp:50' -opt -desc 'Harvest Walnuts and process them using their JEI recipe.'
Q 'rubber' 'Renewable Rubber' 'productivetrees:rubber;productivetrees:cured_rubber' 'tree_rubber_tree' 'xp:75' -opt -desc 'Check the Rubber Tree and processing recipes in JEI for collecting and curing rubber.'
Q 'maple' 'Something Sweet' 'productivetrees:maple_syrup' 'tree_sugar_maple' 'xp:75' -opt -desc 'Follow the maple sap and syrup recipes shown in JEI.'
Q 'collection' 'An Arboretum to Be Proud Of' 'check' 'hybrid,sawmill,fruit' 'xp:200;table:rare' -size 1.5 -desc 'Build a labelled arboretum with several species, a pollination area and a workshop. Tick this after testing that you can repeat a successful cross and keep spare saplings.'

Chapter 'productivefarming' 'Productive Farming' 'productivefarming:farm_controller' 'magic' 'Discover crops, experiment with pollination and automate your harvest.' -showlines
Q 'start' 'A More Productive Farm' 'check' '' 'xp:50;table:common' -size 1.5 -icon 'minecraft:wheat' -desc 'Productive Farming adds crops, mutations and flowers. Use JEI Crop Mutation and Crop Fruiting pages for this pack. Start a small, well-lit farm and save spare seeds.'
Q 'first_seeds' 'First New Seeds' 'productivefarming:barley_seeds' 'start' 'xp:50' -desc 'Obtain Barley Seeds using the recipe or source shown in JEI. Plant them and wait for a mature harvest.'
Q 'barley' 'Harvest the Barley' 'productivefarming:barley' 'first_seeds' 'xp:50' -desc 'Collect your first Barley. Keep seeds available so your farm can be replanted.'
Q 'pollen' 'Crop Pollination' 'productivefarming:pollen' 'start' 'xp:75' -desc 'Use the Crop Mutation pages in JEI to learn the relevant pollen and target crop. Crop pollen and tree pollen belong to different mods.'
Q 'mutation' 'A Successful Mutation' 'check' 'pollen' 'xp:100;table:uncommon' -desc 'Choose a mutation from JEI, prepare its required plants and pollen, and harvest the resulting crop. Tick this once you have reproduced a mutation; this task does not inspect crop genetics.'
Q 'flowers' 'A Flower Garden' 'productivefarming:blue_borage' 'start' 'xp:50' -opt -desc 'Build a flower patch alongside the farm. Check JEI for flower sources and any available breeding recipes.'
foreach ($crop in @(
    @('rice','Rice'), @('oats','Oats'), @('rye','Rye'), @('onion','Onion'), @('garlic','Garlic'),
    @('leek','Leek'), @('cabbage','Cabbage'), @('broccoli','Broccoli'), @('cauliflower','Cauliflower'),
    @('spinach','Spinach'), @('cucumber','Cucumber'), @('eggplant','Eggplant'),
    @('black_beans','Black Beans'), @('sugar_beet','Sugar Beet'), @('cotton','Cotton'),
    @('strawberry','Strawberry'), @('blueberry','Blueberry'), @('raspberry','Raspberry'),
    @('basil','Basil'), @('black_pepper','Black Pepper'), @('black_tea','Black Tea')
)) {
    Q ("crop_" + $crop[0]) $crop[1] ("productivefarming:" + $crop[0]) 'start' 'xp:50' -opt -desc ('Collect one ' + $crop[1] + '. Use JEI for its seed, harvest, fruiting or mutation requirements. Some plants need special support or space: read their tooltips before planting.')
}
Q 'controller' 'Build the Farm' 'productivefarming:farm_controller' 'barley' 'xp:100;table:uncommon' -size 1.5 -desc 'Craft the Farm Controller. Follow the structure information and configuration in its interface before adding crops; a controller item alone is not a complete farm.'
Q 'hatch' 'Farm Access' 'productivefarming:farm_hatch' 'controller' 'xp:75' -desc 'Add a Farm Hatch as required by the farm structure. Use its interface for the supported input and output operations.'
Q 'storage' 'Store the Harvest' 'productivefarming:barley_seeds_bag;productivefarming:onion_crate' 'barley' 'xp:50' -opt -desc 'Seed bags and produce crates compact your supplies. JEI shows their packing and unpacking recipes.'
Q 'automation' 'The Working Farm' 'check' 'controller,hatch' 'xp:150;table:rare' -desc 'Complete a valid farm structure and verify that it harvests a supported crop. Provide the inputs requested by its interface and keep output storage available.'
Q 'collection' 'A Diverse Harvest' 'check' 'mutation,automation' 'xp:200;table:rare' -size 1.5 -desc 'Grow several crop families, keep spare planting material and test one repeatable mutation. Tick this after your farm and storage are working reliably.'
