## control points
scoreboard players set Red tickets 9600

bossbar set point_a visible false
bossbar set point_b visible false
bossbar set point_c visible false

bossbar set point_a players @a
bossbar set point_b players @a
bossbar set point_c players @a

bossbar set point_a max 200
bossbar set point_b max 200
bossbar set point_c max 200

execute store result bossbar point_a value run scoreboard players set point_a cap_state 100
execute store result bossbar point_b value run scoreboard players set point_b cap_state 100
execute store result bossbar point_c value run scoreboard players set point_c cap_state 100

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

execute if entity @e[tag=active,tag=control_point] run scoreboard objectives setdisplay sidebar tickets

## Death Match
execute if entity @e[tag=active,tag=death_match] run scoreboard objectives setdisplay sidebar 

scoreboard players set blue blue_team_kills 0
scoreboard players set red red_team_kills 0

