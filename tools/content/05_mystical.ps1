Chapter 'mystical' 'Mystical Agriculture' 'mysticalagriculture:inferium_essence' 'magic' 'Grow your resources from magical seeds.'

# ===== Getting started =====
Q 'inferium' 'Inferium Essence' 'mysticalagriculture:inferium_essence*32' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'The magic behind every crop' -desc @'
&bMystical Agriculture&r lets you grow almost every resource in the game, from dirt to diamonds to nether stars.

Mine &eInferium Ore&r (it looks like stone with green specks) for &eInferium Essence&r. It is the base of everything in this mod.

&6Tip:&r Inferium Ore is fairly common at most heights, including deepslate.
'@
Q 'prosperity' 'Prosperity Shards' 'mysticalagriculture:prosperity_shard*16' '' 'xp:50' -desc 'Mine &eProsperity Ore&r for shards. They are used for seed bases and many crafting recipes.'
Q 'guide' 'The Guide Book' 'mysticalagriculture:guide_book' 'inferium' 'xp:25' -opt -desc 'The in-game guide explains every block, item and crop in the mod.'
Q 'seedbase' 'Prosperity Seed Base' 'mysticalagriculture:prosperity_seed_base*4' 'inferium,prosperity' 'xp:50' -desc 'The base of every resource seed. You will need a lot of these!'
Q 'inferium_seeds' 'Inferium Seeds' 'mysticalagriculture:inferium_seeds*2' 'seedbase' 'mysticalagriculture:inferium_essence*32' -desc @'
Plant them on farmland to grow more Inferium Essence. Each harvest has a small chance to drop an extra seed.

Inferium crops drop more essence on higher-tier essence farmland.
'@
Q 'farmland' 'Essence Farmland' 'mysticalagriculture:inferium_farmland*16' 'inferium_seeds' 'xp:50' -desc @'
Right-click farmland with an essence to turn it into &eEssence Farmland&r of that tier.

Essence farmland gives a bonus chance of extra essence to crops of the same tier or lower.
'@
Q 'crystal' 'Infusion Crystal' 'mysticalagriculture:infusion_crystal' 'inferium' 'xp:50' -desc @'
Combine 4 essence with an Infusion Crystal to make 1 essence of the next tier. The crystal loses durability each time.

Inferium -> Prudentium -> Tertium -> Imperium -> Supremium -> (Insanium)
'@
Q 'prudentium' 'Prudentium' 'mysticalagriculture:prudentium_essence*16' 'crystal' 'xp:75' -desc 'Tier 2 essence. Used for tier 2 seeds, tools and armor.'
Q 'tertium' 'Tertium' 'mysticalagriculture:tertium_essence*16' 'prudentium' 'xp:100;table:uncommon' -desc 'Tier 3 essence. Iron, copper and most common metal seeds need it.'
Q 'imperium' 'Imperium' 'mysticalagriculture:imperium_essence*16' 'tertium' 'xp:150;table:rare' -desc 'Tier 4 essence. Gold, lapis, and many alloy seeds.'
Q 'supremium' 'Supremium' 'mysticalagriculture:supremium_essence*16' 'imperium' 'xp:250;table:rare' -desc 'Tier 5 essence, the best in the base mod. Diamond, emerald and netherite seeds.'
Q 'insanium' 'Insanium' 'mysticalagradditions:insanium_essence*16' 'supremium' 'xp:400;table:epic' -size 1.5 -desc @'
&bMystical Agradditions&r adds a sixth tier: &dInsanium&r. It is made from Supremium Essence and Nether Star Shards (from the Wither) in the Infusion Altar.

Insanium is needed for tier 6 seeds and the best farmland.
'@
Q 'master' 'Master Infusion Crystal' 'mysticalagriculture:master_infusion_crystal' 'supremium' 'xp:200;table:rare' -desc 'An Infusion Crystal that never breaks. A must-have!'

# ===== Blocks & storage =====
Q 'essence_blocks' 'Storage Blocks' 'mysticalagriculture:inferium_block*4' 'inferium' 'xp:25' -opt -desc 'Store essence compactly. Every tier has its own block.'
Q 'ingots' 'Essence Ingots' 'mysticalagriculture:inferium_ingot*4;mysticalagriculture:prudentium_ingot*4' 'prudentium' 'xp:75' -desc 'Essence + Prosperity Ingots make essence ingots, used in machines and the Growth Accelerator.'
Q 'soulium' 'Soulium' 'mysticalagriculture:soulium_ingot*4;mysticalagriculture:soul_dust*8' 'soulstone' 'xp:100' -desc 'Soulium comes from Soulstone found in the Nether. It is needed for mob seeds.'
Q 'soulstone' 'Soulstone' 'mysticalagriculture:soulstone*16' 'tertium' 'xp:50' -desc 'Soulstone generates in the Nether, especially around soul sand valleys.'

