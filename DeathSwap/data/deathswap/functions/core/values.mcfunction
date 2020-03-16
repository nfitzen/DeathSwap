# deathswap:core/values
# Called from: deathswap:core/init

data remove storage deathswap:values game

# Set messages
data modify storage deathswap:values game.message.begin.imbalance set value '{"text":"Teams are unbalanced!","color":"red"}'
data modify storage deathswap:values game.message.begin.title set value '{"text":"DeathSwap"}'
data modify storage deathswap:values game.message.begin.subtitle set value '{"text":"has begun!"}'

data modify storage deathswap:values game.message.win.blue set value '{"text":"Blue","color":"blue"}'
data modify storage deathswap:values game.message.win.red set value '{"text":"Red","color":"red"}'
data modify storage deathswap:values game.message.win.tie set value '{"text":"Tie."}'
data modify storage deathswap:values game.message.win.subtitle set value '{"text":"wins!"}'

data modify storage deathswap:values game.message.swap.chat set value '{"text":"Swapping...","color":"light_purple"}'
data modify storage deathswap:values game.message.swap.title set value '{"text":"Swapping...","color":"light_purple"}'
