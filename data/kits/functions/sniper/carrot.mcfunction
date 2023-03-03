give @a[tag=sniper,tag=in_arena,scores={sniper_carrot=0,sniper_carrot_used=1..}] carrot 1
scoreboard players remove @a[tag=sniper,tag=in_arena,scores={sniper_carrot=0,sniper_carrot_used=1..}] sniper_carrot_used 1
scoreboard players operation @a[tag=sniper,tag=in_arena,scores={sniper_carrot=..0}] sniper_carrot = carrot_cooldown kit_settings
execute as @a[tag=sniper,tag=in_arena,scores={sniper_carrot_used=1..}] run scoreboard players remove @s sniper_carrot 1