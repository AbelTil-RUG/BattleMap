particle dust 0.024 0.541 0.031 0.3 ~ ~ ~ 0 0 0 0 1 force
execute if block ~ ~ ~ air positioned ~ ~-1.35 ~ unless entity @e[distance=..0.75,type=!armor_stand] positioned ^ ^ ^0.5 positioned ~ ~1.35 ~ run function kits:sniper/shoot_fungus

execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue,type=!armor_stand] if entity @s at @s positioned ~ ~1 ~ run particle dust 0 1 0 2 ~ ~ ~ 0.3 0.3 0.3 0 5 force 
execute as @e[distance=..0.75,team=!Blue,type=!armor_stand] run playsound item.trident.hit_ground player @s
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue,type=!armor_stand] if entity @s at @s run effect give @s glowing 3 1 true
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue,type=!armor_stand] if entity @s at @s run effect give @s wither 5 1 true
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue,type=!armor_stand] if entity @s at @s run effect give @s slowness 3 0 true
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue,type=!armor_stand] if entity @s at @s run effect give @s weakness 3 0 true