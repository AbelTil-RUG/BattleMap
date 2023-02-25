## Death detection
function game:kill_handlers/register_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill,nbt=!{Item:{id:"minecraft:wheat_seeds"}}]
kill @e[type=tnt] 

# replant wheat
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}] run data modify entity @s PickupDelay set value 0 
execute as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]},gamemode=adventure] run function game:replant_wheat

## Win detection
function interface:determine_win

## kit specific things


function game:kill_handlers/handle_kill

scoreboard players set @a[scores={died=1..}] died 0

