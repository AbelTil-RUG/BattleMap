## Death detection
execute as @a[tag=in_arena] if predicate game:is_falling run effect give @s instant_damage 1 10

function interface:tick

function game:kill_handlers/handle_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill]
kill @e[type=tnt] 

## replant wheat
execute as @a[gamemode=adventure,tag=!in_arena] at @s if block ~ ~-1 ~ dirt if block ~ ~ ~ air run function game:replant_wheat

function game:kill_handlers/handle_kill

team join Lobby @a[team=!armor_stand,team=!Blue,team=!Red,team=!Lobby]

execute as @a[predicate=game:is_sneaking,gamemode=adventure,tag=in_arena] run effect give @s slowness 1 10 true
execute as @a[predicate=game:is_sneaking,gamemode=adventure,tag=in_arena] run effect give @s resistance 1 0 false

execute as @a[team=Red,predicate=!game:is_poisoned] at @s if block ~ ~-2 ~ blue_wool run effect give @s poison 3 1
execute as @a[team=Blue,predicate=!game:is_poisoned] at @s if block ~ ~-2 ~ red_wool run effect give @s poison 3 1

scoreboard players set @a[scores={died=1..}] died 0

