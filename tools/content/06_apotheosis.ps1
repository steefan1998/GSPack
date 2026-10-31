Chapter 'apotheosis' 'Apotheosis' 'apotheosis:gem' 'magic' 'Enchanting, affix loot, gems, adventure and spawners.'

# ===== Enchanting =====
Q 'start' 'A New Kind of Enchanting' 'minecraft:enchanting_table' '' 'xp:50;minecraft:lapis_lazuli*32' -size 1.5 -shape 'gear' -sub 'Apothic Enchanting' -desc @'
&bApotheosis&r (with &bApothic Enchanting&r, &bApothic Spawners&r and &bApothic Attributes&r) changes enchanting, loot, gear and spawners.

The enchanting table now has three stats:
- &aEterna&r: the maximum enchanting level.
- &cQuanta&r: how random the results are (and how strong they can roll).
- &dArcana&r: how rare and how many enchantments you get.

Different bookshelves give different stats. Look at the stats in the table's GUI!
'@
Q 'stats' 'Reading the Stats' 'check' 'start' 'xp:25' -icon 'minecraft:bookshelf' -desc @'
Each shelf type adds Eterna, Quanta and/or Arcana, up to a maximum. To reach level 100+ enchants, you need the strongest shelves.

&6Tip:&r Hover over a shelf in JEI to see exactly what stats it gives. The &eSightshelf&r shows the stats in the world.
'@
Q 'hellshelf' 'Hellshelf' 'apothic_enchanting:hellshelf*4' 'start' 'xp:50' -desc 'Made from nether bricks. Adds Eterna and Quanta.'
Q 'seashelf' 'Seashelf' 'apothic_enchanting:seashelf*4' 'start' 'xp:50' -desc 'Made from prismarine. Adds Eterna and Arcana.'
Q 'stoneshelf' 'Stoneshelf' 'apothic_enchanting:stoneshelf' 'start' 'xp:25' -opt -desc 'A shelf that lowers Arcana and Eterna. Useful for fine-tuning.'
Q 'beeshelf' 'Beeshelf & Melonshelf' 'apothic_enchanting:beeshelf;apothic_enchanting:melonshelf' 'start' 'xp:25' -opt -desc 'Silly but useful: they change Quanta and Arcana in special ways.'
Q 'infused' 'Infused Shelves' 'apothic_enchanting:infused_hellshelf;apothic_enchanting:infused_seashelf' 'hellshelf,seashelf' 'xp:100;table:arcane' -desc @'
Infuse shelves by &eenchanting the shelf itself&r in an enchanting table with high enough stats. The table shows special "infusion" recipes when it can.

Infused shelves are much stronger.
'@
Q 'glowing' 'Glowing & Blazing' 'apothic_enchanting:glowing_hellshelf;apothic_enchanting:blazing_hellshelf' 'infused' 'xp:100' -opt -desc 'Special hellshelves with extra Quanta.'
Q 'crystal' 'Crystal & Heart Seashelf' 'apothic_enchanting:crystal_seashelf;apothic_enchanting:heart_seashelf' 'infused' 'xp:100' -opt -desc 'Special seashelves with extra Arcana.'
Q 'deepshelf' 'Deepshelf' 'apothic_enchanting:deepshelf*4' 'infused' 'xp:150' -desc 'Made from deep dark materials. A big step up in Eterna.'
Q 'sculkshelf' 'Echoing Sculkshelf' 'apothic_enchanting:echoing_sculkshelf;apothic_enchanting:soul_touched_sculkshelf' 'deepshelf' 'xp:200;table:rare' -desc 'Sculk shelves from the Deep Dark. Watch out for the Warden!'
Q 'endshelf' 'Endshelf' 'apothic_enchanting:endshelf*4' 'deepshelf' 'xp:200;table:rare' -desc 'The End holds the strongest shelves.'
Q 'draconic' 'Draconic Endshelf' 'apothic_enchanting:draconic_endshelf' 'endshelf' 'xp:300;table:epic' -desc 'Needs a dragon head. One of the very best shelves.'
Q 'sight' 'Sightshelf' 'apothic_enchanting:sightshelf' 'infused' 'xp:50' -desc 'Shows the stats of nearby shelves when you look at them.'
Q 'treasure' 'Treasure Shelf' 'apothic_enchanting:treasure_shelf' 'endshelf' 'xp:150' -desc 'Lets the table roll treasure enchantments like Mending and Frost Walker.'
Q 'filtering' 'Filtering Shelf' 'apothic_enchanting:filtering_shelf' 'infused' 'xp:100' -desc 'Put enchanted books in it to block those enchantments from the table.'
Q 'library' 'Enchantment Library' 'apothic_enchanting:library' 'infused' 'xp:150;table:arcane' -desc @'
Store enchanted books in the Library. It stores the enchantments, not the books, and you can take out exactly the enchantment and level you want.

