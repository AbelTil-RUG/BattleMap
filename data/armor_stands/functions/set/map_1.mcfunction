function armor_stands:set/remove_map
tag @e[type=armor_stand,distance=..50] remove unselected
tag @e[type=armor_stand,distance=..50,tag=!lobby] add map_1