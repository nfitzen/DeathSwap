# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

# deathswap:core/values
# Called from: deathswap:core/init

#>
# @public
#declare storage deathswap:string

data remove storage deathswap:string game

# Set messages
data modify storage deathswap:string game.message.begin.imbalance set value '{"text":"Teams are unbalanced!","color":"red"}'
data modify storage deathswap:string game.message.begin.title set value '{"text":"DeathSwap"}'
data modify storage deathswap:string game.message.begin.subtitle set value '{"text":"has begun!"}'

data modify storage deathswap:string game.message.win.blue set value '{"text":"Blue","color":"blue"}'
data modify storage deathswap:string game.message.win.red set value '{"text":"Red","color":"red"}'
data modify storage deathswap:string game.message.win.tie set value '{"text":"Tie."}'
data modify storage deathswap:string game.message.win.subtitle set value '{"text":"wins!"}'

data modify storage deathswap:string game.message.swap.chat set value '{"text":"Swapping...","color":"light_purple"}'
data modify storage deathswap:string game.message.swap.title set value '{"text":"Swapping...","color":"light_purple"}'