# ===== The Infusion Altar =====
Q 'altar' 'Infusion Altar' 'mysticalagriculture:infusion_altar;mysticalagriculture:infusion_pedestal*8' 'prudentium,seedbase' 'xp:150;table:uncommon' -size 1.5 -shape 'hexagon' -desc @'
Resource seeds are made on the &eInfusion Altar&r.

1. Place the altar and 8 pedestals around it, two blocks away (check JEI for the layout).
2. Put the seed base on the altar and the ingredients on the pedestals.
3. Activate it with a redstone signal, or right-click with a &eWand&r.

&6Tip:&r The &eSeed Codex&r chapter lists every seed you can grow in this pack!
'@
Q 'wand' 'Wand' 'mysticalagriculture:wand' 'altar' 'xp:25' -desc 'Right-click the altar with the Wand to start crafting.'
Q 'soul_extractor' 'Soul Extractor' 'mysticalagriculture:soul_extractor' 'soulium' 'xp:100' -desc 'Turns mob drops into souls for your Soul Jars.'
Q 'soul_jar' 'Soul Jars' 'mysticalagriculture:soul_jar*4;mysticalagriculture:soulium_dagger' 'soulium' 'xp:100' -desc @'
Mob seeds need &esouls&r. Carry an empty Soul Jar and kill mobs with a &eSoulium Dagger&r to fill it.

A full jar goes into the altar recipe for that mob's seed.
'@
Q 'reprocessor' 'Seed Reprocessor' 'mysticalagriculture:seed_reprocessor' 'altar' 'xp:75' -opt -desc 'Turns spare seeds back into essence.'
Q 'essence_furnace' 'Essence Furnace' 'mysticalagriculture:furnace' 'ingots' 'xp:50' -opt -desc 'A faster furnace that uses essence ingots.'

# ===== Farming tools =====
Q 'watering' 'Watering Can' 'mysticalagriculture:inferium_watering_can' 'inferium_seeds' 'xp:50' -desc 'Hold right-click to speed up crops in an area. Higher tiers cover a bigger area.'
Q 'watering_up' 'Better Watering' 'mysticalagriculture:imperium_watering_can' 'watering,imperium' 'xp:100' -opt -desc 'A much bigger area.'
Q 'fertilizer' 'Mystical Fertilizer' 'mysticalagriculture:mystical_fertilizer*16' 'inferium_seeds' 'xp:50' -desc 'Instantly grows any crop, including resource crops. Works in a Dispenser too.'
Q 'accelerator' 'Growth Accelerators' 'mysticalagriculture:inferium_growth_accelerator*4' 'ingots' 'xp:100' -desc 'Place them under the farmland (they work through blocks in a column) to speed up crops. Stack several and use higher tiers for a bigger range.'
Q 'accelerator_up' 'Faster Growth' 'mysticalagriculture:supremium_growth_accelerator*4' 'accelerator,supremium' 'xp:200;table:rare' -opt -desc 'Supremium accelerators have the biggest range.'
Q 'harvester' 'Harvester' 'mysticalagriculture:harvester' 'accelerator,tertium' 'xp:200;table:uncommon' -desc 'Harvests and replants crops automatically. Pipe the output into storage, or connect it to your ME system.'
Q 'sickle' 'Sickles & Scythes' 'mysticalagriculture:iron_sickle' 'inferium_seeds' 'xp:25' -opt -desc 'Harvest many crops at once.'
Q 'farmland_up' 'Supremium Farmland' 'mysticalagriculture:supremium_farmland*16' 'supremium,farmland' 'xp:150;table:rare' -desc 'Tier 5 seeds will not grow without Supremium (or better) farmland under them.'
Q 'insanium_farmland' 'Insanium Farmland' 'mysticalagradditions:insanium_farmland*16' 'insanium,farmland_up' 'xp:300;table:epic' -desc 'The best farmland. Also lets you grow tier 6 crops.'

