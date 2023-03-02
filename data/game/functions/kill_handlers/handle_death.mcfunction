execute as @a[tag=in_arena,scores={death_timer_ticks=1..}] run scoreboard players remove @s death_timer_ticks 1
execute as @a[tag=in_arena,scores={death_timer_ticks=1..}] run scoreboard players operation @s death_timer_seconds = @s death_timer_ticks
execute as @a[tag=in_arena,scores={death_timer_ticks=1..}] run scoreboard players operation @s death_timer_seconds /= twenty numbers
execute as @a[tag=in_arena,scores={death_timer_ticks=1..}] run scoreboard players add @s death_timer_seconds 1
execute as @a[tag=in_arena,scores={died=1..}] run scoreboard players operation @s death_timer_ticks = death_time general_settings
execute as @a[tag=in_arena,scores={died=1..}] run gamemode spectator @s
execute as @a[tag=in_arena,scores={died=1..}] run tellraw @s ["",{"text":"Change your kit: ","color":"gold"},{"text":"Archer ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_kit set 1"}},{"text":"Bomber ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_kit set 2"}},{"text":"Scout ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_kit set 3"}},{"text":"Tank ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_kit set 4"}},{"text":"Wizard ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_kit set 5"}},{"text":"Sniper ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger select_kit set 6"}}]

execute as @a[tag=in_arena,scores={died=1..}] run tp @s @e[tag=active,tag=death_spawn,limit=1,sort=random]
execute as @a[tag=in_arena,scores={death_timer_ticks=1..}] run title @s title {"text": "You died.", "color": "red"}
execute as @a[tag=in_arena,scores={death_timer_ticks=1..}] run title @s subtitle ["Respawning in: ",{"score":{"name":"@s","objective":"death_timer_seconds"}}]
execute as @a[tag=in_arena,scores={death_timer_ticks=0}] run function map:tp_arena
execute as @a[tag=in_arena,scores={death_timer_ticks=0}] run title @s clear
execute as @a[tag=in_arena,scores={death_timer_ticks=0}] run scoreboard players reset @s death_timer_ticks
