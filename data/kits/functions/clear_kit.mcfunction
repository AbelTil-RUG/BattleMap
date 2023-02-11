# clear all items
clear @s #kits:kit_items

# clear effects
effect clear @s
experience add @s -40 levels

# clear all kits
tag @s remove wizard
tag @s remove tank
tag @s remove bomber
tag @s remove archer
tag @s remove scout

# clear all restockables
scoreboard players reset @s archer_arrow
scoreboard players reset @s bomber_bob
scoreboard players reset @s wizard_damage_potion
scoreboard players reset @s wizard_health_potion
scoreboard players reset @s wizard_speed_potion
scoreboard players reset @s scout_ult_timer

# clear all generic schedules

# clear all attributes
attribute @s generic.knockback_resistance base set 0
attribute @s generic.movement_speed base set 0.10
attribute @s generic.max_health base set 20

effect give @s instant_health 1 20 true

