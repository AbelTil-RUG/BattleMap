# make all armor stands with tag map_2 active
function interface:deactivate_map
tag @e[tag=map_3] add active
function interface:activate_map
tellraw @a {"text": "Map 3 loaded."}