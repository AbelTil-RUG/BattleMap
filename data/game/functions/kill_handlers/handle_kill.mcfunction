experience add @a[tag=in_arena,scores={kills=1..},nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] 10 levels
execute as @a[scores={kills=1..},nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] at @s run playsound minecraft:entity.experience_orb.pickup player @s 
scoreboard players remove @a[scores={kills=1..}] kills 1