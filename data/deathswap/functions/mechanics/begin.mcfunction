# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# function deathswap:mechanics/begin
# called by: server op, from: deathswap:begin

# Apply linear transformations for lives
scoreboard players operation Red ds.lives = $count_red ds.int
scoreboard players operation Red ds.lives *= $LifeFunction.a ds.settings
scoreboard players operation Red ds.lives += $LifeFunction.b ds.settings
scoreboard players operation Blue ds.lives = Red ds.lives

scoreboard players operation $range ds.int = $count_red ds.int
scoreboard players operation $range ds.int *= $range.a ds.settings
scoreboard players operation $range ds.int += $range.b ds.settings

scoreboard players operation $offset ds.int = $count_red ds.int
scoreboard players operation $offset ds.int *= $offset.a ds.settings
scoreboard players operation $offset ds.int += $offset.b ds.settings

# Set players/world back to square one

clear @a[tag=ds.player]
xp set @a[tag=ds.player] 0 levels
xp set @a[tag=ds.player] 0 points
effect give @a[tag=ds.player] minecraft:instant_health 1 20 true
effect give @a[tag=ds.player] minecraft:saturation 1 20 true
time set 0
weather rain 1
gamerule doDaylightCycle true
gamerule doMobSpawning true

scoreboard players reset @a ds.death

advancement revoke @a[tag=ds.player] everything
recipe take @a[tag=ds.player] *

# Spread players 10-15k blocks apart
execute in minecraft:overworld run spreadplayers ~ ~ 10000 15000 true @a[tag=ds.player]

execute as @a at @s run spawnpoint @s ~ ~ ~

gamemode survival @a[tag=ds.player]
gamemode spectator @a[tag=!ds.player]

# Schedule a swap
function deathswap:mechanics/rng
scoreboard players operation $timer ds.int = $rng ds.int

# Let the DeathSwap begin!
scoreboard objectives setdisplay sidebar ds.lives
scoreboard players set $started ds.int 1
