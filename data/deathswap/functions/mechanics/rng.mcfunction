# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

# function deathswap:mechanics/rng
# called by: server op, from: /mechanics/begin OR
# from: /mechanics/swap/main

execute unless entity @e[tag=ds.rng] run summon minecraft:area_effect_cloud ~ ~ ~ {"Radius":0f,"Duration":2147483647,"Tags":["ds.rng","ds.rng.tmp"]}
execute store result score $rng ds.int run data get entity @e[tag=ds.rng,limit=1,sort=random] UUID[0]
kill @e[tag=ds.rng.tmp]
scoreboard players operation $rng ds.int %= $range ds.int
scoreboard players operation $rng ds.int += $offset ds.int
