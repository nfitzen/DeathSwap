# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# function deathswap:mechanics/handle_death
# called as/at: @a[scores={ds.death=1..}], from: ./tick/player_handling/main

execute if entity @s[team=ds.red] run scoreboard players remove Red ds.lives 1
execute if entity @s[team=ds.blue] run scoreboard players remove Blue ds.lives 1

# Respawning

execute if entity @s[team=ds.red] run tp @s @r[team=ds.red]
execute if entity @s[team=ds.blue] run tp @s @r[team=ds.blue]
spreadplayers ~ ~ 5 15 false @s

spawnpoint @s ~ ~ ~

scoreboard players set @s ds.death 0