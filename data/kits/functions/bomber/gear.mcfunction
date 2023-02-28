# the bomber class can use explosions in battle

# main weapon: creeper explosion
# secondary weapon: stone sword
# other util: healing and super speed potion
# armour: explosion resistant chain armour (excluding helmet)
# attributes: small jump boost
# ultimate: creeper trident

function kits:clear_kit
tag @s add bomber
function kits:clear_ult_item

# add armour
item replace entity @s[team=Blue] armor.head with leather_helmet{Unbreakable:1,display:{color:3847130},HideFlags:64} 1
item replace entity @s[team=Blue] armor.chest with chainmail_chestplate{Unbreakable:1,display:{color:3847130},HideFlags:64,Enchantments:[{id:blast_protection,lvl:3}]} 1
item replace entity @s[team=Blue] armor.legs with leather_leggings{Unbreakable:1,display:{color:3847130},HideFlags:64,Enchantments:[{id:blast_protection,lvl:3}]} 1
item replace entity @s[team=Blue] armor.feet with leather_boots{Unbreakable:1,display:{color:3847130},HideFlags:64} 1

item replace entity @s[team=Red] armor.head with leather_helmet{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
item replace entity @s[team=Red] armor.chest with chainmail_chestplate{Unbreakable:1,display:{color:11546150},HideFlags:64,Enchantments:[{id:blast_protection,lvl:3}]} 1
item replace entity @s[team=Red] armor.legs with leather_leggings{Unbreakable:1,display:{color:11546150},HideFlags:64,Enchantments:[{id:blast_protection,lvl:3}]} 1
item replace entity @s[team=Red] armor.feet with leather_boots{Unbreakable:1,display:{color:11546150},HideFlags:64} 1
# add weapons
give @s stone_axe{Unbreakable:1}

# add restockables
scoreboard players set @s bomber_bob 0
