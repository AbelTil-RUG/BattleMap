## Teams
team add Red 
team modify Red color red
team join Red Red

team add Blue
team modify Blue color aqua
team join Blue Blue

team add armor_stand

## Triggers
scoreboard objectives add to_arena_trigger trigger
scoreboard objectives add select_kit_trigger trigger
scoreboard objectives add to_lobby_trigger trigger
scoreboard objectives add team_trigger trigger

scoreboard objectives add died deathCount
scoreboard objectives add health health
scoreboard objectives setdisplay belowName health

scoreboard objectives add settings dummy
execute unless score do_overwrite settings matches 0 run function battlemap:load_default_settings

function battlemap:select_map/initialize_map

## Features
# Mana well scheduler
function armor_stands:mana_well/mana_spawn

# Control Points
scoreboard objectives add in_range dummy
scoreboard objectives add cap_state dummy
scoreboard objectives add tickets dummy

# Death Match
scoreboard objectives add TeamKills dummy

playsound ui.toast.challenge_complete

# title setting
title @a times 20 60 20

## Kits
# scoreboards for replenishing consumables
scoreboard objectives add archer_arrow dummy
scoreboard objectives add bomber_bob dummy
scoreboard objectives add wizard_damage_potion dummy
scoreboard objectives add wizard_speed_potion dummy
scoreboard objectives add wizard_health_potion dummy
scoreboard objectives add used_totem_of_undying minecraft.used:totem_of_undying
scoreboard objectives add used_golden_apple minecraft.used:golden_apple
scoreboard objectives add used_honey_bottle minecraft.used:honey_bottle
scoreboard objectives add scout_ult_timer dummy



tellraw @a {"text": "Successfully loaded BattleMap datapack", "color": "#aqua", "hoverEvent": {"action": "show_text", "contents": "By CyclingMan"}}