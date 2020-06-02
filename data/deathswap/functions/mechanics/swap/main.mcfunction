# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

tag @a[tag=ds.player,team=ds.red] add ds.swap
tag @a[tag=ds.player,team=ds.blue] add ds.cdt
# (cdt = candidate (for red tp)

# Summon new AoE cloud for tp
execute at @a[tag=ds.swap,tag=ds.player] run summon minecraft:area_effect_cloud ~ ~ ~ {"Radius":0f,"Duration":2147483647,"Tags":["ds.tpentity","ds.rng"]}

# Schedule a new swap.

# Display the time it took to swap
scoreboard players operation $rng ds.prev = $rng ds.int
scoreboard players operation $rng_s ds.prev = $rng ds.prev
scoreboard players operation $rng_s ds.prev /= 20 ds.const
function deathswap:mechanics/rng
scoreboard players operation $timer ds.int = $rng ds.int

execute as @a[tag=ds.swap,tag=ds.player] at @s run tp @e[tag=ds.tpentity,limit=1,sort=nearest] @s

# Red tp also includes the player display subtitle

execute as @a[tag=ds.player,tag=ds.swap,sort=random] at @s run function deathswap:mechanics/swap/red_tp

execute as @a[tag=ds.player,team=ds.blue,sort=random] at @s run function deathswap:mechanics/swap/blue_tp

tag @a remove ds.swap
tag @a remove ds.cdt

# Just in case
kill @e[tag=ds.tpentity]

scoreboard players operation @a[tag=ds.player] ds.resist_timer = $resistanceTime ds.settings

effect give @a[tag=ds.player] minecraft:resistance 1 127

title @a title {"interpret":true,"nbt":"game.message.swap.title","storage":"deathswap:values"}

tellraw @a {"interpret":true,"nbt":"game.message.swap.chat","storage":"deathswap:values"}
