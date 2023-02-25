clear @s wheat_seeds
execute if block ~ ~ ~ air if block ~ ~-1 ~ dirt run setblock ~ ~ ~ minecraft:wheat[age=7]
execute if block ~ ~-1 ~ dirt run setblock ~ ~-1 ~ minecraft:farmland[moisture=7]