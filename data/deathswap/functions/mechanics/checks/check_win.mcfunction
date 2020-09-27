# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

# Handle wins in normal cases (see mechanics/check_swap for if a player DCs)

execute store success score $ended ds.int if score Red ds.lives matches ..0 if score Red ds.lives = Blue ds.lives run title @s title {"interpret":true,"nbt":"game.message.win.tie","storage":"deathswap:string"}

execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score Red ds.lives matches ..0 if score Red ds.lives < Blue ds.lives run title @s title {"interpret":true,"nbt":"game.message.win.blue","storage":"deathswap:string"}
execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score Blue ds.lives matches ..0 if score Blue ds.lives < Red ds.lives run title @s title {"interpret":true,"nbt":"game.message.win.red","storage":"deathswap:string"}

execute if score $ended ds.int matches 1.. unless score Red ds.lives = Blue ds.lives run title @s subtitle {"interpret":true,"nbt":"game.message.win.subtitle","storage":"deathswap:string"}
execute if score $ended ds.int matches 1.. run function deathswap:mechanics/reset
