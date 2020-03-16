title @a title {"text":"Swap commencing!","color":"light_purple"}

tellraw @a {"text":"Swap commencing!","color":"light_purple"}

tag @r[tag=player] add swap

# Summon new Zombie for tp (Zombie is summoned bc PersistenceRequired tag isn't on Armor Stands)
execute at @a[tag=swap,tag=player] run summon minecraft:zombie ~ ~ ~ {NoAI:1b,Tags:["tpentity"],Team:"noCollision",ActiveEffects:[{Duration:60,Id:14b,Amplifier:0b,ShowParticles:0b}]}

tp @e[type=zombie,tag=tpentity,limit=1] @r[tag=swap,tag=player,limit=1]

tp @a[tag=swap,tag=player,limit=1] @a[tag=!swap,tag=player,limit=1]
tp @a[tag=!swap,tag=player,limit=1] @e[type=minecraft:zombie,tag=tpentity,limit=1]

tp @e[type=minecraft:zombie,tag=tpentity] ~ -300 ~

tag @a remove swap

# Display the time it took to swap
scoreboard players operation rng prevVars = rng ds_int

function deathswap:mechanics/schedule_swap