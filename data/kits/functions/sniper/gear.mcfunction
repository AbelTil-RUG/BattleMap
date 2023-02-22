function kits:clear_kit
tag @s add sniper
function kits:clear_ult_item

# add armor
item replace entity @s[team=Blue] armor.chest with leather_chestplate{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] armor.chest with leather_chestplate{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1

# add weapons
give @p stick{Unbreakable:1,Enchantments:[{id:sharpness,lvl:2}]} 1
give @p carrot_on_a_stick{Unbreakable:1} 1
give @p warped_fungus_on_a_stick{Unbreakable:1} 1


# add attributes

# add restockables
scoreboard players set @s sniper_carrot 0
scoreboard players set @s sniper_fungus 0


