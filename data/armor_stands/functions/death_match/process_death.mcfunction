# if player died, give other team point
execute as @a[team=Blue,scores={died=1..}] run scoreboard players add Red TeamKills 1 
execute as @a[team=Red,scores={died=1..}] run scoreboard players add Blue TeamKills 1 