Two books of the same level combine into the next level, up to the library's cap.
'@
Q 'ender_library' 'Ender Library' 'apothic_enchanting:ender_library' 'library,endshelf' 'xp:300;table:rare' -desc 'A library with a much higher level cap.'
Q 'tomes' 'Tomes' 'apothic_enchanting:scrap_tome;apothic_enchanting:improved_scrap_tome;apothic_enchanting:extraction_tome' 'start' 'xp:75' -desc @'
- &eScrap Tome&r: destroys an item and gives a book with some of its enchantments.
- &eImproved Scrap Tome&r: gives all enchantments.
- &eExtraction Tome&r: removes all enchantments without destroying the item.
'@
Q 'typed_tomes' 'Typed Tomes' 'apothic_enchanting:pickaxe_tome;apothic_enchanting:weapon_tome' 'start' 'xp:50' -opt -desc 'Typed tomes can be enchanted with enchantments for that tool type, then put on the tool in an anvil.'
Q 'materials' 'Enchanting Materials' 'apothic_enchanting:prismatic_web;apothic_enchanting:infused_breath;apothic_enchanting:warden_tendril' 'endshelf' 'xp:200;table:rare' -desc 'Rare materials for the best shelves and special recipes. The Warden Tendril comes from... the Warden.'
Q 'high_level' 'Level 50 Enchanting' 'levels:50' 'endshelf' 'xp:200;table:epic' -icon 'minecraft:experience_bottle' -desc 'Reach experience level 50. You will need it for the strongest enchantments!'

# ===== Affix gear =====
Q 'affix' 'Affix Loot' 'apotheosis:mysterious_scrap_metal*8' '' 'xp:75' -size 1.5 -sub 'Adventure Module' -desc @'
Monsters and chests can drop gear with a coloured name. These items have &eaffixes&r: bonus stats and special effects.

Rarity, from worst to best: &7Common&r, &aUncommon&r, &9Rare&r, &5Epic&r, &6Mythic&r and more.

Salvage affix items you do not need for rarity materials.
'@
Q 'elite_mobs' 'Elite Hunter' 'kill:minecraft:zombie*50' 'affix' 'xp:150;table:uncommon' -icon 'minecraft:iron_sword' -desc 'Monsters can spawn with affixes and better gear too. Kill 50 zombies and see what drops!'
Q 'salvage' 'Salvaging Table' 'apotheosis:salvaging_table' 'affix' 'xp:100' -desc 'Turns affix items into rarity materials based on their rarity.'
Q 'reforge' 'Reforging Table' 'apotheosis:simple_reforging_table' 'salvage' 'xp:150;table:rare' -desc 'Reroll the affixes of an item using rarity materials and gem dust. The full &eReforging Table&r handles higher rarities.'
Q 'reforge_full' 'Master Reforger' 'apotheosis:reforging_table' 'reforge' 'xp:200;table:rare' -desc 'Reforge items up to the highest rarities.'
Q 'augment' 'Augmenting Table' 'apotheosis:augmenting_table' 'reforge_full' 'xp:200' -desc 'Upgrade or reroll single affixes on your favourite gear.'
Q 'boss' 'Apotheosis Bosses' 'apotheosis:boss_summoner' 'affix' 'xp:250;table:rare' -desc @'
Bosses spawn naturally in the world (and can be summoned with the &eBoss Summoner&r). They are tough, have affix gear, and drop great loot.

&cBe prepared!&r
'@
Q 'towers' 'Adventure Towers' 'struct:apotheosis:tower_main' 'affix' 'xp:200;table:rare' -icon 'apotheosis:mysterious_scrap_metal' -desc 'Apotheosis adds towers with tough enemies and good loot. Find one!'
Q 'potion_charm' 'Potion Charm' 'apotheosis:potion_charm' 'affix' 'xp:100' -opt -desc 'A charm that gives you a potion effect permanently, using up potions as fuel.'

# ===== Gems =====
Q 'gems' 'Gems' 'apotheosis:gem*3' 'affix' 'xp:100;table:arcane' -size 1.5 -desc @'
Gems drop from monsters and chests. Put them into the &esockets&r of your gear for extra stats.

