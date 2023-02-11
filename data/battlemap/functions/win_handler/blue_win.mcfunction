title @a title {"text":"Blue team wins!","bold":true,"color":"blue"}
execute as @a[team=Blue] at @s run playsound minecraft:ui.toast.challenge_complete player @s
execute as @a[team=Red] at @s run playsound minecraft:entity.villager.no player @s
function battlemap:win_handler/end_game
