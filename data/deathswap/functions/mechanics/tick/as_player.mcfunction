# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

# function deathswap:mechanics/tick/main
# called as: @a, from: /core/tick, if score $started ds.int matches 1..

# Handles player checks

execute if entity @s[scores={ds.resist_timer=1..}] run function deathswap:mechanics/tick/player_handling/apply_resistance

function deathswap:mechanics/checks/check_win
