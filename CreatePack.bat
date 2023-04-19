@echo off
set ver="55"
set /p ver="Chicory Game Version: C."
set cpath=Chicory/C.%ver%/

if not exist %cpath% (goto noChicory)
if not exist %cpath%\macaroni.win (goto noMacaroni)

echo IF THE FOLLOWING ERRORS, SEND TO JdavisBro FIRST.
@echo on
UndertaleModTool\UndertaleModCli.exe load %cpath%\macaroni.win -s ImportSpeedrunMod.csx -o %cpath%\speedrun.win
@echo off
echo IF THE PREVIOUS ERRORED, SEND TO JdavisBro FIRST.

set package="n"
set /p package="Create Install Package? [y/n] (default - %package%) "

if "%package%"=="y" (goto createPack)
exit

:createPack
if not exist %cpath%\game.ios (goto noGameios)
set packdir="Packs\C.%ver%"
@echo on
mkdir "Packs"
rmdir %packdir%
mkdir %packdir%
mkdir %packdir%\speedrun-mod
InstallScripts\xdelta3.exe -e -s %cpath%/game.ios %cpath%/speedrun.win %packdir%\speedrun-mod\patch.xdelta
copy InstallScripts\* %packdir%\speedrun-mod\
if exist InstallTxt\%ver%.txt (
    copy InstallTxt\%ver%.txt %packdir%\INSTALL.txt
) else (
    copy InstallTxt\generic.txt %packdir%\INSTALL.txt
)
copy VERSION.txt %packdir%\VERSION.txt
exit

:noChicory
echo Chicory Installation for Version %ver% not found. Make sure it's in the directory %cpath%
exit

:noMacaroni
echo macaroni.win not found in %cpath%. Make sure to move your macaroni.win into %cpath% after creating it.
exit

:noGameios
echo game.ios not found in %cpath%. Cannot create patch.
exit
