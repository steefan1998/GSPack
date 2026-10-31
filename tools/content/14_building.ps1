Chapter 'building' 'Building' 'mcwfurnitures:oak_chair' 'base' 'Furniture, roofs, windows, paths and tools to build a beautiful base.'

# ===== Build tools =====
Q 'start' 'Time to Build' 'constructionstick:wooden_stick' '' 'xp:50;table:common' -size 1.5 -shape 'gear' -sub 'Make your base beautiful' -desc @'
This chapter shows the building and decoration mods in the pack.

The &eConstruction Stick&r (wand) places a whole row or wall of the block you are looking at, using blocks from your inventory. Hold it and right-click the side of a block.

&6Tip:&r Better sticks place more blocks at once and have more modes.
'@
Q 'stick_iron' 'Iron Stick' 'constructionstick:iron_stick' 'start' 'xp:50' -desc 'Places more blocks at once.'
Q 'stick_diamond' 'Diamond Stick' 'constructionstick:diamond_stick' 'stick_iron' 'xp:100' -desc 'Even more blocks, and can take templates.'
Q 'stick_netherite' 'Netherite Stick' 'constructionstick:netherite_stick' 'stick_diamond' 'xp:150;table:uncommon' -desc 'The best stick.'
Q 'stick_templates' 'Stick Templates' 'constructionstick:template_angel;constructionstick:template_destruction;constructionstick:template_replacement' 'stick_diamond' 'xp:100' -opt -desc @'
Templates add modes to your stick:
- &eAngel&r: place blocks in mid-air.
- &eDestruction&r: break a whole surface.
- &eReplacement&r: swap blocks for another type.
'@
Q 'gadget' 'Building Gadget' 'buildinggadgets2:gadget_building' 'stick_iron' 'xp:150;table:uncommon' -desc @'
&bBuilding Gadgets&r place shapes of blocks with one click: walls, floors, columns and more. They run on power (FE).

Shift + right-click to choose the shape and size.
'@
Q 'exchanging' 'Exchanging Gadget' 'buildinggadgets2:gadget_exchanging' 'gadget' 'xp:100' -desc 'Swap a whole area of blocks for another block.'
Q 'copy_paste' 'Copy & Paste' 'buildinggadgets2:gadget_copy_paste;buildinggadgets2:template_manager' 'gadget' 'xp:200;table:rare' -desc 'Copy a build and paste it somewhere else. Save builds as templates in the Template Manager.'
Q 'destruction' 'Destruction Gadget' 'buildinggadgets2:gadget_destruction' 'gadget' 'xp:100' -opt -desc 'Removes a big area of blocks at once. It can undo, too!'
Q 'rftools' 'RFTools Builder' 'rftoolsbuilder:builder;rftoolsbuilder:shape_card_def' 'copy_paste' 'xp:200;table:rare' -desc @'
&bRFTools Builder&r builds (or quarries) with &eshape cards&r. It can build huge shapes, copy whole areas, and even move them.

Use the &eComposer&r to combine shapes.
'@
Q 'quarry' 'Quarry Card' 'rftoolsbuilder:shape_card_quarry' 'rftools' 'xp:200' -opt -desc 'Turn the Builder into a powerful quarry.'
Q 'space_chamber' 'Space Chamber' 'rftoolsbuilder:space_chamber_controller;rftoolsbuilder:space_chamber_card' 'rftools' 'xp:150' -opt -desc 'Mark an area to copy and move with the Builder.'

# ===== Furniture =====
Q 'furniture' 'Furniture' 'mcwfurnitures:oak_chair;mcwfurnitures:oak_table' '' 'xp:50;table:common' -size 1.5 -desc @'
&bMacaw's Furniture&r has hundreds of pieces in every wood type: chairs, tables, desks, wardrobes, kitchens and more.

Many pieces are functional: drawers and cabinets are storage, and you can sit on chairs.
'@
Q 'kitchen' 'Kitchen' 'mcwfurnitures:oak_kitchen_cabinet;mcwfurnitures:oak_counter' 'furniture' 'xp:50' -desc 'Build a kitchen with cabinets and counters.'
Q 'bedroom' 'Bedroom' 'mcwfurnitures:oak_wardrobe;mcwfurnitures:oak_drawer' 'furniture' 'xp:50' -desc 'Wardrobes and drawers store your things.'
Q 'office' 'Study' 'mcwfurnitures:oak_desk;mcwfurnitures:oak_bookshelf' 'furniture' 'xp:50' -opt -desc 'A desk and a bookshelf for your study.'
Q 'lights' 'Lighting' 'mcwlights:chain_lantern;mcwlights:wall_lantern;mcwlights:iron_chandelier' 'furniture' 'xp:50' -desc '&bMacaw''s Lights&r: lanterns, chandeliers, lamps and street lights.'
Q 'street' 'Street Lamps' 'mcwlights:classic_street_lamp;mcwlights:oak_tiki_torch' 'lights' 'xp:50' -opt -desc 'Light up your paths and gardens.'
Q 'holidays' 'Holiday Spirit' 'mcwholidays:snowman;mcwholidays:large_pumpkin' 'furniture' 'xp:50' -opt -desc '&bMacaw''s Holidays&r has decorations for Christmas, Halloween and more.'

