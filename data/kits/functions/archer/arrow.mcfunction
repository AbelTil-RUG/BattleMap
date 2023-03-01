give @a[tag=archer,tag=in_arena,scores={archer_arrow=0},nbt=!{Inventory:[{id:"minecraft:arrow",Count:3b}]}] arrow 1
scoreboard players operation @a[tag=archer,tag=in_arena,scores={archer_arrow=..0}] archer_arrow = arrow_cooldown kit_settings
execute as @a[tag=archer,tag=in_arena,nbt=!{Inventory:[{id:"minecraft:arrow",Count:3b}]}] run scoreboard players remove @s archer_arrow 1





