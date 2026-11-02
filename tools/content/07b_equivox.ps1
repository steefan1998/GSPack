Chapter 'equivox' 'Equivox' 'equivox:philosophers_stone' 'magic' 'Equivalent exchange: turn matter into EMC, and EMC into anything.'

# ===== The basics of EMC =====
Q 'stone' 'Philosopher''s Stone' 'equivox:philosophers_stone' 'allthemodium/atm_ingot' 'xp:100;table:arcane' -size 1.5 -shape 'gear' -sub 'Equivalent Exchange' -desc @'
&bEquivox&r is all about &eEMC&r: every item has an energy value. Trade items you do not need for EMC, and turn EMC into anything you have learned.

The &ePhilosopher's Stone&r is the first tool:
- Right-click blocks to &etransmute&r them (stone to grass, sand to cobblestone...).
- Use it in crafting recipes for alchemical conversions (for example 4 iron -> 1 gold).
- Press the &ecraft key&r to open a portable crafting grid.

&6GSPack:&r Equivox is made more expensive. The stone needs &eredstone blocks&r, &eglowstone&r and an &6Allthemodium Ingot&r: you need to reach Allthemodium first.
'@
Q 'emc' 'What is EMC?' 'check' 'stone' 'xp:25' -icon 'equivox:low_covalence_dust' -desc @'
Hover over any item to see its &eEMC&r value. Cobblestone is worth 1, iron 256, diamond 8192...

Items without an EMC value cannot be learned or burned. Tools and gear often have a value based on their recipe.
'@
Q 'covalence' 'Covalence Dust' 'equivox:low_covalence_dust*32;equivox:medium_covalence_dust*16;equivox:high_covalence_dust*8' 'stone' 'xp:75' -desc 'Made from cobblestone + charcoal, iron + redstone, and diamond + coal. Used to repair items and craft devices.'
Q 'repair' 'Repair Talisman' 'equivox:repair_talisman' 'covalence' 'xp:75' -desc 'Slowly repairs every damaged item in your inventory.'

# ===== Transmutation =====
Q 'table' 'Transmutation Table' 'equivox:transmutation_table' 'stone' 'xp:150;table:uncommon' -size 1.5 -desc @'
The heart of Equivox.
- Put an item in the &elearn&r slot to burn it into EMC and learn it.
- Click a learned item to create it, if you have enough EMC.

&6Tip:&r Learn common items early: cobblestone, wood, iron, coal, redstone. Later you can make them whenever you want.

&6GSPack:&r the table needs four &ePrudentium Essence&r from Mystical Agriculture instead of stone.
'@
Q 'tablet' 'Transmutation Tablet' 'equivox:transmutation_tablet' 'table,dark_matter' 'xp:150' -desc 'A portable Transmutation Table. &6GSPack:&r it needs Allthemodium Ingots.'
Q 'provider' 'Transmutation Interface' 'equivox:transmutation_provider' 'table,condenser' 'xp:200;table:rare' -opt -desc 'Lets pipes and other mods access your learned items and EMC.'
Q 'tome' 'Tome of Knowledge' 'equivox:tome' 'red_matter' 'xp:300;table:epic' -opt -desc 'Learn every item at once.'

# ===== Storage =====
Q 'alch_chest' 'Alchemical Chest' 'equivox:alchemical_chest' 'stone' 'xp:50' -desc 'A big chest. Some items (like rings and talismans) work while stored inside it.'
Q 'bag' 'Alchemical Bag' 'equivox:white_alchemical_bag' 'alch_chest' 'xp:50' -desc 'Portable storage linked to you. Every colour is a separate inventory.'
Q 'condenser' 'Energy Condenser' 'equivox:condenser_mk1' 'alch_chest,table' 'xp:200;table:rare' -size 1.5 -desc @'
Put an item in the &etarget&r slot and feed the condenser other items (or EMC). It turns them into copies of the target.

Combine it with collectors for an endless source of anything.

&6GSPack:&r crafted in an &eAdvanced Crafting Table&r (Extended Crafting) with &6Allthemodium Blocks&r.
'@
Q 'condenser2' 'Condenser MK2' 'equivox:condenser_mk2' 'condenser,red_matter' 'xp:300;table:rare' -desc 'Much faster condensing. &6GSPack:&r crafted in an &eElite Crafting Table&r (Extended Crafting) with a &5Compressed Unobtainium Block&r (All The Compressed).'
Q 'gem_density' 'Gem of Eternal Density' 'equivox:gem_of_eternal_density' 'dark_matter' 'xp:150' -desc 'Condenses items in your inventory into something more valuable.'

