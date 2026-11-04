# EMC policy

Ordinary resources, construction materials, food and supplies retain recipe-derived Equivox values. GSPack adds 88 conversions for unified material forms. No arbitrary fallback prices are assigned.

Endgame ingredients/trophies, compressed endgame resources, ores/raw ores, machines, Mystical seeds, tools, weapons and wearable equipment are excluded. Rules: kubejs/data/gspack/emc_policy.json. Native equipment components and block entities supplement ID rules; ordinary vanilla storage/decorations remain allowed.

The generated gspack:emc_excluded tag gets zero EMC through config/Equivox/custom_emc.json. A post-remap guard removes excluded entries reintroduced by other mappers or pregenerated caches. Player EMC balances are unchanged. The instance sync preserves local custom EMC entries.

Restart after installation. Run /gspackemc audit (no OP required) for valued/excluded/unmapped counts and examples. Check tooltips, the condenser and transmutation table. Items lacking a valid mapped recipe/base value can remain unmapped: full coverage requires a live remap check. Creative-only items are not made obtainable.
