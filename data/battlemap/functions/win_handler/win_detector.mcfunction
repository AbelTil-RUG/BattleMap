## Control Point
execute if entity @e[tag=active,tag=control_point] if score Blue tickets matches ..0 run function battlemap:win_handler/blue_win
execute if entity @e[tag=active,tag=control_point] if score Red tickets matches ..0 run function battlemap:win_handler/red_win

## Death Match
execute if entity @e[tag=active,tag=death_match] if score Blue DeathMatchKills >= required_kills settings run function battlemap:win_handler/blue_win
execute if entity @e[tag=active,tag=death_match] if score Red DeathMatchKills >= required_kills settings run function battlemap:win_handler/red_win

