# the bomber class can use explosions in battle

# main weapon: creeper explosion
# secondary weapon: stone sword
# other util: healing and super speed potion
# armour: explosion resistant chain armour (excluding helmet)
# attributes: small jump boost
# ultimate: creeper trident

function kits:clear_kit

tag @s add bomber

# add armour
item replace entity @s armor.feet with chainmail_boots{Unbreakable:1,Enchantments:[{id:blast_protection,lvl:2}]}
item replace entity @s armor.legs with chainmail_leggings{Unbreakable:1,Enchantments:[{id:blast_protection,lvl:2}]}
item replace entity @s armor.chest with chainmail_chestplate{Unbreakable:1,Enchantments:[{id:blast_protection,lvl:2}]}
# add weapons

# add restockables
scoreboard players set @s bomber_bob 0
