Chapter 'progression' 'GSPack Progression' 'minecraft:compass' '' 'The road through the pack: from your first crafting table to the Trophy of Infinity.' -showlines

# A hand-placed roadmap. Every milestone is a key item from another chapter; the lines show the order.
# Rows: technology (top), magic (middle), exploration (bottom). They meet again at Extended Crafting.

# ===== Early game =====
Q 'start' 'The Road Ahead' 'minecraft:crafting_table' '' 'xp:25' -size 1.5 -shape 'gear' -pos '0,0' -desc @'
This chapter is a &emap of GSPack&r. Each quest is a milestone from another chapter, and the lines show the order to reach them.

There are three roads, &9Technology&r, &aMagic&r and &6Exploration&r, and they all lead to the &dTrophy of Infinity&r. You do not have to finish one road before starting another: most players go back and forth.

The milestones complete on their own when you have the item. Open the chapter named in each quest for the details.
'@
Q 'iron' 'Iron Age' 'minecraft:iron_pickaxe' 'start' 'xp:25' -pos '1.6,0' -desc 'Get an iron pickaxe. See &eGetting Started&r.'
Q 'smeltery' 'Molten Metal' 'tconstruct:smeltery_controller' 'iron' 'xp:50' -pos '3.2,-1' -desc 'Build a Smeltery for alloys and better tools. See &eTinkers'' Construct&r.'
Q 'nether' 'Into the Nether' 'dim:minecraft:the_nether' 'iron' 'xp:50' -icon 'minecraft:netherrack' -pos '3.2,1' -desc 'Light a Nether portal and step through. See &eGetting Started&r.'
Q 'diamond' 'Diamonds!' 'minecraft:diamond_pickaxe' 'smeltery,nether' 'xp:50;table:common' -size 1.25 -pos '4.8,0' -desc 'A diamond pickaxe opens up the rest of the pack. Choose a road, or try all three!'

# ===== Technology =====
Q 'infuser' 'Machines' 'mekanism:metallurgic_infuser' 'diamond' 'xp:50' -pos '6.4,-3' -desc 'Your first Mekanism machine: steel, circuits and ore processing. See &eMekanism&r.'
Q 'ae2' 'Digital Storage' 'ae2:controller' 'infuser' 'xp:75' -pos '8,-3.8' -desc 'Store everything in an ME network, then automate crafting. See &eApplied Energistics 2&r.'
Q 'oritech' 'Animated Machines' 'oritech:foundry' 'infuser' 'xp:75' -pos '8,-2.2' -desc 'Oritech''s machines and addons. See &eOritech&r.'
Q 'elite_circuit' 'Elite Technology' 'mekanism:elite_control_circuit' 'ae2,oritech' 'xp:100;table:uncommon' -pos '9.6,-3' -desc 'Elite circuits are needed for the Elite Crafting Table. See &eMekanism&r.'
Q 'antimatter' 'Antimatter' 'mekanism:pellet_antimatter' 'elite_circuit' 'xp:150;table:rare' -size 1.25 -pos '11.2,-3' -desc 'The Supercritical Phase Shifter makes Antimatter, used in many endgame recipes. See &eMekanism&r.'

# ===== Magic =====
Q 'altar' 'Magical Farming' 'mysticalagriculture:infusion_altar' 'diamond' 'xp:50' -pos '6.4,0' -desc 'Grow resources with Mystical Agriculture. See &eMystical Agriculture&r and the &eSeed Codex&r.'
Q 'thaum' 'The Arcane' 'thaumaturge:thaumonomicon' 'altar' 'xp:75' -pos '8,-0.8' -desc 'Research aspects, vis and infusion. See &eThaumaturge&r.'
Q 'apotheosis' 'Gems & Affixes' 'apotheosis:gem_dust' 'altar' 'xp:75' -pos '8,0.8' -desc 'Better enchanting, gems and affix loot. See &eApotheosis&r.'
Q 'supremium' 'Supremium' 'mysticalagriculture:supremium_ingot' 'thaum,apotheosis' 'xp:100;table:uncommon' -pos '9.6,0' -desc 'Tier 5 essence: diamonds, emeralds and netherite from the field. See &eMystical Agriculture&r.'
Q 'insanium' 'Insanium' 'mysticalagradditions:insanium_ingot' 'supremium' 'xp:150;table:rare' -size 1.25 -pos '11.2,0' -desc 'Tier 6 crops and their Crux blocks, including the Allthemodium seeds. See &eMystical Agriculture&r.'

