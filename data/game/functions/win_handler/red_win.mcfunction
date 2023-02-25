title @a title {"text":"Red team wins!","bold":true,"color":"red"}
execute as @a[team=Red] at @s run playsound minecraft:ui.toast.challenge_complete player @s
execute as @a[team=Blue] at @s run playsound minecraft:entity.villager.no player @s
function game:win_handler/end_game
