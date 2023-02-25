scoreboard players operation Red tickets = starting_tickets settings
scoreboard players operation Blue tickets = starting_tickets settings

bossbar set point_a visible false
bossbar set point_b visible false
bossbar set point_c visible false

execute store result bossbar point_a max run scoreboard players get max_tick_point_a settings
execute store result bossbar point_b max run scoreboard players get max_tick_point_b settings
execute store result bossbar point_c max run scoreboard players get max_tick_point_c settings

execute store result bossbar point_a value run scoreboard players operation point_a cap_state = mid_tick_point_a settings
execute store result bossbar point_b value run scoreboard players operation point_b cap_state = mid_tick_point_b settings
execute store result bossbar point_c value run scoreboard players operation point_c cap_state = mid_tick_point_c settings

bossbar set point_a name {"text":"Point A","color":"white"}
bossbar set point_b name {"text":"Point B","color":"white"}
bossbar set point_c name {"text":"Point C","color":"white"}

bossbar set point_a color white
bossbar set point_b color white
bossbar set point_c color white

tag @e[tag=control_point,tag=active] remove captured_blue
tag @e[tag=control_point,tag=active] remove captured_red
tag @e[tag=control_point,tag=active] add uncaptured

execute if entity @e[tag=control_point_a,tag=active] run bossbar set point_a visible true
execute if entity @e[tag=control_point_b,tag=active] run bossbar set point_b visible true
execute if entity @e[tag=control_point_c,tag=active] run bossbar set point_c visible true

function cp:interface/display_game_state