# SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
#
# SPDX-License-Identifier: MIT

tag @e[tag=ds.tpentity,sort=random,limit=1] add ds.tp_np

tp @e[tag=ds.tpentity,tag=ds.tp_np,limit=1]

kill @e[tag=ds.tp_np]