# ===== Exploration =====
Q 'end' 'The End' 'dim:minecraft:the_end' 'diamond' 'xp:50' -icon 'minecraft:end_stone' -pos '6.4,3' -desc 'Defeat the Ender Dragon. See &eGetting Started&r.'
Q 'aether' 'The Aether' 'aether_ii:zanite_gemstone' 'end' 'xp:75' -pos '8,2.2' -desc 'Travel to the floating islands above the clouds. See &eThe Aether II&r.'
Q 'twilight' 'Twilight Forest' 'twilightforest:naga_scale' 'end' 'xp:75' -pos '8,3.8' -desc 'Defeat the bosses of the Twilight Forest, starting with the Naga. See &eTwilight Forest&r.'
Q 'atm' 'Allthemodium' 'allthemodium:allthemodium_ingot' 'aether' 'xp:100;table:uncommon' -pos '9.6,2.2' -desc 'Mine Allthemodium in the Mining Dimension. See &eAllthemodium&r.'
Q 'moon' 'To the Moon' 'stellaris:desh_ingot' 'twilight' 'xp:100;table:uncommon' -pos '9.6,3.8' -desc 'Build a rocket and fly to the Moon for Desh. See &eStellaris&r.'
Q 'unob' 'Unobtainium' 'allthemodium:unobtainium_ingot' 'atm,moon' 'xp:150;table:rare' -size 1.25 -pos '11.2,3' -desc 'The rarest metal, from the End Highlands. See &eAllthemodium&r.'

# ===== Equivox: needs Allthemodium =====
Q 'equivox' 'Equivalent Exchange' 'equivox:philosophers_stone' 'atm' 'xp:100' -pos '9.6,1.4' -desc 'With Allthemodium you can make the Philosopher''s Stone and start with EMC. See &eEquivox&r.'
Q 'red_matter' 'Red Matter' 'equivox:red_matter' 'equivox,unob' 'xp:150;table:rare' -pos '11.2,1.5' -desc 'Dark Matter needs Vibranium, Red Matter needs Unobtainium. See &eEquivox&r.'

# ===== Endgame =====
Q 'elite_table' 'Extended Crafting' 'extendedcrafting:elite_table' 'antimatter,insanium,unob,red_matter' 'xp:200;table:epic' -size 1.5 -shape 'hexagon' -pos '12.9,0' -desc 'All roads meet here. The Elite Crafting Table needs materials from every road. See &eEndgame: Infinity&r.'
Q 'singularity' 'Creative Singularity' 'gspack:creative_singularity' 'elite_table' 'xp:300;table:epic' -size 1.5 -pos '14.6,0' -desc 'Five cores, one for each pillar of the pack, make a Creative Singularity. See &eEndgame: Infinity&r.'
Q 'ultimate' 'The Ultimate Singularity' 'extendedcrafting:ultimate_singularity' 'singularity' 'xp:400;table:epic' -size 1.5 -pos '16.3,0' -desc 'All 19 singularities and a Creative Singularity, in the Ultimate Crafting Table. See &eEndgame: Infinity&r.'
Q 'trophy' 'Trophy of Infinity' 'gspack:infinity_trophy' 'ultimate' 'lvl:10' -size 2.5 -shape 'gear' -pos '18.4,0' -desc 'The end goal of GSPack. See &eEndgame: Infinity&r, and the &eTrophy Checklist&r for every ingredient.'
