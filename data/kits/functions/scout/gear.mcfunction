# the wizard class can use speed in battle

# main weapon: knockback  1 stick
# armour: weak standard armour
# attributes: decent speed boost and double jump, less health
# ultimate: ???

function kits:clear_kit
tag @s add scout
function kits:clear_ult_item

# add armour
item replace entity @s[team=Blue] hotbar.8 with light_blue_wool
item replace entity @s[team=Blue] armor.chest with leather_chestplate{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] hotbar.8 with red_wool
item replace entity @s[team=Red] armor.chest with leather_chestplate{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1

# add weapons
give @s iron_shovel{Unbreakable:1,Enchantments:[{id:knockback,lvl:1}]} 1

# effect give @s jump_boost 3600 0 true
attribute @s generic.movement_speed base set 0.12

attribute @s generic.max_health base set 14