# the tank class has stronger armour and can partially resist knockback 

# main weapon: iron sword
# armour: iron armour with shield
# attributes: reduced speed, increased health, 40% knockback resistance
# ultimate: ???

function kits:clear_kit
tag @s add tank

# add armour
item replace entity @s[team=Blue] armor.head with leather_helmet{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.chest with iron_chestplate{Unbreakable:1,display:{color:3847130},HideFlags:64,Enchantments:[{id:projectile_protection,lvl:2}]} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] armor.head with leather_helmet{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.chest with iron_chestplate{Unbreakable:1,display:{color:11546150},HideFlags:64,Enchantments:[{id:projectile_protection,lvl:2}]} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1

# add weapons
give @p stone_sword{Unbreakable:1,Enchantments:[{id:sweeping,lvl:3}]} 1

# add attributes
attribute @s generic.knockback_resistance base set 0.4
attribute @s generic.movement_speed base set 0.08

effect give @s minecraft:absorption 600 2 true