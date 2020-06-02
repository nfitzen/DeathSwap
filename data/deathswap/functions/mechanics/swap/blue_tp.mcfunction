# ------------------------------------------------------------------------------
# Copyright (C) 2020 Nathaniel Fitzenrider
# This file is a part of DeathSwap.
# DeathSwap is licensed under the terms of the Expat/MIT License.
# See <https://directory.fsf.org/wiki/License:Expat> for details.
# ------------------------------------------------------------------------------

tag @e[tag=ds.tpentity,sort=random,limit=1] add ds.tp_np

tp @e[tag=ds.tpentity,tag=ds.tp_np,limit=1]

kill @e[tag=ds.tp_np]