# ===== Gear =====
Q 'tools' 'Essence Tools' 'mysticalagriculture:prudentium_pickaxe;mysticalagriculture:prudentium_sword' 'prudentium' 'xp:75' -desc 'Essence tools are durable and get &eaugment slots&r at higher tiers.'
Q 'armor' 'Essence Armor' 'mysticalagriculture:prudentium_helmet;mysticalagriculture:prudentium_chestplate;mysticalagriculture:prudentium_leggings;mysticalagriculture:prudentium_boots' 'prudentium' 'xp:100;table:uncommon' -desc 'A full set of the same tier gives a set bonus.'
Q 'tinkering' 'Tinkering Table' 'mysticalagriculture:tinkering_table;mysticalagriculture:blank_augment*2' 'tools,imperium' 'xp:150' -desc @'
Augments add powers to essence gear: speed, strength, flight, mining area, night vision, no fall damage and more.

Craft an augment and put it in the tool or armor at the Tinkering Table.
'@
Q 'augments' 'Augmented' 'mysticalagriculture:speed_i_augment;mysticalagriculture:night_vision_augment' 'tinkering' 'xp:150' -desc 'Try a few augments. Higher tier gear can hold more of them.'
Q 'supremium_gear' 'Supremium Armor' 'mysticalagriculture:supremium_helmet;mysticalagriculture:supremium_chestplate;mysticalagriculture:supremium_leggings;mysticalagriculture:supremium_boots' 'supremium,armor' 'xp:300;table:epic' -desc 'Supremium armor can hold the strongest augments, including &eFlight&r.'
Q 'flight' 'Fly Like a Farmer' 'mysticalagriculture:flight_augment' 'supremium_gear,tinkering' 'xp:300;table:epic' -desc 'Creative-style flight from your chestplate.'
Q 'paxel' 'Paxels' 'mysticalagradditions:supremium_paxel' 'supremium' 'xp:150' -opt -desc 'Mystical Agradditions adds essence paxels.'

# ===== Awakening =====
Q 'cognizant' 'Cognizant Dust' 'mysticalagriculture:cognizant_dust*8' 'supremium' 'xp:150' -desc 'Needed for the awakening ritual and some top-tier recipes.'
Q 'awakening' 'The Awakening Altar' 'mysticalagriculture:awakening_altar;mysticalagriculture:awakening_pedestal*4;mysticalagriculture:essence_vessel*4' 'cognizant,altar' 'xp:300;table:rare' -size 1.5 -desc @'
The Awakening Altar turns Supremium into &eAwakened Supremium&r.

Place the altar with pedestals and four &eEssence Vessels&r around it, each filled with a different elemental essence (Air, Earth, Water and Fire). Check JEI for the exact layout.
'@
Q 'awakened' 'Awakened Supremium' 'mysticalagriculture:awakened_supremium_ingot*4' 'awakening' 'xp:400;table:epic' -desc 'The strongest material in Mystical Agriculture.'
Q 'awakened_gear' 'Awakened Gear' 'mysticalagriculture:awakened_supremium_chestplate;mysticalagriculture:awakened_supremium_pickaxe' 'awakened' 'lvl:30;table:epic' -size 1.5 -shape 'gear' -desc 'Awakened Supremium gear has the most augment slots of all.'
Q 'crux' 'Crux Blocks' 'mysticalagradditions:nether_star_crux' 'insanium' 'xp:200;table:rare' -desc @'
Tier 6 crops need a special &eCrux&r block placed directly &ounder&r the farmland:
- Nether Star Seeds: Nether Star Crux
- Dragon Egg Seeds: Dragon Egg Crux
- Nitro Crystal Seeds: Nitro Crystal Crux

&6GSPack:&r the Allthemodium seeds (Seed Codex) have their own crux blocks: the &6Allthemodium&r, &3Vibranium&r and &5Unobtainium Crux&r. Each one is crafted around the one before it.
'@
Q 'codex' 'Open the Seed Codex' 'check' 'altar' 'xp:50' -shape 'hexagon' -icon 'mysticalagriculture:iron_seeds' -desc 'The &eSeed Codex&r chapter has a quest for every single seed in this pack. Can you collect them all?'

# ===============================================================
# Seed Codex: one quest for every seed that is enabled in GSPack.
# (Crops for mods that are not installed are left out.)
# ===============================================================
Chapter 'seeds' 'Seed Codex' 'mysticalagriculture:diamond_seeds' 'magic' 'Every Mystical Agriculture seed you can grow in GSPack.' -hidelines

