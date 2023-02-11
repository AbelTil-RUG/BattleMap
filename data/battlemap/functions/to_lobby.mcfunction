tag @s remove in_arena
function kits:clear_kit
experience set @s 0 levels

effect give @s instant_health 1 4
tp @s @e[limit=1,tag=lobby,sort=random]
