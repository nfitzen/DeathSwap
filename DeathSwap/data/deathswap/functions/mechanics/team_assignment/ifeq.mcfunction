# deathswap:mechanics/team_assignment/main
# Called by: @a[team=,tag=ds.player,sort=random], from: ./main

# Both teams are equal; randomly assign players to red

execute if score $tmp_noteam ds.int matches 1.. run team join ds.red @s
scoreboard players remove $tmp_noteam ds.int 1