# A seed is a Mystical Agriculture crop name, or a full item id (ns:name_seed) for add-on crops.
function Seed-Key([string]$s) { if ($s -match ':') { ($s -split ':')[1] -replace '_seeds?$', '' } else { $s } }
function Seed-Item([string]$s) { if ($s -match ':') { $s } else { "mysticalagriculture:$($s)_seeds" } }
function Seed-Title([string]$id) { (($id -split '_') | ForEach-Object { $_.Substring(0, 1).ToUpper() + $_.Substring(1) }) -join ' ' }

# Each category: key, title, unlock requirement (quest dependency), reward table, description, seeds (ns:crop)
$seedGroups = @(
    @('elemental', 'Elemental Seeds', 'mystical/altar', 'common', 'The four elements. Their essence fills the Essence Vessels for the awakening ritual, and is used in many seed recipes.',
        'air earth water fire'),
    @('t1', 'Tier 1: The Basics', 'mystical/altar', 'common', 'Cheap tier 1 seeds for building blocks.',
        'stone dirt wood ice deepslate'),
    @('t2', 'Tier 2: Nature', 'mystical/prudentium', 'common', 'Tier 2 seeds need Prudentium Essence.',
        'nature dye nether coal coral honey amethyst'),
    @('mobs', 'Mob Seeds', 'mystical/soul_jar', 'uncommon', 'Mob seeds need a Soul Jar filled with souls of that mob. Their essence crafts into that mob''s drops.',
        'pig chicken cow sheep squid fish slime turtle armadillo zombie skeleton creeper spider phantom rabbit breeze blaze ghast enderman wither_skeleton'),
    @('t3', 'Tier 3: Iron Age', 'mystical/tertium', 'uncommon', 'Tier 3 seeds need Tertium Essence. Copper, iron, redstone and more.',
        'iron copper nether_quartz glowstone redstone obsidian prismarine sculk'),
    @('t4', 'Tier 4: Precious', 'mystical/imperium', 'rare', 'Tier 4 seeds need Imperium Essence.',
        'gold lapis_lazuli end experience'),
    @('t5', 'Tier 5: Treasure', 'mystical/supremium', 'rare', 'Tier 5 seeds need Supremium Essence and only grow on Supremium (or better) farmland.',
        'diamond emerald netherite'),
    @('metals', 'Common Metals', 'mystical/tertium', 'uncommon', 'Seeds for the extra metals from AllTheOres and other mods. They need a matching ingot (any mod''s version works) in the recipe.',
        'aluminum tin lead silver nickel zinc osmium uranium platinum iridium'),
    @('alloys', 'Alloys', 'mystical/imperium', 'rare', 'Alloy seeds save a lot of smelting and mixing.',
        'bronze brass steel constantan electrum invar signalum lumium enderium'),
    @('gems', 'Gems & Minerals', 'mystical/tertium', 'uncommon', 'Gems and useful minerals.',
        'ruby sapphire peridot fluorite silicon sulfur saltpeter'),
    @('mekanism', 'Mekanism', 'mekanism/osmium', 'rare', 'Refined materials from Mekanism, grown instead of compressed.',
        'refined_glowstone refined_obsidian'),
    @('ae2', 'Applied Energistics 2', 'ae2/certus', 'uncommon', 'Never hunt for meteorites again.',
        'sky_stone certus_quartz fluix'),
    @('enderio', 'Ender IO Alloys', 'mystical/imperium', 'rare', 'Ender IO''s alloys, grown in the field.',
        'grains_of_infinity redstone_alloy conductive_alloy soularium dark_steel pulsating_alloy energetic_alloy vibrant_alloy end_steel'),
    @('tinkers', 'Tinkers'' Metals', 'mystical/imperium', 'rare', 'Metals from Tinkers'' Construct (ContinuumConstruct).',
        'amethyst_bronze slimesteel pig_iron rose_gold cobalt manyullyn queens_slime hepatizon'),
    @('twilight', 'Twilight Forest', 'mystical/imperium', 'rare', 'Twilight Forest materials. You need the real material from the Twilight Forest first.',
        'ironwood steeleaf knightmetal fiery_ingot'),
    @('powah', 'Powah Crystals', 'mystical/imperium', 'rare', 'The energy crystals from Powah.',
        'uraninite energized_steel blazing_crystal niotic_crystal spirited_crystal'),
    @('soulium', 'Soulium', 'mystical/soulium', 'uncommon', 'Grow Soulium instead of mining Soulstone.',
        'soulium'),
    @('t6', 'Tier 6: Insanium', 'mystical/crux', 'epic', 'The rarest crops. They need Insanium farmland and the matching Crux block below it.',
        'nether_star dragon_egg nitro_crystal'),
    @('atm', 'Allthemodium', 'allthemodium/atm_ingot', 'epic', 'GSPack''s own crops (Mystical Customization): grow the rarest metals! Each crop needs its own &eCrux&r block under the farmland: the &6Allthemodium&r, &3Vibranium&r and &5Unobtainium Crux&r. Each crux is crafted around the one before it. Vibranium and Unobtainium are tier 6 crops, so they also need Insanium farmland.',
        'mysticalagriculture:allthemodium_seeds mysticalagriculture:vibranium_seeds mysticalagriculture:unobtainium_seeds'),
    @('modores', 'Ores From Other Mods', 'mystical/imperium', 'rare', 'GSPack''s own crops (Mystical Customization) for the ores of other mods: Stellaris, The Aether II, EvilCraft, LTX Industries, Occultism, AllTheOres, Just Dire Things and Aquaculture. Many of them are needed for the endgame cores and the Trophy of Infinity. You need the real material first to craft the seed.',
        'mysticalagriculture:titanium_seeds mysticalagriculture:desh_seeds mysticalagriculture:novite_seeds mysticalagriculture:zanite_seeds mysticalagriculture:arkenium_seeds mysticalagriculture:gravitite_seeds mysticalagriculture:ambrosium_seeds mysticalagriculture:dark_gem_seeds mysticalagriculture:niobium_seeds mysticalagriculture:iesnium_seeds mysticalagriculture:cinnabar_seeds mysticalagriculture:ferricore_seeds mysticalagriculture:blazegold_seeds mysticalagriculture:celestigem_seeds mysticalagriculture:eclipsealloy_seeds mysticalagriculture:neptunium_seeds')
)

