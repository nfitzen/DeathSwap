# deathswap:core/const
# Called from: deathswap:core/init

# y = ax + b, where x is the # of players *on each team*. y is the variable.

# LifeFunction determines # of lives
scoreboard players set $LifeFunction.a ds.int 1
scoreboard players set $LifeFunction.b ds.int 0

# Range is the modulus. By default it's 2001, which is 100.05s.
# You need to add 1 because it's being used as a modulus.
# Thus, RNG % range = a number from 0-2000.
scoreboard players set $range.a ds.int 20
scoreboard players set $range.b ds.int 1881

# Offset is added to the stuff after range.
# a number between 0-2000 + offset = final RNG int.
scoreboard players set $offset.a ds.int 5
scoreboard players set $offset.b ds.int 395