Each gem has a rarity, and gives different bonuses depending on the item type it is in (weapon, armor, tool, bow...).
'@
Q 'socket' 'Sigil of Socketing' 'apotheosis:sigil_of_socketing*2' 'gems' 'xp:75' -desc 'Use it in a smithing table to add a socket to an item.'
Q 'withdraw' 'Sigil of Withdrawal' 'apotheosis:sigil_of_withdrawal' 'socket' 'xp:50' -desc 'Removes the gems from an item without breaking them.'
Q 'gem_table' 'Gem Cutting Table' 'apotheosis:gem_cutting_table;apotheosis:gem_dust*16' 'gems' 'xp:100' -desc 'Combine identical gems to upgrade their rarity. Salvage unwanted gems into &eGem Dust&r.'
Q 'gem_case' 'Gem Case' 'apotheosis:gem_case' 'gems' 'xp:50' -opt -desc 'Stores your gem collection.'
Q 'enhance' 'Sigil of Enhancement' 'apotheosis:sigil_of_enhancement' 'gem_table,reforge' 'xp:300;table:epic' -desc 'Upgrades the gems that are already socketed into an item.'
Q 'sigils' 'More Sigils' 'apotheosis:sigil_of_rebirth;apotheosis:sigil_of_malice' 'enhance' 'xp:200' -opt -desc 'Special sigils that change affixes in powerful ways. Check JEI for what each one does.'
Q 'supremacy' 'Sigil of Supremacy' 'apotheosis:sigil_of_supremacy' 'enhance' 'xp:300;table:epic' -desc 'One of the strongest sigils.'
Q 'pearl' 'Godforged' 'apotheosis:godforged_pearl' 'supremacy' 'lvl:30;table:epic' -size 2 -shape 'gear' -desc 'One of the rarest materials in Apotheosis, used for the most powerful upgrades.'

# ===== Smithing =====
Q 'templates' 'Upgrade Templates' 'apotheosis:iron_upgrade_smithing_template' 'affix' 'xp:75' -opt -desc 'Apotheosis adds smithing templates that upgrade gear material while keeping the affixes.'

# ===== Spawners =====
Q 'spawner' 'Spawner Hunting' 'minecraft:spawner' '' 'xp:150' -size 1.5 -sub 'Apothic Spawners' -desc @'
In this pack, spawners can be mined with a &eSilk Touch&r pickaxe and placed anywhere.

&bApothic Spawners&r lets you upgrade them with &erunes&r. You can also right-click a spawner with a spawn egg to change its mob.
'@
Q 'runes' 'Spawner Runes' 'apotheosis:spawner_rune' 'spawner' 'xp:100;table:arcane' -desc 'The basic rune. Combine it with other items to make specific runes. Apply runes by right-clicking the spawner.'
Q 'rune_count' 'More Mobs' 'apotheosis:youthful_spawner_rune' 'runes' 'xp:75' -desc 'Runes can increase spawn count, max nearby mobs, spawn range, and speed. Check JEI for each rune''s effect.'
Q 'ignore_players' 'No Players Needed' 'apotheosis:ignore_players_spawner_rune' 'runes' 'xp:150;table:rare' -desc 'This rune lets the spawner work even when no player is nearby.'
Q 'ignore_light' 'Lights On' 'apotheosis:ignore_light_spawner_rune' 'runes' 'xp:100' -desc 'Mobs spawn even in full light.'
Q 'redstone_rune' 'Redstone Control' 'apotheosis:redstone_control_spawner_rune' 'runes' 'xp:75' -desc 'Turn the spawner on and off with redstone.'
Q 'silent' 'Silence' 'apotheosis:silent_spawner_rune' 'runes' 'xp:50' -opt -desc 'Silences the spawner and its mobs.'
Q 'no_ai' 'Mindless' 'apotheosis:no_ai_spawner_rune' 'ignore_players' 'xp:150' -desc 'Spawned mobs have no AI: they stand still. Perfect for a safe mob farm.'
Q 'spawner_upgrade' 'Spawner Upgrades' 'apotheosis:frontier_spawner_upgrade_rune;apotheosis:ascent_spawner_upgrade_rune' 'rune_count' 'xp:200;table:rare' -desc 'Upgrade runes raise the limits of a spawner''s stats. Collect the full set: Frontier, Ascent, Summit and Pinnacle.'
Q 'pinnacle' 'Pinnacle Spawner' 'apotheosis:summit_spawner_upgrade_rune;apotheosis:pinnacle_spawner_upgrade_rune' 'spawner_upgrade' 'lvl:20;table:epic' -size 1.5 -shape 'hexagon' -desc 'The highest spawner upgrade. Your mob farm is now unstoppable.'
