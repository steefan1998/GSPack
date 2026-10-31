Chapter 'thaumaturge' 'Thaumaturge' 'thaumaturge:thaumonomicon' 'magic' 'Research the arcane: aspects, vis, essentia, infusion and the eldritch.'

# ===== Beginnings =====
Q 'crystals' 'Vis Crystals' 'thaumaturge:crystal_aer;thaumaturge:crystal_aqua;thaumaturge:crystal_ignis;thaumaturge:crystal_terra;thaumaturge:crystal_ordo;thaumaturge:crystal_perditio' '' 'xp:100;table:arcane' -size 1.5 -sub 'The six primal aspects' -desc @'
&bThaumaturge&r is a mod about magical research.

Everything in the world is made of &easpects&r. The six &eprimal&r aspects are:
&eAer&r (air), &bAqua&r (water), &cIgnis&r (fire), &2Terra&r (earth), &fOrdo&r (order) and &8Perditio&r (entropy).

Find a vis crystal of each aspect growing in caves.
'@
Q 'salis' 'Salis Mundus' 'thaumaturge:salis_mundus*4' 'crystals' 'xp:50' -size 1.5 -shape 'gear' -desc 'Combine crystals with redstone and flint to make &eSalis Mundus&r, the magical dust that turns ordinary blocks into magical ones.'
Q 'book' 'Thaumonomicon' 'thaumaturge:thaumonomicon' 'salis' 'xp:50' -desc @'
Use Salis Mundus on a bookshelf to make the &eThaumonomicon&r. All your research lives in this book.

&6Tip:&r Read it! The book tells you exactly what to research next and how to build each device.
'@
Q 'thaumometer' 'Thaumometer' 'thaumaturge:thaumometer' 'book' 'xp:50' -desc 'Scan blocks, items and creatures to learn their aspects. Scanning gives research points.'
Q 'scan' 'Curious Mind' 'thaumaturge:curio_arcane' 'thaumometer' 'xp:75' -opt -desc 'Curios found in dungeons and ruins give a lot of research knowledge when used.'
Q 'research' 'Research Table' 'thaumaturge:research_table;thaumaturge:scribing_tools' 'book' 'xp:100' -desc 'Solve research puzzles by linking aspects together on the research table. Each solved note unlocks new knowledge.'
Q 'workbench' 'Arcane Workbench' 'thaumaturge:arcane_workbench' 'book' 'xp:75' -desc 'Use Salis Mundus on a crafting table. Arcane recipes draw &evis&r from the aura of the chunk.'
Q 'aura' 'The Aura' 'check' 'workbench' 'xp:25' -icon 'thaumaturge:vis_resonator' -desc @'
Every chunk has an &eaura&r of vis. Arcane crafting uses it up, and it slowly recovers.

&cFlux&r is the pollution of magic. Too much flux causes nasty side effects, and eventually &5taint&r. Keep your workshop clean!
'@

# ===== Wands =====
Q 'wand' 'Your First Wand' 'thaumaturge:wand;thaumaturge:wand_cap_iron*2;thaumaturge:wand_rod_greatwood' 'workbench' 'xp:100;table:arcane' -size 1.5 -desc 'A wand channels vis. It is made from a &erod&r and two &ecaps&r. Better rods hold more vis, better caps reduce the vis cost.'
Q 'greatwood' 'Greatwood & Silverwood' 'thaumaturge:log_greatwood*8;thaumaturge:log_silverwood*4' 'crystals' 'xp:75' -desc 'Magical trees. Greatwood is common in forests, Silverwood is rare and full of order.'
Q 'better_caps' 'Better Caps' 'thaumaturge:wand_cap_gold*2;thaumaturge:wand_cap_thaumium*2' 'wand,thaumium' 'xp:100' -desc 'Gold and thaumium caps make spells cheaper.'
Q 'better_rods' 'Better Rods' 'thaumaturge:wand_rod_silverwood' 'wand,greatwood' 'xp:150' -desc 'A silverwood rod holds much more vis.'
Q 'staff' 'Staff' 'thaumaturge:staff_rod_greatwood' 'better_rods' 'xp:150' -opt -desc 'Staves are bigger than wands and hold even more vis.'
Q 'goggles' 'Goggles of Revealing' 'thaumaturge:goggles_revealing' 'thaumometer,wand' 'xp:100' -desc 'See aspects, aura nodes and essentia contents without scanning.'

