QGroup 'base' 'Storage & Building'

Chapter 'storage' 'Storage' 'sophisticatedstorage:iron_chest' 'base' 'Chests, drawers, backpacks, pipes and networks to keep it all organised.'

# ===== Sophisticated Storage =====
Q 'chest' 'Sophisticated Chest' 'sophisticatedstorage:chest' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'Your first upgradeable chest' -desc @'
&bSophisticated Storage&r adds chests, barrels and shulker boxes that you can &eupgrade in place&r: no need to empty them first!

Craft a wooden Sophisticated Chest. It works like a normal chest, but has slots for &eupgrades&r.

&6Tip:&r Sophisticated chests keep their contents when broken with the right tool, so you can move them around.
'@
Q 'barrel' 'Sophisticated Barrel' 'sophisticatedstorage:barrel' 'chest' 'xp:25' -desc 'Barrels hold the same as chests but can be opened with a block on top. They can also be decorated with any block texture at the Decoration Table.'
Q 'tier_iron' 'Iron Tier' 'sophisticatedstorage:basic_to_iron_tier_upgrade;sophisticatedstorage:iron_chest' 'chest' 'xp:50' -desc 'Use a tier upgrade on a placed chest or barrel to upgrade it: more slots and more upgrade slots.'
Q 'tier_gold' 'Gold Tier' 'sophisticatedstorage:gold_chest' 'tier_iron' 'xp:75' -desc 'Even more space.'
Q 'tier_diamond' 'Diamond Tier' 'sophisticatedstorage:diamond_chest' 'tier_gold' 'xp:100;table:uncommon' -desc 'A huge chest.'
Q 'tier_netherite' 'Netherite Tier' 'sophisticatedstorage:netherite_chest' 'tier_diamond' 'xp:150;table:rare' -desc 'The biggest chest. It does not burn in lava either.'
Q 'shulker' 'Sophisticated Shulker Box' 'sophisticatedstorage:shulker_box' 'tier_iron' 'xp:75' -desc 'A shulker box with upgrade slots. Keeps everything inside when picked up.'
Q 'limited' 'Limited Barrels' 'sophisticatedstorage:limited_barrel_1;sophisticatedstorage:limited_barrel_4' 'barrel' 'xp:50' -desc 'Drawer-like barrels: each slot holds a lot of one item. Great for bulk materials.'
Q 'stack_up' 'Stack Upgrades' 'sophisticatedstorage:stack_upgrade_tier_1;sophisticatedstorage:stack_upgrade_tier_2' 'tier_iron' 'xp:100;table:uncommon' -desc @'
Stack upgrades multiply how many items fit in each slot. Tier 1 doubles it, and every tier after that goes higher.

Combine them with Limited Barrels for enormous bulk storage.
'@
Q 'stack_atm' 'Allthemodium Stacks' 'storage_allthemodium_upgrade:stack_upgrade_tier_6' 'stack_up' 'xp:200;table:rare' -opt -desc 'Allthemodium adds even bigger stack upgrades (tiers 6 to 8) for Sophisticated Storage.'
Q 'upgrades' 'Storage Upgrades' 'sophisticatedstorage:upgrade_base*2;sophisticatedstorage:pickup_upgrade;sophisticatedstorage:hopper_upgrade' 'chest' 'xp:75' -desc @'
Upgrades add features to a storage block:
- &ePickup&r: collects items thrown into it.
- &eHopper&r: pulls items from above and pushes them below.
- &eCompacting&r: turns nuggets into ingots, ingots into blocks.
- &eVoid&r: deletes items you do not want.
- &eSmelting&r: a built-in furnace.
'@
Q 'compacting' 'Compacting' 'sophisticatedstorage:compacting_upgrade' 'upgrades' 'xp:50' -desc 'Automatically compacts items into blocks. Perfect for cobblestone or ore drops.'
Q 'void' 'Void Upgrade' 'sophisticatedstorage:void_upgrade' 'upgrades' 'xp:50' -desc 'Deletes chosen items. Set a filter so you do not lose anything important!'
Q 'smelting' 'Auto-Smelting' 'sophisticatedstorage:auto_smelting_upgrade' 'upgrades' 'xp:75' -opt -desc 'Smelts items inside the storage automatically.'
Q 'controller' 'Storage Controller' 'sophisticatedstorage:controller;sophisticatedstorage:storage_link*2' 'tier_gold' 'xp:150;table:uncommon' -desc @'
The &eController&r connects nearby Sophisticated storage blocks into one big inventory. Put items in the controller and they go to the right place.

Storage Links extend the controller's reach.
'@
Q 'storage_io' 'Storage Input & Output' 'sophisticatedstorage:storage_input;sophisticatedstorage:storage_output' 'controller' 'xp:75' -desc 'Let pipes put items into, or take items out of, your whole controller network.'
Q 'packing_tape' 'Packing Tape' 'sophisticatedstorage:packing_tape' 'chest' 'xp:25' -desc 'Tape a full chest shut, then break it to move it with everything inside.'
Q 'decoration' 'Decoration Table' 'sophisticatedstorage:decoration_table' 'barrel' 'xp:50' -opt -desc 'Give barrels and chests the look of any block.'
Q 'in_motion' 'Storage in Motion' 'sophisticatedstorageinmotion:storage_minecart;sophisticatedstorageinmotion:storage_boat' 'chest' 'xp:75' -opt -desc 'Put your Sophisticated storage on a minecart or a boat.'

