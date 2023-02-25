# Wizard receives a totem of undying in its off hand
# if it triggers: 
# tp up with slowfalling (to be able to get back on the map)
# fully heal and restock items
# get 40% damage resistance for couple seconds

item replace entity @a[tag=wizard,tag=in_arena,level=100..,nbt=!{Inventory:[{tag:{Tags:["ultimate_item"]}}]}] weapon.offhand with totem_of_undying{Tags:["ultimate_item"]}
experience set @a[tag=wizard,tag=in_arena,level=100..] 0 levels

execute as @a[scores={used_totem_of_undying=1..}] if predicate game:is_falling at @s run tp @s ~ ~5 ~
effect give @a[scores={used_totem_of_undying=1..}] slow_falling 3 1
effect give @a[scores={used_totem_of_undying=1..}] instant_health 1 5
effect give @a[scores={used_totem_of_undying=1..}] resistance 5 1

scoreboard players set @a[scores={used_totem_of_undying=1..}] wizard_speed_potion 0
scoreboard players set @a[scores={used_totem_of_undying=1..}] wizard_health_potion 0
scoreboard players set @a[scores={used_totem_of_undying=1..}] wizard_damage_potion 0

scoreboard players set @a[scores={used_totem_of_undying=1..}] used_totem_of_undying 0