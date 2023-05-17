# Chicory Speedrunning Mod

This is a mod for Chicory with utils for speedrunning the game (and other things also)

## Install

Check [releases](https://github.com/JdavisBro/chicory-speedrun-mod/releases/) and [INSTALL.md](https://github.com/JdavisBro/chicory-speedrun-mod/blob/main/INSTALL.md)

or create from scratch: [BUILDING.md](https://github.com/JdavisBro/chicory-speedrun-mod/blob/main/BUILDING.md)

## Current Features:

- Rebindable controls for features
  - Press END on the title screen, use the directional keys (w and s, or arrow up and down) and confirm button (space) to choose controls, then what you want to modify. Press confirm on the control you want to change then press the buttons you want to set and then the confirm button again. You can close settings by pressing back (ctrl) twice or press END again
- Savestate (kinda)
  - By pressing `pagedown + 0 - 9` you can save the game to a slot and load it by pressing `pageup + the same number`
  - Saving and loading before getting the brush might not work, if that happens, pickup the brush then restart the game.
  - Note: this uses the games regular saving and loading mechanics, for example if you save on the sky you will be put to the nearest ground exactly how loading the game regularly does.
  - Note 2: art, custom clothing, and things like that are not copied with the slots, which can cause visual glitches but probably won't crash or change progress. Timelapses are also not copied and WILL LIKELY crash if you try to view them.
- Teleporting - Pressing / teleports the dog to your cursor
- Chapter Select - Pressing = brings up the chapter select menu (without adding it to the regular pause menu)
- Custom Palette Modifying - Pressing home lets you change your custom palette anywhere. (Note: on first time use you need to save & exit to make brush styles work)
- Clear screen - Press delete to clear most of a screens paint and reset breakable rocks.

## Planned Features:

- Boss phase skipping/undoing

## Used Software:

- UndertaleModTool - https://github.com/krzys-h/UndertaleModTool
- xdelta - https://github.com/jmacd/xdelta-gpl
- gamemaker - yoyogame