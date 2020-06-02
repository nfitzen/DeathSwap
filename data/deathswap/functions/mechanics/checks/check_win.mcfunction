# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# function deathswap:mechanics/checks/check_win
# called as: @a, from: /mechanics/tick/main


# Handle wins in normal cases (see mechanics/check_swap for if a player DCs)

execute store success score $ended ds.int if score Red ds.lives matches ..0 if score Red ds.lives = Blue ds.lives run title @s title {"interpret":true,"nbt":"game.message.win.tie","storage":"deathswap:values"}

execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score Red ds.lives matches ..0 if score Red ds.lives < Blue ds.lives run title @s title {"interpret":true,"nbt":"game.message.win.blue","storage":"deathswap:values"}
execute unless score $ended ds.int matches 1.. store success score $ended ds.int if score Blue ds.lives matches ..0 if score Blue ds.lives < Red ds.lives run title @s title {"interpret":true,"nbt":"game.message.win.red","storage":"deathswap:values"}

execute if score $ended ds.int matches 1.. unless score Red ds.lives = Blue ds.lives run title @s subtitle {"interpret":true,"nbt":"game.message.win.subtitle","storage":"deathswap:values"}
execute if score $ended ds.int matches 1.. run function deathswap:mechanics/reset
