## Tickets
# Are removed in 2 ways, controlling points and killing players

# calculate how many each team has controlled
execute store result score blue_controlled_points in_range if entity @e[tag=control_point,tag=captured_blue,tag=active]
execute store result score red_controlled_points in_range if entity @e[tag=control_point,tag=captured_red,tag=active]

scoreboard players operation Blue tickets -= blue_controlled_points in_range
scoreboard players operation Red tickets -= red_controlled_points in_range 

# if player died, give other team points / remove tickets
execute as @a[team=Blue,scores={died=1..}] run scoreboard players operation Red tickets -= tickets_per_kill settings
execute as @a[team=Red,scores={died=1..}] run scoreboard players operation Blue tickets -= tickets_per_kill settings