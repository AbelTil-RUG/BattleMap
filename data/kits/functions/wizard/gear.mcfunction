# the wizard class can use potions in battle

# main weapon: harming potion
# secondary weapon: fast weak weapon
# other util: healing potion, super speed potion
# armour: weak standard armour with shield
# attributes:
# ultimate: ???

function kits:clear_kit
tag @s add wizard
function kits:clear_ult_item

# add armour
item replace entity @s[team=Blue] armor.head with leather_helmet{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.chest with leather_chestplate{Unbreakable:1,display:{color:1908001},HideFlags:64} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] armor.head with leather_helmet{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.chest with leather_chestplate{Unbreakable:1,display:{color:1908001},HideFlags:64} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1

# add weapons
give @s blaze_rod{Unbreakable:1,Enchantments:[{id:sharpness,lvl:3}],display:{Name:'[{"text":"Magic wand","italic":false}]'}} 1

# add attributes

# add restockables
scoreboard players set @s wizard_speed_potion 0
scoreboard players set @s wizard_health_potion 0
scoreboard players set @s wizard_damage_potion 0

attribute @s generic.movement_speed base set 0.105
attribute @s generic.max_health base set 14