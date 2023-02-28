scoreboard players enable @a arena
scoreboard players reset @a[gamemode=spectator] arena
scoreboard players reset @a[tag=in_arena] arena

# you can only tp to the arena if
    # a team has been chosen
execute as @a[scores={arena=1..},team=!Blue,team=!Red] run tellraw @s {"text": "Select a team before going to the arena","color":"yellow"}
execute as @a[scores={arena=1..},team=!Blue,team=!Red] run scoreboard players set @s arena 0
    # a kit has been chosen
execute as @a[scores={arena=1..},tag=!archer,tag=!bomber,tag=!scout,tag=!tank,tag=!wizard,tag=!sniper] run tellraw @s {"text": "Select a kit before going to the arena","color":"yellow"}
execute as @a[scores={arena=1..},tag=!archer,tag=!bomber,tag=!scout,tag=!tank,tag=!wizard,tag=!sniper] run scoreboard players set @s arena 0
    # there is an active arena
execute unless entity @e[tag=active] as @a[scores={arena=1}] run tellraw @s {"text": "You will spawn as soon as the map is selected.","color":"yellow"}
execute unless entity @e[tag=active] as @a[scores={arena=1}] run scoreboard players set @s arena 2

# tp the player
execute if entity @e[tag=active] as @a[scores={arena=1..}] run function map:tp_arena

# reset trigger
execute if entity @e[tag=active] run scoreboard players set @a[scores={arena=1..}] arena 0