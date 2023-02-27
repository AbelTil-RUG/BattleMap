## Teams
team add Red 
team modify Red color red
team join Red Red

team add Blue
team modify Blue color aqua
team join Blue Blue

team add armor_stand

## scoreboards
scoreboard objectives add died deathCount
scoreboard objectives add health health
scoreboard objectives setdisplay belowName health
scoreboard objectives add settings dummy
execute unless score do_overwrite settings matches 0 run function game:load_default_settings
scoreboard objectives add kills playerKillCount
scoreboard objectives add numbers dummy
scoreboard players set twenty numbers 20
scoreboard objectives add death_timer_ticks dummy
scoreboard objectives add death_timer_seconds dummy

## other
function interface:activate_map
title @a times 0 10 5
tellraw @a {"text": "Successfully loaded BattleMap datapack", "color": "#aqua", "hoverEvent": {"action": "show_text", "contents": "By CyclingMan"}}