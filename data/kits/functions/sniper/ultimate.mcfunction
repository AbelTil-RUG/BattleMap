give @a[tag=sniper,tag=in_arena,level=100..,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] honey_bottle{Tags:["ultimate_item"]}
experience set @a[tag=sniper,tag=in_arena,level=100..] 0 levels

execute if entity @a[tag=sniper,team=Blue,scores={used_honey_bottle=1..}] run effect give @a[team=Red] glowing 10 0 true
execute if entity @a[tag=sniper,team=Red,scores={used_honey_bottle=1..}] run effect give @a[team=Blue] glowing 10 0 true

scoreboard players set @a[scores={used_honey_bottle=1..},tag=sniper] used_honey_bottle 0