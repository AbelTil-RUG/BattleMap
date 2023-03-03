scoreboard players enable @a[tag=!in_arena] team
scoreboard players reset @a[tag=in_arena] team

scoreboard players set @a[scores={team=1},team=Red] team 2
execute as @a[scores={team=2}] run team join Blue
execute as @a[scores={team=2}] run tellraw @s {"text": "You joined team Blue","color": "aqua"}

scoreboard players set @a[scores={team=1},team=Blue] team 3
execute as @a[scores={team=3}] run team join Red
execute as @a[scores={team=3}] run tellraw @s {"text": "You joined team Red","color": "red"}

execute as @a[scores={team=1..}] run function kits:reload_kit
scoreboard players set @a[scores={team=1..}] team 0
