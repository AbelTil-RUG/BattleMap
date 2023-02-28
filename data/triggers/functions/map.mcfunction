scoreboard players enable @a select_map
scoreboard players reset @a[tag=in_arena] select_map
execute as @a[scores={select_map=-1},tag=admin] run function interface:deactivate_map
execute as @a[scores={select_map=-1},tag=admin] run tellraw @a {"text": "All maps deactivated"}
execute as @a[scores={select_map=-1},tag=admin] run title @a[tag=!in_arena] actionbar {"text": ""} 
execute as @a[scores={select_map=1},tag=admin] run function map:select/map_1
execute as @a[scores={select_map=2},tag=admin] run function map:select/map_2
execute as @a[scores={select_map=3},tag=admin] run function map:select/map_3
scoreboard players set @a[scores={select_map=..-1}] select_map 0
scoreboard players set @a[scores={select_map=1..}] select_map 0

execute if entity @e[tag=active] run title @a[tag=!in_arena] actionbar {"text": "A map is selected","color": "yellow"} 