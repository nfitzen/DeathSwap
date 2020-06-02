# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

tag @r[team=ds.blue,tag=ds.player,tag=ds.cdt] add ds.tp_p

tp @p[tag=ds.tp_p]

tag @p[tag=ds.tp_p] remove ds.cdt

tag @p[tag=ds.tp_p] remove ds.tp_p