# ===== Structure =====
Q 'roofs' 'Roofs' 'mcwroofs:oak_roof;mcwroofs:oak_steep_roof;mcwroofs:oak_top_roof' '' 'xp:50;table:common' -size 1.5 -desc @'
&bMacaw's Roofs&r: proper roof blocks in many shapes and materials. Steep roofs, attic roofs, lower roofs and the top ridge piece.

Combine shapes to get a nice slope.
'@
Q 'gutters' 'Gutters' 'mcwroofs:rain_gutter' 'roofs' 'xp:25' -opt -desc 'Rain gutters for the edge of your roof.'
Q 'windows' 'Windows' 'mcwwindows:oak_window;mcwwindows:oak_four_window' 'roofs' 'xp:50' -desc '&bMacaw''s Windows&r: framed windows that connect, plus shutters, blinds and curtains.'
Q 'shutters' 'Shutters & Curtains' 'mcwwindows:oak_shutter;mcwwindows:oak_curtain_rod;mcwwindows:oak_blinds' 'windows' 'xp:50' -opt -desc 'Open and close them for the perfect look.'
Q 'doors' 'Doors' 'mcwdoors:oak_cottage_door;mcwdoors:oak_barn_door;mcwdoors:oak_glass_door' 'roofs' 'xp:50' -desc '&bMacaw''s Doors&r: dozens of door styles, from cottage to modern to Japanese.'
Q 'trapdoors' 'Trapdoors' 'mcwtrpdoors:metal_trapdoor' 'doors' 'xp:25' -opt -desc 'Many trapdoor styles to match.'
Q 'stairs' 'Stairs & Balconies' 'mcwstairs:oak_bulk_stairs;mcwstairs:oak_balcony;mcwstairs:oak_railing' 'roofs' 'xp:50' -desc '&bMacaw''s Stairs&r: proper staircases, railings, platforms and balconies.'
Q 'fences' 'Fences & Hedges' 'mcwfences:oak_picket_fence;mcwfences:oak_hedge' 'roofs' 'xp:50' -desc '&bMacaw''s Fences&r: picket fences, stone walls, metal fences and hedges.'
Q 'bridges' 'Bridges' 'mcwbridges:rope_oak_bridge;mcwbridges:stone_brick_bridge' 'fences' 'xp:50' -desc '&bMacaw''s Bridges&r: rope bridges, stone bridges and more.'
Q 'paths' 'Paths' 'mcwpaths:andesite_flagstone;mcwpaths:andesite_basket_weave_paving' 'fences' 'xp:50' -desc '&bMacaw''s Paths&r: paving patterns for roads and gardens.'

# ===== Decoration =====
Q 'chisel' 'Rechiseled' 'rechiseled:chisel' '' 'xp:50;table:common' -size 1.5 -desc @'
&bRechiseled&r turns plain blocks into decorative variants: tiles, bricks, pillars, patterns and more.

Hold the &eChisel&r and right-click to open it, put blocks in, and choose a variant. Many variants &econnect&r to their neighbours.
'@
Q 'chisel_more' 'Chisel Collection' 'rechiseled:basalt_tiles;rechiseled:basalt_pattern;rechiseled:amethyst_block_tiles' 'chisel' 'xp:50' -opt -desc 'Try a few variants.'
Q 'framed' 'Framed Blocks' 'framedblocks:framed_cube;framedblocks:framed_slab;framedblocks:framed_stairs' 'chisel' 'xp:75' -desc @'
&bFramedBlocks&r are shapes (cubes, slabs, stairs, panels, doors and hundreds more) that take the look of &eany&r block.

Right-click a framed block with any block to give it that texture.
'@
Q 'framing_saw' 'Framing Saw' 'framedblocks:framing_saw' 'framed' 'xp:75' -desc 'Craft every framed block shape from one place.'
Q 'framed_tools' 'Framed Tools' 'framedblocks:framed_hammer;framedblocks:framed_wrench;framedblocks:framed_screwdriver' 'framed' 'xp:50' -opt -desc 'The hammer removes the camo, the wrench rotates, and the screwdriver adjusts special shapes.'
Q 'framed_chest' 'Framed Chest' 'framedblocks:framed_chest' 'framed' 'xp:25' -opt -desc 'A chest that looks like any block. Hide your storage!'
Q 'master_builder' 'Master Builder' 'check' 'furniture,roofs,windows,doors,stairs,chisel,framed,gadget' 'lvl:15;table:rare' -size 1.5 -shape 'hexagon' -icon 'mcwroofs:oak_roof' -desc 'You know all the building tools in GSPack. Show off your base to your friends!'
