execute if entity @e[tag=active,tag=ctf_base] if score Blue FlagsCaptured >= required_flags_captured settings run function battlemap:win_handler/blue_win
execute if entity @e[tag=active,tag=ctf_base] if score Red FlagsCaptured >= required_flags_captured settings run function battlemap:win_handler/red_win