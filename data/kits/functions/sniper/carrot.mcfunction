give @a[tag=sniper,tag=in_arena,scores={sniper_carrot=0},nbt=!{Inventory:[{id:"minecraft:carrot",Count:2b}]}] carrot 1
scoreboard players operation @a[tag=sniper,tag=in_arena,scores={sniper_carrot=..0}] sniper_carrot = carrot_cooldown settings
execute as @a[tag=sniper,tag=in_arena,nbt=!{Inventory:[{id:"minecraft:carrot",Count:2b}]}] run scoreboard players remove @s sniper_carrot 1

