# clear all items
clear @s #kits:kit_items

# clear effects
effect clear @s
effect give @a saturation 1000000 1 true
experience add @s -5 levels

# clear all kits
tag @s remove wizard
tag @s remove tank
tag @s remove bomber
tag @s remove archer
tag @s remove scout
tag @s remove sniper

# clear all restockables
scoreboard players reset @s archer_arrow_used
scoreboard players reset @s archer_arrow
scoreboard players reset @s bomber_bob_used
scoreboard players reset @s bomber_bob
scoreboard players reset @s wizard_damage_potion
scoreboard players reset @s wizard_health_potion
scoreboard players reset @s wizard_speed_potion
scoreboard players reset @s sniper_carrot_used
scoreboard players reset @s sniper_carrot
scoreboard players reset @s sniper_fungus_used
scoreboard players reset @s sniper_fungus

# clear all attributes
attribute @s generic.knockback_resistance base set 0
attribute @s generic.movement_speed base set 0.10
attribute @s generic.max_health base set 20

effect give @s instant_health 1 20 true

