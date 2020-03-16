# DeathSwap 2.0
A Minecraft PVP minigame inspired by SethBling.

## Features
- Supports 2 teams - red and blue
- Customizable swap timer
- A barebones means to hook into the data pack
    - Only has replacing text (for now)

## Usage

### Playing the game
1. Set `gamemode=spectator` in your `server.properties`.
2. Run `tag <player> add ds.player` to add to players.
    - Alternatively, run `tag @a add ds.player`if everyone is gonna be playing
3. Assign players to teams
    - Run `team join red <player>` and `team join blue <player>`
    - The game will randomly assign to a team any players not on a team until both teams are equal
4. **Ensure all teams are equal! The game won't work if not!**
5. Run `function deathswap:begin` to begin!

### Settings
There are various settings you can change before the game.
Currently the settings are for the # of lives and the swap timer.

You can find the default values in the function `deathswap:core/const`.

There's also "values" (bad name) for various things.
You can find those in the function `deathswap:core/values`

## Copyright
So yeah. I know data packs are distributed by default in source format, and the game just reads them, but I'm using GPL anyway.

You can use this program under the terms of the [GPLv3], or, at your option, [any later version][GPLvX]. See https://www.gnu.org/licenses/.

[GPLv3]: https://www.gnu.org/licenses/gpl-3.0
[GPLvX]: https://www.gnu.org/licenses/gpl