# ===== Alchemy =====
Q 'cinnabar' 'Quicksilver' 'thaumaturge:raw_cinnabar*4;thaumaturge:quicksilver*4' 'research' 'xp:75' -desc 'Cinnabar ore is found deep underground. Smelt it for quicksilver.'
Q 'amber' 'Amber' 'thaumaturge:amber*4' 'research' 'xp:50' -desc 'Amber ore is used for warded glass and essentia storage.'
Q 'crucible' 'The Crucible' 'thaumaturge:crucible' 'research' 'xp:100;table:arcane' -size 1.5 -desc @'
Use Salis Mundus on a cauldron and fill it with water over a fire (or a nitor).

Throw items in and they melt into &eessentia&r. Then throw in a catalyst to make an alchemy recipe from that essentia.
'@
Q 'thaumium' 'Thaumium' 'thaumaturge:ingot_thaumium*8' 'crucible,cinnabar' 'xp:150;table:uncommon' -desc 'Iron infused with magic. The base metal for most Thaumaturge gear.'
Q 'brass' 'Brass' 'thaumaturge:ingot_brass*8' 'crucible' 'xp:50' -desc 'Brass is used for tubes, mechanisms and many devices.'
Q 'tallow' 'Tallow' 'thaumaturge:tallow*8' 'crucible' 'xp:25' -opt -desc 'Rendered fat, used for candles and seals.'
Q 'nitor' 'Nitor' 'thaumaturge:nitor_yellow*4' 'crucible' 'xp:50' -desc 'Magical light that never goes out. Also a great heat source for the crucible.'
Q 'alumentum' 'Alumentum' 'thaumaturge:alumentum*4' 'crucible' 'xp:50' -opt -desc 'An explosive magical fuel.'
Q 'jars' 'Warded Jars' 'thaumaturge:jar_normal*4;thaumaturge:label*4' 'amber' 'xp:75' -desc 'Store essentia in warded jars. Labels lock a jar to one aspect.'
Q 'alembic' 'Alembic' 'thaumaturge:alembic*2' 'jars' 'xp:50' -desc 'Collects essentia from a smelter below it.'
Q 'smelter' 'Essentia Smeltery' 'thaumaturge:smelter_basic;thaumaturge:tube*16;thaumaturge:bellows' 'alembic,brass' 'xp:150' -desc 'Automatically breaks items down into essentia. Bellows make it faster. Watch out for flux!'
Q 'tubes' 'Essentia Tubes' 'thaumaturge:tube_valve;thaumaturge:tube_filter;thaumaturge:tube_buffer' 'smelter' 'xp:75' -opt -desc 'Valves, filters and buffers let you build an essentia network.'
Q 'centrifuge' 'Essentia Centrifuge' 'thaumaturge:centrifuge' 'smelter' 'xp:100' -opt -desc 'Splits compound aspects into their parts.'
Q 'thaumatorium' 'Thaumatorium' 'thaumaturge:thaumatorium' 'smelter,infusion' 'xp:200;table:rare' -desc 'Automates crucible recipes using essentia from your jars.'
Q 'flux_scrubber' 'Flux Scrubber' 'thaumaturge:flux_scrubber' 'smelter' 'xp:100' -desc 'Cleans flux from the air before it causes trouble.'

# ===== Gear =====
Q 'thaumium_tools' 'Thaumium Tools' 'thaumaturge:thaumium_pickaxe;thaumaturge:thaumium_sword;thaumaturge:thaumium_axe' 'thaumium' 'xp:100' -desc 'Better than iron and very enchantable.'
Q 'thaumium_armor' 'Thaumium Armor' 'thaumaturge:thaumium_helm;thaumaturge:thaumium_chest;thaumaturge:thaumium_legs;thaumaturge:thaumium_boots' 'thaumium' 'xp:150;table:uncommon' -desc 'A full set of thaumium armor.'
Q 'robes' 'Thaumaturge''s Robes' 'thaumaturge:cloth_chest;thaumaturge:cloth_legs;thaumaturge:cloth_boots' 'thaumium' 'xp:100' -opt -desc 'Enchanted fabric robes that reduce vis costs.'
Q 'boots' 'Traveller''s Boots' 'thaumaturge:traveller_boots' 'infusion' 'xp:150' -desc 'Run faster, jump higher and step up full blocks.'
Q 'baubles' 'Rings, Amulets & Belts' 'thaumaturge:ring_apprentice;thaumaturge:amulet_vis' 'workbench' 'xp:100' -desc 'Magical jewellery. The Vis Amulet stores extra vis for your wand.'
Q 'elemental' 'Elemental Tools' 'thaumaturge:elemental_pickaxe;thaumaturge:elemental_sword' 'infusion' 'xp:200;table:rare' -desc 'Thaumium tools infused with the power of the elements, each with a special ability.'
Q 'grapple' 'Grapple Gun' 'thaumaturge:grapple_gun' 'infusion' 'xp:100' -opt -desc 'Swing around like a spider.'

