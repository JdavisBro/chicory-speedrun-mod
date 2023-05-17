@echo off
set ver="55"
set /p ver="Chicory Game Version: C."
set cpath=Chicory\C.%ver%\

if not exist %cpath% (goto noChicory)
if not exist %cpath%\data.win (goto noDatawin)

set packdir="Packs\C.%ver%"
@echo on
mkdir "Packs"
rmdir /s /Q %packdir%
mkdir %packdir%
mkdir %packdir%\speedrun-mod
InstallScripts\xdelta3.exe -e -s %cpath%\data.win %cpath%\speedrun.win %packdir%\speedrun-mod\patch.xdelta
copy InstallScripts\* %packdir%\speedrun-mod\
if exist InstallTxt\%ver%.txt (
    copy InstallTxt\%ver%.txt %packdir%\INSTALL.txt
) else (
    copy InstallTxt\generic.txt %packdir%\INSTALL.txt
)
copy VERSION.txt %packdir%\VERSION.txt
pause
exit

:noChicory
echo Chicory Installation for Version %ver% not found. Make sure it's in the directory %cpath%
exit

:noDatawin
echo data.win not found in %cpath%. Cannot create patch.
exit
