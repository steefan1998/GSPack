// NASA Mars24 mean solar day: https://www.giss.nasa.gov/tools/mars24/help/notes.html
import fs from 'node:fs';import path from 'node:path';
const write=(p,v)=>{fs.mkdirSync(path.dirname(p),{recursive:true});fs.writeFileSync(p,JSON.stringify(v,null,2)+'\n')};
const period=Math.round(24000*(88775.244/86400));
const day=JSON.parse(fs.readFileSync('tools/content-data/mars-day-timeline-template.json','utf8'));
function scale(value){if(Array.isArray(value))return value.map(scale);if(value&&typeof value==='object')return Object.fromEntries(Object.entries(value).map(([k,v])=>[k,k==='ticks'&&typeof v==='number'?Math.round(v*period/24000):scale(v)]));return value}
const mars=scale(day);mars.clock='gspack:mars';mars.period_ticks=period;
const villagers=scale(JSON.parse(fs.readFileSync('tools/content-data/mars-villager-schedule-template.json','utf8')));villagers.clock='gspack:mars';villagers.period_ticks=period;write('kubejs/data/gspack/timeline/mars_villager_schedule.json',villagers);
write('kubejs/data/gspack/world_clock/mars.json',{});
write('kubejs/data/gspack/timeline/mars_day.json',mars);
write('kubejs/data/gspack/tags/timeline/in_mars.json',{replace:false,values:['gspack:mars_day','gspack:mars_villager_schedule']});
const p='kubejs/data/gspack/dimension_type/mars.json',type=JSON.parse(fs.readFileSync(p,'utf8'));type.default_clock='gspack:mars';type.timelines='#gspack:in_mars';write(p,type);
console.log(`Mars solar cycle: ${period} game ticks (${period/1200} real minutes at 20 TPS); independent native world clock/timeline.`);
