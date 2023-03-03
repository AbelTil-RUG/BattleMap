

give @a[tag=bomber,tag=in_arena,level=100..,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] trident{Unbreakable:1,Tags:["ultimate_item","bomber_ult"],AttributeModifiers:[{AttributeName:"generic.attack_damage",Amount:4,Slot:mainhand,Name:"generic.attack_damage",UUID:[I;-123111,2743,203058,-5486]}],HideFlags:2} 1
experience set @a[tag=bomber,tag=in_arena,level=100..] 0 levels

# replace trident with creeper if trident touches the ground
execute at @e[type=minecraft:trident,nbt={inGround:true}] run summon creeper ~ ~ ~ {Fuse:30,ExplosionRadius:5,ignited:1,NoAI:true,Invulnerable:1}
kill @e[type=minecraft:trident,nbt={inGround:true}]