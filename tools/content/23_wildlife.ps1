Chapter 'wildlife' 'Wildlife' 'livingthings:lexicon' 'explore' 'New animals and monsters from every corner of the world.'

# ===== Living Things =====
Q 'lexicon' 'The Lexicon' 'livingthings:lexicon' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'A field guide to new animals' -desc @'
&bLiving Things&r adds lots of new animals all over the world.

The &eLexicon&r is its guide book: craft it from a &eBook&r and &eLapis Lazuli&r and read about every creature.
'@
Q 'savanna' 'Savanna Safari' 'biome:minecraft:savanna' 'lexicon' 'xp:50' -icon 'livingthings:elephant_spawn_egg' -desc 'Elephants, giraffes, lions, ostriches and peacocks live in the &esavanna&r. Watch out for the lions!'
Q 'ostrich' 'Ostrich Egg' 'livingthings:ostrich_egg' 'savanna' 'xp:75' -desc 'Ostriches build nests and lay their eggs in them. You can also ride an ostrich.'
Q 'safari_food' 'Safari Cooking' 'livingthings:cooked_elephant;livingthings:cooked_giraffe' 'savanna' 'xp:50' -opt -desc 'Savanna animals drop meat you can cook in a furnace, smoker or on a campfire.'
Q 'jungle' 'Jungle Friends' 'livingthings:banana*4' 'lexicon' 'xp:50' -icon 'livingthings:monkey_spawn_egg' -desc 'Monkeys and koalas live in the &ejungle&r. Monkeys drop bananas.'
Q 'beach' 'Beachcombing' 'livingthings:crab_shell*2;livingthings:cooked_crab' 'lexicon' 'xp:50' -desc 'Crabs live on beaches, rivers and swamps. They drop crab meat and shells.'
Q 'shark' 'Shark Tooth' 'livingthings:shark_tooth*4' 'beach' 'xp:100;table:angler' -desc 'Sharks hunt in the oceans. Their teeth can be crafted into arrows or bone meal.'
Q 'seahorse' 'Seahorse' 'livingthings:seahorse_bucket' 'beach' 'xp:75' -desc 'Catch a seahorse in a bucket. They live in the warmer oceans, and sometimes drop coral or even a Heart of the Sea.'
Q 'cold' 'Snowy Lands' 'biome:minecraft:snowy_plains' 'lexicon' 'xp:50' -icon 'livingthings:penguin_spawn_egg' -desc 'Penguins waddle around snowy plains, slopes and beaches.'
Q 'mushroom' 'Shroomies' 'biome:minecraft:mushroom_fields' 'lexicon' 'xp:75' -opt -icon 'livingthings:shroomie_spawn_egg' -desc 'Little mushroom creatures that only live on mushroom islands.'
Q 'end_dragon' 'Baby Ender Dragon' 'dim:minecraft:the_end' 'lexicon' 'xp:100' -opt -icon 'livingthings:baby_ender_dragon_spawn_egg' -desc 'Small dragons can be found on the end stone of The End. They drop chorus fruit and ender pearls.'

# ===== Variants & Ventures =====
Q 'vv' 'Variants & Ventures' 'check' '' 'xp:25' -icon 'variantsandventures:thicket_spawn_egg' -desc @'
&bVariants & Ventures&r adds four new monsters, each in its own kind of biome:
- &eGelid&r: frozen, icy and snowy biomes
- &eMurk&r: warm and lukewarm oceans
- &eThicket&r and &eVerdant&r: jungles

They can also appear in the spawners of &eTrial Chambers&r.
'@
Q 'gelid' 'Gelid' 'kill:variantsandventures:gelid*3' 'vv' 'xp:100;table:uncommon' -icon 'variantsandventures:gelid_spawn_egg' -desc 'A monster of the frozen lands. Defeat three.'
Q 'murk' 'Murk' 'kill:variantsandventures:murk*3' 'vv' 'xp:100;table:uncommon' -icon 'variantsandventures:murk_spawn_egg' -desc 'Murks attack from range in warm oceans. Defeat three.'
Q 'thicket' 'Thicket' 'kill:variantsandventures:thicket*3' 'vv' 'xp:100;table:uncommon' -icon 'variantsandventures:thicket_spawn_egg' -desc 'A jungle monster that fights up close. Defeat three.'
Q 'verdant' 'Verdant' 'kill:variantsandventures:verdant*3' 'vv' 'xp:100;table:uncommon' -icon 'variantsandventures:verdant_spawn_egg' -desc 'A jungle monster that attacks from range. Defeat three.'
Q 'vv_all' 'Monster Hunter' 'check' 'gelid,murk,thicket,verdant' 'xp:250;table:rare' -size 1.5 -shape 'hexagon' -desc 'You have defeated every new monster. Well done!'
