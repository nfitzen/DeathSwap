# DeathSwap
A Minecraft PVP minigame inspired by SethBling.

## Features
- Supports 2 teams - red and blue
- Customizable swap timer
- A barebones means to hook into the data pack
    - Only has replacing text (for now... hopefully)

## Usage

### Playing the game
1. Set `gamemode=spectator` in your `server.properties`.
2. Run `tag <player> add ds.player` to add to players.
    - Alternatively, run `tag @a add ds.player`if everyone is gonna be playing.
3. Assign players to teams
    - Run `team join red <player>` and `team join blue <player>`
    - The game will randomly assign any players not on a team
4. **Ensure all teams are equal! The game won't work if not!**
5. Run `function deathswap:begin` to begin!

### Playing the game (2 players)
This section is just an extension of [§ Playing the game](#playing-the-game) incorporating the random team assignments
1. Do steps 1-2 from [above](#playing-the-game)
    - Probably `tag @a add ds.player`
2. Run `function deathswap:begin`

### Settings
There are various settings you can change before the game.
Currently the settings are for the # of lives and the swap timer.

You can find the default values for these settings in the function `deathswap:core/settings`.

There are also "values" (bad name) for various things such as translations.
These are mostly for data pack developers.

You can find those in the function `deathswap:core/values`
and the storage `deathswap:values`.
