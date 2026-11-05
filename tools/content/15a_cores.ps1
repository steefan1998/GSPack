# Five independent routes; authoring data is shared with the recipe contract test.
QGroup 'cores' 'Cores'
$definitions = Get-Content (Join-Path $PSScriptRoot '../content-data/cores.json') -Raw | ConvertFrom-Json
$titles = @{tech_core='Technological';arcane_core='Arcane';verdant_core='Verdant';dimensional_core='Dimensional';cosmic_core='Cosmic'}
foreach ($definition in $definitions) {
    $key=$definition[0]; $frame=$definition[1]; $ingredients=@($definition[2])
    $chapter='core_'+$key.Replace('_core',''); $title=$titles[$key]; $tech=$key -eq 'tech_core'
    Chapter $chapter "$title Core" "gspack:$key" 'cores' 'Master the ingredients and craft this endgame core.' -showlines
    Q 'intro' "$title Core: Start" 'check' '' 'xp:50' -icon "gspack:$key" -shape 'gear' -size 1.5 -pos '0,-5' -desc 'Complete this route independently. Quests do not consume ingredients. JEI shows exact quantities. Combine all five cores in a Powah Energizing Orb with 1 billion FE.'
    if($tech) {
        Q 'workstation' 'FE Assembly Multiblock' 'extendedcrafting:crafting_core;extendedcrafting:pedestal*24' 'intro' 'xp:100' -shape 'hexagon' -pos '0,-3' -desc 'Build a 7x7 outer ring of 24 Pedestals around a Crafting Core at the SAME height. Put an Advanced AE Quantum Core on the central core. Use ONE ingredient per pedestal: eight different technology items, eight Elite Components, four double-compressed Osmium Blocks and four Black Iron Blocks. Supply 250,000,000 FE, up to 25,000 FE/t. At full power and 20 TPS the craft takes 8 minutes 20 seconds. Check JEI. Do not add unrelated ingredients.'
    } else {
        Q 'workstation' 'Elite Crafting Table' 'extendedcrafting:elite_table' 'intro' 'xp:100' -shape 'hexagon' -pos '0,-3' -desc 'Use the Elite Crafting Table (7x7). The outer frame requires 4 Elite Components, 16 Black Iron Ingots and 4 themed frame ingredients. The nine inner ingredients come from this core''s mod group. Check JEI for their exact arrangement.'
    }
    $distinct=@($ingredients | Select-Object -Unique); $deps=@('workstation')
    for($n=0;$n -lt $distinct.Count;$n++) {
        $item=$distinct[$n]; $part="part_$n";$deps+=$part
        $name=(Get-Culture).TextInfo.ToTitleCase((($item -split ':')[1]).Replace('_',' '))
        $x=(($n%3)-1)*3; $y=[int][math]::Floor($n/3)*2
        $shape=if($n%2){'hexagon'}else{'circle'}
        Q $part $name $item 'workstation' 'xp:75' -shape $shape -pos "$x,$y" -desc ("Required mod: "+($item -split ':')[0]+". Produce this component through that mod. Crafting consumes the quantities listed in JEI.")
    }
    $deps+='frame';$metal=if($tech){'block'}else{'ingot'}
    if ($key -eq 'verdant_core') {
        $harvest = @('minecraft:wheat','minecraft:carrot','minecraft:potato','minecraft:beetroot','minecraft:pumpkin','minecraft:melon_slice','minecraft:sugar_cane','minecraft:apple','productivefarming:rice','productivefarming:cotton','productivefarming:strawberry','productivefarming:black_beans','productivefarming:sugar_beet','productivefarming:garlic','productivefarming:cabbage','productivefarming:blueberry')
        Q 'harvest' 'A Complete Harvest' ($harvest -join ';') 'workstation' 'xp:200;table:rare' -shape 'hexagon' -pos '5,4' -desc 'The Verdant Core combines vanilla farming, Productive Trees, Productive Farming, Mystical Agriculture and Aquaculture. Produce every crop in this task. The 7x7 recipe uses all 25 inner slots. Productive Bees remains optional.'
        $deps+='harvest'
        $script:Cur.ByKey['workstation'].Desc='Use the Elite Crafting Table (7x7). The outer frame requires 4 Elite Components, 16 Black Iron Ingots and 4 double-compressed Emerald Blocks. Fill all 25 inner slots with the farming components and diverse harvest shown in JEI.'
    }
    Q 'frame' 'Assembly Materials' "$frame;extendedcrafting:elite_component;extendedcrafting:black_iron_$metal" 'workstation' 'xp:100' -shape 'diamond' -pos '5,2' -desc 'Prepare these materials in the full quantities shown by JEI. Frame ingredients are required as well as the central mod components.'
    Q 'finish' "$title Core" "gspack:$key" ($deps -join ',') 'xp:1000;table:epic' -size 2 -shape 'gear' -pos '0,7' -desc 'Craft this core and continue in Endgame: Infinity. Every Creative Singularity needs all five cores.'
}
