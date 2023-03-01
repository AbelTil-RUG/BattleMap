# the archer class can use a bow in battle

# main weapon: knockback 1 bow
# secondary weapon: fast weak weapon
# other util: 
# armor: weak standard armor
# ultimate: stronger bow with limited uses

function kits:clear_kit
tag @s add archer
function kits:clear_ult_item

# add armor
item replace entity @s[team=Blue] armor.chest with leather_chestplate{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] armor.chest with leather_chestplate{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1

# add weapons
give @s stick{Unbreakable:1,Enchantments:[{id:sharpness,lvl:5}]} 1
give @s bow{Unbreakable:1,Enchantments:[{id:power,lvl:1},{id:punch,lvl:1}]} 1


# add attributes

# add restockables
scoreboard players set @s archer_arrow 0