tag @e[tag=active] remove active

bossbar set point_a visible false
bossbar set point_b visible false
bossbar set point_c visible false

scoreboard objectives setdisplay sidebar

schedule clear battlemap:display_control_state

function ctf:deactivate_map