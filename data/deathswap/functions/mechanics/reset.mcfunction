# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

# Reset world
gamerule doDaylightCycle false
time set 0
gamerule doMobSpawning false

scoreboard players reset $ended ds.int
scoreboard players set $started ds.int 0
