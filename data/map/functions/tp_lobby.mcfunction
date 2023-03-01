tag @s remove in_arena
gamemode adventure @s
function kits:clear_kit
clear @s
experience set @s 0 levels

bossbar set point_a players @a[tag=in_arena]
bossbar set point_b players @a[tag=in_arena]
bossbar set point_c players @a[tag=in_arena]

effect give @s instant_health 1 4
team leave @s
tp @s @e[limit=1,tag=lobby,sort=random]
