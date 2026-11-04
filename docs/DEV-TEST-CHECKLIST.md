# Unreleased Dev Build test checklist

Restart Minecraft and any dedicated server before testing. Silicon changes a startup table; EMC needs a fresh map. Existing quest progress uses stable IDs.

1. Without OP, run /mastery, /mastery player <online-player>, /mastery chapter ae2 and /mastery list. Only mastered chapters appear in colour. Read Chapter Mastery in Welcome.
2. Extended Crafting starts with a checkmark, not a missing book.
3. Check Farming (25), Mob Hunting Board (22), Neo Vitae (28), Utilities (eight categories) and Mekanism Circuits / Alloys / Tier Installers.
4. Craft the Neo Vitae Guide Book (redstone + book); complete an altar/orb quest and a player-kill bounty.
5. Test all four silicon items unifying to AE2 and completing tag quests. Printed Silicon stays separate.
6. Check the three changed Occultism rituals in JEI. Arcane Core requires a tier-4 Storage Stabilizer, three Void Metal ingots, two Godforged Pearls, two Red Matter blocks and a Primordial Pearl.
7. Run /gspackemc audit. Check ordinary EMC values and that excluded items cannot be transmuted, including after remapping.
8. Walk in shallow/deep Flux Goo; leave and check normal walking, water and flight. Harmful effects remain.
9. Inspect all eleven loot-table previews.
10. Inspect fresh logs for errors and EMC policy messages. Twelve invalid conditions were corrected to neoforge:never.

Automated checks cover syntax, quest IDs/dependencies, item IDs, recipe grids, EMC policy/remapping and Flux Goo modifier cleanup. These do not replace an in-game playtest.
