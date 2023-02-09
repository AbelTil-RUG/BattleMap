tag @s remove in_arena
function kits:clear_kit

effect give @s instant_health 1 4
tp @s @e[limit=1,tag=lobby,sort=random]
scoreboard players set @a to_lobby_trigger 0
scoreboard players set @a to_arena_trigger 0
scoreboard players set @a select_kit_trigger 0