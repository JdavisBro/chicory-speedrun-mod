# Chicory Speedrunning Mod

This is a mod for Chicory with utils for speedrunning the game (and other things also)

## Install

Check [releases](https://github.com/JdavisBro/chicory-speedrun-mod/releases/) and [INSTALL.md](https://github.com/JdavisBro/chicory-speedrun-mod/blob/main/INSTALL.md)

or create from scratch: [BUILDING.md](https://github.com/JdavisBro/chicory-speedrun-mod/blob/main/BUILDING.md)

## Current Features:

- Savestate (kinda)
  - By pressing `pagedown + 0 - 9` you can save the game to a slot and load it by pressing `pageup + the same number`
  - Saving and loading before getting the brush might not work, if that happens, pickup the brush then restart the game.
  - Note: this uses the games regular saving and loading mechanics, for example if you save on the sky you will be put to the nearest ground exactly how loading the game regularly does.
  - Note 2: art, custom clothing, and things like that are not copied with the slots, which can cause visual glitches but probably won't crash or change progress. Timelapses are also not copied and WILL LIKELY crash if you try to view them.
- Pressing home lets you change your custom palette anywhere.

## Planned Features:

- Boss phase skipping/undoing
- Clear a screen's, paint, breakable rocks, and other things like that
- Teleporting
- Configurable Keybinds

## Used Software:

- UndertaleModTool - https://github.com/krzys-h/UndertaleModTool
- xdelta - https://github.com/jmacd/xdelta-gpl
- gamemaker - yoyogame