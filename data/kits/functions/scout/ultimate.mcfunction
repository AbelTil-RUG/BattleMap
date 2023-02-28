give @a[tag=scout,tag=in_arena,level=100..,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] honey_bottle{Tags:["ultimate_item"]}
experience set @a[tag=scout,tag=in_arena,level=100..] 0 levels

effect give @a[tag=scout,scores={used_honey_bottle=1..}] resistance 10 1 false
effect give @a[tag=scout,scores={used_honey_bottle=1..}] jump_boost 10 1 false
effect give @a[tag=scout,scores={used_honey_bottle=1..}] speed 10 0 false

clear @a glass_bottle

scoreboard players set @a[scores={used_honey_bottle=1..}] used_honey_bottle 0