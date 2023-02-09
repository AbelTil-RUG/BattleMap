# if a person is falling out of the map
execute as @a[tag=in_arena] if predicate battlemap:is_falling run function battlemap:tick_handlers/fall_handler

# if a person is kileld
execute as @a[scores={died=1..}] run function battlemap:to_lobby

# kill all items and arrows
kill @e[type=arrow,nbt={inGround:true}]
kill @e[type=minecraft:item,tag=!do_not_kill]





# allow any user to tp to the arena by using /trigger to_arena
scoreboard players enable @a to_arena
execute as @a[scores={to_arena=1..}] run function battlemap:to_arena
scoreboard players set @a to_arena 0