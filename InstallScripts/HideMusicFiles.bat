@echo off
echo Are you sure you want to hide all .ogg files in the previous dir? Enter/return to continue, Ctrl + C to cancel.
pause
for %%f in (../*.ogg) do (attrib ../%%f +h)
