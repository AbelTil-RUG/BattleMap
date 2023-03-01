execute if entity @e[tag=active,tag=control_point] run function cq:interface/deactivate_map
execute if entity @e[tag=active,tag=death_match] run function dm:interface/deactivate_map
execute if entity @e[tag=active,tag=ctf_base] run function ctf:interface/deactivate_map

tag @e[tag=active] remove active
scoreboard objectives remove Deaths
execute as @a[tag=in_arena] run function map:tp_lobby