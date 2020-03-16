# deathswap:mechanics/team_assignment/main
# Called from: deathswap:begin

# Count num. players on each team

scoreboard players set $count_red ds.int 0
scoreboard players set $count_blue ds.int 0
execute store result score $count_red ds.int if entity @a[team=ds.red,tag=ds.player]
execute store result score $count_blue ds.int if entity @a[team=ds.blue,tag=ds.player]

# Randomly assign players to teams

# Count # players without a team
scoreboard players set $tmp_noteam ds.int 0
execute as @a[tag=ds.player,team=] run scoreboard players add $tmp_noteam ds.int 1

scoreboard players operation $tmp_teamdiff ds.int = $count_red ds.int
scoreboard players operation $tmp_teamdiff ds.int -= $count_blue ds.int

# Balance player slots first
execute if score $tmp_teamdiff ds.int matches 1.. as @a[tag=ds.player,sort=random,team=] run function deathswap:mechanics/team_assignment/red
execute if score $tmp_teamdiff ds.int matches ..-1 as @a[tag=ds.player,sort=random,team=] run function deathswap:mechanics/team_assignment/blue

# Assign teams randomly, given that all teams have an equal amount of players.
scoreboard players operation $tmp_noteam ds.int /= 2 ds.const
# deathswap:mechanics/team_assignment/ifeq assigns half of the players to red
execute as @a[tag=ds.player,sort=random,team=] run function deathswap:mechanics/team_assignment/ifeq
team join ds.blue @a[tag=ds.player,team=]

# Reset tmp variables

scoreboard players reset $tmp_noteam ds.int
scoreboard players reset $tmp_teamdiff ds.int

# Set team counts to their proper values

scoreboard players set $count_red ds.int 0
scoreboard players set $count_blue ds.int 0
execute as @a[team=ds.red,tag=ds.player] run scoreboard players add $count_red ds.int 1
execute as @a[team=ds.blue,tag=ds.player] run scoreboard players add $count_blue ds.int 1
