scoreboard players enable @a select_kit
execute as @a if entity @s[scores={select_kit=1..},tag=in_arena,gamemode=adventure] run function map:tp_arena
execute as @a if entity @s[scores={select_kit=1..},gamemode=adventure] run tellraw @s {"text": "Kit selected"}
execute as @a if entity @s[scores={select_kit=1},gamemode=adventure] run function kits:archer/gear
execute as @a if entity @s[scores={select_kit=2},gamemode=adventure] run function kits:bomber/gear
execute as @a if entity @s[scores={select_kit=3},gamemode=adventure] run function kits:scout/gear
execute as @a if entity @s[scores={select_kit=4},gamemode=adventure] run function kits:tank/gear
execute as @a if entity @s[scores={select_kit=5},gamemode=adventure] run function kits:wizard/gear
execute as @a if entity @s[scores={select_kit=6},gamemode=adventure] run function kits:sniper/gear
scoreboard players set @a[scores={select_kit=1..},gamemode=adventure] select_kit 0