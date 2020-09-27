<!--
  ~ SPDX-FileCopyrightText: 2020 Nathaniel Fitzenrider <https://github.com/nfitzen>
  ~
  ~ SPDX-License-Identifier: MIT
 -->

# DeathSwap
An implementation of the Minecraft PVP minigame by SethBling.

## Features
- Supports 2 teams - red and blue
    - This means you can play with more than 2 players!
- Automatic or manual team assignment
    - Any players not already in a team are assigned to one
- Automatically puts people into spectator when the game begins
    - Doesn't automatically put people who join into spectator. There's an
    easier and faster way to implement this. It's `gamemode=spectator` in
    `server.properties`.
- Customizable swap timer
    - 20-120s by default with 2 players.
- Swap timer automatically scales with the number of players
    - I need your help with playtesting this! I'm unsure what the right values
    are.
- Top tier enterprise development with over-engineered code
    - Oh hey, I'll *totally* hook into the data pack in the future. You never
    know! *Hyuk!*
        - I say this, but wait until you see my [Manhunt datapack].
        That thing's a total hack.

[Manhunt datapack]: https://github.com/nfitzen/MinecraftManhunt

## Usage

### Playing the game (basic)

1. Set `gamemode=spectator` in `server.properties`
2. Run `tag @a add ds.player`
3. Ensure there's an even number of players
4. Run `function deathswap:begin`

### Playing the game (advanced/teams)

1. Set `gamemode=spectator` in server.properties
    - This pack only makes non-players spectator when the game begins. If
    someone joins during the game, they won't be in spectator.
2. Change [settings](#settings) to suit your needs.
2. Run `tag <player> add ds.player`
    - This lets the game know who's a player for random team assignment.
    - "Player" in this document refers to anyone with `tag=ds.player`.
3. Assign teams to players
    - There are 2 teams: `ds.red` and `ds.blue`.
        - Run, e.g., `team join ds.red <player>` to make a player join that
        team.
    - Any players not assigned to a team will be randomly assigned.
4. Ensure teams have an equal number of players
5. Run `function deathswap:begin`

### Settings
There are various settings you can change before the game.
Currently the settings are for the # of lives and the swap timer.

You can find the default values for these settings in the function
`deathswap:core/settings`.
Since these are implemented with scoreboard values instead of world storage, you can't share a settings command.

There are also string values for various things such as translations
and are mostly for data pack developers.

You can find those in the function `deathswap:core/string` and the storage
`deathswap:string`.

## Copyright

DeathSwap is licensed under the [Expat/MIT License](LICENSE).

More copyright and licensing information can be found in individual files
and in [the dep5 file](.reuse/dep5) if an SPDX header isn't found.
