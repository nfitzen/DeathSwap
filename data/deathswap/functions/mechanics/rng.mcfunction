# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# function deathswap:mechanics/rng
# called by: server op, from: /mechanics/begin OR
# from: /mechanics/swap/main

execute unless entity @e[tag=ds.rng] run summon minecraft:area_effect_cloud ~ ~ ~ {"Radius":0f,"Duration":2147483647,"Tags":["ds.rng","ds.rng.tmp"]}
# Get entity's UUIDMost and divide by 2^32 to truncate to most significant 32 bits.
execute store result score $rng ds.int run data get entity @e[tag=ds.rng,limit=1,sort=random] UUIDMost 0.00000000023283064365386962890625
kill @e[tag=ds.rng.tmp]
scoreboard players operation $rng ds.int %= $range ds.int
scoreboard players operation $rng ds.int += $offset ds.int
