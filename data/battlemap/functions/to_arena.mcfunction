function battlemap:select_kit_trigger

tag @s add in_arena
gamemode adventure @s

effect give @s instant_health 1 10 true

bossbar set point_a players @a
bossbar set point_b players @a
bossbar set point_c players @a

function battlemap:reload_kit


tp @s[team=Blue] @e[limit=1,tag=active,tag=blue_spawn,sort=random]
tp @s[team=Red] @e[limit=1,tag=active,tag=red_spawn,sort=random]

scoreboard players set @a to_arena_trigger 0