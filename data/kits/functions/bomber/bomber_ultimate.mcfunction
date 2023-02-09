

give @a[tag=bomber,tag=in_arena,level=100,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] trident{Tags:["ultimate_item"]}
experience set @a[tag=bomber,tag=in_arena,level=100] 0 levels

# replace trident with creeper if trident touches the ground
execute at @e[type=minecraft:trident,nbt={inGround:true}] run summon creeper ~ ~ ~ {Fuse:60,ExplosionRadius:5,ignited:1,NoAI:true}
kill @e[type=minecraft:trident,nbt={inGround:true}]