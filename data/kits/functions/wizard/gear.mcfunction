# the wizard class can use potions in battle

# main weapon: harming potion
# secondary weapon: fast weak weapon
# other util: healing potion, super speed potion
# armour: weak standard armour with shield
# attributes:
# ultimate: ???

function kits:clear_kit
tag @s add wizard

# add armour
item replace entity @s armor.feet with leather_boots{Unbreakable:true}
item replace entity @s armor.legs with leather_leggings{Unbreakable:true}
item replace entity @s armor.chest with leather_chestplate{Unbreakable:true}

# add weapons
give @s blaze_rod{Unbreakable:1,AttributeModifiers:[{AttributeName:"generic.attack_damage",Amount:3,Slot:mainhand,Name:"generic.attack_damage",UUID:[I;-12316,27609,20484,-55218]},{AttributeName:"generic.attack_speed",Amount:3,Slot:mainhand,Name:"generic.attack_speed",UUID:[I;-12316,29609,20484,-59218]}],display:{Name:'[{"text":"Magic wand","italic":false}]'},HideFlags:4} 1

# add attributes

# add restockables
scoreboard players set @s wizard_speed_potion 0
scoreboard players set @s wizard_health_potion 0
scoreboard players set @s wizard_damage_potion 0


