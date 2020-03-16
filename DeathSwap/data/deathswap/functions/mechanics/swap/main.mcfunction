tag @a[tag=ds.player,team=ds.red] add ds.swap
tag @a[tag=ds.player,team=ds.blue] add ds.cdt
# (cdt = candidate (for red tp)

# Summon new AoE cloud for tp
execute at @a[tag=ds.swap,tag=ds.player] run summon minecraft:area_effect_cloud ~ ~ ~ {"Radius":0f,"Duration":2147483647,"Tags":["ds.tpentity"]}

# Schedule a new swap.

# Display the time it took to swap
scoreboard players operation $rng ds.prev = $rng ds.int
# Get random tpentity's UUID and divide by 2^32 to truncate to most significant 32 bits.
execute store result score $rng ds.int run data get entity @e[limit=1,sort=random,tag=ds.tpentity] UUIDMost 0.00000000023283064365386962890625
scoreboard players operation $rng ds.int %= $range ds.int
scoreboard players operation $rng ds.int += $offset ds.int
scoreboard players operation $timer ds.int = $rng ds.int

execute as @a[tag=ds.swap,tag=ds.player] at @s run tp @e[tag=ds.tpentity,limit=1,sort=nearest] @s

# Red tp also includes the player display subtitle

execute as @a[tag=ds.player,tag=ds.swap,sort=random] at @s run function deathswap:mechanics/swap/red_tp

execute as @a[tag=ds.player,team=ds.blue,sort=random] at @s run function deathswap:mechanics/swap/blue_tp

tag @a remove ds.swap
tag @a remove ds.cdt

title @a title {"interpret":true,"nbt":"game.message.swap.title","storage":"deathswap:values"}

tellraw @a {"interpret":true,"nbt":"game.message.swap.chat","storage":"deathswap:values"}
