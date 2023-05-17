@echo off
set ver="55"
set /p ver="Chicory Game Version: C."
set cpath=Chicory\C.%ver%\

if not exist %cpath% (goto noChicory)
if not exist %cpath%\macaroni.win (goto noMacaroni)

echo IF THE FOLLOWING ERRORS, SEND TO JdavisBro FIRST.
@echo on
UndertaleModTool\UndertaleModCli.exe load %cpath%\macaroni.win -s ImportSpeedrunMod.csx -o %cpath%\speedrun.win
@echo off
echo IF THE PREVIOUS ERRORED, SEND TO JdavisBro FIRST.

exit

:noChicory
echo Chicory Installation for Version %ver% not found. Make sure it's in the directory %cpath%
exit

:noMacaroni
echo macaroni.win not found in %cpath%. Make sure to make macaroni in %cpath%.
exit

