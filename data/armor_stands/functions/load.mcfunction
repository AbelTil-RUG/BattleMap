# Generic
team add armor_stand

team add Blue
team modify Blue color aqua 
team modify Blue friendlyFire false

team add Red
team modify Red color red 
team modify Red friendlyFire false

# Mana well
function armor_stands:mana_well/mana_spawn

# Control Points
scoreboard objectives add in_range dummy
scoreboard objectives add cap_state dummy
scoreboard objectives add tickets dummy

