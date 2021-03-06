# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

# Blue team is the dominant team -- i.e., they have more players
# $tmp_teamdiff ds.int < 0
# Called by: @a[tag=ds.player,team=,sort=random], from: ./main

execute unless score $tmp_noteam ds.int matches ..0 unless score $tmp_teamdiff ds.int matches 0 run team join ds.red @s
execute unless score $tmp_noteam ds.int matches ..0 unless score $tmp_teamdiff ds.int matches 0 run scoreboard players add $tmp_teamdiff ds.int 1
execute unless score $tmp_noteam ds.int matches ..0 unless score $tmp_teamdiff ds.int matches 0 run scoreboard players remove $tmp_noteam ds.int 1
