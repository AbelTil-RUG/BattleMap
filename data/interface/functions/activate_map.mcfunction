execute if entity @e[tag=active,tag=control_point] run function cq:interface/activate_map
execute if entity @e[tag=active,tag=death_match] run function dm:interface/activate_map
execute if entity @e[tag=active,tag=ctf_base] run function ctf:interface/activate_map
scoreboard objectives add Deaths deathCount
scoreboard objectives setdisplay sidebar Deaths