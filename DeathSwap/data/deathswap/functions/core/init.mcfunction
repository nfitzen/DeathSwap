gamerule doDaylightCycle false
time set 0
gamerule doMobSpawning false

# Create scoreboard variables/teams
scoreboard objectives add ds_int dummy "DS Misc. Dummy Variables"
scoreboard players add rng ds_int 0
team add noCollision
team modify noCollision collisionRule never

scoreboard objectives add ds_death deathCount "DS Deaths"

scoreboard objectives add health health "Health"
scoreboard objectives setdisplay list health

# Add deathswap previous variables, so people can gawk.
scoreboard objectives add prevVars dummy "Previous swap"