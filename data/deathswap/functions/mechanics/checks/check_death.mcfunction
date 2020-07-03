# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

# function deathswap:mechanics/checks/check_death
# called from: advancement deathswap:take_damage

execute if score @s ds.death matches 1.. run function deathswap:mechanics/handle_death

advancement revoke @s only deathswap:take_damage
