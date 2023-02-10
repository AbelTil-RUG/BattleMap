## trigger scoreboards
scoreboard objectives add to_arena_trigger trigger
scoreboard objectives add select_kit_trigger trigger
scoreboard objectives add to_lobby_trigger trigger

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

## Kits
# scoreboards for replenishing consumables
scoreboard objectives add archer_arrow dummy
scoreboard objectives add bomber_bob dummy
scoreboard objectives add wizard_damage_potion dummy
scoreboard objectives add wizard_speed_potion dummy
scoreboard objectives add wizard_health_potion dummy
scoreboard objectives add used_totem_of_undying minecraft.used:totem_of_undying
scoreboard objectives add used_golden_apple minecraft.used:golden_apple



tellraw @a {"text": "Successfully loaded BattleMap datapack", "color": "#aqua", "hoverEvent": {"action": "show_text", "contents": "By CyclingMan"}}