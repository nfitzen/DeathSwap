# DeathSwap swap schedule generation
# By nfitzen (nathaniel.fitzenrider.com)

import json

mn = int(input('Minimum time (seconds): '))

mx = int(input('Maximum time (seconds): '))

with open('DeathSwap/data/deathswap/functions/mechanics/schedule_swap.mcfunction', 'w') as f:
    init = """execute store result score rng ds_int run loot spawn ~ ~ ~ loot deathswap:rng

# Generated this aggravatingly long thing with a Python script don't do this manually please

"""
    f.write(init + '\n'.join('execute if score rng ds_int matches %d run schedule function deathswap:mechanics/check_swap %ds' % (i,i) for i in range(mn,mx+1)))

with open('DeathSwap/data/deathswap/loot_tables/rng.json', 'r+') as f:
    table = json.load(f)
    table['pools'][0]['rolls'] = {'min': mn, 'max': mx}
    f.seek(0)
    json.dump(table, f, indent=4)
    f.truncate()
