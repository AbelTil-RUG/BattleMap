execute if entity @e[tag=active,tag=control_point] run function cq:interface/tick
execute if entity @e[tag=active,tag=death_match] run function dm:interface/tick
execute if entity @e[tag=active,tag=ctf_base] run function ctf:interface/tick
execute if entity @e[tag=active,tag=mana_well] run function mw:interface/tick