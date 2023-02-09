## BUG: if capped by blue, red attempts to cap and blue comes in, it should stay still but now it goes back to blue


##################################################################################################################
## POINT A 
##################################################################################################################

# process capping unless enemy is in area
execute at @e[tag=control_point_a,tag=active] store result bossbar point_a value unless entity @a[team=Blue, distance=..4] if score point_a cap_state matches 1.. run scoreboard players operation point_a cap_state -= a_red in_range
execute at @e[tag=control_point_a,tag=active] store result bossbar point_a value unless entity @a[team=Red, distance=..4] if score point_a cap_state matches ..199 run scoreboard players operation point_a cap_state += a_blue in_range

# if captured by team blue, make it blue
execute if score point_a cap_state matches 200 run tag @e[tag=control_point_a,tag=uncaptured] remove uncaptured
execute if score point_a cap_state matches 200 run tag @e[tag=control_point_a,tag=captured_red] remove captured_red
execute if score point_a cap_state matches 200 run tag @e[tag=control_point_a,tag=!captured_blue] add captured_blue
execute if score point_a cap_state matches 200 run bossbar set point_a name {"text":"Point A","color":"aqua"}
execute if score point_a cap_state matches 200 run bossbar set point_a color blue

# if captured by team red, make it red
execute if score point_a cap_state matches 0 run tag @e[tag=control_point_a,tag=uncaptured] remove uncaptured
execute if score point_a cap_state matches 0 run tag @e[tag=control_point_a,tag=captured_blue] remove captured_blue
execute if score point_a cap_state matches 0 run tag @e[tag=control_point_a,tag=!captured_red] add captured_red
execute if score point_a cap_state matches 0 run bossbar set point_a name {"text":"Point A","color":"red"}
execute if score point_a cap_state matches 0 run bossbar set point_a color red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_a,tag=active,tag=uncaptured] if score point_a cap_state matches 101.. unless entity @a[distance=..4] run scoreboard players remove point_a cap_state 1
execute at @e[tag=control_point_a,tag=active,tag=uncaptured] if score point_a cap_state matches ..99 unless entity @a[distance=..4] run scoreboard players add point_a cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_a,tag=active,tag=captured_blue] if score point_a cap_state matches ..199 unless entity @a[distance=..4,team=Red] run scoreboard players add point_a cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_a,tag=active,tag=captured_red] if score point_a cap_state matches 1.. unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_a cap_state 1

##################################################################################################################
## POINT B
##################################################################################################################

# process capping unless enemy is in area
execute at @e[tag=control_point_b,tag=active] store result bossbar point_b value unless entity @a[team=Blue, distance=..4] if score point_b cap_state matches 1.. run scoreboard players operation point_b cap_state -= b_red in_range
execute at @e[tag=control_point_b,tag=active] store result bossbar point_b value unless entity @a[team=Red, distance=..4] if score point_b cap_state matches ..199 run scoreboard players operation point_b cap_state += b_blue in_range

# if captured by team blue, make it blue
execute if score point_b cap_state matches 200 run tag @e[tag=control_point_b,tag=uncaptured] remove uncaptured
execute if score point_b cap_state matches 200 run tag @e[tag=control_point_b,tag=captured_red] remove captured_red
execute if score point_b cap_state matches 200 run tag @e[tag=control_point_b,tag=!captured_blue] add captured_blue
execute if score point_b cap_state matches 200 run bossbar set point_b name {"text":"Point B","color":"aqua"}
execute if score point_b cap_state matches 200 run bossbar set point_b color blue

# if captured by team red, make it red
execute if score point_b cap_state matches 0 run tag @e[tag=control_point_b,tag=uncaptured] remove uncaptured
execute if score point_b cap_state matches 0 run tag @e[tag=control_point_b,tag=captured_blue] remove captured_blue
execute if score point_b cap_state matches 0 run tag @e[tag=control_point_b,tag=!captured_red] add captured_red
execute if score point_b cap_state matches 0 run bossbar set point_b name {"text":"Point B","color":"red"}
execute if score point_b cap_state matches 0 run bossbar set point_b color red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_b,tag=active,tag=uncaptured] if score point_b cap_state matches 101.. unless entity @a[distance=..4] run scoreboard players remove point_b cap_state 1
execute at @e[tag=control_point_b,tag=active,tag=uncaptured] if score point_b cap_state matches ..99 unless entity @a[distance=..4] run scoreboard players add point_b cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_b,tag=active,tag=captured_blue] if score point_b cap_state matches ..199 unless entity @a[distance=..4,team=Red] run scoreboard players add point_b cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_b,tag=active,tag=captured_red] if score point_b cap_state matches 1.. unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_b cap_state 1

##################################################################################################################
## POINT C
##################################################################################################################

# process capping unless enemy is in area
execute at @e[tag=control_point_c,tag=active] store result bossbar point_c value unless entity @a[team=Blue, distance=..4] if score point_c cap_state matches 1.. run scoreboard players operation point_c cap_state -= c_red in_range
execute at @e[tag=control_point_c,tag=active] store result bossbar point_c value unless entity @a[team=Red, distance=..4] if score point_c cap_state matches ..199 run scoreboard players operation point_c cap_state += c_blue in_range

# if captured by team blue, make it blue
execute if score point_c cap_state matches 200 run tag @e[tag=control_point_c,tag=uncaptured] remove uncaptured
execute if score point_c cap_state matches 200 run tag @e[tag=control_point_c,tag=captured_red] remove captured_red
execute if score point_c cap_state matches 200 run tag @e[tag=control_point_c,tag=!captured_blue] add captured_blue
execute if score point_c cap_state matches 200 run bossbar set point_c name {"text":"Point C","color":"aqua"}
execute if score point_c cap_state matches 200 run bossbar set point_c color blue

# if captured by team red, make it red
execute if score point_c cap_state matches 0 run tag @e[tag=control_point_c,tag=uncaptured] remove uncaptured
execute if score point_c cap_state matches 0 run tag @e[tag=control_point_c,tag=captured_blue] remove captured_blue
execute if score point_c cap_state matches 0 run tag @e[tag=control_point_c,tag=!captured_red] add captured_red
execute if score point_c cap_state matches 0 run bossbar set point_c name {"text":"Point C","color":"red"}
execute if score point_c cap_state matches 0 run bossbar set point_c color red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_c,tag=active,tag=uncaptured] if score point_c cap_state matches 101.. unless entity @a[distance=..4] run scoreboard players remove point_c cap_state 1
execute at @e[tag=control_point_c,tag=active,tag=uncaptured] if score point_c cap_state matches ..99 unless entity @a[distance=..4] run scoreboard players add point_c cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_c,tag=active,tag=captured_blue] if score point_c cap_state matches ..199 unless entity @a[distance=..4,team=Red] run scoreboard players add point_c cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_c,tag=active,tag=captured_red] if score point_c cap_state matches 1.. unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_c cap_state 1