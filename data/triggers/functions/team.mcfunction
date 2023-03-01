scoreboard players enable @a team_blue
scoreboard players reset @a[tag=in_arena] team_blue
execute as @a[scores={team_blue=1..},tag=!in_arena] run clear @s red_wool
execute as @a[scores={team_blue=1..},tag=!in_arena] run clear @s light_blue_wool
execute as @a[scores={team_blue=1..},tag=!in_arena] run item replace entity @s hotbar.8 with light_blue_wool
execute as @a[scores={team_blue=1..},tag=!in_arena] run team join Blue
execute as @a[scores={team_blue=1..},tag=!in_arena] run tellraw @s {"text": "You joined team Blue","color": "aqua"}
scoreboard players set @a[scores={team_blue=1..}] team_blue 0

scoreboard players enable @a team_red
scoreboard players reset @a[tag=in_arena] team_red
execute as @a[scores={team_red=1..},tag=!in_arena] run clear @s red_wool
execute as @a[scores={team_red=1..},tag=!in_arena] run clear @s light_blue_wool
execute as @a[scores={team_red=1..},tag=!in_arena] run item replace entity @s hotbar.8 with red_wool
execute as @a[scores={team_red=1..},tag=!in_arena] run team join Red
execute as @a[scores={team_red=1..},tag=!in_arena] run tellraw @s {"text": "You joined team Red","color": "red"}
scoreboard players set @a[scores={team_red=1..}] team_red 0