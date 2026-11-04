# Compact, independently approachable branches for AE2 and Mekanism.
# Group membership changes presentation, never task/reward IDs or item counts.
function Set-CompactBranches($chapterKey, $groups, $free, $deps) {
    $c = $script:Chapters | Where-Object Key -eq $chapterKey
    $seen = @{}; $c.LabelAnchors = @{}; $c.BranchGroups = @{}
    $panel = 0; $bandY = 0.0; $bandHeight = 0.0
    foreach ($group in $groups) {
        $keys = $group.Keys -split ','
        $x = ($panel % 3) * 10.8
        $c.LabelAnchors[$group.Label] = '{0},{1}' -f ($x - 0.9).ToString($Inv), $bandY.ToString($Inv)
        for ($i = 0; $i -lt $keys.Count; $i++) {
            $key = $keys[$i]; $q = $c.ByKey[$key]
            if (-not $q -or $seen.ContainsKey($key)) { throw "Invalid compact branch: $chapterKey/$key" }
            $seen[$key] = $true; $c.BranchGroups[$key] = $panel
            $qx = $x + ($i % 3) * 1.8
            $qy = $bandY + [Math]::Floor($i / 3) * 1.8
            $q.Pos = '{0},{1}' -f $qx.ToString($Inv), $qy.ToString($Inv)
        }
        $bandHeight = [Math]::Max($bandHeight, [Math]::Ceiling($keys.Count / 3.0) * 1.8 + 3.0)
        $panel++
        if ($panel % 3 -eq 0) { $bandY += $bandHeight; $bandHeight = 0.0 }
    }
    foreach ($key in $free) {
        $c.ByKey[$key].Deps = @($c.ByKey[$key].OriginalDeps)
        $c.ByKey[$key].Opt = $true
    }
    foreach ($key in $deps.Keys) { $c.ByKey[$key].Deps = @($deps[$key] -split ',' | Where-Object { $_ }) }
    if ($chapterKey -eq 'ae2') {
        $wireless = $c.ByKey['wireless'].Pos -split ','
        $p2p = $c.ByKey['p2p'].Pos -split ','
        $c.LabelAnchors['p2p'] = '{0},{1}' -f ([double]::Parse($wireless[0], $Inv) - 0.9).ToString($Inv), $p2p[1]
    }
    if ($seen.Count -ne $c.Quests.Count) {
        throw "Unplaced $chapterKey quests: $((@($c.Quests | Where-Object { -not $seen.ContainsKey($_.Key) } | ForEach-Object Key)) -join ', ')"
    }
}

Set-CompactBranches 'ae2' @(
    @{Label='certus'; Keys='inscriber,meteorite,certus,charger,charged,fluix,cable,controller,energy_cell'},
    @{Label='presses'; Keys='presses,silicon,circuits,processors,skystone,budding,growth'},
    @{Label='cable'; Keys='compass,knife,wrench,fluix_tools,smart,dense,channels'},
    @{Label='drive'; Keys='drive,cell1k,cells,cell256,fluid_cell,workbench,portable,me_chest,io_port'},
    @{Label='terminal'; Keys='terminal,crafting_term,import,export,interface,storage_bus,level_emitter,cards,planes'},
    @{Label='wireless'; Keys='wireless,wireless_term,wireless_craft,infinity_card,p2p,p2p_types,quantum,spatial,chem_p2p'},
    @{Label='pattern'; Keys='pattern,cpu,provider,assembler,access,big_cpu,requester,polymorphic,oritech_link'},
    @{Label='ex_start'; Keys='ex_start,ex_devices,ex_assembler,ex_wireless,entro,chem_cell,appflux,ender_drives,app_thaum'},
    @{Label='adv_ae'; Keys='adv_ae,reaction,adv_provider,qstorage,qcomputer,qarmor,replication,replicator,apprep'}
) @(
    'compass','knife','wrench','fluix_tools','channels','workbench','portable','me_chest','level_emitter',
    'cards','planes','io_port','access','requester','polymorphic','p2p_types','spatial','chem_p2p',
    'oritech_link','ex_start','chem_cell','appflux','ender_drives','app_thaum','replication'
) @{
    inscriber=''; meteorite='inscriber'; certus='meteorite'; growth='budding'
    processors='inscriber'; dense='smart'; controller='cable'; interface='controller'; storage_bus='controller'
    provider='pattern'; wireless_craft='wireless_term'; p2p='controller'; adv_ae='assembler'
}

Set-CompactBranches 'mekanism' @(
    @{Label='osmium'; Keys='osmium,infuser,steel,casing,tools_basic,refined_obsidian,ro_gear,glowstone'},
    @{Label='heat_gen'; Keys='heat_gen,cable,cube,solar,adv_solar,wind,bio,gas_gen,ethene,adv_cube,induction'},
    @{Label='enrich'; Keys='enrich,crusher,smelter,osmium_compressor,combiner,sawmill,separator,tanks,purify,inject,chem_infuser,evap,dissolve'},
    @{Label='circuit'; Keys='circuit,adv_circuit,elite,ultimate,extras,supreme,cosmic,infinite'},
    @{Label='alloy'; Keys='alloy,reinforced_alloy,atomic_alloy,radiance_alloy,thermonuclear_alloy,shining_alloy,spectrum_alloy'},
    @{Label='upgrades'; Keys='upgrades,muffler,installer,advanced_installer,elite_installer,ultimate_installer,absolute_installer,supreme_installer,cosmic_installer,infinite_installer,factory,naquadah,naquadah_reactor'},
    @{Label='transporter'; Keys='transporter,sorter,restrictive,configurator,card,bin,teleporter,portable_tp,qio,qio_more,miner'},
    @{Label='disassembler'; Keys='disassembler,jetpack,scuba,free_runners,robit,hazmat,modstation,mekatool,mekasuit'},
    @{Label='dyntank'; Keys='dyntank,boiler,turbine,uranium,centrifuge,fission,waste,plutonium,sps,laser,fusion,antiprotonic'}
) @(
    'tools_basic','ro_gear','glowstone','adv_solar','bio','muffler','combiner','sawmill',
    'restrictive','configurator','card','bin','portable_tp','scuba','free_runners','robit','dyntank'
) @{
    casing='steel'; heat_gen='infuser'; adv_cube='cube'; induction='ultimate'
    purify='separator'; dissolve='inject'; installer='adv_circuit'; factory='installer'
    elite='adv_circuit'; cosmic='supreme,sps'; infinite='cosmic'
    miner='elite'; hazmat='separator'; uranium='separator'; fission='centrifuge,hazmat'
    mekasuit='modstation,sps'; fusion='laser'; naquadah_reactor='naquadah'
}

# Welcome: three straight tutorial lanes, with a clean final milestone below.
$welcomeChapter = $script:Chapters | Where-Object Key -eq 'welcome'
$welcomePositions = @{
    welcome='0,0'; mastery='-4.8,4.8'; book='-2.4,2.4'; team='-2.4,4.8'; rewards='0,2.4'
    qol='0,4.8'; grave='0,7.2'; jei='2.4,2.4'; maps='2.4,4.8'; start='0,9.6'
}
foreach ($q in $welcomeChapter.Quests) { $q.Pos = $welcomePositions[$q.Key] }
$welcomeChapter.ByKey['start'].HideLines = $true
$welcomeChapter.ExtraImages = @(@{File='pack_logo.png'; X=0; Y=-4.2; Width=8; Height=2.08})
