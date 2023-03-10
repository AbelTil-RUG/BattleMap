##################################################################################################################
## POINT A 
##################################################################################################################

# calculate how many are in range
execute at @e[tag=control_point,tag=control_point_a,tag=active] store result score a_red in_range if entity @e[team=Red,distance=..4,gamemode=adventure]
execute at @e[tag=control_point,tag=control_point_a,tag=active] store result score a_blue in_range if entity @e[team=Blue,distance=..4,gamemode=adventure]

# scout captures twice as fast
execute at @e[tag=control_point,tag=control_point_a,tag=active] as @a[tag=scout,team=Red,distance=..4,gamemode=adventure] run scoreboard players add a_red in_range 1
execute at @e[tag=control_point,tag=control_point_a,tag=active] as @a[tag=scout,team=Blue,distance=..4,gamemode=adventure] run scoreboard players add a_blue in_range 1

# limit on how many players can effectively cap at the same time
execute if score a_red in_range matches 3.. run scoreboard players set a_red in_range 3
execute if score a_blue in_range matches 3.. run scoreboard players set a_blue in_range 3

# process capping unless enemy is in area
execute at @e[tag=control_point_a,tag=active] store result bossbar point_a value unless entity @a[team=Blue, distance=..4] if score point_a cap_state > min_tick_point_a cq_settings run scoreboard players operation point_a cap_state -= a_red in_range
execute at @e[tag=control_point_a,tag=active] store result bossbar point_a value unless entity @a[team=Red, distance=..4] if score point_a cap_state < max_tick_point_a cq_settings run scoreboard players operation point_a cap_state += a_blue in_range

# if captured by team blue
execute if score point_a cap_state = max_tick_point_a cq_settings run tag @e[tag=control_point_a,tag=uncaptured] remove uncaptured
execute if score point_a cap_state = max_tick_point_a cq_settings run tag @e[tag=control_point_a,tag=captured_red] remove captured_red
execute as @e[tag=control_point_a,tag=active,tag=!captured_blue] at @s if score point_a cap_state = max_tick_point_a cq_settings run experience add @a[tag=in_arena,distance=..4,team=Blue,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @e[tag=control_point_a,tag=active,tag=!captured_blue] at @s if score point_a cap_state = max_tick_point_a cq_settings run playsound minecraft:entity.experience_orb.pickup player @a[distance=..4,team=Blue]
execute if score point_a cap_state = max_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_blue] run tellraw @a {"text": "Point A is capped.", "color": "aqua"}
execute if score point_a cap_state = max_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_blue] run bossbar set point_a name {"text":"Point A","color":"aqua"}
execute if score point_a cap_state = max_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_blue] run bossbar set point_a color blue
execute if score point_a cap_state = max_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_blue] run tag @s add captured_blue


# if captured by team red
execute if score point_a cap_state = min_tick_point_a cq_settings run tag @e[tag=control_point_a,tag=uncaptured] remove uncaptured
execute if score point_a cap_state = min_tick_point_a cq_settings run tag @e[tag=control_point_a,tag=captured_blue] remove captured_blue
execute as @e[tag=control_point_a,tag=active,tag=!captured_red] at @s if score point_a cap_state = min_tick_point_a cq_settings run experience add @a[tag=in_arena,distance=..4,team=Red,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @e[tag=control_point_a,tag=active,tag=!captured_red] at @s if score point_a cap_state = min_tick_point_a cq_settings run playsound minecraft:entity.experience_orb.pickup player @a[distance=..4,team=Red]
execute if score point_a cap_state = min_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_red] run tellraw @a {"text": "Point A is capped.", "color": "red"}
execute if score point_a cap_state = min_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_red] run bossbar set point_a name {"text":"Point A","color":"red"}
execute if score point_a cap_state = min_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_red] run bossbar set point_a color red
execute if score point_a cap_state = min_tick_point_a cq_settings as @e[tag=control_point_a,tag=!captured_red] run tag @s add captured_red


# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_a,tag=active,tag=uncaptured] if score point_a cap_state > mid_tick_point_a cq_settings unless entity @a[distance=..4] run scoreboard players remove point_a cap_state 1
execute at @e[tag=control_point_a,tag=active,tag=uncaptured] if score point_a cap_state < mid_tick_point_a cq_settings unless entity @a[distance=..4] run scoreboard players add point_a cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_a,tag=active,tag=captured_blue] if score point_a cap_state < max_tick_point_a cq_settings unless entity @a[distance=..4,team=Red] run scoreboard players add point_a cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_a,tag=active,tag=captured_red] if score point_a cap_state > min_tick_point_a cq_settings unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_a cap_state 1

##################################################################################################################
## POINT B 
##################################################################################################################

# calculate how many are in range
execute at @e[tag=control_point,tag=control_point_b,tag=active] store result score b_red in_range if entity @e[team=Red,distance=..4,gamemode=adventure]
execute at @e[tag=control_point,tag=control_point_b,tag=active] store result score b_blue in_range if entity @e[team=Blue,distance=..4,gamemode=adventure]

# scout captures twice as fast
execute at @e[tag=control_point,tag=control_point_b,tag=active] as @a[tag=scout,team=Red,distance=..4,gamemode=adventure] run scoreboard players add b_red in_range 1
execute at @e[tag=control_point,tag=control_point_b,tag=active] as @a[tag=scout,team=Blue,distance=..4,gamemode=adventure] run scoreboard players add b_blue in_range 1

# limit on how many players can effectively cap at the same time
execute if score b_red in_range matches 3.. run scoreboard players set b_red in_range 3
execute if score b_blue in_range matches 3.. run scoreboard players set b_blue in_range 3

# process capping unless enemy is in area
execute at @e[tag=control_point_b,tag=active] store result bossbar point_b value unless entity @a[team=Blue, distance=..4] if score point_b cap_state > min_tick_point_b cq_settings run scoreboard players operation point_b cap_state -= b_red in_range
execute at @e[tag=control_point_b,tag=active] store result bossbar point_b value unless entity @a[team=Red, distance=..4] if score point_b cap_state < max_tick_point_b cq_settings run scoreboard players operation point_b cap_state += b_blue in_range

# if captured by team blue, make it blue
execute if score point_b cap_state = max_tick_point_b cq_settings run tag @e[tag=control_point_b,tag=uncaptured] remove uncaptured
execute if score point_b cap_state = max_tick_point_b cq_settings run tag @e[tag=control_point_b,tag=captured_red] remove captured_red
execute as @e[tag=control_point_b,tag=active,tag=!captured_blue] at @s if score point_b cap_state = max_tick_point_b cq_settings run experience add @a[tag=in_arena,distance=..4,team=Blue,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @e[tag=control_point_b,tag=active,tag=!captured_blue] at @s if score point_b cap_state = max_tick_point_b cq_settings run playsound minecraft:entity.experience_orb.pickup player @a[distance=..4,team=Blue]
execute if score point_b cap_state = max_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_blue] run tellraw @a {"text": "Point B is capped.", "color": "aqua"}
execute if score point_b cap_state = max_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_blue] run bossbar set point_b name {"text":"Point B","color":"aqua"}
execute if score point_b cap_state = max_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_blue] run bossbar set point_b color blue
execute if score point_b cap_state = max_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_blue] run tag @s add captured_blue

