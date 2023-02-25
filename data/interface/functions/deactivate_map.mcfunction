execute if entity @e[tag=active,tag=control_point] run function cp:interface/deactivate_map
execute if entity @e[tag=active,tag=death_match] run function dm:interface/deactivate_map
execute if entity @e[tag=active,tag=ctf_base] run function ctf:interface/deactivate_map
tag @e[tag=active] remove active