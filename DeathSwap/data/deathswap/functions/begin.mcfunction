# Set players back to square one

clear @a
xp set @a 0 levels
xp set @a 0 points
effect give @a minecraft:instant_health 1 20 true
effect give @a minecraft:saturation 1 20 true
time set 0
weather rain 1
gamerule doDaylightCycle true
gamerule doMobSpawning true

advancement revoke @a everything

scoreboard players reset @a ds_death

# ID the players (go in adventure mode to qualify -- 2 players MAXIMUM!)
tag @p[gamemode=adventure] add player
tag @p[gamemode=adventure,tag=!player] add player

# Spread players 5-10k blocks apart
spreadplayers ~ ~ 5000 10000 false @a[tag=player]

gamemode survival @a[tag=player]
gamemode spectator @a[tag=!player]

# Remove collision so that people don't push each other

team join noCollision @a[tag=player]

# Schedule a swap

function deathswap:mechanics/schedule_swap