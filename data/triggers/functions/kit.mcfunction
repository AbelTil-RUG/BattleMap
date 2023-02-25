scoreboard players enable @a select_kit
execute as @a[scores={select_kit=1..},tag=in_arena] run function map:tp_arena
execute as @a[scores={select_kit=1..}] run tellraw @s {"text": "Kit selected"}
execute as @a[scores={select_kit=1}] run function kits:archer/gear
execute as @a[scores={select_kit=2}] run function kits:bomber/gear
execute as @a[scores={select_kit=3}] run function kits:scout/gear
execute as @a[scores={select_kit=4}] run function kits:tank/gear
execute as @a[scores={select_kit=5}] run function kits:wizard/gear
execute as @a[scores={select_kit=6}] run function kits:sniper/gear
scoreboard players set @a[scores={select_kit=1..}] select_kit 0