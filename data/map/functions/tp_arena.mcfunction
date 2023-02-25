tag @s add in_arena
gamemode adventure @s

effect give @s instant_health 1 10 true

bossbar set point_a players @a[tag=in_arena]
bossbar set point_b players @a[tag=in_arena]
bossbar set point_c players @a[tag=in_arena]

function kits:reload_kit 
effect give @a saturation 1000000 1 true

tp @s[team=Blue] @e[limit=1,tag=active,tag=blue_spawn,sort=random]
tp @s[team=Red] @e[limit=1,tag=active,tag=red_spawn,sort=random]