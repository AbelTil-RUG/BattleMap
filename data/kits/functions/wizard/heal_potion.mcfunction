item replace entity @a[tag=wizard,tag=in_arena,scores={wizard_health_potion=0},nbt=!{Inventory:[{id:"minecraft:splash_potion",tag:{Tags:["health_potion"]}}]}] hotbar.2 with splash_potion{CustomPotionColor:15536973,Tags:["health_potion"],display:{Name:'[{"text":"Wizards Health Potion","italic":false}]',Lore:['[{"text":"Of course you prioritize your team."}]']},HideFlags:32,CustomPotionEffects:[{Id:10,Amplifier:2,Duration:120,ShowParticles:0b,ShowIcon:0b}]} 1
scoreboard players operation @a[tag=wizard,tag=in_arena,scores={wizard_health_potion=..0}] wizard_health_potion = health_potion_cooldown settings
execute as @a[tag=wizard,tag=in_arena,nbt=!{Inventory:[{id:"minecraft:splash_potion",tag:{Tags:["health_potion"]}}]}] run scoreboard players remove @s wizard_health_potion 1
