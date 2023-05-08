# Installation:

First get the version of the mod for the version of the game you want: [releases](https://github.com/JdavisBro/chicory-speedrun-mod/releases/)

(Version .50 and .55 currently available)

Download the mac version of Chicory: ---> (this is required even for windows) <---

Open steam console by pressing ctrl + r and typing `steam://open/console`

In steam console paste the command for the version you need:

- .50 - `download_depot 1123450 1123452 6113710901506258771`
- .55 - `download_depot 1123450 1123452 1811707737243329344`

Rename and move the resources folder from that download, I'll call this the Game folder. This is usually at `C:\Program Files (x86)\Steam\steamapps\content\app_1123450\depot_1123452\Mac\Chicory_A_Colorful_Tale.app\Contents\Resources` for a regular steam installation.

Move the speedrun-mod folder into the game folder and go inside it.

- Optional: Copy Controls and Settings from regular Chicory by running CopySettings.bat (note: controls may not work)
<details>
<summary>Optional: Hiding Music Files</summary>

- To make the game folder easier to navigate you can run the HideAudioFiles.bat script found inside the speedrun-mod folder
- If you want to make audio files visible again, you can turn on hidden files (File Explorer > View > Show > Hidden Files), select all (ctrl+a), right click > properties, and turn on hidden

</details>
&nbsp;

Now run Patch.bat.

Installation complete! To run the mod go back to your game folder and run RunSpeedrunMod.bat

To update, move the new chicory-speedrun-mod folder into the game folder and run Patch.bat again.