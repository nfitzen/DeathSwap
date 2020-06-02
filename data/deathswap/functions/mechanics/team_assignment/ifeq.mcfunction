# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# deathswap:mechanics/team_assignment/main
# Called by: @a[team=,tag=ds.player,sort=random], from: ./main

# Both teams are equal; randomly assign players to red

execute if score $tmp_noteam ds.int matches 1.. run team join ds.red @s
scoreboard players remove $tmp_noteam ds.int 1
