##################################################################################################################
## Blue flag
##################################################################################################################

# spawn flag
execute as @e[tag=ctf_base,tag=ctf_base_blue,tag=active] at @s unless entity @e[tag=ctf_flag_blue] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,DisabledSlots:0,Tags:["ctf_flag_blue","ctf_flag_at_base"],Team:armor_stand,CustomNameVisible:1,ArmorItems:[{},{},{},{id:light_blue_wool,Count:1}],ArmorDropChances:[0f,0f,0f,0f]}

# move flag
execute as @e[tag=ctf_flag_blue,limit=1] at @s run tp @s @p[distance=..1.5,team=Red]

# set flag to be on the move
execute as @e[tag=ctf_flag_blue,limit=1,tag=ctf_flag_at_base] at @s if entity @p[distance=..1,team=Red] run tag @s remove ctf_flag_at_base
execute as @e[tag=ctf_flag_blue,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Red] run tellraw @a ["",{"selector":"@p","bold":true}," picked up the ", {"text": "Blue", "color": "aqua"}," flag!"]
execute as @e[tag=ctf_flag_blue,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Red] run experience add @p[nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]},tag=in_arena, level=..100] 5 levels
execute as @e[tag=ctf_flag_blue,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Red] run playsound minecraft:entity.experience_orb.pickup player @p
execute as @e[tag=ctf_flag_blue,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Red] run tag @s add ctf_flag_moving

# remove flag to be on the move
execute as @e[tag=ctf_flag_blue,limit=1,tag=ctf_flag_moving] at @s unless entity @p[distance=..1,team=Red] run scoreboard players operation blue_flag flag_decay_ticks = flag_decay_time ctf_settings 
execute as @e[tag=ctf_flag_blue,limit=1,tag=ctf_flag_moving] at @s unless entity @p[distance=..1,team=Red] run tellraw @a {"text": "Blue flag is dropped!", "color": "yellow"}
execute as @e[tag=ctf_flag_blue,limit=1,tag=ctf_flag_moving] at @s unless entity @p[distance=..1,team=Red] run tag @s remove ctf_flag_moving

# calculate decay
execute if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players operation blue_flag flag_decay_seconds = blue_flag flag_decay_ticks
execute if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players operation blue_flag flag_decay_seconds /= twenty numbers
execute if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players add blue_flag flag_decay_seconds 1
execute if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players remove blue_flag flag_decay_ticks 1
execute at @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] if entity @a[team=Blue,distance=..1] run scoreboard players remove blue_flag flag_decay_ticks 1

