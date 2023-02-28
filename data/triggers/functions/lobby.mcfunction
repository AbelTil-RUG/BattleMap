scoreboard players enable @a lobby
scoreboard players reset @a[gamemode=spectator] lobby
execute as @a[scores={lobby=1..}] run function map:tp_lobby
scoreboard players set @a[scores={lobby=1..}] lobby 0
