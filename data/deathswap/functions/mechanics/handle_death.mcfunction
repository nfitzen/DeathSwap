# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

# function deathswap:mechanics/handle_death
# called as/at: @a[scores={ds.death=1..}], from: ./checks/check_death

execute if entity @s[team=ds.red] run scoreboard players remove Red ds.lives 1
execute if entity @s[team=ds.blue] run scoreboard players remove Blue ds.lives 1

# Respawning

execute if entity @s[team=ds.red] run tp @s @r[team=ds.red]
execute if entity @s[team=ds.blue] run tp @s @r[team=ds.blue]

execute unless data entity @s {"Dimension":"minecraft:overworld"} run spreadplayers ~ ~ 5 15 under 127 false @s
execute if data entity @s {"Dimension":"minecraft:overworld"} run spreadplayers ~ ~ 5 15 false @s

spawnpoint @s ~ ~ ~

scoreboard players set @s ds.death 0
