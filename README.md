# The .bashrc-file
--------------------------------------------------------------------------------------------------------------------------
First issue of my .bashrc with its associates files. It produces a simple but nice output and is suitable for the average user. If you want more functionality while using e.g. github then you should look for other repos like [Voku/dotfiles](../../../../../voku/dotfiles).
<br></br>
<span style="color:green">Suggestions are always welcome.</span>

## Instructions
1. **Backup your current ~/.bashrc** e.g. with `mv -iv .bashrc bashrc.old` or `cp -i .bashrc bashrc.old`.
2. Download the repo as zip-file and extract the content into your home folder.<br>Overwrite existing files. (**Do not forget to backup your current files.** Just saying!)
3. Start an interactive shell (means: open a terminal). At start it will look like this:

![screenshot of the terminal output with logo](terminal_logo.jpg)
The logo does not appear every time you issue a command. That would be annoying.

You will only need the follwing files:
+ [~/.bashrc](/.bashrc) (necessary)
+ [~/.logo](/.logo) (optional)
+ [~/shellcfg/.alias](/shellcfg/.alias) (necessary for full functionality)
+ [~/shellcfg/.colors](/shellcfg/.colors) (optional, necessary for color prompt)
+ [~/shellcfg/.functions](/shellcfg/.functions) (necessary for full functionality)
+ [~/shellcfg/.what_shell](/shellcfg/.what_shell) (see also [.what_shell section](/README.md#what_shell) below)

Other stuff that comes with the zip-file won't be necessary.<br>
If something goes wrong, it's no drama. Just rename your backup files to their original names and you'll be fine.
<br>You have backup files, right?

## Automated Backup
With this .bashrc every time you start a terminal it will check if there is a backup folder in `~/shellcfg`. If not, it will create one and backup the files I mentioned above. Just these files. If you cannot see the original files in your favorite file manager, you need to enable "Show hidden files". The backup files are not hidden and named `$FILENAME.backup` resp. `$FILENAME.backup~` (You'll have two versions of the backup). If you messed up and want to roll back, you need to copy the backup files from `~/shellcfg/backup/`to `~/` and rename them to `.$FILENAME`. Backups are only created when files have been modified. Maybe someday I'll implement a handy rollback function.

## Content
This .bashrc consists of several files. On the one hand the actual .bashrc and on the other hand a few files that are assigned to certain settings (mentioned above).
In principle, the contents of these files could also be written directly to the bashrc, but it is a bit clearer this way.
<br>These files can be found in the `~/shellcfg/` directory.

## Aliases and functions
There are a few functions and aliases as well as color definitions in the corresponding files. To take full advantage, be sure to check out these files.
+ [~/shellcfg/.alias](/shellcfg/.alias)
+ [~/shellcfg/.colors](/shellcfg/.colors)
+ [~/shellcfg/.functions](/shellcfg/.functions)

However, be aware that things can get messed up very quickly if the files are modified in the wrong way (see section [Automated Backup](/README.md#automated-backup)).
#### Aliases in `/shellcfg/.alias`
Way to much to mention all here. Most of them are explained in the file, but currently mostly in German. (see [todo list](/todo.md))

#### Functions in `/shellcfg/.functions`
|Name|Usage|Description|
|-|-|-|
| _*allcolors*_ | allcolors | It will show you almost all color codes that can be used when prettifying your prompt. <br> Before you fiddle around with color codes just have a look at the file [~/shellcfg/.colors](/shellcfg/.colors). There is a chance your desired color has already a human readable equivalent.|
| _*wtfis*_ | wtfis&nbsp;'arg' | Like `which` but exposes much more info. <br>'arg' has to be the name of a program that is installed on your system, e.g. `wtfis man`. <br> ❗**Be patient!** This function needs some time to parse all the information.❗|

## .what_shell
The `~/shellcfg/what_shell` file currently is actually nonsense because other shells have different file names and the output could have been a simple query (like "$SHELL") or just writing "BASH" since it will always be BASH with a .bashrc, you know. Furthermore the version query does only work in BASH this way. However, it doesn't bother me either, so I left it there. This is only an issue if you do not have a file named .logo in your home directory and/or *lolcat* is not installed.
If I can spare time I would make it suitable for other shells. In this case the file would only have to be renamed and then the query could become useful. Until then, it's just a gimmick, more or less useless.

## Modifying
If you want to modify the .bashrc and its associated files for other shells, feel free to do so. Just fork this repo and send me some love when you do so.
Some comments within these files as well as some outputs appear to be in German. You can translate it by yourself or live with that.

## Changing the logo
By default there is a file named .logo containing a raspberry ascii art. Who knows why...<br>
If you want to see another logo when you start an interactive shell you just have to create an ascii art and save it as ~/.logo. As an alternative you can just delete or rename ~/.logo and you will get an animated intro. The result will look like this:
![screenshot of the terminal output with intro](terminal_intro.jpg)

The output of RAM (command `free -h`) and the interface table (command `netstat -i`) will be shown according to your system language settings. If the interface table is not shown you need to install the package `net-tools` (see section [Optional programs](/README.md#optional-programs)). This is avaible at least in Debian and Ubuntu based distros. ARCH Linux, e.g., doesn't have that unfortunately and it will throw an 'command-not-found' msg. In this case just comment out line 247 in the .bashrc

## Optional programs
There are programs wich will be used and may not be present by default in your installation. I mentioned some of them already above. Below is a list of all progs this .bashrc is using:
+ `netstat` - part of net-tools package (`apt-get install net-tools` The package may not be available in other distros, e.g. ARCH Linux.)
+ `lolcat` - It is like *cat* but colorized. (`apt-get install lolcat`, install all dependencies ).
+ `most` - this will be the new less. (`apt-get install most`)

*Of course you need root privileges to install packages. Usually this is obtained by using 'sudo' in front of the program to be executed (in our case 'apt-get') or with the command 'sudo -i'. The 'sudo -i' command logs you in as root and you remain in that status in that terminal window until the 'exit' command is entered or the window is closed.*

You can use `apt install package` instead of `apt-get install package`. Depending on your distro, one or the other will offer more options. For the installation, however, it is initially unimportant.

|🌟 Hint 🌟|Instead of using command line tools you can use a package manager like *Synaptic* (`apt-get install synaptic`) or (if you insist to work in a shell) *Aptitude* `apt-get install aptitude`. It's more convenient to use a package manager.<br>If you use Synaptic, I recommend installing xapian-tools and xapian-index as well, including their dependencies of course. This gives Synaptic a search bar in the main window that is always visible and prevents a new window from opening each time you do a search. A reboot is necessary after installing these two packages for the search bar to appear in Synaptic.
|:-:|:-|

## Configure your prompt conveniently
This .bashrc makes the prompt configuration a little bit easier. Nonetheless it is often a pain in the a...<br>
A colorized prompt with some usefull informations will often look like this in the .bashrc file:

`PS1='\[\e[0;38;5;42m\]\D{}\n\[\e[0;1;38;5;40m\]\u\[\e[0;38;5;226m\]@\[\e[0;38;5;35m\]\H\[\e[0;38;5;41m\]/\[\e[0;38;5;77m\]\W\[\e[0;38;5;77m\]/\[\e[0;38;5;27m\]$\[\e[0;5m\]_\[\e[0m\]'`

That is a bunch of cryptic strings. There are escape codes and color codes and you almost have to study rocket science to read and understand it fluently. My .bashrc contains a little explanation of escape codes (the most important only) in German und English. So you don't have to crawl the web to get startet.

But there are some awesome guys around that will help you.<br>One of them is [Scriptim](../../../../../Scriptim/) and he made a phantastic tool: the [Bash Prompt Generator](../../../../../Scriptim/bash-prompt-generator). You can use this tool to preformat your prompt and afterwards you can change colors into a human readable format. How this works you can learn while studying the file `/bashcfg/.colors`. The code for the prompt in my .bashrc looks like this:

`PS1="\n\[${LIGHTGRAY}\]Systemzeit \A\n\[${LIGHTBLUE}\]\u \[${YELLOW}\]@ \[${LIGHTGREEN}\]\h \[${LIGHTGREEN}\]\w\[${NC}\]:\$\[\e[0;5m\]_\[\e[0m\]`

As you can see it is more readable. The result can be seen in the pics above.

In case you want to have more colors invoke `allcolors` in a terminal. This will show you a lot of color codes and how they will look like. You can then add the desired color codes to the ~/shellcfg/.colors file and use them accordingly to format the prompt. Just try it.

And now have fun!
