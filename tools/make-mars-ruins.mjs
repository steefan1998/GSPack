import {I,S,C,L,payload,text} from './make-mars-dungeon.mjs';
import fs from 'node:fs';import path from 'node:path';import {gzipSync} from 'node:zlib';
const write=(p,v)=>{fs.mkdirSync(path.dirname(p),{recursive:true});fs.writeFileSync(p,JSON.stringify(v,null,2)+'\n')};
const palette=[{Name:S('minecraft:cracked_stone_bricks')},{Name:S('minecraft:chiseled_copper')},{Name:S('minecraft:chest'),Properties:C({facing:S('north'),type:S('single'),waterlogged:S('false')})}],blocks=[];
for(let x=1;x<14;x++)for(let z=1;z<14;z++){
 blocks.push({pos:L(3,[x,0,z]),state:I(0)});
 if(x===1||x===13||z===1||z===13){const h=(x*7+z*3)%5;for(let y=1;y<=h;y++)blocks.push({pos:L(3,[x,y,z]),state:I((x+z)%7===0?1:0)})}
}
blocks.push({pos:L(3,[7,1,7]),state:I(2),nbt:C({id:S('minecraft:chest'),x:I(7),y:I(1),z:I(7),LootTable:S('gspack:chests/mars_ruins')})});
const root=C({DataVersion:I(4790),size:L(3,[15,7,15]),palette:L(10,palette),blocks:L(10,blocks),entities:L(10,[])});
fs.writeFileSync('kubejs/data/gspack/structure/mars/ruins.nbt',gzipSync(Buffer.concat([Buffer.from([10]),text(''),payload(root)])));
write('kubejs/data/gspack/worldgen/structure/mars_ruins.json',{type:'minecraft:jigsaw',biomes:['gspack:mars','gspack:mars_frozen_wastes','gspack:mars_dome_fields','gspack:mars_colony_flats'],step:'surface_structures',spawn_overrides:{},start_pool:'gspack:mars/ruins',size:1,start_height:{absolute:0},project_start_to_heightmap:'WORLD_SURFACE_WG',max_distance_from_center:40,use_expansion_hack:false,terrain_adaptation:'beard_thin'});
write('kubejs/data/gspack/worldgen/template_pool/mars/ruins.json',{fallback:'minecraft:empty',elements:[{weight:1,element:{element_type:'minecraft:single_pool_element',location:'gspack:mars/ruins',processors:{processors:[]},projection:'rigid'}}]});
write('kubejs/data/gspack/worldgen/structure_set/mars_ruins.json',{structures:[{structure:'gspack:mars_ruins',weight:1}],placement:{type:'minecraft:random_spread',spacing:8,separation:4,salt:71008425,frequency:0.05}});
const entry=(name,weight,min,max)=>({type:'minecraft:item',name,weight,functions:[{function:'minecraft:set_count',count:{type:'minecraft:uniform',min,max}}]});
write('kubejs/data/gspack/loot_table/chests/mars_ruins.json',{type:'minecraft:chest',pools:[{rolls:{type:'minecraft:uniform',min:4,max:7},entries:[entry('stellaris:titanium_ingot',8,3,8),entry('stellaris:desh_ingot',5,1,4),entry('minecraft:emerald',5,2,5),entry('minecraft:diamond',3,1,2),entry('minecraft:golden_apple',2,1,1),entry('stellaris:space_suit_oxygen_module_tier_1',1,1,1)]}]});
console.log('Generated Martian ruins with expedition loot and 5% chance per eligible structure-placement candidate (not per chunk).');
