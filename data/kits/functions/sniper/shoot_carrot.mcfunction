particle dust 0.914 0.118 0.757 0.3 ~ ~ ~ 0 0 0 0 1 force
execute if block ~ ~ ~ air positioned ~ ~-1.35 ~ unless entity @e[distance=..0.75] positioned ^ ^ ^0.5 positioned ~ ~1.35 ~ run function kits:sniper/shoot_carrot

execute positioned ~ ~-1.35 ~ as @e[distance=..0.75] if entity @s at @s positioned ~ ~1 ~ run particle dust 0.914 0.118 0.757 2 ~ ~ ~ 0.3 0.3 0.3 0 5 force 

execute as @e[distance=..0.75] run playsound item.trident.hit_ground player @s
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75] if entity @s at @s run effect give @s regeneration 8 1 true