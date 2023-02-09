execute at @e[tag=control_point,tag=control_point_a,tag=active] store result score a_red in_range if entity @e[team=Red,distance=..4]
execute at @e[tag=control_point,tag=control_point_a,tag=active] store result score a_blue in_range if entity @e[team=Blue,distance=..4]

execute at @e[tag=control_point,tag=control_point_b,tag=active] store result score b_red in_range if entity @e[team=Red,distance=..4]
execute at @e[tag=control_point,tag=control_point_b,tag=active] store result score b_blue in_range if entity @e[team=Blue,distance=..4]

execute at @e[tag=control_point,tag=control_point_c,tag=active] store result score c_red in_range if entity @e[team=Red,distance=..4]
execute at @e[tag=control_point,tag=control_point_c,tag=active] store result score c_blue in_range if entity @e[team=Blue,distance=..4]