// Build native Potions Master entries and matching tags from the installed pack index.
import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
const root=process.cwd(),index=JSON.parse(fs.readFileSync('.gspack-dev/potionsmaster-index.json','utf8'));
const items=new Set(index.items),blocks=new Set(index.blocks),groups=new Map(),assigned=new Map();
const write=(file,value)=>{fs.mkdirSync(path.dirname(file),{recursive:true});fs.writeFileSync(file,JSON.stringify(value,null,2)+'\n')};
function expand(tag,seen=new Set()){if(seen.has(tag))return [];seen.add(tag);return (index.tags[tag]??[]).flatMap(v=>{const id=typeof v==='string'?v:v.id;return id?.startsWith('#')?expand(id.slice(1),new Set(seen)):id?[id]:[]})}
function add(name,values){if(!groups.has(name))groups.set(name,new Set());for(const id of values){groups.get(name).add(id);assigned.set(id,name)}}
const defaults={coal:['minecraft:coal',0xff202020],emerald:['minecraft:emerald',0xff00ff00],lapis:['minecraft:lapis_lazuli',0xff0000ff],redstone:['minecraft:redstone',0xffff0000],diamond:['minecraft:diamond',0xff3dd9e3],iron:['minecraft:raw_iron',0xffe4c0aa],gold:['minecraft:raw_gold',0xffd4af37],netherite:['minecraft:netherite_scrap',0xffffa500],quartz:['minecraft:quartz',0xffffffff],copper:['minecraft:raw_copper',0xffb76e3a]};
for(const name of Object.keys(defaults))add(name,name==='netherite'?['minecraft:ancient_debris']:name==='quartz'?['minecraft:nether_quartz_ore']:[`minecraft:${name}_ore`,`minecraft:deepslate_${name}_ore`]);
for(const tag of Object.keys(index.tags).sort())if(/^c:ores\/[a-z_]+$/.test(tag)){
 let name=tag.slice(7);if(/^uraninite_(dense|regular|poor)$/.test(name))name='uraninite';if(name==='netherite_scrap'||name==='ancient_debris')name='netherite';if(name==='nether_quartz')name='quartz';
 const values=expand(tag).filter(id=>blocks.has(id));if(values.length)add(name,values);
}
for(const id of [...blocks].sort())if(id.endsWith('_ore')&&!assigned.has(id)){
 let name=id.split(':')[1].replace(/^(?:deepslate_|nether_|endstone_|end_|other_|undershale_|moon_stone_|moon_|mars_|holystone_|deep_|raw_)+/,'').replace(/_ore$/,'').replace(/_end$/,'');
 add(name,[id]);
}
add('dimensional_shard',['rftoolsbase:dimensionalshard_overworld','rftoolsbase:dimensionalshard_nether','rftoolsbase:dimensionalshard_end'].filter(id=>blocks.has(id)));
add('certus_quartz',[...blocks].filter(id=>/^ae2:(?:\w+_budding_quartz|\w+_quartz_bud|quartz_cluster)$/.test(id)));
for(const name of ['iron','copper','gold','osmium','uranium','unobtainium'])add(name,[`gspack:mars_${name}_ore`]);
const overrides={inferium:'mysticalagriculture:inferium_essence',prosperity:'mysticalagriculture:prosperity_shard',soulium:'mysticalagriculture:soulium_dust',dimensional_shard:'rftoolsbase:dimensionalshard',certus_quartz:'ae2:certus_quartz_crystal',ambrosium:'aether_ii:ambrosium_shard',glint:'aether_ii:glint_gemstone',zanite:'aether_ii:zanite_gemstone',arkenium:'aether_ii:inert_arkenium',gravitite:'aether_ii:inert_gravitite',corrobonite:'aether_ii:corrobonite_crystal',hellforged:'neovitae:dungeon_ore'};
// Potions Master 2.0.2 only scans block tags whose name contains "ores/", then matches a tag when its
// id contains the sight oretag. Keep "ores/" in the path and the _sight suffix so coal does not match coal_t1.
for(const dir of ["potionsmaster","potionsmaster_ores"])fs.rmSync(`kubejs/data/gspack/tags/block/${dir}`,{recursive:true,force:true});
const manifest=[];
for(const [name,set] of [...groups].sort(([a],[b])=>a.localeCompare(b))){
 if(!set.size)continue;const values=[...set].sort();const namespaces=[...new Set(['alltheores',...values.map(id=>id.split(':')[0])])];
 let recipeItem=defaults[name]?.[0]??overrides[name];
 if(!recipeItem||!items.has(recipeItem)){recipeItem=namespaces.flatMap(ns=>[`raw_${name}`,name,`${name}_gemstone`,`${name}_crystal`,`${name}_gem`,`${name}_ingot`,`${name}_dust`].map(p=>ns+':'+p)).find(id=>items.has(id))??values.find(id=>items.has(id));}
 if(!recipeItem)throw Error('No real recipe item for '+name);
 const hash=crypto.createHash('sha256').update(name).digest();const color=defaults[name]?.[1]??((0xff000000|(64+hash[0]%160)<<16|(64+hash[1]%160)<<8|(64+hash[2]%160))>>>0);
 const oretag=`gspack:potionsmaster_ores/${name}_sight`;const entry={entryname:name,oretag,color:color|0,drawing:false,order:manifest.length,recipeItem};
 write(`config/potionsmaster/gspack_${name}.json`,entry);
 write(`kubejs/data/gspack/tags/block/potionsmaster_ores/${name}_sight.json`,{replace:false,values:values.map(id=>({id,required:false}))});
 manifest.push({...entry,blocks:values});
}
write('tools/content-data/potionsmaster-sights.json',manifest);
console.log(`Generated ${manifest.length} native Ore Sights (${manifest.length-10} additional), covering ${new Set(manifest.flatMap(e=>e.blocks)).size} ore/crystal blocks. All recipe items exist in installed item assets.`);
