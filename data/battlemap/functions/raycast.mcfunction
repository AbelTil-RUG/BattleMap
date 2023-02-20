particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1 force
execute if block ~ ~ ~ air positioned ~ ~-1.35 ~ unless entity @e[distance=..0.75,type=armor_stand] unless entity @e[distance=0.75,type=player,team=Red] positioned ^ ^ ^1 positioned ~ ~1.35 ~ run function battlemap:raycast

execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue] if entity @s at @s positioned ~ ~1 ~ run particle dust 1 0 0 2 ~ ~ ~ 0.3 0.3 0.3 0 5 force 
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue] if entity @s at @s run say I got shot! 
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,team=!Blue] if entity @s at @s run effect give @s glowing 2 1