Q 'start' 'The Seed Codex' 'mysticalagriculture:prosperity_seed_base' 'mystical/altar' 'xp:50' -size 2 -shape 'gear' -pos '1.5,-2.4' -desc @'
This chapter has a quest for &eevery seed&r you can grow in GSPack, sorted by category.

Seeds are crafted on the &eInfusion Altar&r: a seed base in the middle and the ingredients on the pedestals. Check each seed's recipe in JEI.

Crops for mods that are not in the pack are disabled, so they are not listed here.
'@

$row = 0
foreach ($g in $seedGroups) {
    $gkey, $gtitle, $gdep, $gtable, $gdesc, $gseeds = $g
    $crops = @($gseeds -split ' ')
    $first = $crops[0]
    $y = $row * 1.5
    Q "g_$gkey" $gtitle 'check' "start,$gdep" 'xp:25' -shape 'hexagon' -icon (Seed-Item $first) -pos "0,$y" -desc $gdesc
    $col = 0
    foreach ($crop in $crops) {
        if ($col -eq 12) { $row++; $col = 0 }
        $x = 1.5 + $col * 1.1; $y = $row * 1.5
        $name = Seed-Title (Seed-Key $crop)
        Q "s_$(Seed-Key $crop)" "$name Seeds" (Seed-Item $crop) "g_$gkey" "xp:30;table:$gtable" -pos ('{0},{1}' -f $x.ToString([Globalization.CultureInfo]::InvariantCulture), $y.ToString([Globalization.CultureInfo]::InvariantCulture)) -desc @"
Craft &e$name Seeds&r on the Infusion Altar and plant them.

Harvesting gives &e$name Essence&r. Craft the essence into the real resource. Check JEI (press &eU&r on the essence) for the exact recipe.
"@
        $col++
    }
    $row++
}

Q 'all' 'Master Farmer' 'check' (($seedGroups | ForEach-Object { ($_[5] -split ' ') | ForEach-Object { "s_$(Seed-Key $_)" } }) -join ',') 'lvl:50;table:epic' -size 2 -shape 'gear' -pos '4.5,-2.4' -hidelines -icon 'mysticalagriculture:awakened_supremium_ingot' -desc 'You have crafted &eevery single seed&r in the Seed Codex. You are a true Master Farmer!'
