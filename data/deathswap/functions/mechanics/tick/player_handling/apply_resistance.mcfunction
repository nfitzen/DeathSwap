# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# function deathswap:mechanics/tick/player_handling/apply_resistance
# called by: @a[scores={ds.resist_timer=1..}], from: ./main

effect give @s[scores={ds.resist_timer=20..}] minecraft:resistance 1 127 false
scoreboard players remove @s ds.resist_timer 1