# ===== Infusion =====
Q 'infusion' 'Infusion Altar' 'thaumaturge:infusion_matrix;thaumaturge:pedestal_arcane*8;thaumaturge:pillar_arcane*4' 'thaumium,smelter' 'xp:300;choice:rare' -size 2 -shape 'hexagon' -desc @'
&eInfusion&r combines a central item, items on pedestals and essentia into powerful artifacts.

Build the altar as shown in the Thaumonomicon, then activate the matrix with your wand.

&cInstability&r: an uneven altar is unstable, which can cause bad things to happen. Keep it symmetrical and use stabilizers like candles and skulls.
'@
Q 'stabilizer' 'Stabilizers' 'thaumaturge:stabilizer*4' 'infusion' 'xp:100' -desc 'Reduce infusion instability.'
Q 'matrix_up' 'Matrix Upgrades' 'thaumaturge:matrix_speed;thaumaturge:matrix_cost' 'infusion' 'xp:150' -opt -desc 'Make infusions faster or cheaper.'
Q 'charms' 'Charms' 'thaumaturge:verdant_charm;thaumaturge:voidseer_charm' 'infusion' 'xp:150' -opt -desc 'Powerful charms with permanent effects.'
Q 'charm_undying' 'Charm of Undying' 'thaumaturge:charm_undying' 'infusion' 'xp:200;table:rare' -desc 'Cheat death.'
Q 'vis_gen' 'Vis Generation' 'thaumaturge:vis_generator;thaumaturge:vis_battery' 'infusion' 'xp:150' -desc 'Turn vis into power, and store vis for later.'
Q 'lamps' 'Arcane Lamps' 'thaumaturge:lamp_arcane;thaumaturge:lamp_growth' 'infusion' 'xp:100' -opt -desc 'The Arcane Lamp lights up the area. The Lamp of Growth speeds up crops.'
Q 'bore' 'Arcane Bore' 'thaumaturge:arcane_bore' 'elemental' 'xp:200' -opt -desc 'A magical quarry turret.'

# ===== Foci =====
Q 'foci' 'Foci' 'thaumaturge:focus_1;thaumaturge:focus_pouch' 'infusion,wand' 'xp:200;table:uncommon' -desc 'A focus holds a spell for your wand. Keep extra foci in the pouch.'
Q 'manipulator' 'Focal Manipulator' 'thaumaturge:focal_manipulator' 'foci' 'xp:150' -desc 'Design your own spells: choose the effect, the shape and the modifiers.'
Q 'foci3' 'Master Focus' 'thaumaturge:focus_3' 'manipulator,void' 'xp:300;table:epic' -desc 'The strongest focus can hold the most complex spells.'

# ===== Golemancy =====
Q 'golem' 'Golemancy' 'thaumaturge:golem;thaumaturge:golem_bell' 'infusion' 'xp:200;table:rare' -desc 'Golems are your magical workers. Use the Golem Bell to pick them up and move them.'
Q 'golem_builder' 'Golem Press' 'thaumaturge:golem_builder' 'golem' 'xp:100' -desc 'Build golems from different materials, heads, arms and legs.'
Q 'seals' 'Seals' 'thaumaturge:seal_blank*4;thaumaturge:seal_harvest;thaumaturge:seal_pickup' 'golem' 'xp:150' -desc 'Seals tell golems what to do: harvest crops, pick up items, fill chests, guard an area, chop trees and more.'
Q 'adv_seals' 'Advanced Seals' 'thaumaturge:seal_pickup_advanced;thaumaturge:seal_fill_advanced' 'seals' 'xp:150' -opt -desc 'Advanced seals have filters and more options.'
Q 'mind' 'Golem Minds' 'thaumaturge:mind_clockwork;thaumaturge:mind_biothaumic' 'golem' 'xp:150' -opt -desc 'Smarter golems can do more complex jobs.'

