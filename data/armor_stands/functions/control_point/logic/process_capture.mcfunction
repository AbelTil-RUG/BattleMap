##################################################################################################################
## POINT A 
##################################################################################################################

# calculate how many are in range
execute at @e[tag=control_point,tag=control_point_a,tag=active] store result score a_red in_range if entity @e[team=Red,distance=..4]
execute at @e[tag=control_point,tag=control_point_a,tag=active] store result score a_blue in_range if entity @e[team=Blue,distance=..4]

# limit on how many players can effectively cap at the same time
execute if score a_red in_range matches 2.. run scoreboard players set a_red in_range 2
execute if score a_blue in_range matches 2.. run scoreboard players set a_blue in_range 2

# add scout ultimate if effective
execute at @e[tag=control_point,tag=control_point_a,tag=active] as @a[tag=scout,scores={scout_ult_timer=1..},team=Red,distance=..4] run scoreboard players add a_red in_range 1
execute at @e[tag=control_point,tag=control_point_a,tag=active] as @a[tag=scout,scores={scout_ult_timer=1..},team=Blue,distance=..4] run scoreboard players add a_blue in_range 1

# process capping unless enemy is in area
execute at @e[tag=control_point_a,tag=active] store result bossbar point_a value unless entity @a[team=Blue, distance=..4] if score point_a cap_state > min_tick_point_a settings run scoreboard players operation point_a cap_state -= a_red in_range
execute at @e[tag=control_point_a,tag=active] store result bossbar point_a value unless entity @a[team=Red, distance=..4] if score point_a cap_state < max_tick_point_a settings run scoreboard players operation point_a cap_state += a_blue in_range

# if captured by team blue
execute if score point_a cap_state = max_tick_point_a settings run tag @e[tag=control_point_a,tag=uncaptured] remove uncaptured
execute if score point_a cap_state = max_tick_point_a settings run tag @e[tag=control_point_a,tag=captured_red] remove captured_red
execute as @e[tag=control_point_a,tag=active,tag=!captured_blue] at @s if score point_a cap_state = max_tick_point_a settings run experience add @a[distance=..4,team=Blue,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute if score point_a cap_state = max_tick_point_a settings run tag @e[tag=control_point_a,tag=!captured_blue] add captured_blue
execute if score point_a cap_state = max_tick_point_a settings run bossbar set point_a name {"text":"Point A","color":"aqua"}
execute if score point_a cap_state = max_tick_point_a settings run bossbar set point_a color blue


# if captured by team red
execute if score point_a cap_state = min_tick_point_a settings run tag @e[tag=control_point_a,tag=uncaptured] remove uncaptured
execute if score point_a cap_state = min_tick_point_a settings run tag @e[tag=control_point_a,tag=captured_blue] remove captured_blue
execute as @e[tag=control_point_a,tag=active,tag=!captured_red] at @s if score point_a cap_state = min_tick_point_a settings run experience add @a[distance=..4,team=Red,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute if score point_a cap_state = min_tick_point_a settings run tag @e[tag=control_point_a,tag=!captured_red] add captured_red
execute if score point_a cap_state = min_tick_point_a settings run bossbar set point_a name {"text":"Point A","color":"red"}
execute if score point_a cap_state = min_tick_point_a settings run bossbar set point_a color red


# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_a,tag=active,tag=uncaptured] if score point_a cap_state > mid_tick_point_a settings unless entity @a[distance=..4] run scoreboard players remove point_a cap_state 1
execute at @e[tag=control_point_a,tag=active,tag=uncaptured] if score point_a cap_state < mid_tick_point_a settings unless entity @a[distance=..4] run scoreboard players add point_a cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_a,tag=active,tag=captured_blue] if score point_a cap_state < max_tick_point_a settings unless entity @a[distance=..4,team=Red] run scoreboard players add point_a cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_a,tag=active,tag=captured_red] if score point_a cap_state > min_tick_point_a settings unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_a cap_state 1

##################################################################################################################
## POINT B 
##################################################################################################################

# calculate how many are in range
execute at @e[tag=control_point,tag=control_point_b,tag=active] store result score b_red in_range if entity @e[team=Red,distance=..4]
execute at @e[tag=control_point,tag=control_point_b,tag=active] store result score b_blue in_range if entity @e[team=Blue,distance=..4]

# limit on how many players can effectively cap at the same time
execute if score b_red in_range matches 2.. run scoreboard players set b_red in_range 2
execute if score b_blue in_range matches 2.. run scoreboard players set b_blue in_range 2

# add scout ultimate if effective
execute at @e[tag=control_point,tag=control_point_b,tag=active] as @a[tag=scout,scores={scout_ult_timer=1..},team=Red,distance=..4] run scoreboard players add b_red in_range 1
execute at @e[tag=control_point,tag=control_point_b,tag=active] as @a[tag=scout,scores={scout_ult_timer=1..},team=Blue,distance=..4] run scoreboard players add b_blue in_range 1

# process capping unless enemy is in area
execute at @e[tag=control_point_b,tag=active] store result bossbar point_b value unless entity @a[team=Blue, distance=..4] if score point_b cap_state > min_tick_point_b settings run scoreboard players operation point_b cap_state -= b_red in_range
execute at @e[tag=control_point_b,tag=active] store result bossbar point_b value unless entity @a[team=Red, distance=..4] if score point_b cap_state < max_tick_point_b settings run scoreboard players operation point_b cap_state += b_blue in_range