# ===== Backpacks =====
Q 'backpack' 'Backpack' 'sophisticatedbackpacks:backpack' '' 'xp:50;table:common' -size 1.5 -desc @'
&bSophisticated Backpacks&r gives you storage to carry around. Wear it on your back, or place it down.

Press the backpack key (see Controls) to open it while wearing it.
'@
Q 'bp_iron' 'Iron Backpack' 'sophisticatedbackpacks:iron_backpack' 'backpack' 'xp:50' -desc 'Upgrade the backpack in the crafting grid. It keeps its contents.'
Q 'bp_gold' 'Gold Backpack' 'sophisticatedbackpacks:gold_backpack' 'bp_iron' 'xp:75' -desc 'More slots and more upgrade slots.'
Q 'bp_diamond' 'Diamond Backpack' 'sophisticatedbackpacks:diamond_backpack' 'bp_gold' 'xp:100;table:uncommon' -desc 'A lot of space.'
Q 'bp_netherite' 'Netherite Backpack' 'sophisticatedbackpacks:netherite_backpack' 'bp_diamond' 'xp:150;table:rare' -desc 'The biggest backpack, and it does not burn.'
Q 'bp_pickup' 'Pickup & Magnet' 'sophisticatedbackpacks:pickup_upgrade;sophisticatedbackpacks:magnet_upgrade' 'backpack' 'xp:75' -desc 'Items go straight into your backpack, and the magnet pulls them in from a distance.'
Q 'bp_feeding' 'Feeding Upgrade' 'sophisticatedbackpacks:feeding_upgrade' 'backpack' 'xp:50' -desc 'Eats food from your backpack when you get hungry. Never starve again!'
Q 'bp_tools' 'Tool Swapper' 'sophisticatedbackpacks:tool_swapper_upgrade' 'bp_iron' 'xp:75' -desc 'Picks the best tool from your backpack for the block you are mining.'
Q 'bp_restock' 'Restock & Refill' 'sophisticatedbackpacks:refill_upgrade;sophisticatedbackpacks:restock_upgrade' 'bp_iron' 'xp:50' -opt -desc 'Keeps your hotbar filled with blocks, torches and food.'
Q 'bp_crafting' 'Crafting & Smithing' 'sophisticatedbackpacks:crafting_upgrade;sophisticatedbackpacks:smithing_upgrade' 'backpack' 'xp:50' -opt -desc 'A crafting grid (and more) inside your backpack.'
Q 'bp_stack' 'Backpack Stacks' 'sophisticatedbackpacks:stack_upgrade_tier_1' 'bp_gold' 'xp:100' -desc 'Fit more items in every slot.'
Q 'bp_inception' 'Inception' 'sophisticatedbackpacks:inception_upgrade' 'bp_diamond' 'xp:150' -opt -desc 'Put backpacks in your backpack, and their upgrades still work.'
Q 'bp_everlasting' 'Everlasting' 'sophisticatedbackpacks:everlasting_upgrade' 'bp_netherite' 'xp:200;table:rare' -desc 'Your backpack can never be destroyed, and it stays with you even when you die.'

# ===== Drawers =====
Q 'drawers' 'Storage Drawers' 'storagedrawers:oak_full_drawers_1;storagedrawers:oak_full_drawers_4' '' 'xp:50;table:common' -size 1.5 -desc @'
&bStorage Drawers&r: each drawer holds a big stack of one item, and shows it on the front.

