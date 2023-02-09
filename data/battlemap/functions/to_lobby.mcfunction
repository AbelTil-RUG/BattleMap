tag @s remove in_arena
scoreboard players set @s died 0
effect give @s instant_health 1 4 true
effect clear @s

tp @s @e[limit=1,tag=lobby]