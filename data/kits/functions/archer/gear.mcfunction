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
item replace entity @s[team=Blue] hotbar.8 with light_blue_wool
item replace entity @s[team=Blue] armor.chest with leather_chestplate{Unbreakable:1,display:{color:16701501},HideFlags:64} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] hotbar.8 with red_wool
item replace entity @s[team=Red] armor.chest with leather_chestplate{Unbreakable:1,display:{color:16701501},HideFlags:64} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1

# add weapons
give @s stick{Unbreakable:1,Enchantments:[{id:sharpness,lvl:5}]} 1
give @s bow{Unbreakable:1,Enchantments:[{id:power,lvl:1},{id:punch,lvl:1}]} 1


# add attributes

# add restockables
scoreboard players operation @s archer_arrow_used = max_arrows kit_settings 
scoreboard players set @s archer_arrow 0