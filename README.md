# bashrc
First issue of my bashrc-file with its associates

Instruction: Just download the repo as zip-file and extract it in your home folder. Start a Terminal and watch the magic...

Suggestions are always welcome.

This bashrc consists of several files. On the one hand the actual bashrc and on the other hand a few files that are assigned to certain settings.

In principle, the contents of these files could also be written directly to the bashrc, but it is a bit clearer this way. These files can be found in the ~/shellcfg/ directory.

Aliases and functions

There are a few functions and a lot of alias defnitions in the corresponding files (.function,.alias). Some of them are default in most linux distros, some not.

The ~/shellcfg/what_shell file is actually nonsense because other shells have different file names and the output could have been a simple query (like "$SHELL"). Furthermore the version query does only work in BASH this way. However, it doesn't bother me either, so I left it there. This is only an issue if you do not have a file named .logo in your home directory and/or lolcat is not installed.
You can install lolcat the usual way (e.g. sudo apt install lolcat). lolcat gives the color to the ascii art.
By default there is one file named .logo. It contains a raspberry. Who knows why...

Modifying

If you want to modify the bashrc and its associated files for other shells, feel free to do so. Just fork this repo and send me some love when you do so.
Some comments within these files as well as some outputs appear to be in German. You can translate it by yourself or live with it.
