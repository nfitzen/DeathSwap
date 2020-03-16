# function deathswap:mechanics/begin
# called by: server op, from: deathswap:begin

# Apply linear transformations for lives
scoreboard players operation Red ds.lives = $count_red ds.int
scoreboard players operation Red ds.lives *= $LifeFunction.a ds.int
scoreboard players operation Red ds.lives += $LifeFunction.b ds.int
scoreboard players operation Blue ds.lives = Red ds.lives

scoreboard players operation $range ds.int = $count_red ds.int
scoreboard players operation $range ds.int *= $range.a ds.int
scoreboard players operation $range ds.int += $range.b ds.int

scoreboard players operation $offset ds.int = $count_red ds.int
scoreboard players operation $offset ds.int *= $offset.a ds.int
scoreboard players operation $offset ds.int += $offset.b ds.int

# Set players/world back to square one

clear @a[tag=ds.player]
xp set @a[tag=ds.player] 0 levels
xp set @a[tag=ds.player] 0 points
effect give @a[tag=ds.player] minecraft:instant_health 1 20 true
effect give @a[tag=ds.player] minecraft:saturation 1 20 true
time set 0
weather rain 1
gamerule doDaylightCycle true
gamerule doMobSpawning true

scoreboard players reset @a ds.death

advancement revoke @a[tag=ds.player] everything
recipe take @a[tag=ds.player] *

# Spread players 10-15k blocks apart
execute in minecraft:overworld run spreadplayers ~ ~ 10000 15000 true @a[tag=ds.player]

execute as @a at @s run spawnpoint @s ~ ~ ~

gamemode survival @a[tag=ds.player]
gamemode spectator @a[tag=!ds.player]

# Schedule a swap
summon minecraft:area_effect_cloud ~ ~ ~ {"Radius":0f,"Duration":2147483647,"Tags":["ds.rng"]}
execute store result score $rng ds.int run data get entity @e[limit=1,sort=random,tag=ds.rng] UUIDMost 0.00000000023283064365386962890625
scoreboard players operation $timer ds.int = $rng ds.int
kill @e[tag=ds.rng]

# Let the DeathSwap begin!
scoreboard objectives setdisplay sidebar ds.lives
scoreboard players set $started ds.int 1