// Reuse the dungeon's native NBT writer; import also refreshes the research dome.
import {T,I,S,C,L,H,payload,text} from './make-mars-dungeon.mjs';
import fs from 'node:fs';import path from 'node:path';import {gzipSync} from 'node:zlib';
const json=p=>JSON.parse(fs.readFileSync(p,'utf8'));
const write=(p,v)=>{fs.mkdirSync(path.dirname(p),{recursive:true});fs.writeFileSync(p,JSON.stringify(v,null,2)+'\n')};
const B=v=>T(1,v),F=v=>T(5,v);
const villageBiome=json('kubejs/data/gspack/worldgen/biome/mars.json');
write('kubejs/data/gspack/worldgen/biome/mars_colony_flats.json',villageBiome);
const dimPath='kubejs/data/stellaris/dimension/mars.json',dim=json(dimPath);
const common={continentalness:[-1,1],depth:[-1,1],erosion:[-1,1],offset:0,weirdness:[-1,1],temperature:[-0.55,1]};
dim.generator.biome_source={type:'minecraft:multi_noise',biomes:[
 {biome:'gspack:mars_frozen_wastes',parameters:{...common,temperature:[-1,-0.55],humidity:[-1,1]}},
 ...[[-1,-0.65,'gspack:mars'],[-0.65,-0.45,'gspack:mars_colony_flats'],[-0.45,0.55,'gspack:mars'],[0.55,0.72,'gspack:mars_dome_fields'],[0.72,1,'gspack:mars']].map(([min,max,biome])=>({biome,parameters:{...common,humidity:[min,max]}}))
]};write(dimPath,dim);
function builder(size){const palette=[],states=new Map(),blocks=new Map(),entities=[];return {
 block(x,y,z,name,props={},nbt){const key=JSON.stringify([name,props]);if(!states.has(key)){states.set(key,palette.length);const p={Name:S(name)};if(Object.keys(props).length)p.Properties=C(Object.fromEntries(Object.entries(props).map(([k,v])=>[k,S(v)])));palette.push(p)}const b={pos:L(3,[x,y,z]),state:I(states.get(key))};if(nbt)b.nbt=C(nbt);blocks.set(`${x},${y},${z}`,b)},
 entity(x,y,z,nbt){entities.push({pos:L(6,[x,y,z]),blockPos:L(3,[Math.floor(x),Math.floor(y),Math.floor(z)]),nbt:C({...nbt,Pos:L(6,[x,y,z]),Rotation:L(5,[0,0])})})},
 save(name){const root=C({DataVersion:I(4790),size:L(3,size),palette:L(10,palette),blocks:L(10,[...blocks.values()]),entities:L(10,entities)});const p=`kubejs/data/gspack/structure/mars/${name}.nbt`;fs.mkdirSync(path.dirname(p),{recursive:true});fs.writeFileSync(p,gzipSync(Buffer.concat([Buffer.from([10]),text(''),payload(root)])));return {blocks:blocks.size,entities:entities.length,palette:palette.map(p=>p.Name.v)}}
}}
const village=builder([65,19,65]),domes=[[32,32,14.7],[12,32,10.7],[52,32,10.7],[32,12,10.7],[32,52,10.7]];
const inside=(x,y,z)=>domes.some(([cx,cz,r])=>(x-cx)**2+(z-cz)**2+(y-1)**2<=r*r);
for(let x=1;x<64;x++)for(let z=1;z<64;z++)if(inside(x,1,z)){
 village.block(x,0,z,(x%5===0||z%5===0)?'minecraft:polished_andesite':'minecraft:stone_bricks');
 for(let y=1;y<18;y++)if(inside(x,y,z)){
  const shell=[[1,0,0],[-1,0,0],[0,1,0],[0,0,1],[0,0,-1]].some(([a,b,c])=>!inside(x+a,y+b,z+c));
  village.block(x,y,z,shell?'minecraft:light_blue_stained_glass':'minecraft:air');
 }
}
// A closed, two-door airlock at the northern dome entrance; pressure plates inside/outside.
for(let x=31;x<=33;x++)for(let z=0;z<=6;z++){village.block(x,0,z,'minecraft:stone_bricks');for(let y=1;y<=3;y++)village.block(x,y,z,x===32&&y<3?'minecraft:air':'minecraft:light_blue_stained_glass')}
for(const z of [2,5])for(const [half,y] of [['lower',1],['upper',2]])village.block(32,y,z,'minecraft:iron_door',{facing:'north',half,hinge:'left',open:'false',powered:'false'});
for(const z of [1,3,4,6])village.block(32,1,z,'minecraft:stone_pressure_plate',{powered:'false'});
village.block(32,0,32,'gspack:martian_village_life_support');
village.block(32,1,32,'stellaris:oxygen_distributor',{}, {id:S('stellaris:oxygen_distributor'),x:I(32),y:I(1),z:I(32),'stellaris.energyContainer':I(12800),'oxygen_tank-singleFluid':C({id:S('stellaris:oxygen'),amount:I(10000)})});
for(const [x,z] of [[12,32],[52,32],[32,12],[32,52]]){village.block(x,0,z,'minecraft:sea_lantern');village.block(x+2,1,z,'minecraft:cartography_table');for(const [part,xx] of [['foot',x-2],['head',x-1]])village.block(xx,1,z+3,'minecraft:cyan_bed',{facing:'east',part,occupied:'false'})}
const trades=[
 {emeralds:1,item:'gspack:mars_stone',count:32},{emeralds:1,item:'gspack:mars_regolith',count:32},
 {emeralds:1,item:'gspack:mars_sand',count:32},{emeralds:3,item:'minecraft:packed_ice',count:8},
 {emeralds:2,item:'minecraft:bread',count:8},{emeralds:2,item:'minecraft:copper_ingot',count:8},
 {emeralds:24,item:'stellaris:space_suit_oxygen_module_tier_1',count:1}
];
const offers=trades.map(t=>({buy:C({id:S('minecraft:emerald'),count:I(t.emeralds)}),sell:C({id:S(t.item),count:I(t.count)}),uses:I(0),maxUses:I(16),rewardExp:B(1),priceMultiplier:F(0),xp:I(1)}));
for(const [x,z] of [[12,32],[52,32],[32,52]])village.entity(x+0.5,1,z+0.5,{id:S('minecraft:villager'),PersistenceRequired:B(1),Age:I(0),Xp:I(250),VillagerData:C({type:S('minecraft:plains'),profession:S('minecraft:cartographer'),level:I(5)}),Offers:C({Recipes:L(10,offers)}),Tags:L(8,['gspack_mars_trader'])});
const villageInfo=village.save('oxygen_village');
function structure(name,biomes,spacing,salt,spawn_overrides={}){
 write(`kubejs/data/gspack/worldgen/structure/${name}.json`,{type:'minecraft:jigsaw',biomes,step:'surface_structures',spawn_overrides,start_pool:`gspack:mars/${name}`,size:1,start_height:{absolute:0},project_start_to_heightmap:'WORLD_SURFACE_WG',max_distance_from_center:80,use_expansion_hack:false,terrain_adaptation:'beard_thin'});
 write(`kubejs/data/gspack/worldgen/template_pool/mars/${name}.json`,{fallback:'minecraft:empty',elements:[{weight:1,element:{element_type:'minecraft:single_pool_element',location:`gspack:mars/${name}`,processors:{processors:[]},projection:'rigid'}}]});
 write(`kubejs/data/gspack/worldgen/structure_set/${name}.json`,{structures:[{structure:`gspack:${name}`,weight:1}],placement:{type:'minecraft:random_spread',spacing,separation:Math.floor(spacing/2),salt}});
}
structure('oxygen_village','gspack:mars_colony_flats',40,71008421);
const camp=builder([25,15,25]);
for(let x=1;x<24;x++)for(let z=1;z<24;z++){
 camp.block(x,0,z,'minecraft:polished_andesite');
 if(x===1||x===23||z===1||z===23)for(let y=1;y<=3;y++)camp.block(x,y,z,y===3?'minecraft:iron_bars':'minecraft:deepslate_bricks');
}
for(let x=9;x<=15;x++)for(let z=9;z<=15;z++){
 for(const y of [4,8])camp.block(x,y,z,'minecraft:dark_oak_planks');
 if((x===9||x===15)&&(z===9||z===15))for(let y=1;y<=12;y++)camp.block(x,y,z,'minecraft:dark_oak_log');
}
for(let x=10;x<=14;x++)for(let y=1;y<=2;y++)camp.block(x,y,1,'minecraft:air');
camp.block(12,1,12,'minecraft:chest',{facing:'south',type:'single',waterlogged:'false'},{id:S('minecraft:chest'),LootTable:S('gspack:chests/mars_dome_supplies'),x:I(12),y:I(1),z:I(12)});
for(const [i,[x,y,z]] of [[6,1,6],[18,1,6],[6,1,18],[18,1,18],[12,9,12]].entries())camp.entity(x+0.5,y,z+0.5,{id:S('minecraft:pillager'),PersistenceRequired:B(1),PatrolLeader:B(i===4?1:0),equipment:C({mainhand:C({id:S('minecraft:crossbow'),count:I(1)})}),Tags:L(8,['gspack_mars_raider'])});
const campInfo=camp.save('pillager_camp');
structure('pillager_camp',['gspack:mars','gspack:mars_colony_flats'],32,71008422,{monster:{bounding_box:'full',spawns:[{type:'minecraft:pillager',weight:1,minCount:1,maxCount:2}]}});
const immunePath='kubejs/data/stellaris/tags/entity_type/no_oxygen_needed.json',immune=json(immunePath);immune.values=[...new Set([...immune.values,'minecraft:villager','minecraft:pillager','minecraft:vindicator','minecraft:evoker','minecraft:illusioner','minecraft:ravager','minecraft:witch','minecraft:vex'])];write(immunePath,immune);
const typePath='kubejs/data/gspack/dimension_type/mars.json',type=json(typePath);type.attributes['minecraft:gameplay/can_start_raid']=true;write(typePath,type);
const langPath='kubejs/feature_assets/mars/assets/gspack/lang/en_us.json',lang=json(langPath);lang['biome.gspack.mars_colony_flats']='Martian Colony Flats';write(langPath,lang);
write('tools/content-data/mars-settlements.json',{village:villageInfo,camp:campInfo,trades,oxygen:{permanent:true,refillTicks:40,tankCapacity:10000,protectedMarker:'gspack:martian_village_life_support'},raids:'only native pillagers on Mars; Overworld unchanged'});
console.log('Generated a five-dome oxygen village with three Mars traders, and a separate pillager camp with a captain.');
