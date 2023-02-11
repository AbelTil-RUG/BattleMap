# the wizard class can use speed in battle

# main weapon: knockback  1 stick
# armour: weak standard armour
# attributes: decent speed boost and double jump, less health
# ultimate: ???

function kits:clear_kit
tag @s add scout

# add armour
item replace entity @s armor.feet with leather_boots{Unbreakable:true}
item replace entity @s armor.legs with leather_leggings{Unbreakable:true}
item replace entity @s armor.chest with leather_chestplate{Unbreakable:true}

# add weapons
give @s wooden_shovel{Unbreakable:1,display:{Name:'[{"text":"Baseball bat","italic":false}]'},Enchantments:[{id:knockback,lvl:1}]} 1

effect give @s jump_boost 3600 1 true
attribute @s generic.movement_speed base set 0.12

attribute @s generic.max_health base set 14