Right-click to put the item you are holding in; double-click to put all of that item from your inventory in. Left-click takes items out.
'@
Q 'drawer_controller' 'Drawer Controller' 'storagedrawers:controller' 'drawers' 'xp:100;table:uncommon' -desc 'Connects all touching drawers. Put items into the controller and they go to the right drawer. Pipe items into it for automatic sorting.'
Q 'drawer_upgrades' 'Drawer Upgrades' 'storagedrawers:upgrade_template;storagedrawers:iron_storage_upgrade;storagedrawers:gold_storage_upgrade' 'drawers' 'xp:75' -desc 'Storage upgrades multiply the capacity of a drawer.'
Q 'drawer_big' 'Bigger Drawers' 'storagedrawers:diamond_storage_upgrade;storagedrawers:emerald_storage_upgrade' 'drawer_upgrades' 'xp:150;table:uncommon' -desc 'Much more capacity.'
Q 'compacting_drawer' 'Compacting Drawer' 'storagedrawers:compacting_drawers_3' 'drawers' 'xp:75' -desc 'Stores nuggets, ingots and blocks of the same metal together, and converts between them automatically.'
Q 'drawer_void' 'Void Upgrade' 'storagedrawers:void_upgrade' 'drawer_upgrades' 'xp:50' -desc 'A full drawer with a void upgrade deletes extra items. Great for cobblestone farms.'
Q 'drawer_keys' 'Drawer Keys' 'storagedrawers:drawer_key;storagedrawers:quantify_key' 'drawers' 'xp:25' -opt -desc 'Lock a drawer to its item, or show the exact amount.'
Q 'functional' 'Functional Storage' 'functionalstorage:oak_1;functionalstorage:storage_controller' 'drawers' 'xp:75' -desc '&bFunctional Storage&r is another drawer mod with its own controller, ender drawers and fluid drawers.'
Q 'func_upgrades' 'Functional Upgrades' 'functionalstorage:iron_downgrade;functionalstorage:gold_upgrade;functionalstorage:diamond_upgrade' 'functional' 'xp:100' -opt -desc 'Upgrade drawers, or downgrade them to keep only a little.'
Q 'ender_drawer' 'Ender Drawer' 'functionalstorage:ender_drawer' 'functional' 'xp:150' -desc 'Linked drawers share their contents, anywhere in the world.'
Q 'fluid_drawer' 'Fluid Drawers' 'functionalstorage:fluid_1' 'functional' 'xp:50' -opt -desc 'Drawers for fluids.'
Q 'armory' 'Armory Cabinet' 'functionalstorage:armory_cabinet' 'functional' 'xp:50' -opt -desc 'Stores lots of non-stackable items like tools and armor.'

# ===== Networks =====
Q 'toms' 'Tom''s Simple Storage' 'toms_storage:storage_terminal;toms_storage:inventory_connector' '' 'xp:75;table:common' -size 1.5 -desc @'
&bTom's Simple Storage&r is an easy early storage network. Place an &eInventory Connector&r touching your chests (or connect them with Inventory Cables), and add a &eStorage Terminal&r.

Now you can see and search everything in all connected chests from one screen. A great step before AE2!
'@
Q 'toms_crafting' 'Crafting Terminal' 'toms_storage:crafting_terminal' 'toms' 'xp:50' -desc 'A terminal with a crafting grid that uses items from the network.'
Q 'toms_cable' 'Inventory Cables' 'toms_storage:inventory_cable*16' 'toms' 'xp:25' -desc 'Connect chests that are further away.'
Q 'toms_wireless' 'Wireless Terminal' 'toms_storage:wireless_terminal' 'toms_crafting' 'xp:100;table:uncommon' -desc 'Access your Tom''s network from a distance.'
Q 'toms_filter' 'Filters' 'toms_storage:item_filter;toms_storage:tag_item_filter' 'toms' 'xp:25' -opt -desc 'Choose which items go into which inventory.'
Q 'to_ae2' 'Ready for More?' 'check' 'toms_wireless,drawer_controller,controller' 'xp:100' -icon 'ae2:controller' -desc 'Once your base outgrows simple networks, move on to the &bApplied Energistics 2&r chapter (or Mekanism''s QIO) for real digital storage and autocrafting.'

# ===== Pipes & magnets =====
Q 'pipez' 'Pipez' 'pipez:item_pipe*16;pipez:wrench' '' 'xp:50;table:common' -size 1.5 -desc @'
&bPipez&r adds simple, fast pipes for items, fluids, energy and Mekanism gases.

Pipes only extract from a block when you set that side to extract: shift + right-click the connection with the &eWrench&r.
'@
Q 'pipez_types' 'All the Pipes' 'pipez:fluid_pipe*8;pipez:energy_pipe*8;pipez:gas_pipe*8' 'pipez' 'xp:50' -desc 'Fluid, energy and gas pipes work the same way.'
Q 'pipez_universal' 'Universal Pipe' 'pipez:universal_pipe*8' 'pipez_types' 'xp:75' -desc 'One pipe that carries everything.'
Q 'pipez_upgrades' 'Pipe Upgrades' 'pipez:basic_upgrade;pipez:improved_upgrade;pipez:advanced_upgrade' 'pipez' 'xp:100;table:uncommon' -desc 'Upgrades make an extracting connection faster and unlock filters, round-robin and redstone modes.'
Q 'pipez_ultimate' 'Ultimate Upgrade' 'pipez:ultimate_upgrade' 'pipez_upgrades' 'xp:150' -opt -desc 'The fastest pipe upgrade.'
Q 'magnet' 'Magnet' 'simplemagnets:basicmagnet' 'pipez' 'xp:50' -desc 'Pulls items around you into your inventory. Toggle it with a keybind.'
Q 'magnet2' 'Advanced Magnet' 'simplemagnets:advancedmagnet' 'magnet' 'xp:100' -desc 'A bigger range and a filter.'
Q 'demagnetize' 'Demagnetization Coil' 'simplemagnets:basic_demagnetization_coil' 'magnet' 'xp:25' -opt -desc 'Stops magnets from pulling items near your farms and machines.'
