# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

# deathswap:core/const
# Called from: deathswap:core/init

#>
# @public
scoreboard objectives add ds.settings dummy

#> y = ax + b, where x is the # of players *on each team*. y is the variable.
#  LifeFunction determines # of lives
# @public
    scoreboard players set $LifeFunction.a ds.settings 1
    scoreboard players set $LifeFunction.b ds.settings 0

#> Range is the modulus. By default it's 2001, which is 100.05s.
#  You need to add 1 because it's being used as a modulus.
#  Thus, RNG % range = a number from 0-2000.
# @public
    scoreboard players set $range.a ds.settings 20
    scoreboard players set $range.b ds.settings 1881

#> Offset is added to the stuff after range.
#  a number between 0-2000 + offset = final RNG int.
# @public
    scoreboard players set $offset.a ds.settings 5
    scoreboard players set $offset.b ds.settings 395

#> Resistance timer
# @public
    scoreboard players set $resistanceTime ds.settings 100
