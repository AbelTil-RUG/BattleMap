# make all armor stands with tag map_1 active
function interface:deactivate_map
tag @e[tag=map_1] add active
function interface:activate_map
tellraw @a {"text": "Map 1 loaded."}

