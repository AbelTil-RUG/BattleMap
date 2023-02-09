# Tank receives a golden apple in its hotbar
# if it is eaten: 
# give all friendly players in the area absorption 3 for 10 seconds
# 

give @a[tag=tank,tag=in_arena,level=100,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] golden_apple{Tags:["ultimate_item"]}
experience set @a[tag=tank,tag=in_arena,level=100] 0 levels

execute as @a[scores={used_golden_apple=1..},team=Blue] at @s run effect give @a[distance=..4,team=Blue] absorption 20 2
execute as @a[scores={used_golden_apple=1..},team=Blue] at @s run effect give @a[distance=..4,team=Red] slowness 5 1 

execute as @a[scores={used_golden_apple=1..},team=Red] at @s run effect give @a[distance=..4,team=Red] absorption 20 2
execute as @a[scores={used_golden_apple=1..},team=Red] at @s run effect give @a[distance=..4,team=Blue] slowness 5 1 

scoreboard players set @a[scores={used_golden_apple=1..}] used_golden_apple 0