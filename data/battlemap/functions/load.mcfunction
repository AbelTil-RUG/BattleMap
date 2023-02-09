tellraw @a {"text": "Successfully loaded BattleMap datapack", "color": "#aqua", "hoverEvent": {"action": "show_text", "contents": "By CyclingMan"}}

scoreboard objectives add to_arena_trigger trigger
scoreboard objectives add select_kit_trigger trigger
scoreboard objectives add to_lobby_trigger trigger

scoreboard objectives add died deathCount
scoreboard objectives add health health
scoreboard objectives setdisplay belowName health

function battlemap:select_map/initialize_map