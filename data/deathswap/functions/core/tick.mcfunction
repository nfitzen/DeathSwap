# Handle swapping timer
scoreboard players remove $timer ds.int 1
execute if score $started ds.int matches 1 if score $timer ds.int matches ..0 run function deathswap:mechanics/check_swap

# Handle player death
execute as @a[scores={ds.death=1},team=ds.red] run scoreboard players remove Red ds.lives 1
execute as @a[scores={ds.death=1},team=ds.blue] run scoreboard players remove Blue ds.lives 1

# Respawning

execute as @a[team=ds.red,scores={ds.death=1..}] run tp @s @r[team=ds.red]
execute as @a[team=ds.blue,scores={ds.death=1..}] run tp @s @r[team=ds.blue]

execute as @a[scores={ds.death=1..}] at @s run spreadplayers ~ ~ 5 15 false @s


# execute if entity @a[scores={ds.death=1..},tag=ds.player,team=ds.red] at @a[team=ds.red,sort=random] run spreadplayers ~ ~ 5 15 false @a[team=ds.red,scores={ds.death=1..},tag=ds.player]
# execute if entity @a[scores={ds.death=1..},tag=ds.player,team=ds.blue] at @a[team=ds.blue,sort=random] run spreadplayers ~ ~ 5 15 false @a[team=ds.blue,scores={ds.death=1..},tag=ds.player]

execute as @a[tag=ds.player,scores={ds.death=1..}] at @s run spawnpoint @s ~ ~ ~

scoreboard players reset @a[scores={ds.death=1..}] ds.death

# scoreboard players add @a[scores={ds.death=1..}] ds.death 1

# Apply resistance

execute if score $resistanceTimer ds.int matches 20.. run effect give @a[tag=ds.player] minecraft:resistance 1 127 false
scoreboard players remove $resistanceTimer ds.int 1


# Handle wins in normal cases (see mechanics/check_swap for if a player DCs)

execute store success score $ended ds.int if score $started ds.int matches 1 if score Red ds.lives matches ..0 if score Red ds.lives = Blue ds.lives run title @a title {"interpret":true,"nbt":"game.message.win.tie","storage":"deathswap:values"}

execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score $started ds.int matches 1 if score Red ds.lives matches ..0 if score Red ds.lives < Blue ds.lives run title @a title {"interpret":true,"nbt":"game.message.win.blue","storage":"deathswap:values"}
execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score $started ds.int matches 1 if score Blue ds.lives matches ..0 if score Blue ds.lives < Red ds.lives run title @a title {"interpret":true,"nbt":"game.message.win.red","storage":"deathswap:values"}

execute if score $ended ds.int matches 1.. unless score Red ds.lives = Blue ds.lives run title @a subtitle {"interpret":true,"nbt":"game.message.win.subtitle","storage":"deathswap:values"}
execute if score $ended ds.int matches 1.. run function deathswap:mechanics/reset

function #deathswap:addons/core/tick
