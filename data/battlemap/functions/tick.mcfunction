## Death detection
function battlemap:kill_handlers/register_death

## Remove items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill,nbt=!{Item:{id:"minecraft:wheat_seeds"}}]
kill @e[type=tnt] 

# replant wheat
execute as @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds"}}] run data modify entity @s PickupDelay set value 0 
execute as @a at @s if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]},gamemode=adventure] run function battlemap:replant_wheat

## Enable triggers (functions that anyone can run, also non OP players)
# to lobby - always
scoreboard players enable @a lobby
execute as @a[scores={lobby=1..}] run function battlemap:to_lobby
scoreboard players set @a[scores={lobby=1..}] lobby 0

# to arena - if in team && kit selected && map selected
scoreboard players enable @a arena

execute as @a if entity @s[tag=!archer,tag=!bomber,tag=!scout,tag=!tank,tag=!wizard] run scoreboard players set @s arena 0
execute as @a if entity @s[team=!Blue,team=!Red] run scoreboard players set @s arena 0
execute unless entity @e[tag=active] as @a[scores={arena=1}] run tellraw @s {"text": "You will spawn as soon as the map is selected."}
execute unless entity @e[tag=active] as @a[scores={arena=1}] run scoreboard players add @s arena 1
execute if entity @e[tag=active] as @a[scores={arena=1..}] run function battlemap:to_arena
execute if entity @e[tag=active] run scoreboard players set @a[scores={arena=1..}] arena 0

# select kit
scoreboard players enable @a select_kit
execute as @a[scores={select_kit=1..},tag=in_arena] run function battlemap:to_arena
execute as @a[scores={select_kit=1..}] run tellraw @s {"text": "Kit selected"}
execute as @a[scores={select_kit=1}] run function kits:archer/gear
execute as @a[scores={select_kit=2}] run function kits:bomber/gear
execute as @a[scores={select_kit=3}] run function kits:scout/gear
execute as @a[scores={select_kit=4}] run function kits:tank/gear
execute as @a[scores={select_kit=5}] run function kits:wizard/gear
execute as @a[scores={select_kit=6}] run function kits:sniper/gear
scoreboard players set @a[scores={select_kit=1..}] select_kit 0

# select team
scoreboard players enable @a team_blue
execute as @a[scores={team_blue=1..}] run team join Blue
execute as @a[scores={team_blue=1..}] run tellraw @s {"text": "You joined team Blue","color": "aqua"}
scoreboard players set @a[scores={team_blue=1..}] team_blue 0
scoreboard players enable @a team_red
execute as @a[scores={team_red=1..}] run team join Red
execute as @a[scores={team_red=1..}] run tellraw @s {"text": "You joined team Red","color": "red"}
scoreboard players set @a[scores={team_red=1..}] team_red 0

# select map
scoreboard players enable @a select_map
execute as @a[scores={select_map=-1},tag=admin] run function battlemap:select_map/deactivate_map
execute as @a[scores={select_map=-1},tag=admin] run tellraw @a {"text": "All maps deactivated"}
execute as @a[scores={select_map=1},tag=admin] run function battlemap:select_map/map_1
execute as @a[scores={select_map=1},tag=admin] run tellraw @a {"text": "Map 1 selected."}
execute as @a[scores={select_map=2},tag=admin] run function battlemap:select_map/map_2
execute as @a[scores={select_map=2},tag=admin] run tellraw @a {"text": "Map 2 selected."}
scoreboard players set @a[scores={select_map=..-1}] select_map 0
scoreboard players set @a[scores={select_map=1..}] select_map 0

execute if entity @e[tag=active] run title @a[tag=!in_arena] actionbar {"text": "A map is selected","color": "yellow"} 

## map features
# mana well
execute if entity @e[tag=mana_well,tag=active] run function armor_stands:mana_well/mana_pickup

# control point
execute if entity @e[tag=control_point,tag=active] run function armor_stands:control_point/show_owner
execute if entity @e[tag=control_point,tag=active] run function armor_stands:control_point/logic/process_capture
execute if entity @e[tag=control_point,tag=active] run function armor_stands:control_point/logic/process_tickets

# death match
execute if entity @e[tag=death_match,tag=active] run function armor_stands:death_match/process_death

# capture the flag
function ctf:logic

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

function kits:sniper/detect_shot
function kits:sniper/carrot
function kits:sniper/fungus

function kits:ultimate_particles

function battlemap:kill_handlers/handle_kill

scoreboard players set @a[scores={died=1..}] died 0