# ===== Power & fuel =====
Q 'fuels' 'Alchemical Fuels' 'equivox:alchemical_coal*16;equivox:mobius_fuel*8' 'stone' 'xp:75' -desc 'Alchemical Coal, Mobius Fuel and Aeternalis Fuel burn longer than coal and are used in many recipes.'
Q 'aeternalis' 'Aeternalis Fuel' 'equivox:aeternalis_fuel*8' 'fuels' 'xp:150' -desc 'The best fuel, needed to craft dark matter.'
Q 'collector' 'Energy Collector' 'equivox:collector_mk1*4' 'fuels' 'xp:150;table:uncommon' -desc @'
Collectors make EMC from light. More light = more EMC.

Put fuel in a collector to upgrade it (coal -> alchemical coal -> mobius -> aeternalis).
'@
Q 'relay' 'Anti-Matter Relay' 'equivox:relay_mk1' 'collector' 'xp:100' -desc 'Collects EMC from collectors around it and passes it on to condensers, with a small bonus.'
Q 'collector2' 'Collector MK2' 'equivox:collector_mk2*4;equivox:relay_mk2' 'collector,dark_matter' 'xp:200' -desc 'Better collectors and relays. &6GSPack:&r they need a Dark Matter Block instead of a single Dark Matter.'
Q 'collector3' 'Collector MK3' 'equivox:collector_mk3*4;equivox:relay_mk3' 'collector2,red_matter' 'xp:300;table:rare' -desc 'The best EMC production. &6GSPack:&r they need a Red Matter Block instead of a single Red Matter, and &eCompressed Glowstone&r / &eCompressed Obsidian&r (All The Compressed).'
Q 'klein' 'Klein Stars' 'equivox:klein_star_ein' 'covalence' 'xp:100' -desc 'Klein Stars store EMC. Many tools and rings drain EMC from them. Charge them in a condenser or collector.'
Q 'klein2' 'Bigger Stars' 'equivox:klein_star_zwei;equivox:klein_star_drei' 'klein' 'xp:150' -desc 'Combine four stars into a bigger one: Ein, Zwei, Drei, Vier, Sphere, Omega.'
Q 'klein_omega' 'Klein Star Omega' 'equivox:klein_star_omega' 'klein2,red_matter' 'xp:400;table:epic' -desc 'The biggest Klein Star.'

# ===== Dark & red matter =====
Q 'dark_matter' 'Dark Matter' 'equivox:dark_matter*8' 'aeternalis,allthemodium/vib_ingot' 'xp:250;table:rare' -size 1.5 -shape 'hexagon' -desc 'A very dense material made from Aeternalis Fuel and, in GSPack, a &3Vibranium Ingot&r (Allthemodium). It is the next big step.'
Q 'dm_pedestal' 'Dark Matter Pedestal' 'equivox:dm_pedestal' 'dark_matter' 'xp:150' -desc 'Place a ring or talisman on it to use its power on the area around it.'
Q 'dm_tools' 'Dark Matter Tools' 'equivox:dm_pick;equivox:dm_sword;equivox:dm_axe;equivox:dm_shovel' 'dark_matter' 'xp:250' -desc 'Unbreakable tools with &echarge levels&r (press the charge key) for more speed and area mining.'
Q 'dm_hammer' 'Dark Matter Hammer' 'equivox:dm_hammer' 'dm_tools' 'xp:100' -opt -desc 'Mines a 3x3 area.'
Q 'dm_armor' 'Dark Matter Armor' 'equivox:dm_helmet;equivox:dm_chestplate;equivox:dm_leggings;equivox:dm_boots' 'dark_matter' 'xp:300;table:rare' -desc 'Very strong armor.'
Q 'dm_furnace' 'Dark Matter Furnace' 'equivox:dm_furnace' 'dark_matter' 'xp:100' -opt -desc 'Smelts very fast and doubles ore output.'
Q 'red_matter' 'Red Matter' 'equivox:red_matter*8' 'dark_matter,allthemodium/unob_ingot' 'xp:400;table:epic' -size 1.5 -desc 'Even denser than dark matter. In GSPack it needs dark matter, &eAeternalis Fuel Blocks&r (9 fuel each) and &5Unobtainium Ingots&r (Allthemodium).'
Q 'rm_tools' 'Red Matter Tools' 'equivox:rm_pick;equivox:rm_sword;equivox:rm_katar;equivox:rm_morning_star' 'red_matter' 'xp:300' -desc 'The strongest tools in Equivox. The &eKatar&r and &eMorning Star&r combine several tools in one.'
Q 'rm_armor' 'Red Matter Armor' 'equivox:rm_helmet;equivox:rm_chestplate;equivox:rm_leggings;equivox:rm_boots' 'red_matter' 'xp:400;table:epic' -desc 'Better armor than dark matter.'
Q 'rm_furnace' 'Red Matter Furnace' 'equivox:rm_furnace' 'red_matter' 'xp:100' -opt -desc 'Even faster smelting.'

