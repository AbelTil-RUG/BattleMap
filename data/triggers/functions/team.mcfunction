scoreboard players enable @a[tag=!in_arena,team=!Blue] team_blue
scoreboard players reset @a[tag=in_arena] team_blue
scoreboard players reset @a[team=Blue] team_blue
execute as @a[scores={team_blue=1..}] run team join Blue
execute as @a[scores={team_blue=1..}] run function kits:reload_kit
execute as @a[scores={team_blue=1..}] run tellraw @s {"text": "You joined team Blue","color": "aqua"}
scoreboard players set @a[scores={team_blue=1..}] team_blue 0

scoreboard players enable @a[tag=!in_arena,team=!Red] team_red
scoreboard players reset @a[tag=in_arena] team_red
scoreboard players reset @a[team=Red] team_red
execute as @a[scores={team_red=1..}] run team join Red
execute as @a[scores={team_red=1..}] run function kits:reload_kit
execute as @a[scores={team_red=1..}] run tellraw @s {"text": "You joined team Red","color": "red"}
scoreboard players set @a[scores={team_red=1..}] team_red 0