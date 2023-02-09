execute as @s[scores={select_kit_trigger=1},tag=!in_arena] run function kits:archer/gear
execute as @s[scores={select_kit_trigger=2},tag=!in_arena] run function kits:bomber/gear
execute as @s[scores={select_kit_trigger=3},tag=!in_arena] run function kits:scout/gear
execute as @s[scores={select_kit_trigger=4},tag=!in_arena] run function kits:tank/gear
execute as @s[scores={select_kit_trigger=5},tag=!in_arena] run function kits:wizard/gear
scoreboard players set @s select_kit_trigger 0