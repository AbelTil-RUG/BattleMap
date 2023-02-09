# the tank class has stronger armour and can partially resist knockback 

# main weapon: iron sword
# armour: iron armour with shield
# attributes: reduced speed, increased health, 40% knockback resistance
# ultimate: ???

function kits:clear_kit
tag @s add tank

# add armour
item replace entity @s armor.feet with iron_boots{Unbreakable:true}
item replace entity @s armor.legs with iron_leggings{Unbreakable:true}
item replace entity @s armor.chest with iron_chestplate{Unbreakable:true}
item replace entity @s weapon.offhand with shield{Unbreakable:true}

# add weapons
give @s iron_sword{Unbreakable:true,AttributeModifiers:[{AttributeName:"generic.attack_speed",Amount:0.05,Slot:mainhand,Name:"generic.attack_speed",UUID:[I;-12316,29609,20484,-59218]},{AttributeName:"generic.attack_damage",Amount:8,Slot:mainhand,Name:"generic.attack_damage",UUID:[I;-12316,28609,20484,-57218]}]}

# add attributes
attribute @s generic.knockback_resistance base set 0.4
attribute @s generic.movement_speed base set 0.08

effect give @s minecraft:absorption 600 2 true