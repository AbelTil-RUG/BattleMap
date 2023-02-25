## Death detection
function game:kill_handlers/register_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill,nbt=!{Item:{id:"minecraft:wheat_seeds"}}]
kill @e[type=tnt] 

## replant wheat
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}] run data modify entity @s PickupDelay set value 0 
execute as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]},gamemode=adventure] run function game:replant_wheat

function game:kill_handlers/handle_kill

execute as @a[predicate=game:is_sneaking,gamemode=adventure,tag=in_arena] run effect give @s slowness 1 10 true
execute as @a[predicate=game:is_sneaking,gamemode=adventure,tag=in_arena] run effect give @s resistance 1 0 false
execute as @a[predicate=!game:is_sneaking,gamemode=adventure,tag=in_arena] run effect clear @s resistance

execute as @a[team=Red,predicate=!game:is_poisoned] at @s if block ~ ~-2 ~ blue_wool run effect give @s poison 3 1
execute as @a[team=Blue,predicate=!game:is_poisoned] at @s if block ~ ~-2 ~ red_wool run effect give @s poison 3 1

scoreboard players set @a[scores={died=1..}] died 0

