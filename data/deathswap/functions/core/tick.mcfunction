# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

# function deathswap:core/tick
# called from: #minecraft:tick

# Handle swapping timer
scoreboard players remove $timer ds.int 1
execute if score $started ds.int matches 1 if score $timer ds.int matches ..0 run function deathswap:mechanics/checks/check_swap

# Wrapper for this function
execute as @a if score $started ds.int matches 1 run function deathswap:mechanics/tick/as_player

function #deathswap:addons/core/tick
