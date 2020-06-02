# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

# Reset world
gamerule doDaylightCycle false
time set 0
gamerule doMobSpawning false

scoreboard players reset $ended ds.int
scoreboard players set $started ds.int 0
