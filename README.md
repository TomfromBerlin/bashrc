# bashrc
--------------------------------------------------------------------------------------------------------------------------
First issue of my bashrc with its associates files. It produces a simple but nice output and is suitable for the average user. If you want more functionallity while using e.g. github then you should look for other repos like [Voku/dotfiles](https://github.com/voku/dotfiles).

## Instruction
1. **Backup your current ~/.bashrc** (`mv -iv .bashrc bashrc.old` Look at your current .bashrc if there is already an alias for mv. Use the alias in case of...)
2. Then download the repo as zip-file and extract it in your home folder.
3. Start an interactive shell (means: open a terminal). It will look like this:

![terminal.jpg](terminal_logo.jpg)

You will only need the follwing files:
+ [~/.bashrc](https://github.com/TomfromBerlin/bashrc/blob/main/.bashrc) (nessecary)
+ [~/.logo](https://github.com/TomfromBerlin/bashrc/blob/main/.logo) (optional)
+ [~/shellcfg/.alias](https://github.com/TomfromBerlin/bashrc/blob/main/shellcfg/.alias) (nessecary for full functionality)
+ [~/shellcfg/.colors](https://github.com/TomfromBerlin/bashrc/blob/main/shellcfg/.colors) (optional)
+ [~/shellcfg/functions](https://github.com/TomfromBerlin/bashrc/blob/main/shellcfg/.functions) (nessecary for full functionality)
+ [~/shellcfg/.what_shell](https://github.com/TomfromBerlin/bashrc/blob/main/shellcfg/.what_shell) (see also [.what_shell section](https://github.com/TomfromBerlin/bashrc#what_shell) below)

Other stuff that comes with the zip-file won't be nessecary.

## Automated Backup
Every time you start a terminal with this .bashrc it will check if there is a backup folder in `~/shellcfg`. If not, it will create one and backup those files. If you cannot see the original files in your favorite file manager, you need to enable "Show hidden files". The backup files are not hidden and named `$FILENAME.backup` resp `$FILENAME.backup~` (You'll have two versions of the backup). If you messed up and want to roll back, you need to copy the backup files from `~/shellcfg/backup/`to `~/` and rename them to `.$FILENAME`. Backups are only created when files have been modified.

Suggestions are always welcome.

## Content
This bashrc consists of several files. On the one hand the actual bashrc and on the other hand a few files that are assigned to certain settings (mentioned above).

In principle, the contents of these files could also be written directly to the bashrc, but it is a bit clearer this way. These files can be found in the `~/shellcfg/` directory.

## Aliases and functions
There are a few functions and a lot of alias defnitions in the corresponding files (`~/shellcfg/.functions`, `~/shellcfg/.alias`). Some of them are default in most linux distros, some not.

## .what_shell
The `~/shellcfg/what_shell` file is actually nonsense because other shells have different file names and the output could have been a simple query (like "$SHELL"). Furthermore the version query does only work in BASH this way. However, it doesn't bother me either, so I left it there. This is only an issue if you do not have a file named .logo in your home directory and/or *lolcat* is not installed. Even in this case I've made a work around (see section [Changing the logo](https://github.com/TomfromBerlin/bashrc#changing-the-logo))

By default there is a file named .logo containing a raspberry ascii art. Who knows why...

## Modifying
If you want to modify the bashrc and its associated files for other shells, feel free to do so. Just fork this repo and send me some love when you do so.
Some comments within these files as well as some outputs appear to be in German. You can translate it by yourself or live with that.

## Changing the logo
If you want to see another logo when you start an interactive terminal you just have to create an ascii art and save it as ~/.logo. As an alternative you can just delete or rename ~/.logo and you will get an animated intro. The result will look like this:
![terminal.jpg](terminal_intro.jpg)

The output of RAM and the interface table will be shown according to your system language settings. If the interface table is not shown you need to install the package `net-tools` (see section Optional programs). This is avaible at least in Debian and Ubuntu based distros. ARCH Linux, e.g., doesn't have that unfortunately and it will throw an 'command-not-found' msg. In this case just comment out line 247 in the .bashrc

## Optional programs
There are programs wich will be used and may not be present in the default in your installation. I mentioned them already above, but below they are listed again for your convenience:
+ `netstat` - part of net-tools package (Debian and derivates: `sudo apt install net-tools`; Ubuntu: depricated sudo (afak) for security reasons. If this is still true you'll need to use `pkexec apt install net-tools`). The `net-tools` package may not be available in other distros, e.g. ARCH Linux.
+ `lolcat` - It is like *cat* but colorized. (Debian an derivates`sudo apt install lolcat`; Ubuntu: (probably) `pkexec apt install lolcat`)

Instead of using the command line to install programs you can use a package manager like *synaptic* or (if you insists to work in a shell) *aptitude*. Its more convenient.

## Configure your prompt conveniently
This .bashrc makes the prompt configuration a little bit easier. Nonetheless it is often a pain in the a...
A colorized prompt with some usefull informations will often look like this:
`PS1='\[\e[0;38;5;42m\]\D{}\n\[\e[0;1;38;5;40m\]\u\[\e[0;38;5;226m\]@\[\e[0;38;5;35m\]\H\[\e[0;38;5;41m\]/\[\e[0;38;5;77m\]\W\[\e[0;38;5;77m\]/\[\e[0;38;5;27m\]$\[\e[0;5m\]_\[\e[0m\]'`

That is a bunch of cryptic strings.

But there are some awesome guys around that will help you. One of them is [Scriptim](]https://github.com/Scriptim/) and he made a phantastic tool: the [Bash Prompt Generator](https://github.com/Scriptim/bash-prompt-generator). You can use this tool to preformat your prompt and afterwards you can change colors into a human readable format. How this works you can learn while studying the file `/bashcfg/.colors`
The code for the prompt in this bashrc looks like this:
`PS1="\n\[${LIGHTGRAY}\]Systemzeit \A\n\[${LIGHTBLUE}\]\u \[${YELLOW}\]@ \[${LIGHTGREEN}\]\h \[${LIGHTGREEN}\]\w\[${NC}\]:\$\[\e[0;5m\]_\[\e[0m\]`
As you can see it is more readable. The result can be seen in the pics above.
