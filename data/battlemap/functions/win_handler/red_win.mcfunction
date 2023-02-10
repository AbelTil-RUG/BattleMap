title @a title {"text":"Red team wins!","bold":true,"color":"red"}
playsound minecraft:ui.toast.challenge_complete player @a[team=Red]
playsound minecraft:entity.villager.no player @a[team=Blue]
function battlemap:win_handler/end_game
