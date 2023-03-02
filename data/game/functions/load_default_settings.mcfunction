scoreboard objectives add general_settings dummy

execute unless score do_overwrite general_settings matches 0 run scoreboard players set do_overwrite general_settings 1
execute unless score do_overwrite general_settings matches 0 run scoreboard players set death_time general_settings 100
execute unless score do_overwrite general_settings matches 0 run function interface:default_settings