# if captured by team red, make it red
execute if score point_b cap_state = min_tick_point_b cq_settings run tag @e[tag=control_point_b,tag=uncaptured] remove uncaptured
execute if score point_b cap_state = min_tick_point_b cq_settings run tag @e[tag=control_point_b,tag=captured_blue] remove captured_blue
execute as @e[tag=control_point_b,tag=active,tag=!captured_red] at @s if score point_b cap_state = min_tick_point_b cq_settings run experience add @a[tag=in_arena,distance=..4,team=Red,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @e[tag=control_point_b,tag=active,tag=!captured_red] at @s if score point_b cap_state = min_tick_point_b cq_settings run playsound minecraft:entity.experience_orb.pickup player @a[distance=..4,team=Red]
execute if score point_b cap_state = min_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_red] run tellraw @a {"text": "Point B is capped.", "color": "red"}
execute if score point_b cap_state = min_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_red] run bossbar set point_b name {"text":"Point B","color":"red"}
execute if score point_b cap_state = min_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_red] run bossbar set point_b color red
execute if score point_b cap_state = min_tick_point_b cq_settings as @e[tag=control_point_b,tag=!captured_red] run tag @s add captured_red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_b,tag=active,tag=uncaptured] if score point_b cap_state > mid_tick_point_b cq_settings unless entity @a[distance=..4] run scoreboard players remove point_b cap_state 1
execute at @e[tag=control_point_b,tag=active,tag=uncaptured] if score point_b cap_state < mid_tick_point_b cq_settings unless entity @a[distance=..4] run scoreboard players add point_b cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_b,tag=active,tag=captured_blue] if score point_b cap_state < max_tick_point_b cq_settings unless entity @a[distance=..4,team=Red] run scoreboard players add point_b cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_b,tag=active,tag=captured_red] if score point_b cap_state > min_tick_point_b cq_settings unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_b cap_state 1

##################################################################################################################
## POINT C 
##################################################################################################################

# calculate how many are in range
execute at @e[tag=control_point,tag=control_point_c,tag=active] store result score c_red in_range if entity @e[team=Red,distance=..4,gamemode=adventure]
execute at @e[tag=control_point,tag=control_point_c,tag=active] store result score c_blue in_range if entity @e[team=Blue,distance=..4,gamemode=adventure]

# scout captures twice as fast
execute at @e[tag=control_point,tag=control_point_c,tag=active] as @a[tag=scout,team=Red,distance=..4,gamemode=adventure] run scoreboard players add c_red in_range 1
execute at @e[tag=control_point,tag=control_point_c,tag=active] as @a[tag=scout,team=Blue,distance=..4,gamemode=adventure] run scoreboard players add c_blue in_range 1

# limit on how many players can effectively cap at the same time
execute if score c_red in_range matches 3.. run scoreboard players set c_red in_range 3
execute if score c_blue in_range matches 3.. run scoreboard players set c_blue in_range 3

# process capping unless enemy is in area
execute at @e[tag=control_point_c,tag=active] store result bossbar point_c value unless entity @a[team=Blue, distance=..4] if score point_c cap_state > min_tick_point_c cq_settings run scoreboard players operation point_c cap_state -= c_red in_range
execute at @e[tag=control_point_c,tag=active] store result bossbar point_c value unless entity @a[team=Red, distance=..4] if score point_c cap_state < max_tick_point_c cq_settings run scoreboard players operation point_c cap_state += c_blue in_range

# if captured by team blue, make it blue
execute if score point_c cap_state = max_tick_point_c cq_settings run tag @e[tag=control_point_c,tag=uncaptured] remove uncaptured
execute if score point_c cap_state = max_tick_point_c cq_settings run tag @e[tag=control_point_c,tag=captured_red] remove captured_red
execute as @e[tag=control_point_c,tag=active,tag=!captured_blue] at @s if score point_c cap_state = max_tick_point_c cq_settings run experience add @a[tag=in_arena,distance=..4,team=Blue,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @e[tag=control_point_c,tag=active,tag=!captured_blue] at @s if score point_c cap_state = max_tick_point_c cq_settings run playsound minecraft:entity.experience_orb.pickup player @a[distance=..4,team=Blue]
execute if score point_c cap_state = max_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_blue] run tellraw @a {"text": "Point C is capped.", "color": "aqua"}
execute if score point_c cap_state = max_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_blue] run bossbar set point_c name {"text":"Point C","color":"aqua"}
execute if score point_c cap_state = max_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_blue] run bossbar set point_c color blue
execute if score point_c cap_state = max_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_blue] run tag @s add captured_blue

