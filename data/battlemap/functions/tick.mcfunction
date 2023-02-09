## Death detection
function battlemap:kill_handlers/register_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill]

## Enable triggers (functions that anyone can run, also non OP players)
scoreboard players enable @a to_lobby_trigger
scoreboard players reset @a[team=!Blue,team=!Red] to_arena_trigger
scoreboard players enable @a[team=Blue] to_arena_trigger
scoreboard players enable @a[team=Red] to_arena_trigger
scoreboard players enable @a[team=Blue] select_kit_trigger
scoreboard players enable @a[team=Red] select_kit_trigger

execute as @a[scores={to_lobby_trigger=1..}] run function battlemap:to_lobby
execute as @a[scores={to_arena_trigger=1..,select_kit_trigger=1..},tag=!in_arena] run function battlemap:to_arena

tellraw @a[scores={to_arena_trigger=1..},tag=in_arena] {"text": "You are already in the arena."}
tellraw @a[scores={to_arena_trigger=1..,select_kit_trigger=0}] {"text": "Please select a kit first."}
scoreboard players set @a[scores={to_arena_trigger=1..},tag=in_arena] to_arena_trigger 0
scoreboard players set @a[scores={to_arena_trigger=1..,select_kit_trigger=0}] to_arena_trigger 0 

