# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# Tally # of players on each team
scoreboard players set $tmp_count_red ds.int 0
scoreboard players set $tmp_count_blue ds.int 0
execute as @a[team=ds.red,tag=ds.player] run scoreboard players add $tmp_count_red ds.int 1
execute as @a[team=ds.blue,tag=ds.player] run scoreboard players add $tmp_count_blue ds.int 1

# Ties

execute store success score $ended ds.int if score $tmp_count_red ds.int = $tmp_count_blue ds.int unless score $tmp_count_red ds.int = $count_red ds.int unless score $tmp_count_blue ds.int = $count_blue ds.int run title @a title {"interpret":true,"nbt":"game.message.win.tie","storage":"deathswap:values"}

# Handle wins by default

execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score $tmp_count_red ds.int < $tmp_count_blue ds.int run title @a title {"interpret":true,"nbt":"game.message.win.blue","storage":"deathswap:values"}
execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score $tmp_count_blue ds.int < $tmp_count_red ds.int run title @a title {"interpret":true,"nbt":"game.message.win.red","storage":"deathswap:values"}

execute if score $ended ds.int matches 1.. unless score $tmp_count_red ds.int = $tmp_count_blue ds.int run title @a subtitle {"interpret":true,"nbt":"game.message.win.subtitle","storage":"deathswap:values"}

execute if score $ended ds.int matches 1.. run function deathswap:mechanics/reset

execute if score Red ds.lives matches 1.. if score Blue ds.lives matches 1.. if score $tmp_count_red ds.int = $tmp_count_blue ds.int run function deathswap:mechanics/swap/main
