# Tank receives a golden apple in its hotbar
# if it is eaten: 
# give all friendly players in the area absorption and all enemies slow and blindness
# 

give @a[tag=tank,tag=in_arena,level=100..,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] golden_apple{Tags:["ultimate_item","tank_ult"]}
experience set @a[tag=tank,tag=in_arena,level=100..] 0 levels

execute as @a[scores={used_golden_apple=1..}] at @s run effect give @s minecraft:absorption 600 2 true
execute as @a[scores={used_golden_apple=1..},team=Blue] at @s run effect give @a[distance=..6,team=Blue] absorption 10 1 
execute as @a[scores={used_golden_apple=1..},team=Blue] at @s run effect give @a[distance=..6,team=Red] slowness 5 1 
execute as @a[scores={used_golden_apple=1..},team=Blue] at @s run effect give @a[distance=..6,team=Red] blindness 2 1 

execute as @a[scores={used_golden_apple=1..},team=Red] at @s run effect give @a[distance=..6,team=Red] absorption 10 1
execute as @a[scores={used_golden_apple=1..},team=Red] at @s run effect give @a[distance=..6,team=Blue] slowness 5 1 
execute as @a[scores={used_golden_apple=1..},team=Red] at @s run effect give @a[distance=..6,team=Blue] blindness 2 1 

scoreboard players set @a[scores={used_golden_apple=1..}] used_golden_apple 0