# if captured by team blue, make it blue
execute if score point_b cap_state = max_tick_point_b settings run tag @e[tag=control_point_b,tag=uncaptured] remove uncaptured
execute if score point_b cap_state = max_tick_point_b settings run tag @e[tag=control_point_b,tag=captured_red] remove captured_red
execute as @e[tag=control_point_b,tag=active,tag=!captured_blue] at @s if score point_b cap_state = max_tick_point_b settings run experience add @a[distance=..4,team=Blue,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute if score point_b cap_state = max_tick_point_b settings run tag @e[tag=control_point_b,tag=!captured_blue] add captured_blue
execute if score point_b cap_state = max_tick_point_b settings run bossbar set point_b name {"text":"Point B","color":"aqua"}
execute if score point_b cap_state = max_tick_point_b settings run bossbar set point_b color blue

# if captured by team red, make it red
execute if score point_b cap_state = min_tick_point_b settings run tag @e[tag=control_point_b,tag=uncaptured] remove uncaptured
execute if score point_b cap_state = min_tick_point_b settings run tag @e[tag=control_point_b,tag=captured_blue] remove captured_blue
execute as @e[tag=control_point_b,tag=active,tag=!captured_red] at @s if score point_b cap_state = min_tick_point_b settings run experience add @a[distance=..4,team=Red,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute if score point_b cap_state = min_tick_point_b settings run tag @e[tag=control_point_b,tag=!captured_red] add captured_red
execute if score point_b cap_state = min_tick_point_b settings run bossbar set point_b name {"text":"Point B","color":"red"}
execute if score point_b cap_state = min_tick_point_b settings run bossbar set point_b color red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_b,tag=active,tag=uncaptured] if score point_b cap_state > mid_tick_point_b settings unless entity @a[distance=..4] run scoreboard players remove point_b cap_state 1
execute at @e[tag=control_point_b,tag=active,tag=uncaptured] if score point_b cap_state < mid_tick_point_b settings unless entity @a[distance=..4] run scoreboard players add point_b cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_b,tag=active,tag=captured_blue] if score point_b cap_state < max_tick_point_b settings unless entity @a[distance=..4,team=Red] run scoreboard players add point_b cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_b,tag=active,tag=captured_red] if score point_b cap_state > min_tick_point_b settings unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_b cap_state 1

##################################################################################################################
## POINT C 
##################################################################################################################

# calculate how many are in range
execute at @e[tag=control_point,tag=control_point_c,tag=active] store result score c_red in_range if entity @e[team=Red,distance=..4]
execute at @e[tag=control_point,tag=control_point_c,tag=active] store result score c_blue in_range if entity @e[team=Blue,distance=..4]

# limit on how many players can effectively cap at the same time
execute if score c_red in_range matches 2.. run scoreboard players set c_red in_range 2
execute if score c_blue in_range matches 2.. run scoreboard players set c_blue in_range 2

# add scout ultimate if effective
execute at @e[tag=control_point,tag=control_point_c,tag=active] as @a[tag=scout,scores={scout_ult_timer=1..},team=Red,distance=..4] run scoreboard players add c_red in_range 1
execute at @e[tag=control_point,tag=control_point_c,tag=active] as @a[tag=scout,scores={scout_ult_timer=1..},team=Blue,distance=..4] run scoreboard players add c_blue in_range 1

# process capping unless enemy is in area
execute at @e[tag=control_point_c,tag=active] store result bossbar point_c value unless entity @a[team=Blue, distance=..4] if score point_c cap_state > min_tick_point_c settings run scoreboard players operation point_c cap_state -= c_red in_range
execute at @e[tag=control_point_c,tag=active] store result bossbar point_c value unless entity @a[team=Red, distance=..4] if score point_c cap_state < max_tick_point_c settings run scoreboard players operation point_c cap_state += c_blue in_range

# if captured by team blue, make it blue
execute if score point_c cap_state = max_tick_point_c settings run tag @e[tag=control_point_c,tag=uncaptured] remove uncaptured
execute if score point_c cap_state = max_tick_point_c settings run tag @e[tag=control_point_c,tag=captured_red] remove captured_red
execute as @e[tag=control_point_c,tag=active,tag=!captured_blue] at @s if score point_c cap_state = max_tick_point_c settings run experience add @a[distance=..4,team=Blue,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute if score point_c cap_state = max_tick_point_c settings run tag @e[tag=control_point_c,tag=!captured_blue] add captured_blue
execute if score point_c cap_state = max_tick_point_c settings run bossbar set point_c name {"text":"Point C","color":"aqua"}
execute if score point_c cap_state = max_tick_point_c settings run bossbar set point_c color blue

# if captured by team red, make it red
execute if score point_c cap_state = min_tick_point_c settings run tag @e[tag=control_point_c,tag=uncaptured] remove uncaptured
execute if score point_c cap_state = min_tick_point_c settings run tag @e[tag=control_point_c,tag=captured_blue] remove captured_blue
execute as @e[tag=control_point_c,tag=active,tag=!captured_red] at @s if score point_c cap_state = min_tick_point_c settings run experience add @a[distance=..4,team=Red,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute if score point_c cap_state = min_tick_point_c settings run tag @e[tag=control_point_c,tag=!captured_red] add captured_red
execute if score point_c cap_state = min_tick_point_c settings run bossbar set point_c name {"text":"Point C","color":"red"}
execute if score point_c cap_state = min_tick_point_c settings run bossbar set point_c color red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_c,tag=active,tag=uncaptured] if score point_c cap_state > mid_tick_point_c settings unless entity @a[distance=..4] run scoreboard players remove point_c cap_state 1
execute at @e[tag=control_point_c,tag=active,tag=uncaptured] if score point_c cap_state < mid_tick_point_c settings unless entity @a[distance=..4] run scoreboard players add point_c cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_c,tag=active,tag=captured_blue] if score point_c cap_state < max_tick_point_c settings unless entity @a[distance=..4,team=Red] run scoreboard players add point_c cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_c,tag=active,tag=captured_red] if score point_c cap_state > min_tick_point_c settings unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_c cap_state 1
