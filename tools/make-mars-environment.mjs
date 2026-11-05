// Dimension-local biomes and native spawn tables; no global biome overrides.
import fs from 'node:fs';import path from 'node:path';
const json=p=>JSON.parse(fs.readFileSync(p,'utf8'));
const write=(p,v)=>{fs.mkdirSync(path.dirname(p),{recursive:true});fs.writeFileSync(p,JSON.stringify(v,null,2)+'\n')};
const biomePath='kubejs/data/gspack/worldgen/biome/mars.json',biome=json(biomePath);
biome.spawners.monster=[
 {type:'minecraft:enderman',weight:3,minCount:1,maxCount:2},
 {type:'minecraft:creeper',weight:6,minCount:1,maxCount:2},
 {type:'mekanismadditions:baby_creeper',weight:2,minCount:1,maxCount:1},
 {type:'minecraft:zombie',weight:8,minCount:1,maxCount:3}
];write(biomePath,biome);
const frozen=structuredClone(biome);frozen.temperature=-0.7;frozen.downfall=0;frozen.has_precipitation=false;
Object.assign(frozen.effects,{sky_color:10259887,fog_color:10991819,grass_color:12634828,foliage_color:12634828});
write('kubejs/data/gspack/worldgen/biome/mars_frozen_wastes.json',frozen);
const dimensionPath='kubejs/data/stellaris/dimension/mars.json',dimension=json(dimensionPath);
const common={continentalness:[-1,1],depth:[-1,1],erosion:[-1,1],humidity:[-1,1],offset:0,weirdness:[-1,1]};
dimension.generator.biome_source={type:'minecraft:multi_noise',biomes:[
 {biome:'gspack:mars_frozen_wastes',parameters:{...common,temperature:[-1,-0.55]}},
 {biome:'gspack:mars',parameters:{...common,temperature:[-0.55,1]}}
]};write(dimensionPath,dimension);
const noisePath='kubejs/data/gspack/worldgen/noise_settings/mars.json',noise=json(noisePath);
const surface=noise.surface_rule.sequence.find(r=>r.if_true?.type==='minecraft:above_preliminary_surface').then_run.sequence;
const iceRule={type:'minecraft:condition',if_true:{type:'minecraft:biome',biome_is:['gspack:mars_frozen_wastes']},then_run:{type:'minecraft:sequence',sequence:[
 {type:'minecraft:condition',if_true:{type:'minecraft:stone_depth',add_surface_depth:false,offset:0,secondary_depth_range:0,surface_type:'floor'},then_run:{type:'minecraft:block',result_state:{Name:'minecraft:packed_ice'}}},
 {type:'minecraft:condition',if_true:{type:'minecraft:stone_depth',add_surface_depth:false,offset:3,secondary_depth_range:0,surface_type:'floor'},then_run:{type:'minecraft:block',result_state:{Name:'minecraft:blue_ice'}}}
]}};
noise.surface_rule.sequence.find(r=>r.if_true?.type==='minecraft:above_preliminary_surface').then_run.sequence=[iceRule,...surface.filter(r=>!r.if_true?.biome_is?.includes('gspack:mars_frozen_wastes'))];write(noisePath,noise);
write('kubejs/data/stellaris/tags/entity_type/no_oxygen_needed.json',{replace:false,values:[...biome.spawners.monster.map(s=>s.type),'minecraft:villager']});
const langPath='kubejs/feature_assets/mars/assets/gspack/lang/en_us.json',lang=json(langPath);lang['biome.gspack.mars']='Martian Wastes';lang['biome.gspack.mars_frozen_wastes']='Martian Frozen Wastes';write(langPath,lang);
console.log('Generated Mars desert/ice climate biomes, native mob spawn tables, ice surface rules and Stellaris oxygen exemptions.');