# if captured by team red, make it red
execute if score point_c cap_state = min_tick_point_c cq_settings run tag @e[tag=control_point_c,tag=uncaptured] remove uncaptured
execute if score point_c cap_state = min_tick_point_c cq_settings run tag @e[tag=control_point_c,tag=captured_blue] remove captured_blue
execute as @e[tag=control_point_c,tag=active,tag=!captured_red] at @s if score point_c cap_state = min_tick_point_c cq_settings run experience add @a[tag=in_arena,distance=..4,team=Red,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @e[tag=control_point_c,tag=active,tag=!captured_red] at @s if score point_c cap_state = min_tick_point_c cq_settings run playsound minecraft:entity.experience_orb.pickup player @a[distance=..4,team=Red]
execute if score point_c cap_state = min_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_red] run tellraw @a {"text": "Point C is capped.", "color": "red"}
execute if score point_c cap_state = min_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_red] run bossbar set point_c name {"text":"Point C","color":"red"}
execute if score point_c cap_state = min_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_red] run bossbar set point_c color red
execute if score point_c cap_state = min_tick_point_c cq_settings as @e[tag=control_point_c,tag=!captured_red] run tag @s add captured_red

# if leaving uncaptured, go to neutral
execute at @e[tag=control_point_c,tag=active,tag=uncaptured] if score point_c cap_state > mid_tick_point_c cq_settings unless entity @a[distance=..4] run scoreboard players remove point_c cap_state 1
execute at @e[tag=control_point_c,tag=active,tag=uncaptured] if score point_c cap_state < mid_tick_point_c cq_settings unless entity @a[distance=..4] run scoreboard players add point_c cap_state 1

# if leaving blue, go to blue
execute at @e[tag=control_point_c,tag=active,tag=captured_blue] if score point_c cap_state < max_tick_point_c cq_settings unless entity @a[distance=..4,team=Red] run scoreboard players add point_c cap_state 1

# if leaving red, go to red
execute at @e[tag=control_point_c,tag=active,tag=captured_red] if score point_c cap_state > min_tick_point_c cq_settings unless entity @a[distance=..4,team=Blue] run scoreboard players remove point_c cap_state 1

##################################################################################################################
## Show owner
##################################################################################################################
execute at @e[tag=control_point,tag=active,tag=uncaptured] run function cq:particles/circle_grey
execute at @e[tag=control_point,tag=active,tag=captured_red] run function cq:particles/circle_red
execute at @e[tag=control_point,tag=active,tag=captured_blue] run function cq:particles/circle_blue

##################################################################################################################
## Tickets
##################################################################################################################
# Are removed in 2 ways, controlling points and killing players

# calculate how many each team has controlled
execute store result score blue_controlled_points in_range if entity @e[tag=control_point,tag=captured_blue,tag=active]
execute store result score red_controlled_points in_range if entity @e[tag=control_point,tag=captured_red,tag=active]

scoreboard players operation Blue tickets -= blue_controlled_points in_range
scoreboard players operation Red tickets -= red_controlled_points in_range 

# if player died, give other team points / remove tickets
execute as @a[team=Blue,scores={died=1..},tag=in_arena] run scoreboard players operation Red tickets -= tickets_per_kill cq_settings
execute as @a[team=Red,scores={died=1..},tag=in_arena] run scoreboard players operation Blue tickets -= tickets_per_kill cq_settings


scoreboard players operation Blue Tickets = Blue tickets
scoreboard players operation Blue Tickets /= twenty numbers

scoreboard players operation Red Tickets = Red tickets
scoreboard players operation Red Tickets /= twenty numbers


