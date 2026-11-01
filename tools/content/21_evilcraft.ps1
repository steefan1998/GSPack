Chapter 'evilcraft' 'EvilCraft' 'evilcraft:dark_gem' 'magic' 'Dark magic: blood, spirits, werewolves and brooms.'

# ===== The first age =====
Q 'dark_gem' 'Dark Gems' 'evilcraft:dark_gem*8' '' 'xp:75;table:common' -size 1.5 -shape 'gear' -sub 'Discover the first evil age' -desc @'
&bEvilCraft&r is dark magic built on &cblood&r, spirits and forbidden knowledge.

It starts with &eDark Gems&r. Mine &eDark Ore&r underground.
'@
Q 'apple' 'Darkened Apple' 'evilcraft:darkened_apple' 'dark_gem' 'xp:50' -desc 'An apple corrupted with dark power. You need it to get the guide book.'
Q 'book' 'Origins of Darkness' 'evilcraft:origins_of_darkness' 'apple' 'xp:100;table:arcane' -desc @'
The guide book of EvilCraft. You cannot craft it:

Feed a &eDarkened Apple&r to an animal, then quickly throw a &eBook&r at the anomaly that appears.

Read it to learn everything about EvilCraft.
'@

# ===== Blood =====
Q 'extractor' 'Blood Extractor' 'evilcraft:blood_extractor' 'dark_gem' 'xp:75' -desc @'
Keep a &eBlood Extractor&r in your inventory while you slay mobs and it collects their blood.

Shift + right-click to empty it, or turn on auto-supply.
'@
Q 'dark_tank' 'Dark Tank' 'evilcraft:dark_tank' 'extractor' 'xp:75' -desc 'Stores blood. Combine tanks in the crafting grid to make a bigger one.'
Q 'infuser' 'Blood Infuser' 'evilcraft:blood_infuser' 'dark_tank' 'xp:150;table:arcane' -size 1.5 -desc 'The main EvilCraft machine: it infuses items with blood to make new materials. Check JEI for its recipes.'
Q 'hardened' 'Hardened Blood' 'evilcraft:hardened_blood_shard*8' 'extractor' 'xp:50' -opt -desc 'Dried blood. Break Hardened Blood with Flint and Steel to get shards.'
Q 'blood_chest' 'Blood Chest' 'evilcraft:blood_chest' 'infuser' 'xp:100' -desc 'Repairs the items inside it, using blood.'
Q 'purifier' 'Purifier' 'evilcraft:purifier' 'infuser' 'xp:100' -opt -desc 'A disenchanter. A Blook placed in it absorbs the enchantments of an item.'

# ===== Spirits & monsters =====
Q 'glasses' 'Spectral Glasses' 'evilcraft:spectral_glasses' 'dark_gem' 'xp:75' -desc 'Look into the spirit world and see the Vengeance Spirits around you.'
Q 'spirits' 'Vengeance Spirits' 'kill:evilcraft:vengeance_spirit*3' 'glasses' 'xp:150;table:arcane' -desc 'Vengeance Spirits roam the world, mostly unseen. Defeat a few.'
Q 'box' 'Box of Eternal Closure' 'evilcraft:box_of_eternal_closure' 'spirits' 'xp:150' -desc 'Traps a Vengeance Spirit inside.'
Q 'spirit_furnace' 'Spirit Furnace' 'evilcraft:spirit_furnace' 'box,infuser' 'xp:200;table:rare' -desc 'Cooks Vengeance Spirits to get their drops. A mob farm without the mobs!'
Q 'werewolf' 'Werewolf' 'kill:evilcraft:werewolf;evilcraft:werewolf_fur' 'dark_gem' 'xp:150;table:uncommon' -desc 'Werewolves are dangerous. Defeat one and take its fur.'
Q 'undead' 'Undead Tree' 'evilcraft:undead_sapling;evilcraft:undead_log*8' 'dark_gem' 'xp:50' -opt -desc 'An Undead Sapling grows into an Undead Tree.'

# ===== Power =====
Q 'accumulator' 'Environmental Accumulator' 'evilcraft:environmental_accumulator' 'book' 'xp:150' -desc 'Found at &eDark Temples&r: break one to get its core. It works with the weather and Weather Containers: see the Origins of Darkness. Later you can craft the Sanguinary version.'
Q 'broom' 'Broom' 'evilcraft:broom' 'infuser' 'xp:200;table:rare' -size 1.5 -desc 'I can fly! Broom parts give your broom different modifiers: check their tooltips.'
Q 'mace' 'Mace of Distortion' 'evilcraft:mace_of_distortion' 'infuser' 'xp:150' -opt -desc 'A powerful magic mace. The Origins of Darkness explains what it does.'
