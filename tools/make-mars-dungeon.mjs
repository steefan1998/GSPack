// Native Minecraft 26.1.2 jigsaw structure; deterministic gzip NBT and matching loot.
import fs from 'node:fs';import path from 'node:path';import {gzipSync} from 'node:zlib';
const json=p=>JSON.parse(fs.readFileSync(p,'utf8'));
const write=(p,v)=>{fs.mkdirSync(path.dirname(p),{recursive:true});fs.writeFileSync(p,JSON.stringify(v,null,2)+'\n')};
const biome=json('kubejs/data/gspack/worldgen/biome/mars.json');
biome.effects.fog_color=11836515;write('kubejs/data/gspack/worldgen/biome/mars_dome_fields.json',biome);
const dimPath='kubejs/data/stellaris/dimension/mars.json',dim=json(dimPath);
const common={continentalness:[-1,1],depth:[-1,1],erosion:[-1,1],offset:0,weirdness:[-1,1]};
dim.generator.biome_source={type:'minecraft:multi_noise',biomes:[
 {biome:'gspack:mars_frozen_wastes',parameters:{...common,humidity:[-1,1],temperature:[-1,-0.55]}},
 {biome:'gspack:mars',parameters:{...common,humidity:[-1,0.55],temperature:[-0.55,1]}},
 {biome:'gspack:mars_dome_fields',parameters:{...common,humidity:[0.55,0.72],temperature:[-0.55,1]}},
 {biome:'gspack:mars',parameters:{...common,humidity:[0.72,1],temperature:[-0.55,1]}}
]};write(dimPath,dim);
write('kubejs/data/gspack/worldgen/structure/mars_research_dome.json',{
 type:'minecraft:jigsaw',biomes:'gspack:mars_dome_fields',step:'surface_structures',spawn_overrides:{},
 start_pool:'gspack:mars/research_dome',size:1,start_height:{absolute:0},
 project_start_to_heightmap:'WORLD_SURFACE_WG',max_distance_from_center:80,use_expansion_hack:false,terrain_adaptation:'beard_thin'
});
write('kubejs/data/gspack/worldgen/template_pool/mars/research_dome.json',{fallback:'minecraft:empty',elements:[{weight:1,element:{element_type:'minecraft:single_pool_element',location:'gspack:mars/research_dome',processors:{processors:[]},projection:'rigid'}}]});
write('kubejs/data/gspack/worldgen/structure_set/mars_research_domes.json',{structures:[{structure:'gspack:mars_research_dome',weight:1}],placement:{type:'minecraft:random_spread',spacing:32,separation:12,salt:71860241}});
const supply={type:'minecraft:chest',pools:[{rolls:{type:'minecraft:uniform',min:3,max:6},entries:[
 {type:'minecraft:item',name:'minecraft:iron_ingot',weight:8,functions:[{function:'minecraft:set_count',count:{type:'minecraft:uniform',min:2,max:8}}]},
 {type:'minecraft:item',name:'stellaris:raw_titanium',weight:6,functions:[{function:'minecraft:set_count',count:{type:'minecraft:uniform',min:2,max:5}}]},
 {type:'minecraft:item',name:'minecraft:bread',weight:6},
 {type:'minecraft:item',name:'minecraft:gold_ingot',weight:3},
 {type:'minecraft:item',name:'stellaris:space_suit_oxygen_module_tier_1',weight:1}
]}]};write('kubejs/data/gspack/loot_table/chests/mars_dome_supplies.json',supply);
write('kubejs/data/gspack/loot_table/chests/mars_dome_relic.json',{type:'minecraft:chest',pools:[{rolls:1,entries:[{type:'minecraft:item',name:'gspack:martian_research_relic'}]},{rolls:1,entries:[{type:'minecraft:loot_table',value:'gspack:chests/mars_dome_supplies'}]}]});
const T=(t,v)=>({t,v}),I=v=>T(3,v),S=v=>T(8,v),C=v=>T(10,v),L=(t,v)=>T(9,{t,v}),H=v=>T(2,v);
function int(v,n=4){const b=Buffer.alloc(n);n===2?b.writeInt16BE(v):b.writeInt32BE(v);return b}
function text(s){const b=Buffer.from(s,'utf8');const n=Buffer.alloc(2);n.writeUInt16BE(b.length);return Buffer.concat([n,b])}
function payload(tag){switch(tag.t){case 1:return Buffer.from([tag.v]);case 2:return int(tag.v,2);case 3:return int(tag.v);case 5:{const b=Buffer.alloc(4);b.writeFloatBE(tag.v);return b}case 6:{const b=Buffer.alloc(8);b.writeDoubleBE(tag.v);return b}case 8:return text(tag.v);case 9:return Buffer.concat([Buffer.from([tag.v.t]),int(tag.v.v.length),...tag.v.v.map(v=>payload(T(tag.v.t,v)))]);case 10:return Buffer.concat([...Object.entries(tag.v).map(([k,v])=>Buffer.concat([Buffer.from([v.t]),text(k),payload(v)])),Buffer.from([0])]);default:throw Error('Unknown NBT tag')}}
const palette=[],states=new Map(),placed=new Map();
function block(x,y,z,name,props={},nbt){const key=JSON.stringify([name,props]);if(!states.has(key)){states.set(key,palette.length);const p={Name:S(name)};if(Object.keys(props).length)p.Properties=C(Object.fromEntries(Object.entries(props).map(([k,v])=>[k,S(v)])));palette.push(p)}const value={pos:L(3,[x,y,z]),state:I(states.get(key))};if(nbt)value.nbt=C(nbt);placed.set(`${x},${y},${z}`,value)}
// 33 x 18 x 33 dome; air inside carves a navigable dungeon into sloping terrain.
for(let x=1;x<32;x++)for(let z=1;z<32;z++){
 const d=Math.hypot(x-16,z-16);if(d>14.7)continue;
 block(x,0,z,(x%4===0||z%4===0)?'minecraft:polished_andesite':'minecraft:stone_bricks');
 for(let y=1;y<=16;y++){
  const radius=Math.sqrt((x-16)**2+(z-16)**2+(y-1)**2);
  if(radius<=14.7)block(x,y,z,radius>13.7?'minecraft:cyan_stained_glass':'minecraft:air');
 }
}
// Broken airlock: this abandoned dome needs visitors to bring their own oxygen.
for(let x=15;x<=17;x++)for(let z=0;z<=4;z++){
 block(x,0,z,'minecraft:stone_bricks');for(let y=1;y<=3;y++)block(x,y,z,'minecraft:air');
}
for(const [x,z] of [[7,16],[25,16],[16,7],[16,25]])block(x,0,z,'minecraft:sea_lantern');
for(const [x,z] of [[10,15],[22,15],[10,20],[22,20]])block(x,1,z,'minecraft:chiseled_copper');
function chest(x,z,loot){block(x,1,z,'minecraft:chest',{facing:'north',type:'single',waterlogged:'false'},{id:S('minecraft:chest'),LootTable:S(loot),x:I(x),y:I(1),z:I(z)})}
chest(16,17,'gspack:chests/mars_dome_relic');chest(8,16,'gspack:chests/mars_dome_supplies');chest(24,18,'gspack:chests/mars_dome_supplies');
for(const [x,z,entity] of [[9,9,'minecraft:zombie'],[23,9,'minecraft:zombie'],[9,23,'mekanismadditions:baby_creeper'],[23,23,'minecraft:enderman']]){
 const light=C({min_inclusive:I(0),max_inclusive:I(15)});
 block(x,1,z,'minecraft:spawner',{}, {id:S('minecraft:mob_spawner'),x:I(x),y:I(1),z:I(z),Delay:H(100),MinSpawnDelay:H(300),MaxSpawnDelay:H(700),SpawnCount:H(2),MaxNearbyEntities:H(6),RequiredPlayerRange:H(16),SpawnRange:H(4),SpawnData:C({entity:C({id:S(entity)}),custom_spawn_rules:C({block_light_limit:light,sky_light_limit:light})})});
}
const root=C({DataVersion:I(4790),size:L(3,[33,18,33]),palette:L(10,palette),blocks:L(10,[...placed.values()]),entities:L(10,[])});
const raw=Buffer.concat([Buffer.from([10]),text(''),payload(root)]),out='kubejs/data/gspack/structure/mars/research_dome.nbt';fs.mkdirSync(path.dirname(out),{recursive:true});fs.writeFileSync(out,gzipSync(raw));
write('tools/content-data/mars-dungeon.json',{size:[33,18,33],blocks:placed.size,palette:palette.map(p=>p.Name.v),spawners:4,chests:3,relicsPerDome:1,biome:'gspack:mars_dome_fields',oxygen:'abandoned airlock; visitors need their own oxygen'});
const langPath='kubejs/feature_assets/mars/assets/gspack/lang/en_us.json',lang=json(langPath);lang['biome.gspack.mars_dome_fields']='Martian Research Wastes';write(langPath,lang);
console.log(`Generated abandoned oxygen dome: ${placed.size} blocks, four spawners, three loot chests, one guaranteed relic; only Martian Research Wastes.`);
export {T,I,S,C,L,H,payload,text};
