# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# function deathswap:mechanics/tick/main
# called as: @a, from: /core/tick, if score $started ds.int matches 1..

# Handles player checks

execute at @s[scores={ds.death=1..}] run function deathswap:mechanics/handle_death

execute if entity @s[scores={ds.resist_timer=1..}] run function deathswap:mechanics/tick/player_handling/apply_resistance

function deathswap:mechanics/checks/check_win
