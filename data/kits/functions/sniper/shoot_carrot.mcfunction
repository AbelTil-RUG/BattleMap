particle dust 0.914 0.118 0.757 0.5 ~ ~ ~ 0 0 0 0 1 force
execute if block ~ ~ ~ #kits:air_blocks positioned ~ ~-1.35 ~ unless entity @e[distance=..0.75,type=!armor_stand] positioned ^ ^ ^0.5 positioned ~ ~1.35 ~ run function kits:sniper/shoot_carrot

execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,type=!armor_stand] if entity @s at @s positioned ~ ~1 ~ run particle dust 0.914 0.118 0.757 2 ~ ~ ~ 0.3 0.3 0.3 0 5 force 

execute as @e[distance=..0.75,type=!armor_stand] run playsound enchant.thorns.hit player @s
execute positioned ~ ~-1.35 ~ as @e[distance=..0.75,type=!armor_stand] at @s run effect give @s regeneration 8 3 true
execute positioned ~ ~-1.35 ~ if entity @e[distance=..0.75,type=!armor_stand] at @s run playsound entity.arrow.hit_player player @s
