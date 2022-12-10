# Paradox-Benchmarking
Benchmark performance of Paradox games for all to know.

## Stellaris
Clone/Download this repository.  If you know how to clone a repo, you can skip this.  If you do not, that's okay.  In the top right you'll see a button with the label `<> Code`, click that, then click `Download ZIP`.  Save and extract the file somewhere, it doesn't matter.  Suggested location is `Downloads/Paradox-Benchmarking`.  For Stellaris, we only care about the contents of the `Stellaris` folder, which are:

1. `2300_Huge.sav` - A `v3.6.1 Orion` savegame
2. `benchmark.txt` - A file of commands to be run by the game, this is how we benchmark.
3. `Benchmarking_Tool_Windows.bat` - A batch script which will set up the benchmark and walk you through what you need to do to benchmark your hardware.
4. `standard_pdx_settings.txt` - Standard settings so all benchmarks can be compared.
5. `standard_settings.txt` - Standard settings so all benchmarks can be compared.

### Benchmarking

Before benchmarking, please close all programs.  This will ensure that all of your system's performance will be dedicated to Stellaris and give us the most accurate results.  If you were to leave something running in the background, like another game or rendering a video or streaming, then game performance will be degraded.

#### Using the Script

1. Double click `Benchmarking_Tool_Windows.bat`.  It will open a command prompt and let you know how to proceed with the benchmark.

#### Manually

1. Go to the Victoria 3 folder, it should be at `Documents\Paradox Interactive\Stellaris`.  On Linux... well if you're playing on Linux you probably already know, but it should be at `~/.paradoxinteractive/Stellaris` or `~/.local/share/Paradox/Stellaris`
2. Once inside the “Paradox Interactive” > “Stellaris” folder, look for the “pdx_settings.txt” and the "settings.txt" files. I suggest making a copy of them and storing them somewhere else to be able to quickly restore your custom settings after conducting the test.
3. Copy the files “standard_pdx_settings.txt” and the "standard_settings.txt" from the unzipped Stellaris_benchmark folder to the Stellaris folder identified in the steps above.
4. Rename the files “pdx_settings.txt” and "settings.txt" respectively.
5. Copy the file "benchmark.txt" to the Stellaris folder.
6. Change the extension of the file from .txt to .ini
7. Locate the "save games" folder and create a new folder inside with a name of your liking (e.g. BENCHMARK)
8. Copy the "2300_Huge.sav" file from the benchmark folder to the newly created folder within "save games"
9. Launch the game and press "load save"
10. Look for a game called "The Cosmic Knights" with one save in it called "2300_Huge". Load the save.
11. When the map loads, ZOOM ALL THE WAY IN and open the in-game console.
12. Type "run benchmark.ini" without the quotes into the in-game console and press enter.  One in-game year will pass and then the game will automatically pause. Do not move the mouse around meanwhile. 
13. Write down the time that appears on-screen at the end of the benchmark.
14. Close the game. You may now restore your old settings files using the copies you made in step 2.


### After the Benchmark

1. Open Task Manager, HWiNFO, or some other appropriate system utility and collect your PC specs - CPU, RAM, and GPU.  Write this information down as we need it for benchmarking.
2. Fill out the form [here](https://forms.gle/VHd8r1pguuF4DzTZ8)

## Victoria 3

Benchmarking Victoria 3 is still quite manual.  Clone/Download this repository as described at the beginning of the Stellaris section above.

1. Go to the Victoria 3 game folder, it should be at `Documents\Paradox Interactive\Victoria 3`.  On Linux... well if you're playing on Linux you probably already know, but it should be in `~/.paradoxinteractive/` or `~/.local/share/Paradox/`.
2. Make a folder called `debug`.
3. Copy the `camerapos.txt` file in the `Victoria 3` folder in this repository to the `debug` folder.
4. Make a copy of `pdx_settings.json` file in the Victoria 3 game folder and save it as `pdx_settings.bak.json`.  You'll be changing your settings for this benchmark as we need to make sure settings are the same across all benchmarks.
5. Disable all mods and launch Victoria 3
6. Go to the settings and set the `Display Mode` to `Window`, the `Resolution` to `1920x1080`, and the `Render Scale` to `100%`.  Disable `Vsync` and `Maximum FPS`.  Select the `Low` Preset.
7. Close Victoria 3.
8. Launch the game in **Debug Mode**.  Instructions can be found [here](https://vic3.paradoxwikis.com/Console_commands#Enabling_debug_mode).
9. Create a new single player game.  Select default game rules and disable achievements.  Select **Sandbox** and click **Observe**.
10. Open the Console.  Instructions [here](https://vic3.paradoxwikis.com/Console_commands).
11. Enter the command `Camera.Load`.  This will move your camera to the middle of the Pacific Ocean if you completed step 3 correctly.  If not, your game will crash.
12. Set game speed to maximum.
13. Start a 5 minute timer on any of your devices (a phone would be easiest) and unpause the game.
14. Enjoy a nice cup of tea/coffee/hot cocoa/etc. until the timer finishes.
15. Pause the game as soon as the timer finishes.  Write the in-game date down in `YYYY/MM/DD` format.
1. Open Task Manager, HWiNFO, or some other appropriate system utility and collect your PC specs - CPU, RAM, and GPU.  Write this information down as we need it for benchmarking.
17. Fill out the form [here](https://docs.google.com/forms/d/e/1FAIpQLSfgHVhU92p0oFSUr9tflPaeN2pKtd8r-rWoI3lfTP5UiHmRGg/viewform?usp=sf_link)