# ===== Rings & artifacts =====
Q 'iron_band' 'Iron Band' 'equivox:iron_band' 'covalence' 'xp:50' -desc 'The base for most rings.'
Q 'swrg' 'Swiftwolf''s Rending Gale' 'equivox:swiftwolf_rending_gale' 'iron_band,klein' 'xp:200;table:rare' -desc 'Flight! It uses EMC from your Klein Stars while you fly.'
Q 'black_hole' 'Black Hole Band' 'equivox:black_hole_band' 'iron_band' 'xp:150' -desc 'Pulls nearby items towards you.'
Q 'harvest' 'Harvest Goddess Band' 'equivox:harvest_goddess_band' 'iron_band' 'xp:150' -desc 'Makes plants around you grow.'
Q 'fire_water' 'Elemental Rings' 'equivox:ignition_ring;equivox:zero_ring' 'iron_band' 'xp:150' -opt -desc 'Ignition Ring sets things on fire, Zero Ring freezes water and slows enemies.'
Q 'amulets' 'Elemental Amulets' 'equivox:evertide_amulet;equivox:volcanite_amulet' 'dark_matter' 'xp:200' -desc 'Create water or lava, and walk on them.'
Q 'arcana' 'Ring of Arcana' 'equivox:arcana_ring' 'rings_all' 'xp:300;table:epic' -desc 'Combines the powers of the four elemental rings.'
Q 'rings_all' 'Ring Collector' 'check' 'swrg,black_hole,harvest,fire_water' 'xp:100' -icon 'equivox:iron_band' -desc 'You have collected the main rings.'
Q 'watch' 'Watch of Flowing Time' 'equivox:watch_of_flowing_time' 'dark_matter' 'xp:250;table:rare' -desc 'Speeds up machines, crops and furnaces around you. Can also slow time down.'
Q 'mercurial' 'Mercurial Eye' 'equivox:mercurial_eye' 'dark_matter' 'xp:150' -opt -desc 'A building tool that places and transmutes blocks.'
Q 'interdiction' 'Interdiction Torch' 'equivox:interdiction_torch*4' 'dark_matter' 'xp:100' -desc 'Pushes monsters away. Perfect around your base.'
Q 'destruction' 'Destruction Catalyst' 'equivox:destruction_catalyst' 'dark_matter' 'xp:150' -opt -desc 'Destroys blocks in a big area in front of you.'
Q 'stones' 'Stones of Power' 'equivox:body_stone;equivox:soul_stone;equivox:life_stone;equivox:mind_stone' 'red_matter' 'xp:300;table:epic' -desc @'
- &eBody Stone&r: restores hunger.
- &eSoul Stone&r: restores health.
- &eLife Stone&r: both!
- &eMind Stone&r: stores XP.
'@
Q 'void_ring' 'Void Ring' 'equivox:void_ring' 'black_hole,red_matter' 'xp:200' -opt -desc 'Teleports you short distances and deletes junk items.'
Q 'archangel' 'Archangel''s Smite' 'equivox:archangel_smite' 'red_matter' 'xp:200' -opt -desc 'A bow that fires homing arrows.'
Q 'nova' 'Nova Catalyst' 'equivox:nova_catalyst' 'red_matter' 'xp:150' -opt -desc 'A very powerful explosive. &cDo not use it near your base!&r'

# ===== Endgame =====
Q 'gem_armor' 'Gem Armor' 'equivox:gem_helmet;equivox:gem_chestplate;equivox:gem_leggings;equivox:gem_boots' 'rm_armor,klein_omega' 'lvl:50;table:epic' -size 2 -shape 'gear' -desc @'
The ultimate armor of Equivox. Each piece has special powers: night vision, flight, fire immunity, explosions and more.

You have mastered Equivalent Exchange!
'@
