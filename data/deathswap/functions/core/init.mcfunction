# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider
#
# SPDX-License-Identifier: MIT

# deathswap:core/init
# Called by: #minecraft:load, deathswap:mechanics/reset

# Create scoreboard variables and set constants
scoreboard objectives add ds.int dummy
scoreboard objectives add ds.const dummy

scoreboard objectives add ds.resist_timer dummy

# Define values n such
function deathswap:core/settings
function deathswap:core/values
scoreboard players set 2 ds.const 2
scoreboard players set 20 ds.const 20

team add ds.red "Red"
team modify ds.red color red
team add ds.blue "Blue"
team modify ds.blue color blue
# Make sure teams can't push each other
team modify ds.red collisionRule pushOtherTeams
team modify ds.blue collisionRule pushOtherTeams

scoreboard players add $rng ds.int 0
scoreboard players add $timer ds.int 0

scoreboard objectives add ds.death deathCount

scoreboard objectives add health health "Health"
scoreboard objectives setdisplay list health

# Add deathswap previous variables, so people can gawk.
scoreboard objectives add ds.prev dummy "Previous swap"

scoreboard objectives add ds.lives dummy "Lives left"

function #deathswap:addons/core/init
