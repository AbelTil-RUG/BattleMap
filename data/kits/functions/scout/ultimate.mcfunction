give @a[tag=scout,tag=in_arena,level=100..,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] honey_bottle{Tags:["ultimate_item"]}
experience set @a[tag=scout,tag=in_arena,level=100..] 0 levels

execute as @a[scores={used_honey_bottle=1..}] at @s run scoreboard players operation @s scout_ult_timer = scout_ult_time settings

clear @a glass_bottle



scoreboard players set @a[scores={used_honey_bottle=1..}] used_honey_bottle 0
scoreboard players remove @a[scores={scout_ult_timer=1..}] scout_ult_timer 1