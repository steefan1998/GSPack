Chapter 'roots' 'Roots Classic' 'rootsclassic:staff' 'magic' 'Nature magic: herbs, powders, spells and rituals.'

# ===== Herbalism =====
Q 'tablet' 'Runic Tablet' 'rootsclassic:runic_tablet' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'The magic of nature' -desc @'
&bRoots Classic&r is druid magic: you gather herbs and bark, grind them into powders, and use them for spells and rituals.

The &eRunic Tablet&r is the guide to everything in the mod. Read it whenever you are stuck.
'@
Q 'knife' 'Bark Knife' 'rootsclassic:bark_knife;rootsclassic:oak_bark*8' 'tablet' 'xp:50' -desc 'Use the Bark Knife on logs to peel off &ebark&r. Every type of wood gives its own bark, and many recipes need it.'
Q 'herbs' 'Herb Gathering' 'rootsclassic:old_root*4;rootsclassic:verdant_sprig*4' 'tablet' 'xp:50' -desc 'Roots uses plants from all over the world. Press U on these herbs in JEI to see where they come from.'
Q 'berries' 'Wild Berries' 'rootsclassic:elderberry*4;rootsclassic:blackcurrant*4' 'herbs' 'xp:25' -opt -desc 'Berries make healthy food, like Fruit Salad and Rooty Stew.'
Q 'mortar' 'Mortar & Pestle' 'rootsclassic:mortar;rootsclassic:pestle' 'knife,herbs' 'xp:75' -desc 'Grind herbs, bark and other ingredients into powders. JEI shows each recipe.'
Q 'growth' 'Growth Powder' 'rootsclassic:growth_powder*8' 'mortar' 'xp:50' -desc 'Use it on dirt to grow grass.'
Q 'poultice' 'Healing Poultice' 'rootsclassic:healing_poultice*2' 'mortar' 'xp:50' -opt -desc 'A herbal remedy: eat it for instant healing.'

# ===== Spells =====
Q 'spell' 'Spell Powder' 'rootsclassic:spell_powder' 'mortar' 'xp:100;table:arcane' -desc 'Spell Powder holds a spell. Which spell depends on the ingredients you grind into it: see the Runic Tablet.'
Q 'staff' 'The Staff' 'rootsclassic:staff;rootsclassic:imbuer' 'spell' 'xp:150;table:arcane' -size 1.5 -desc 'Use Spell Powder on the &eImbuer&r to create a &eStaff&r that casts that spell. Each staff has a number of uses.'
Q 'crystal_staff' 'Crystal Staff' 'rootsclassic:crystal_staff' 'staff' 'xp:150' -opt -desc 'An advanced staff for the most powerful magic. See the Runic Tablet for how to make it.'

# ===== Rituals =====
Q 'altar' 'Altar & Brazier' 'rootsclassic:altar;rootsclassic:brazier' 'mortar' 'xp:100;table:arcane' -desc 'Rituals are performed at an &eAltar&r. The &eBrazier&r burns incense during the ritual. Each ritual needs its own ingredients and standing stones: see the Runic Tablet.'
Q 'stones' 'Standing Stones' 'rootsclassic:mundane_standing_stone*4;rootsclassic:attuned_standing_stone*4' 'altar' 'xp:100' -desc 'Standing stones around the altar power rituals.'
Q 'magic_stones' 'Living Stones' 'rootsclassic:grower_standing_stone;rootsclassic:healer_standing_stone' 'stones' 'xp:100' -opt -desc 'Some standing stones have a lasting effect: the Grower Stone boosts plant growth and the Healer Stone gives regeneration nearby.'

# ===== Gear =====
Q 'living_tools' 'Living Tools' 'rootsclassic:living_pickaxe;rootsclassic:living_sword' 'altar' 'xp:100' -desc 'Living tools are made with a ritual and repair themselves.'
Q 'sylvan' 'Sylvan Robes' 'rootsclassic:sylvan_hood;rootsclassic:sylvan_robe;rootsclassic:sylvan_tunic;rootsclassic:sylvan_boots' 'living_tools' 'xp:150;table:rare' -desc 'Druid clothing, made with a ritual.'
Q 'wildwood' 'Wildwood Armor' 'rootsclassic:wildwood_mask;rootsclassic:wildwood_plate;rootsclassic:wildwood_leggings;rootsclassic:wildwood_boots' 'living_tools' 'xp:200;table:rare' -size 1.5 -desc 'Wildwood armor, made with a ritual. See the Runic Tablet for what it needs.'
