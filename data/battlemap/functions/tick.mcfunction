## Death detection
function battlemap:kill_handlers/register_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill]

## Enable triggers (functions that anyone can run, also non OP players)
# to lobby - always
scoreboard players enable @a to_lobby_trigger
execute as @a[scores={to_lobby_trigger=1..}] run function battlemap:to_lobby
scoreboard players set @a[scores={to_lobby_trigger=1..}] to_lobby_trigger 0

# to arena - if in team && kit selected && map selected
scoreboard players enable @a to_arena_trigger

execute as @a if entity @s[tag=!archer,tag=!bomber,tag=!scout,tag=!tank,tag=!wizard] run scoreboard players set @s to_arena_trigger 0
execute as @a if entity @s[team=!Blue,team=!Red] run scoreboard players set @s to_arena_trigger 0
execute unless entity @e[tag=active] as @a[scores={to_arena_trigger=1}] run tellraw @s {"text": "You will spawn if the map is selected."}
execute unless entity @e[tag=active] as @a[scores={to_arena_trigger=1}] run scoreboard players add @s to_arena_trigger 1
execute if entity @e[tag=active] as @a[scores={to_arena_trigger=1..}] run function battlemap:to_arena
execute if entity @e[tag=active] run scoreboard players set @a[scores={to_arena_trigger=1..}] to_arena_trigger 0

# select kit
scoreboard players enable @a select_kit_trigger
execute as @a[scores={select_kit_trigger=1..},tag=in_arena] run function battlemap:to_arena
execute as @a[scores={select_kit_trigger=1}] run function kits:archer/gear
execute as @a[scores={select_kit_trigger=2}] run function kits:bomber/gear
execute as @a[scores={select_kit_trigger=3}] run function kits:scout/gear
execute as @a[scores={select_kit_trigger=4}] run function kits:tank/gear
execute as @a[scores={select_kit_trigger=5}] run function kits:wizard/gear
scoreboard players set @a[scores={select_kit_trigger=1..}] select_kit_trigger 0

# select team
scoreboard players enable @a team_trigger
execute as @a[scores={team_trigger=1}] run team join Blue
execute as @a[scores={team_trigger=1}] run tellraw @s {"text": "You joined team Blue","color": "aqua"}
execute as @a[scores={team_trigger=2}] run team join Red
execute as @a[scores={team_trigger=2}] run tellraw @s {"text": "You joined team Red","color": "red"}
scoreboard players set @a[scores={team_trigger=1..}] team_trigger 0

## map features
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

## kit specific things
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

function battlemap:kill_handlers/handle_kill

scoreboard players set @a[scores={died=1..}] died 0
