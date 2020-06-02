# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

# function deathswap:begin
# called by: server op
# Wrapper for deathswap:mechanics/begin with some extra cleanup and stuff
# Also checks for team imbalance

tag @a[team=ds.red] add ds.player
tag @a[team=ds.blue] add ds.player

function deathswap:mechanics/team_assignment/main

execute if score $count_red ds.int = $count_blue ds.int run function deathswap:mechanics/begin

execute if score $count_red ds.int = $count_blue ds.int run title @a subtitle {"interpret":true,"nbt":"game.message.begin.subtitle","storage":"deathswap:values"}
execute if score $count_red ds.int = $count_blue ds.int run title @a title {"interpret":true,"nbt":"game.message.begin.title","storage":"deathswap:values"}

execute unless score $count_red ds.int = $count_blue ds.int run tellraw @s {"interpret":true,"nbt":"game.message.begin.imbalance","storage":"deathswap:values"}
