execute as @s[tag=shrinked] run attribute @s scale base set 1
execute as @s[tag=shrinked] run return run tag @s remove shrinked
execute if score @s shrink matches 1 run attribute @s scale base set 0.45
execute if score @s shrink matches 2..24 run tellraw @s {text:"Scale has a limit of 25 to 100!",color:"red"}
execute if score @s shrink matches 2..24 run scoreboard players set @s shrink 25
execute if score @s shrink matches 101.. run tellraw @s {text:"Scale has a limit of 25 to 100!",color:"red"}
execute if score @s shrink matches 101.. run scoreboard players set @s shrink 100
execute unless score @s shrink matches 1 store result storage temp shrink_value double 0.01 run scoreboard players get @s shrink
execute unless score @s shrink matches 1 run function code:trigger/shrink.macro with storage temp
execute unless score @s shrink matches 1 run data remove storage temp shrink_value
tag @s add shrinked
tellraw @s[scores={settings.chat_notifications=0}] [{"text":"\u2139 You can unshrink by using ","color": "yellow"},{"text":"/trigger shrink","underlined": true,"click_event": {"action": "run_command","command": "/trigger shrink"},"color": "white"},{"text": " again","color": "yellow"}]