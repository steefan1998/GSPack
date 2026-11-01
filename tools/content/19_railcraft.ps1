Chapter 'railcraft' 'Railcraft Reborn' 'railcraft:steam_locomotive' 'tech' 'Steel, tracks, steam and trains.'

# ===== Steel =====
Q 'coke_oven' 'Coke Oven' 'railcraft:coke_oven_bricks*26' '' 'xp:75;table:common' -size 1.5 -shape 'gear' -sub 'Railroads need steel' -desc @'
&bRailcraft Reborn&r is about building real railways: steel, tracks, signals and locomotives.

Start with a &eCoke Oven&r: a hollow 3x3x3 cube of 26 Coke Oven Bricks. It bakes coal into &eCoal Coke&r and leaves &eCreosote Oil&r behind.
'@
Q 'coke' 'Coal Coke' 'railcraft:coal_coke*16' 'coke_oven' 'xp:50' -desc 'A better fuel than coal, and the key ingredient for steel.'
Q 'blast_furnace' 'Blast Furnace' 'railcraft:blast_furnace_bricks*34' 'coke' 'xp:100;table:tech' -desc @'
The &eBlast Furnace&r is a hollow 3x4x3 multiblock (3 wide, 4 tall) made of Blast Furnace Bricks.

Feed it iron and Coal Coke to make &eSteel&r. Check JEI for the exact build.
'@
Q 'steel' 'Steel' 'railcraft:steel_ingot*16' 'blast_furnace' 'xp:100' -desc 'Railcraft steel is used for rails, machines and locomotives.'
Q 'steel_gear' 'Steel Tools' 'railcraft:steel_pickaxe;railcraft:steel_sword' 'steel' 'xp:50' -opt -desc 'Steel tools and armor are a solid step up from iron.'

# ===== Tracks =====
Q 'crowbar' 'Crowbar' 'railcraft:iron_crowbar' '' 'xp:50' -desc 'The railway tool: rotate tracks, link carts together and configure track kits.'
Q 'rolling' 'Rolling Machine' 'railcraft:manual_rolling_machine' 'steel' 'xp:75' -desc 'Rolls ingots into plates, rails and rebar. Look up its recipes in JEI.'
Q 'rails' 'Rails & Ties' 'railcraft:standard_rail*8;railcraft:wooden_tie*4' 'rolling' 'xp:50' -desc 'Rails and ties are the parts of every Railcraft track.'
Q 'tracks' 'Reinforced Track' 'railcraft:reinforced_track*16' 'rails' 'xp:75' -desc 'Strong track that creepers cannot blow up. Other track types: strap iron (cheap), high speed and electric.'
Q 'high_speed' 'High Speed' 'railcraft:high_speed_track*32;railcraft:high_speed_transition_track*2' 'tracks' 'xp:150;table:tech' -desc @'
High Speed Track lets carts go much faster, but only on straight lines.

Use &eHigh Speed Transition Tracks&r to speed up and slow down, or carts will derail in curves.
'@
Q 'kits' 'Track Kits' 'railcraft:booster_track_kit;railcraft:detector_track_kit;railcraft:locking_track_kit' 'tracks' 'xp:75' -desc 'Track kits turn a normal track into a special one: boosters, detectors, locks, junctions and more. JEI shows how to combine a kit with a track.'

# ===== Trains =====
Q 'loaders' 'Loading Bay' 'railcraft:item_loader;railcraft:item_unloader' 'tracks' 'xp:100' -desc 'Item loaders fill passing carts, unloaders empty them. Fluid loaders do the same for tank carts.'
Q 'boiler' 'Steam Boiler' 'railcraft:solid_fueled_firebox;railcraft:low_pressure_steam_boiler_tank*2' 'steel' 'xp:150;table:tech' -desc 'A multiblock steam boiler: a firebox at the bottom with boiler tanks on top. Keep it filled with water before you light it!'
Q 'turbine' 'Steam Turbine' 'railcraft:steam_turbine' 'boiler' 'xp:150' -opt -desc 'Turns steam into power for electric tracks and locomotives.'
Q 'steam_loco' 'Steam Locomotive' 'railcraft:steam_locomotive' 'boiler,loaders' 'xp:250;choice:rare' -size 1.5 -desc @'
A real train! The &eSteam Locomotive&r needs water and fuel and pulls a row of linked carts.

Link carts with the Crowbar, and fill the locomotive from a Water Tank Siding and a loader.
'@
Q 'electric' 'Electric Locomotive' 'railcraft:electric_locomotive;railcraft:electric_track*16' 'steam_loco,turbine' 'xp:200' -opt -desc 'Runs on power from electric tracks. Quiet and clean.'
Q 'signals' 'Signals' 'railcraft:block_signal*2;railcraft:signal_tuner' 'steam_loco' 'xp:100' -opt -desc 'Block signals keep trains from crashing into each other. Pair them with the Signal Tuner.'
Q 'tunnel_bore' 'Tunnel Bore' 'railcraft:tunnel_bore' 'steam_loco' 'xp:200;table:rare' -opt -desc 'A locomotive that digs a tunnel ahead of it and lays the track for you.'
Q 'world_spike' 'World Spike' 'railcraft:world_spike' 'steel' 'xp:100' -desc 'Keeps the chunks around it loaded, so your railway and machines keep running when you are away. Check its tooltip for what it needs to run.'
