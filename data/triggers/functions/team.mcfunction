scoreboard players enable @a team_blue
execute as @a[scores={team_blue=1..},tag=!in_arena] run team join Blue
execute as @a[scores={team_blue=1..},tag=!in_arena] run tellraw @s {"text": "You joined team Blue","color": "aqua"}
scoreboard players set @a[scores={team_blue=1..}] team_blue 0

scoreboard players enable @a team_red
execute as @a[scores={team_red=1..},tag=!in_arena] run team join Red
execute as @a[scores={team_red=1..},tag=!in_arena] run tellraw @s {"text": "You joined team Red","color": "red"}
scoreboard players set @a[scores={team_red=1..}] team_red 0