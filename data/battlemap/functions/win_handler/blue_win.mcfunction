title @a title {"text":"Blue team wins!","bold":true,"color":"blue"}
playsound minecraft:ui.toast.challenge_complete player @a[team=Blue]
playsound minecraft:entity.villager.no player @a[team=Red]
function battlemap:win_handler/end_game
