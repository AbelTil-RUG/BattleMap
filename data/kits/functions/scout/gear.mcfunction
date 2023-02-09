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


effect give @s jump_boost 600 1 true
effect give @s speed 600 2 true


attribute @s generic.max_health base set 14
effect give @s absorption 1 2
effect give @s instant_damage 1 2