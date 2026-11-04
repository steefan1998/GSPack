Chapter 'welcome' 'Welcome to GSPack' 'minecraft:nether_star' '' 'Start here! How the quest book, rewards and the pack work.'

Q 'welcome' 'Welcome to GSPack!' 'check' '' 'xp:50;minecraft:bread*16;minecraft:torch*32' -size 2 -shape 'gear' -icon 'minecraft:nether_star' -sub 'Click the checkmark to begin' -desc (
    "Welcome to &6GSPack&r! This quest book is your guide through the pack.||" +
    "New to the game or the pack? Start with &eGetting Started&r: it takes you from your first tree to the Ender Dragon and the Wither.||" +
    "After that, each chapter on the left covers one big mod: &bTechnology&r (Mekanism, Applied Energistics 2, Oritech), " +
    "&dMagic & Farming&r (Mystical Agriculture with the full &eSeed Codex&r, Apotheosis, Thaumaturge, Equivox) and &aExploration&r (Allthemodium, Aquaculture, The Aether II, The Twilight Forest, Stellaris).||" +
    "Nothing is forced: play the chapters in any order you like.|{@pagebreak}|" +
    "&eHow to complete a quest&r|" +
    "- &fItem tasks&r detect items in your inventory automatically. Items are &onot&r taken from you.|" +
    "- &fCheckmark tasks&r are completed by clicking them.|" +
    "- &fDimension, biome and kill tasks&r complete when you go somewhere or defeat something.||" +
    "Quests unlock when the quests they are connected to are done.")

Q 'book' 'Your Quest Book' 'check' 'welcome' 'xp:25' -icon 'ftbquests:book' -desc (
    "Open this book any time with the &equest button&r in the top-left of your inventory, or with the quest book keybind (set it under Options > Controls).||" +
    "Lost the book item? No problem, the inventory button always works.")

Q 'rewards' 'Rewards & Loot Tables' 'check' 'welcome' 'table:common' -icon 'minecraft:chest' -desc (
    "Finished quests give &arewards&r: items, XP, or a roll on a &dreward table&r.||" +
    "Click a reward to claim it, or use &eClaim All&r at the bottom right of the chapter.||" +
    "&7Reward tables in this pack:|&fCommon, Uncommon, Rare, Epic&r for general loot, plus themed tables like the &bEngineer's Crate&r, &dArcane Cache&r, &3Angler's Catch&r, &eSky Treasure&r, &2Twilight Spoils&r, &5Space Salvage&r and the &6Allthemodium Hoard&r.||" +
    "Some quests let you &echoose&r a reward from a table instead of a random roll.")

Q 'jei' 'Looking Up Recipes' 'check' 'welcome' 'xp:25' -icon 'minecraft:crafting_table' -desc (
    "&bJEI&r (Just Enough Items) is your recipe encyclopedia, on the right side of your inventory.||" +
    "- Hover over an item and press &eR&r to see its &frecipe&r.|" +
    "- Press &eU&r to see what it is &fused in&r.|" +
    "- Press &eA&r to bookmark it.||" +
    "Every item in a quest can also be clicked in the quest book to open JEI.")

Q 'team' 'Playing Together' 'check' 'book' 'xp:25' -icon 'minecraft:cake' -desc (
    "Quest progress is shared per &aFTB Team&r. Create or join a team with &e/ftbteams&r or via the team button in your inventory.||" +
    "Everyone in a team shares quest completion, so split up and tackle different chapters!||" +
    "Protect your base by claiming chunks on the &eFTB Chunks&r map (default &eM&r).")

Q 'maps' 'Finding Your Way' 'check' 'jei' 'minecraft:compass;xp:25' -icon 'minecraft:filled_map' -desc (
    "- &bJourneyMap&r draws a minimap in the corner of your screen. Press &eJ&r for the full-screen map, &eCtrl + J&r to hide or show the minimap.|" +
    "- Press &eB&r to set a waypoint and &eN&r to see all your waypoints, so you never lose your base.|" +
    "- &eM&r opens the &bFTB Chunks&r map, where you claim chunks.|" +
    "- &bWaystones&r let you teleport between places you have visited.|" +
    "- &bNature's Compass&r and &bExplorer's Compass&r help you find biomes and structures.")

Q 'qol' 'Quality of Life' 'check' 'rewards' 'xp:25' -icon 'sophisticatedbackpacks:backpack' -desc (
    "A few handy tools in this pack:|" +
    "- &bSophisticated Backpacks&r: extra storage on your back, with upgrades.|" +
    "- &bFTB Ultimine&r: hold the Ultimine key (see Options > Controls) while mining to break whole veins at once.|" +
    "- &bJade&r: shows what block or entity you are looking at.|" +
    "- &bFTB Backups&r: saves your world regularly, just in case.")

Q 'grave' 'Rest in Peace' 'check' 'qol' 'xp:25' -icon 'tombstone:decorative_grave_simple' -desc (
    "Died far from home? Do not panic.||" +
    "&bCorail Tombstone&r puts your items in a &egrave&r at the place where you died. Go back to it and open it to get everything back.||" +
    "Write down your death location, or set a waypoint there with &eB&r.")

Q 'start' 'Where Do I Start?' 'check' 'team,maps,qol' 'table:uncommon' -size 1.5 -shape 'hexagon' -icon 'minecraft:iron_pickaxe' -desc (
    "Not sure where to begin? A good route:|" +
    "0. &aGetting Started&r for the basics: iron, diamonds, the Nether.|" +
    "1. &aMystical Agriculture&r to start farming resources early.|" +
    "2. &aMekanism&r for ore processing and power.|" +
    "3. &aApplied Energistics 2&r for storage.|" +
    "4. &aThe Twilight Forest&r and &aThe Aether II&r for adventure.|" +
    "5. &aOritech&r, &aAllthemodium&r and &aStellaris&r for the late game, all the way to the Moon!||" +
    "Have fun, and good luck!")

Q 'mastery' 'Chapter Mastery' 'check' 'book' 'xp:25' -opt -icon 'gspack:infinity_trophy' -desc @'
Complete every required quest in a chapter to unlock its mastery. Optional quests do not block it. Mastery follows your FTB Quests team.

&e/mastery&r shows your completed chapters in colour. Unfinished chapters stay hidden.
&e/mastery player <player>&r checks another online player.
&e/mastery chapter ae2&r lists online AE2 masters and completed teams, including offline teams. Replace ae2 with another chapter key.
&e/mastery list&r lists all chapter keys.

Everyone can use these commands without OP. Mastery is checked on login and every ten seconds; it never completes quests for you.
'@
