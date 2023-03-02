##################################################################################################################
## Blue flag
##################################################################################################################

# if no flag, spawn flag
execute as @e[tag=active,tag=ctf_base,tag=ctf_base_blue] at @s unless entity @e[tag=ctf_flag_blue] unless entity @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] run playsound entity.chicken.egg player @a[team=Blue]
execute as @e[tag=active,tag=ctf_base,tag=ctf_base_blue] at @s unless entity @e[tag=ctf_flag_blue] unless entity @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,DisabledSlots:0,Tags:["ctf_flag_blue","ctf_flag_at_base"],Team:armor_stand,CustomNameVisible:1,ArmorItems:[{},{},{},{id:light_blue_wool,Count:1}],ArmorDropChances:[0f,0f,0f,0f]}

# if enemy is close, give player the flag
execute at @e[tag=ctf_flag_blue] as @p[distance=..2,team=Red] run playsound minecraft:block.composter.ready player @s
execute at @e[tag=ctf_flag_blue] as @p[distance=..2,team=Red] run playsound block.note_block.banjo player @a[team=Blue] ~ ~ ~ 1 0.1
execute at @e[tag=ctf_flag_blue] as @p[distance=..2,team=Red] run tellraw @a [{"text": "Blue flag has been picked up by ","color": "aqua"},{"selector":"@s","bold": true}]
execute at @e[tag=ctf_flag_blue] as @p[distance=..2,team=Red] run item replace entity @p armor.head with light_blue_banner{Enchantments:[{id:binding_curse,lvl:1}]}
execute at @e[tag=ctf_flag_blue] as @p[distance=..2,team=Red] unless entity @e[tag=ctf_ghost_flag_blue] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,Tags:["ctf_ghost_flag_blue"],Team:armor_stand}
execute at @e[tag=ctf_flag_blue] as @p[distance=..2,team=Red] run kill @e[tag=ctf_flag_blue]

# tp armor stand to flag carrier, such that if player dies, game knows where to drop the flag
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red,scores={died=0},gamemode=adventure] at @s run tp @e[tag=ctf_ghost_flag_blue] @s

# show the carrier particles
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s run particle dust 0 0 1 0.7 ~ ~1 ~ 0.4 0.2 0.4 1 5 force

# give red point if reached red base
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s if entity @e[tag=active,tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run scoreboard players add Red FlagsCaptured 1
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s if entity @e[tag=active,tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run tellraw @a ["",{"selector":"@p","bold":true}," captured the ", {"text": "Blue", "color": "aqua"}," flag!"]
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s if entity @e[tag=active,tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run experience add @p[nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]},tag=in_arena, level=..100] 10 levels
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s if entity @e[tag=active,tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run playsound minecraft:entity.experience_orb.pickup player @p
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s if entity @e[tag=active,tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run item replace entity @s armor.head with air
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},team=Red] at @s if entity @e[tag=active,tag=ctf_base_red,distance=..1] if entity @e[tag=ctf_flag_red,tag=!ctf_flag_at_base] run particle dust 0.2 0.2 0.2 2 ~ ~ ~ 0.5 0.5 0.5 1 4

# if player dies, drop the flag
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},scores={died=1..},team=Red] run playsound entity.slime.attack player @a
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},scores={died=1..},team=Red] run tellraw @a [{"text": "Blue flag has been dropped by ", "color": "aqua"}, {"selector":"@s", "bold": true}]
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},scores={died=1..},team=Red] at @e[tag=ctf_ghost_flag_blue] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,DisabledSlots:0,Tags:["ctf_flag_blue","ctf_flag_on_floor"],Team:armor_stand,CustomNameVisible:1,ArmorItems:[{},{},{},{id:light_blue_wool,Count:1}],ArmorDropChances:[0f,0f,0f,0f]}
execute as @a[nbt={Inventory:[{id:"minecraft:light_blue_banner"}]},scores={died=1..},team=Red] run item replace entity @s armor.head with air

# if flag is dropped, let it decay
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] unless score @s flag_decay_ticks matches 0.. run scoreboard players operation @s flag_decay_ticks = flag_decay_time ctf_settings 
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] run scoreboard players operation @s flag_decay_seconds = @s flag_decay_ticks
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] run scoreboard players operation @s flag_decay_seconds /= twenty numbers
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] run scoreboard players add @s flag_decay_seconds 1
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] run scoreboard players remove @s flag_decay_ticks 1
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] at @s if entity @a[team=Blue,distance=..2] run scoreboard players remove @s flag_decay_ticks 1
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] if score @s flag_decay_ticks matches ..0 run tellraw @a {"text": "Blue flag has returned to base", "color": "aqua", "bold": true}
execute as @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] if score @s flag_decay_ticks matches ..0 run kill @s

# set name based on the state
execute as @e[tag=active,tag=ctf_base_blue] at @s if entity @e[tag=ctf_flag_blue,tag=ctf_flag_on_floor] run setblock ~ ~2 ~ oak_sign{Text1:'["",{"text":"Despawn in ","color":"aqua"},{"score":{"name":"@e[tag=ctf_flag_blue,limit=1]","objective":"flag_decay_seconds"},"color":"aqua"}]'}
execute as @e[tag=active,tag=ctf_base_blue] at @s if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run setblock ~ ~2 ~ oak_sign{Text1:'{"text":""}'}
execute as @e[tag=active,tag=ctf_base_blue] at @s run data modify entity @e[tag=ctf_flag_blue,limit=1] CustomName set from block ~ ~2 ~ Text1
execute as @e[tag=active,tag=ctf_base_blue] at @s run setblock ~ ~2 ~ air


