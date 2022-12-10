@echo off
rem Stellaris Benchmarking Tool v1
rem This is a comment.

echo Welcome to the Stellaris Benchmarking Tool v1
echo Please make sure this batch file/script is located in the same folder as the rest of the contents of the ZIP.
echo Please make sure Stellaris is closed.
echo:

echo Press ENTER when you are ready...
pause>nul

rem Stores the location of the current batch file (and presumably the standard benchmark savegame) as a variable. This location will be referred to as the "benchmark folder" going forward.
set benchmark_folder=%~dp0

rem Stores the location of the Paradox Interactive Stellaris documents folder as a variable.
rem IF YOU HAVE CHANGED THE LOCATION OF THIS DIRECTORY (the one where the save games are located, NOT the one where the game itself is installed. That last one doesn't matter.), YOU WILL NEED TO MODIFY THIS LINE FOR THE PROGRAM TO WORK.
rem If you don't know what I'm talking about, you don't need to worry.
set stellaris_folder=C:\Users\%USERNAME%\Documents\Paradox Interactive\Stellaris
cd %stellaris_folder%

rem Cuts the settings to the benchmark folder (as to backup the user's custom settings).
echo Moving your custom settings somewhere safe...
move "settings.txt" "%benchmark_folder%"
move "pdx_settings.txt" "%benchmark_folder%"
echo:

rem Creates the benchmark.ini file in the Paradox Interactive Stellaris documents folder.
rem This contains the necessary commands to execute the benchmark.
echo Creating the file containing the in-game commands for the benchmark...
type "%benchmark_folder%benchmark.txt" > "benchmark.ini"
echo:

rem Creates the standard settings files as per this benchmark's methodology.
echo Creating the standard benchmarking settings...
type "%benchmark_folder%standard_settings.txt" > settings.txt
type "%benchmark_folder%standard_pdx_settings.txt" > pdx_settings.txt
echo:

rem Adds the standard benchmarking save-game to your save-game list.
echo Creating a new save game folder and copying the benchmark save...
mkdir "%stellaris_folder%\save games\BENCHMARK"
copy "%benchmark_folder%2300_Huge.sav" "%stellaris_folder%\save games\BENCHMARK"
echo:

rem Launches Stellaris (using the Steam shortcuts system).
echo Do you want to launch the game through Steam?
set /p choice=Enter "Y" to launch the game thru Steam. Enter "N" if you don't own it through Steam or if you prefer to launch the game manually: 

if /I "%choice%"=="Y" (
  echo This could take a second...
  start steam://rungameid/281990
) else (
  echo Please launch the game manually.
)
echo:

rem These are the steps to follow to run the benchmark in-game.
echo INSTRUCTIONS:
echo  (Disable all mods)
echo  - Once inside the game, press "Load game" and look for a game called "The Cosmic Knights" with one save in it called "2300_Huge".
echo  - Load the save.
echo  - When the map loads, ZOOM ALL THE WAY IN and open the in-game console.
echo  - Type "run benchmark.ini" without the quotes into the in-game console and press enter.
echo  - One in-game year will pass and then the game will automatically pause. Do not move the mouse around meanwhile.
echo  - Please write down the time that appears on-screen at the end of the benchmark.
echo:

echo If something goes wrong when starting Stellaris (e.g. it fails to launch with the current settings), just press ENTER. The program will restore your old settings.
echo Press ENTER (in this window) when you are done.
pause>nul

rem Looks thru the game.log for the results and copies them to the benchmark folder. It also displays said results in the console.
echo:
echo Here are the results (if you missed them):
findstr /C:"Performance run" "%stellaris_folder%\logs\game.log" > "%benchmark_folder%results.txt"
type "%benchmark_folder%results.txt"
echo:

rem Closes Stellaris by killing the task.
echo Do you want me to close Stellaris?
set /p choice=Enter "Y" to close the game. Enter "N" if you want to close it manually: 

if /I "%choice%"=="Y" (
  taskkill /IM stellaris.exe
) else (
  echo Please close the game manually.
)
echo:

echo When the game closes, press ENTER. I will now restore your old settings.
pause>nul

rem Uses the backup made to your original settings to restore the in-game settings to the state they were before the benchmark.
echo Restoring settings...
copy /Y /Z "%benchmark_folder%settings.txt" "%stellaris_folder%"
copy /Y /Z "%benchmark_folder%pdx_settings.txt" "%stellaris_folder%"
echo:
rem If you didn't close the game, this last step could have failed. In the folder where this script is located you can find a copy of your old settings to restore them manually ("settings.txt" and "pdx_settings.txt").

echo Now, please submit your results and hardware specs to the form. To view the latter, you can use a free tool like HWiNFO (recommended).
echo:

echo Thanks for helping the PDX Benchmarking Initiative. (This is a community-ran project and is in no way affiliated to Paradox Interactive AB or its subsidiaries).
rem HWiNFO is not affiliated to the initiative either.
echo Press ENTER to exit...
pause>nul