# set name
execute as @e[tag=ctf_base_blue] at @s if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run setblock ~ ~2 ~ oak_sign{Text1:'["",{"text":"Despawn in ","color":"aqua"},{"score":{"name":"blue_flag","objective":"flag_decay_seconds"},"color":"aqua"}]'}
execute as @e[tag=ctf_base_blue] at @s unless entity @e[tag=ctf_flag_blue,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run setblock ~ ~2 ~ oak_sign{Text1:'{"text":""}'}
execute as @e[tag=ctf_base_blue] at @s run data modify entity @e[tag=ctf_flag_blue,limit=1] CustomName set from block ~ ~2 ~ Text1
execute as @e[tag=ctf_base_blue] at @s run setblock ~ ~2 ~ air

# kill if decayed or is falling
execute as @e[tag=ctf_flag_blue] if score blue_flag flag_decay_ticks matches ..0 run kill @s
execute if score blue_flag flag_decay_ticks matches ..0 run scoreboard players reset blue_flag flag_decay_ticks

# give red point if reached red base
execute as @e[tag=ctf_flag_blue] at @s if entity @e[tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run scoreboard players add Red FlagsCaptured 1
execute as @e[tag=ctf_flag_blue] at @s if entity @e[tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run tellraw @a ["",{"selector":"@p","bold":true}," captured the ", {"text": "Blue", "color": "aqua"}," flag!"]
execute as @e[tag=ctf_flag_blue] at @s if entity @e[tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run experience add @p[nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]},tag=in_arena, level=..100] 10 levels
execute as @e[tag=ctf_flag_blue] at @s if entity @e[tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run playsound minecraft:entity.experience_orb.pickup player @p
execute as @e[tag=ctf_flag_blue] at @s if entity @e[tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run kill @s
execute as @e[tag=ctf_flag_blue] at @s if entity @e[tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=!ctf_flag_at_base] run particle dust 0.2 0.2 0.2 2 ~ ~ ~ 0.5 0.5 0.5 1 4

# show flag particles
execute as @e[tag=ctf_flag_blue] at @s as @p[distance=..1.5,team=Red] at @s run particle dust 0 0 1 1 ~ ~1 ~ 0.5 0.2 0.5 0 5

##################################################################################################################
## Red flag
##################################################################################################################

# spawn flag
execute as @e[tag=ctf_base,tag=ctf_base_red,tag=active] at @s unless entity @e[tag=ctf_flag_red] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,DisabledSlots:0,Tags:["ctf_flag_red","ctf_flag_at_base"],Team:armor_stand,CustomNameVisible:1,ArmorItems:[{},{},{},{id:red_wool,Count:1}],ArmorDropChances:[0f,0f,0f,0f]}

# move flag
execute as @e[tag=ctf_flag_red,limit=1] at @s run tp @s @p[distance=..1.5,team=Blue]

# set flag to be on the move
execute as @e[tag=ctf_flag_red,limit=1,tag=ctf_flag_at_base] at @s if entity @p[distance=..1,team=Blue] run tag @s remove ctf_flag_at_base
execute as @e[tag=ctf_flag_red,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Blue] run tellraw @a ["",{"selector":"@p","bold":true}," picked up the ", {"text": "Red", "color": "red"}," flag!"]
execute as @e[tag=ctf_flag_red,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Blue] run playsound minecraft:entity.experience_orb.pickup player @p
execute as @e[tag=ctf_flag_red,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Blue] run experience add @p[nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]},tag=in_arena, level=..100] 5 levels
execute as @e[tag=ctf_flag_red,limit=1,tag=!ctf_flag_moving] at @s if entity @p[distance=..1,team=Blue] run tag @s add ctf_flag_moving

# remove flag to be on the move
execute as @e[tag=ctf_flag_red,limit=1,tag=ctf_flag_moving] at @s unless entity @p[distance=..1,team=Blue] run scoreboard players operation red_flag flag_decay_ticks = flag_decay_time ctf_settings 
execute as @e[tag=ctf_flag_red,limit=1,tag=ctf_flag_moving] at @s unless entity @p[distance=..1,team=Blue] run tellraw @a {"text": "Red flag is dropped!", "color": "yellow"}
execute as @e[tag=ctf_flag_red,limit=1,tag=ctf_flag_moving] at @s unless entity @p[distance=..1,team=Blue] run tag @s remove ctf_flag_moving

# calculate decay
execute if entity @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players operation red_flag flag_decay_seconds = red_flag flag_decay_ticks
execute if entity @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players operation red_flag flag_decay_seconds /= twenty numbers
execute if entity @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players add red_flag flag_decay_seconds 1
execute if entity @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run scoreboard players remove red_flag flag_decay_ticks 1
execute at @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] if entity @a[team=Red,distance=..1] run scoreboard players remove red_flag flag_decay_ticks 1

# set name
execute as @e[tag=ctf_base_red] at @s if entity @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run setblock ~ ~2 ~ oak_sign{Text1:'["",{"text":"Despawn in ","color":"red"},{"score":{"name":"red_flag","objective":"flag_decay_seconds"},"color":"red"}]'}
execute as @e[tag=ctf_base_red] at @s unless entity @e[tag=ctf_flag_red,tag=!ctf_flag_moving,tag=!ctf_flag_at_base] run setblock ~ ~2 ~ oak_sign{Text1:'{"text":""}'}
execute as @e[tag=ctf_base_red] at @s run data modify entity @e[tag=ctf_flag_red,limit=1] CustomName set from block ~ ~2 ~ Text1
execute as @e[tag=ctf_base_red] at @s run setblock ~ ~2 ~ air

# kill if decayed or is falling
execute as @e[tag=ctf_flag_red] if score red_flag flag_decay_ticks matches ..0 run kill @s
execute if score red_flag flag_decay_ticks matches ..0 run scoreboard players reset red_flag flag_decay_ticks

# give blue point if reached blue base
execute as @e[tag=ctf_flag_red] at @s if entity @e[tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run scoreboard players add Blue FlagsCaptured 1
execute as @e[tag=ctf_flag_red] at @s if entity @e[tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run tellraw @a ["",{"selector":"@p","bold":true}," captured the ", {"text": "Red", "color": "red"}," flag!"]
execute as @e[tag=ctf_flag_red] at @s if entity @e[tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run experience add @p[nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]},tag=in_arena, level=..100] 10 levels
execute as @e[tag=ctf_flag_red] at @s if entity @e[tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run playsound minecraft:entity.experience_orb.pickup player @p
execute as @e[tag=ctf_flag_red] at @s if entity @e[tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run kill @s
execute as @e[tag=ctf_flag_red] at @s if entity @e[tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_at_base] run particle dust 0.2 0.2 0.2 2 ~ ~ ~ 0.5 0.5 0.5 1 4

# show flag particles
execute as @e[tag=ctf_flag_red] at @s as @p[distance=..1.5,team=Blue] at @s run particle dust 1 0 0 1 ~ ~1 ~ 0.5 0.2 0.5 0 5