##################################################################################################################
## Red flag
##################################################################################################################

# if no flag, spawn flag
execute as @e[tag=active,tag=ctf_base,tag=ctf_base_red] at @s unless entity @e[tag=ctf_flag_red] unless entity @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] run playsound entity.chicken.egg player @a[team=Red]
execute as @e[tag=active,tag=ctf_base,tag=ctf_base_red] at @s unless entity @e[tag=ctf_flag_red] unless entity @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,DisabledSlots:0,Tags:["ctf_flag_red","ctf_flag_at_base"],Team:armor_stand,CustomNameVisible:1,ArmorItems:[{},{},{},{id:red_wool,Count:1}],ArmorDropChances:[0f,0f,0f,0f]}

# if enemy is close, give player the flag
execute at @e[tag=ctf_flag_red] as @p[distance=..2,team=Blue] run playsound minecraft:block.composter.ready player @s
execute at @e[tag=ctf_flag_red] as @p[distance=..2,team=Blue] run playsound block.note_block.banjo player @a[team=Red] ~ ~ ~ 1 0.1
execute at @e[tag=ctf_flag_red] as @p[distance=..2,team=Blue] run tellraw @a [{"text": "Red flag has been picked up by ","color": "red"},{"selector":"@s","bold": true}]
execute at @e[tag=ctf_flag_red] as @p[distance=..2,team=Blue] run item replace entity @p armor.head with red_banner{Enchantments:[{id:binding_curse,lvl:1}]}
execute at @e[tag=ctf_flag_red] as @p[distance=..2,team=Blue] unless entity @e[tag=ctf_ghost_flag_red] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,Tags:["ctf_ghost_flag_red"],Team:armor_stand}
execute at @e[tag=ctf_flag_red] as @p[distance=..2,team=Blue] run kill @e[tag=ctf_flag_red]

# tp armor stand to flag carrier, such that if player dies, game knows where to drop the flag
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue,scores={died=0},gamemode=adventure] at @s run tp @e[tag=ctf_ghost_flag_red] @s

# show the carrier particles
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s run particle dust 1 0 0 0.7 ~ ~1 ~ 0.4 0.2 0.4 1 5 force

# give blue point if reached blue base
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s if entity @e[tag=active,tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run scoreboard players add Blue FlagsCaptured 1
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s if entity @e[tag=active,tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run tellraw @a ["",{"selector":"@p","bold":true}," captured the ", {"text": "Red", "color": "red"}," flag!"]
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s if entity @e[tag=active,tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run experience add @p[nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]},tag=in_arena, level=..100] 10 levels
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s if entity @e[tag=active,tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run playsound minecraft:entity.experience_orb.pickup player @p
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s if entity @e[tag=active,tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=ctf_flag_at_base] run item replace entity @s armor.head with air
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},team=Blue] at @s if entity @e[tag=active,tag=ctf_base_blue,distance=..1] if entity @e[tag=ctf_flag_blue,tag=!ctf_flag_at_base] run particle dust 0.2 0.2 0.2 2 ~ ~ ~ 0.5 0.5 0.5 1 4

# if player dies, drop the flag
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},scores={died=1..},team=Blue] run playsound entity.slime.attack player @a
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},scores={died=1..},team=Blue] run tellraw @a [{"text": "Red flag has been dropped by ", "color": "red"}, {"selector":"@s", "bold": true}]
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},scores={died=1..},team=Blue] at @e[tag=ctf_ghost_flag_red] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoBasePlate:1b,Small:1b,DisabledSlots:0,Tags:["ctf_flag_red","ctf_flag_on_floor"],Team:armor_stand,CustomNameVisible:1,ArmorItems:[{},{},{},{id:red_wool,Count:1}],ArmorDropChances:[0f,0f,0f,0f]}
execute as @a[nbt={Inventory:[{id:"minecraft:red_banner"}]},scores={died=1..},team=Blue] run item replace entity @s armor.head with air

# if flag is dropped, let it decay
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] unless score @s flag_decay_ticks matches 0.. run scoreboard players operation @s flag_decay_ticks = flag_decay_time ctf_settings 
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] run scoreboard players operation @s flag_decay_seconds = @s flag_decay_ticks
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] run scoreboard players operation @s flag_decay_seconds /= twenty numbers
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] run scoreboard players add @s flag_decay_seconds 1
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] run scoreboard players remove @s flag_decay_ticks 1
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] at @s if entity @a[team=Red,distance=..2] run scoreboard players remove @s flag_decay_ticks 1
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] if score @s flag_decay_ticks matches ..0 run tellraw @a {"text": "Red flag has returned to base", "color": "red", "bold": true}
execute as @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] if score @s flag_decay_ticks matches ..0 run kill @s

# set name based on the state
execute as @e[tag=active,tag=ctf_base_red] at @s if entity @e[tag=ctf_flag_red,tag=ctf_flag_on_floor] run setblock ~ ~2 ~ oak_sign{Text1:'["",{"text":"Despawn in ","color":"red"},{"score":{"name":"@e[tag=ctf_flag_red,limit=1]","objective":"flag_decay_seconds"},"color":"red"}]'}
execute as @e[tag=active,tag=ctf_base_red] at @s if entity @e[tag=ctf_flag_red,tag=ctf_flag_at_base] run setblock ~ ~2 ~ oak_sign{Text1:'{"text":""}'}
execute as @e[tag=active,tag=ctf_base_red] at @s run data modify entity @e[tag=ctf_flag_red,limit=1] CustomName set from block ~ ~2 ~ Text1
execute as @e[tag=active,tag=ctf_base_red] at @s run setblock ~ ~2 ~ air