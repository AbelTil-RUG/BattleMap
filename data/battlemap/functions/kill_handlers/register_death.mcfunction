execute as @a[tag=in_arena] if predicate battlemap:is_falling run effect give @s instant_damage 1 10
execute as @a[tag=in_arena,scores={died=1..}] run function battlemap:kill_handlers/handle_death