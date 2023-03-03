execute as @a[scores={shoot_carrot=1..},nbt={Inventory:[{id:"minecraft:carrot"}]}] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^1 run function kits:sniper/shoot_carrot
execute as @a[scores={shoot_carrot=1..},nbt={Inventory:[{id:"minecraft:carrot"}]}] at @s run playsound minecraft:item.trident.throw player @s ~ ~ ~ 
execute as @a[scores={shoot_carrot=1..},nbt=!{Inventory:[{id:"minecraft:carrot"}]}] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 
execute as @a[scores={shoot_carrot=1..},nbt={Inventory:[{id:"minecraft:carrot"}]}] run scoreboard players add @s sniper_carrot_used 1
execute as @a[scores={shoot_carrot=1..},nbt={Inventory:[{id:"minecraft:carrot"}]}] run clear @s carrot 1

scoreboard players set @a[scores={shoot_carrot=1..}] shoot_carrot 0


execute as @a[scores={shoot_fungus=1..},nbt={Inventory:[{id:"minecraft:warped_fungus"}]}] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^1 run function kits:sniper/shoot_fungus
execute as @a[scores={shoot_fungus=1..},nbt={Inventory:[{id:"minecraft:warped_fungus"}]}] at @s run playsound minecraft:item.trident.throw player @s ~ ~ ~ 
execute as @a[scores={shoot_fungus=1..},nbt=!{Inventory:[{id:"minecraft:warped_fungus"}]}] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 
execute as @a[scores={shoot_fungus=1..},nbt={Inventory:[{id:"minecraft:warped_fungus"}]}] run scoreboard players add @s sniper_fungus_used 1
execute as @a[scores={shoot_fungus=1..},nbt={Inventory:[{id:"minecraft:warped_fungus"}]}] run clear @s warped_fungus 1

scoreboard players set @a[scores={shoot_fungus=1..}] shoot_fungus 0