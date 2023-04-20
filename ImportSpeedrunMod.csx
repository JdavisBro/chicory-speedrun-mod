// Modified from this -> https://github.com/krzys-h/UndertaleModTool/blob/master/UndertaleModTool/Scripts/Resource%20Repackers/ImportGML.csx

using System;
using System.IO;
using System.Threading.Tasks;
using System.Linq;
using UndertaleModLib.Util;

// Change save folder and window title
ScriptMessage(Data.GeneralInfo.FileName.Content);
Data.GeneralInfo.FileName.Content = "paintdog-speedrun";
Data.GeneralInfo.Name.Content = "paintdog-speedrun";
Data.GeneralInfo.DisplayName.Content = "Chicory_A_Speedrunning_Mod";

string importFolder = Path.GetFullPath("Code/");

string[] dirFiles = Directory.GetFiles(importFolder);

SyncBinding("Strings, Code, CodeLocals, Scripts, GlobalInitScripts, GameObjects, Functions, Variables", true);
await Task.Run(() => {
    foreach (string file in dirFiles)
    {
        ScriptMessage(file);
        ImportGMLFile(file, true, false, true);
    }
});
DisableAllSyncBindings();

ScriptMessage("All files successfully imported.");