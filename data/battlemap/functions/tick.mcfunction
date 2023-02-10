## Death detection
function battlemap:kill_handlers/register_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill]

## Enable triggers (functions that anyone can run, also non OP players)
# allow anyone to use these triggers
scoreboard players enable @a to_lobby_trigger
scoreboard players enable @a to_arena_trigger
scoreboard players enable @a select_kit_trigger
scoreboard players enable @a team_trigger

# execute function if triggered
execute as @a[scores={to_lobby_trigger=1..}] run function battlemap:to_lobby
execute as @a[scores={to_arena_trigger=1..,select_kit_trigger=1..},tag=!in_arena,team=Blue] run function battlemap:to_arena
execute as @a[scores={to_arena_trigger=1..,select_kit_trigger=1..},tag=!in_arena,team=Red] run function battlemap:to_arena
execute as @a[scores={team_trigger=1},tag=!in_arena] run team join Blue
execute as @a[scores={team_trigger=2},tag=!in_arena] run team join Red

# tell why not allowed if triggered
tellraw @a[scores={to_arena_trigger=1..},tag=in_arena] {"text": "You are already in the arena."}
tellraw @a[scores={to_arena_trigger=1..,=0}] {"text": "Please select a kit first."}
tellraw @a[scores={to_arena_trigger=1..},team=!Blue,team=!Red] {"text": "Please select a Team first."}

# reset trigger if not allowed
scoreboard players set @a[scores={to_arena_trigger=1..},tag=in_arena] to_arena_trigger 0
scoreboard players set @a[scores={to_arena_trigger=1..,select_kit_trigger=0}] to_arena_trigger 0 
scoreboard players set @a[scores={to_arena_trigger=1..},team=!Blue,team=!Red] to_arena_trigger 0
scoreboard players set @a team_trigger 0

## Handle map features
# mana well
execute if entity @e[tag=mana_well,tag=active] run function armor_stands:mana_well/mana_pickup

# control point
execute if entity @e[tag=control_point,tag=active] run function armor_stands:control_point/show_owner
execute if entity @e[tag=control_point,tag=active] run function armor_stands:control_point/logic/process_capture
execute if entity @e[tag=control_point,tag=active] run function armor_stands:control_point/logic/process_tickets

# death match
execute if entity @e[tag=death_match,tag=active] run function armor_stands:death_match/process_death

## Win detection
function battlemap:win_handler/win_detector

## Handle kit specific things
function kits:archer/arrow
function kits:archer/ultimate

function kits:bomber/bob
function kits:bomber/ultimate

function kits:wizard/damage_potion
function kits:wizard/heal_potion
function kits:wizard/speed_potion
function kits:wizard/ultimate

function kits:tank/ultimate

function kits:scout/ultimate

function kits:ultimate_particles

scoreboard players set @a[scores={died=1..}] died 0
