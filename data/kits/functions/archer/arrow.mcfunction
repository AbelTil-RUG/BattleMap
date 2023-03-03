give @a[tag=archer,tag=in_arena,scores={archer_arrow=0,archer_arrow_used=1..}] arrow 1
scoreboard players remove @a[tag=archer,tag=in_arena,scores={archer_arrow=0,archer_arrow_used=1..}] archer_arrow_used 1
scoreboard players operation @a[tag=archer,tag=in_arena,scores={archer_arrow=0}] archer_arrow = arrow_cooldown kit_settings
execute as @a[tag=archer,tag=in_arena,scores={archer_arrow_used=1..}] run scoreboard players remove @s archer_arrow 1