# ===== The Eldritch =====
Q 'cultists' 'The Crimson Cult' 'kill:thaumaturge:cultist_knight*5;kill:thaumaturge:cultist_cleric*3' 'thaumium_armor' 'xp:250;table:rare' -icon 'thaumaturge:crimson_blade' -desc @'
The &4Crimson Cult&r worships the Outer Gods. Their portals appear in the world and their knights and clerics are dangerous.

Defeat their warriors.
'@
Q 'crimson' 'Crimson Gear' 'thaumaturge:crimson_blade;thaumaturge:crimson_plate_chest' 'cultists' 'xp:200' -desc 'Cultist gear is powerful, but wearing it whispers things into your mind.'
Q 'pech' 'Pech Trader' 'kill:thaumaturge:pech' 'research' 'xp:100' -opt -icon 'thaumaturge:pech_wand' -desc 'Pechs are little creatures that trade magical goods... or you could take their stuff.'
Q 'wisp' 'Wisps' 'kill:thaumaturge:wisp*3' 'aura' 'xp:100' -desc 'Wisps are floating balls of essentia that appear where magic is strong. They drop essentia crystals.'
Q 'taint' 'Taint' 'kill:thaumaturge:taint_crawler*5' 'flux_scrubber' 'xp:150' -icon 'thaumaturge:taint_fibre' -desc @'
When flux runs out of control, &5taint&r spreads across the land, corrupting blocks and creatures.

Clean it up before it consumes your base!
'@
Q 'mound' 'Barrow Mound' 'struct:thaumaturge:mound' 'research' 'xp:100;table:arcane' -icon 'thaumaturge:loot_urn_common' -desc 'Ancient burial mounds hide loot urns and curios.'
Q 'obelisk' 'Eldritch Obelisk' 'struct:thaumaturge:eldritch_obelisk' 'cultists' 'xp:200;table:rare' -icon 'thaumaturge:eldritch_obelisk' -desc 'Strange obelisks of the Outer Gods. Something powerful is connected to them.'
Q 'void' 'Void Metal' 'thaumaturge:ingot_void*8;thaumaturge:void_seed' 'infusion,obelisk' 'xp:300;table:epic' -size 1.5 -desc 'An eldritch metal that repairs itself. It makes the best tools and armor, but carries a warp...'
Q 'void_gear' 'Void Gear' 'thaumaturge:void_pickaxe;thaumaturge:void_sword;thaumaturge:void_chest' 'void' 'xp:300;table:epic' -desc 'Self-repairing, powerful, and a little bit dangerous.'
Q 'void_robe' 'Void Robes' 'thaumaturge:void_robe_helm;thaumaturge:void_robe_chest;thaumaturge:void_robe_legs' 'void_gear' 'xp:300;table:epic' -opt -desc 'Void robes combine strong protection with vis discounts.'
Q 'outer' 'The Outer Lands' 'dim:thaumaturge:outer_lands' 'void' 'xp:500;table:epic' -size 1.5 -shape 'hexagon' -icon 'thaumaturge:eldritch_eye' -desc @'
Use the eldritch knowledge you gathered to enter the &5Outer Lands&r, a maze of ancient eldritch ruins.

Guardians and golems protect the deepest secrets. Come with your best gear.
'@
Q 'guardians' 'Eldritch Guardians' 'kill:thaumaturge:eldritch_guardian*5' 'outer' 'xp:300;table:epic' -icon 'thaumaturge:eldritch_eye' -desc 'The silent guardians of the Outer Lands.'
Q 'golem_boss' 'Eldritch Golem' 'kill:thaumaturge:eldritch_golem' 'guardians' 'xp:400;table:epic' -icon 'thaumaturge:eldritch_stone' -desc 'A huge construct of eldritch stone.'
Q 'warden' 'The Eldritch Warden' 'kill:thaumaturge:eldritch_warden' 'golem_boss' 'xp:500;table:epic' -icon 'thaumaturge:eldritch_capstone' -desc 'The warden of the eldritch labyrinth.'
Q 'pearl' 'Primordial Pearl' 'thaumaturge:primordial_pearl' 'warden' 'lvl:40;table:epic' -size 2 -shape 'gear' -desc 'The rarest magical item of all, and the key to the most powerful creations. You have mastered Thaumaturge!'
Q 'causality' 'Causality Collapser' 'thaumaturge:causality_collapser' 'pearl' 'xp:300' -opt -desc 'A dangerous device that tears holes in reality.'
