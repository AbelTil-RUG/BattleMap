## Teams
team add Red 
team modify Red color red
team modify Red friendlyFire false
team join Red Red

team add Blue
team modify Blue color aqua
team modify Blue friendlyFire false
team join Blue Blue

team add armor_stand

team add Lobby
team modify Lobby friendlyFire false

## scoreboards
scoreboard objectives add died deathCount
scoreboard objectives add health health
scoreboard objectives setdisplay belowName health


function game:load_default_settings
scoreboard objectives add kills playerKillCount
scoreboard objectives add numbers dummy
scoreboard players set twenty numbers 20
scoreboard objectives add death_timer_ticks dummy
scoreboard objectives add death_timer_seconds dummy

## other
function interface:activate_map
title @a times 0 10 5
tellraw @a {"text": "Successfully loaded BattleMap datapack", "color": "#aqua", "hoverEvent": {"action": "show_text", "contents": "By CyclingMan"}}