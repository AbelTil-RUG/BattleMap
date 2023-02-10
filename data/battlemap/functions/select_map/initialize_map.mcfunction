execute if entity @e[tag=active,tag=control_point] run function battlemap:select_map/initialize_control_points
execute if entity @e[tag=active,tag=death_match] run function battlemap:select_map/initialize_death_match
execute if entity @e[tag=active,tag=control_point] if entity @e[tag=active,tag=death_match] run tellraw @a {"text": "Error, two objectives in one map is not supported."}

