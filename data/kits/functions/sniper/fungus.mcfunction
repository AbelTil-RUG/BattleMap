give @a[tag=sniper,tag=in_arena,scores={sniper_fungus=0,sniper_fungus_used=1..}] warped_fungus 1
scoreboard players remove @a[tag=sniper,tag=in_arena,scores={sniper_fungus=0,sniper_fungus_used=1..}] sniper_fungus_used 1
scoreboard players operation @a[tag=sniper,tag=in_arena,scores={sniper_fungus=..0}] sniper_fungus = fungus_cooldown kit_settings
execute as @a[tag=sniper,tag=in_arena,scores={sniper_fungus_used=1..}] run scoreboard players remove @s sniper_fungus 1