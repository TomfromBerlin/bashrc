# The .bashrc-file

--------------------------------------------------------------------------------------------------------------------------
Phew. This gets bigger than I originally thought. Actually I only wanted to backup the configuration of my bash and now this...

My [.bashrc](/.bashrc) and its associated files. It produces a simple but nice output and is suitable for the average user. If you want more functionality while using e.g. GitHub then you should look for other repos like [Voku/dotfiles](../../../../../voku/dotfiles).

Some comments in these files as well as some screen outputs are in German. Maybe someday I will implement some code to have the output according to the system language or translate everything into English. For now, you can translate it yourself if you want, or just live with the sauerkraut. It really could be worse.

Suggestions are always welcome. If errors occur, I would be grateful for information on this and will take them into account accordingly.

## Instructions

1. **Backup your current ~/.bashrc** e.g. with `mv -iv ~/.bashrc ~/bashrc.old` or `cp -i ~/.bashrc ~/bashrc.old`.
2. Download the repo as zip-file and extract the content into your home folder. You will then find a new directory named `main-bashrc`. Copy the files mentioned below to `~/` (your home) and `~/.shellcfg/` respectively. Perhaps the directory `~/.shellcfg/` needs to be created because it probably doesn't already exist. Overwrite existing files. If you cannot see the dot-files and the .shellcfg-directory in your favorite file manager, you need to enable "Show hidden files". (**Do not forget to backup your current files.** Just saying!)
3. Start an interactive shell (means: open a terminal).

You will only need the follwing files:

+ [~/.bashrc](/.bashrc) (necessary)
+ [~/.logo](/.logo) (optional)
+ [~/.shellcfg/alias](/.shellcfg/alias) (necessary for full functionality)
+ [~/.shellcfg/colors](/.shellcfg/colors) (optional, necessary for color prompt)
+ [~/.shellcfg/functions](/.shellcfg/functions) (necessary for full functionality)
+ [~/.shellcfg/what_shell](/.shellcfg/what_shell) (see also [what-the-(s)hell section](/README.md#what-the-(s)hell) below)

If any of these files are missing, the shell will still work. However, under certain circumstances (e.g., your `/etc/bash.bashrc` as well as your `~/.profile` don't contain alias definitions or functions) no or at least lesser [aliases](/.shellcfg/alias) or [functions](/.shellcfg/functions) will then be declared. If [/.shellcfg/colors](/.shellcfg/colors) is missing, the prompt will still appear colored (lack of color support should be the exception), but customization will be more challenging, since you need to use color codes (see section about [configuration of the prompt](/README.md#configure-your-prompt-conveniently)).

Other things that come with the zip file may also be important, but not required, e.g., the README.md you are reading right now.

If something goes wrong, it's no drama. Just rename your backup files to their original names and you'll be fine.

You have backup files, right?

## Automated Backup

With this [.bashrc](/.bashrc) every time you start a terminal it will check if there is a directory named backup in `~/.shellcfg/`. If not, it will create one and backup the files I mentioned above. Just these files. The backup files are named `<FILENAME>.backup` resp. `<FILENAME>.backup~` (You'll have two versions of the backup). Although the directory `~/.shellcfg/` is hidden the content inside of it is not. You can navigate to the directory with `cd ~/.shellcfg/` and display the content with the `ls` command or just enable "Show hidden files" in your favorite file manager.

If you messed up and want to roll back, you need to copy the backup files from `~/.shellcfg/backup/` to `~/` and `~/.shellcfg/` respectively and rename them to `.<FILENAME >`. Backups are only created when files have been modified. Maybe one day I'll implement a handy rollback feature, but for now you should have a basic knowledge of file management, e.g. how to copy, move, and rename files. For more information use `man cp` or `man mv` at the command line.

## Content

This [.bashrc](/.bashrc) consists of several files. On the one hand the actual [.bashrc](/.bashrc) and on the other hand a few files that are assigned to certain settings (mentioned above).
In principle, the contents of these files could also be written directly to the [.bashrc](/.bashrc), but it is a bit cleaner this way.
These files can be found in the `~/.shellcfg/` directory.

### Aliases and functions

There are a few functions and aliases as well as color definitions in the corresponding files. To take full advantage, be sure to check out these files.

+ [~/.shellcfg/alias](/.shellcfg/alias)
+ [~/.shellcfg/colors](/.shellcfg/colors)
+ [~/.shellcfg/functions](/.shellcfg/functions)

However, be aware that things can get messed up very quickly if the files are modified in the wrong way (see section [Automated Backup](/README.md#automated-backup)).

#### Aliases in [~/.shellcfg/alias](/.shellcfg/alias)

Way to much to mention all here. Most of them are explained in the file, but currently mostly in German. (see [todo list](/todo.md))

#### Functions in [~/.shellcfg/functions](/.shellcfg/functions)

|Name|Usage|Description|
|-|-|-|
|  **__add_command_replace_alias** | _will be invoked automatically_ | This function checks if certain applications are installed and defines aliases in case of. This will not remove the application. But if you call it the usual way the more sophisticated version will be used, e.g. 'htop' instead of 'top'.<br> Source: _<https://github.com/slomkowski/bash-full-of-colors/blob/master/bash_aliases.sh>_|
| **allcolors** | allcolors | It will show you almost all color codes that can be used when prettifying your prompt. <br> Before you fiddle around with color codes just have a look at the file [~/shellcfg/.colors](/shellcfg/.colors). There is a chance your desired color has already a human readable equivalent.[^1]|
| **command&nbsp;not&nbsp;found** | _will be invoked automatically_ | When command-not-found is installed, use it. This is available in most distributions, but not necessarily installed. It should actually be called in `/etc/bash.bashrc` for the function to be available globally, but it doesn't hurt if it lives there either. Under Arch Linux, line 10 must also be commented out (#source /usr/share/doc/pkgfile/command-not-found.bash) and should be processed before the function will be declared, otherwise the whole thing won't work in this distribution.|
| **extract** | extract&nbsp;&lt;filename&gt; | extracts all formats of archive files (credits: urukrama, Ubuntuforums.org)
| **find file** | ff&nbsp;&lt;filename&gt; | The name says it all: It finds files.|
| **wtfis** | wtfis&nbsp;&lt;arg&gt; | Like `which` but exposes much more info.<br>&lt;arg&gt; has to be the name of a program, function, or alias that can be found on your system, e.g. `wtfis man`. <br> ❗**Be patient!** This function takes some time to collect all the information.❗<br> Source: <https://raw.githubusercontent.com/janmoesen/tilde/master/.bash/commands>|

#### what the (s)hell

The idea behind the what_shell-file was to make the whole thing accessible to other shells as well and if possible, to prevent that any user-side changes to the files are necessary for it to work - apart from renaming the [.bashrc](/.bashrc) file. For now, the query should work in the following environments: Bourne Shell (sh),  Bourne-Again Shell (bash), Korn-Shell (ksh) and maybe Z-Shell (zsh). The Debian-Almqist-Shell (dash), Yet Another Shell (yash), and Process Offloed Shell (posh) are also recognized. When using dash as an interactive shell it is recommended, to check that all scripts that don't have the `#!/bin/bash` directive in their shebang are fully POSIX compliant.

However, there is another tiny problem: Different shells have different filenames and especially different features and functions. Also, the commands may vary depending on which shell is used and whether that is also the default shell or possibly called from another shell, which can lead to different results. This may require different queries. Therefore, the file [~/.shellcfg/what_shell](/.shellcfg/what_shell) is currently only safe to use in in the Bourne Again Shell (bash) and Bourne Shell (sh) and should not cause any problems here, but may work within Korn-Shell as well, perhaps even within the Z-Shell. But as I said, all the shells mentioned are initially recognized. However, whether the rest will also work is not certain at the moment.

In principle, a - more or less simple - query is sufficient to find out the name of the shell. As usual in Linux, there is more than one way to achieve a goal. To check which shell is being used, the following commands can be used:

+ `$SHELL` - the easiest way and the most commonly used, and displays the default shell for the system (or user), which is usually (but not necessarily) the shell actually being used at any given time
+ `ps -cp "$$" -o command=""` - shows the actual shell currently in use, but that wouldn't always work everywhere, e.g. in Tenex-C-Shell (tcsh) it will not

But the standard output for `$SHELL` is ugly: _/bin/bash_

`ps -cp "$$" -o command=""` isn't much better either: _bash_

Yes it's functional and yes it's ugly. Because of this, I wrote a few lines to change the displayed information. That's why the terminal says i.e. "Bourne Again Shell - Version <version>" and not "/bin/bash".

The version query should also work in other shells (sh, bash, ksh, zsh, posh and yash). This does not apply to dash as dash has no information about its version for historical reasons.

| ❗ |I can't stress this enough: If you use these files in shells other than bash, I strongly recommend checking the contents for compatibility.|
|-|:-|

## Changing the logo

By default, the downloaded zip file contains a file named ".logo" which contains an ASCII graphic and a stylized raspberry will appear above the prompt when opening a terminal window.

![screenshot of the terminal output with logo](terminal_logo.jpg)

_The logo does not appear every time you issue a command. That would be annoying. You can recall the logo at any time with the command `lolcat ~/.logo` or `cat ~/.logo` as you wish._

If you want to see another logo when you start an interactive shell you just have to create an ascii art and save it as `~/.logo`. Alternatively, you can simply delete or rename this file and get an animated intro. The result will look like this:

![screenshot of the terminal output with intro](terminal_intro.jpg)

The output of RAM (command `free -h`) and the interface table (command `netstat -i`) will be shown according to your system language settings. If the interface table is not shown you need to install the net-tools package (see section [Optional programs](/README.md#optional-programs)). This is avaible at least in Debian and Ubuntu based distros. The package may not be available by default. In this case, a "command not found" message is issued. If the package is not in the distribution repositories and cannot or should not be made available elsewhere, simply comment out or delete line 247 in [~/.bashrc](/.bashrc).

## Optional programs

There are programs wich will be used and may not be present by default in your installation. I mentioned some of them already above. Below is a list of these programs that are more or less necessary for full functionality:

|Program|Description|
|-|-|
| `command-not-found` | If you enter a command on the command line or call a program and it does not exist, the message "Command not found" appears. The command-not-found package makes sure that in addition to the message, suggestions are made as to what could be meant and where a program or command with this or a similar name can be found. (`apt-get install command-not-found`, then `apt update` to populate the command-not-found database.)|
| `lolcat` | It is like _cat_ but colorized. (`apt-get install lolcat`).|
| `most` | there is an alias set and if `most` is installed it will be used instead of _less_. (`apt-get install most`)|
| `netstat` | part of _net-tools_ package (`apt-get install net-tools`)|

One or the other package may not be available in distros other than Debian- or Ubuntu-based.

_Of course you need root privileges to install packages. Usually this is obtained by using 'sudo' in front of the program or command to be executed (in our case 'apt-get') or with the command 'sudo -i'. The 'sudo -i' command logs you in as root and you remain in that status in that terminal window until the 'exit' command is entered or the window is closed._

You can use _apt install &lt;package name&gt;_ instead of _apt-get install &lt;package name&gt;_. Depending on your distro, one or the other will offer more options. For the installation, however, it is unimportant.

| 🌟 |Instead of using command line tools you can use a package manager like _Synaptic_ or (if you insist to work in a shell) _Aptitude_ `apt-get install aptitude`. It's more convenient to use a package manager. If you use Synaptic, I recommend installing xapian-tools and apt-xapian-index as well. This gives Synaptic a search bar in the main window that is always visible and prevents from opening a dialog window each time you want to do a search. `apt-get install synaptic xapian-tools apt-xapian-index`
|:-:|:-|

## Configure your prompt conveniently

This [.bashrc](/.bashrc) makes the prompt configuration a little bit easier. Nonetheless it is often a pain in the a...

A colored prompt with some useful information often looks like this in the [.bashrc](/.bashrc) file:

`PS1="\n\e[0;37mSystemzeit \A\n\e[1;34m\u \e[1;33m@ \e[1;32m\h \e[1;32m\w\\e[0m:\$\[\e[0;5m\]_\e[0m`

That's a bunch of cryptic strings. There are escape codes and color codes and it almost takes rocket science to read and understand fluently. (my [.bashrc](/.bashrc) contains a small explanation of escape codes, but only the most important ones, in German and English. So you don't have to search the web to get started. More you can find [here](https://misc.flogisoft.com/bash/tip_colors_and_formatting))

But if you don't hate your life then you won't turn down help and there are some really badass guys out there who will use their skills to make your life easier. One of them is [Scriptim](../../../../../Scriptim/) and he made a phantastic tool: the [Bash Prompt Generator](../../../../../Scriptim/bash-prompt-generator). You can use this tool to preformat your prompt and afterwards you can change colors into a human readable format. The code for the prompt in my [.bashrc](/.bashrc) looks like this:

`PS1="\n\[${LIGHTGRAY}\]Systemzeit \A\n\[${LIGHTBLUE}\]\u \[${YELLOW}\]@ \[${LIGHTGREEN}\]\h \[${LIGHTGREEN}\]\w\[${NC}\]:\$\[\e[0;5m\]_\[${NC}\]`'

As you can see it is more readable. I'll break it down into individual pieces for better understanding:

|Code|Description|
|:-:|-|
|`PS1`|path var, you can define more than one path var, e.g. one for the default user and one for root|
|`=`|equal sign, splits the name of the variable from the content|
|`"`|The first quotation mark defines the beginning of the content of the variable. Some will need a single quote instead of a double quote.|
|`\n`|line break / new line|
|`\[${LIGHTGRAY}\]`|color formatting|
|`Systemzeit `|text to be shown (with tailing space)|
|`\A`|time|
|`\n`|line break / new line|
|`\[${LIGHTBLUE}\]`|color formatting|
|`\u `|user name (with tailing space)|
|`\[${YELLOW}\]`|color formatting|
|`@ `|text to be shown (with tailing space)|
|`\[${LIGHTGREEN}\]`|color formatting|
|`\h `|host name (with tailing space)|
`\[${LIGHTGREEN}\]`|color formatting|
|`\w`|Path|
|`\[${NC}\]`|reset all|
|`:`|text to be shown|
|`\$`|dollar sign|
|`\[\e[0;5m\]`| makes the following output blink. Note that the blink attribute may not be supported by all terminals (XTerm, tty will).
|`_`| the actual prompt, in this case an underscore|
|`\[${NC}\]`| resets all (color and formatting)
|`"`|The second and last quotation mark defines the end of the content of the variable. If you use a single quote for the first quotation mark you have to use it here, too.|
| |Without the tailing spaces the output looks very squeezed.|

Despite the human-readable format, configuring the prompt remains a small challenge.

Which colors already have been "transformed" into human-readable format you can learn while studying the file [~/.shellcfg/colors](/.shellcfg/colors).
In case you want to have more colors invoke `allcolors` in a terminal. This will show you a lot of color codes and how they will look like. You can then add the desired color codes to the [~/.shellcfg/colors](/.shellcfg/colors) file using the following format: `<unique color name>=<'color code'>` (the quotation marks are required) and you're good to go. In order to use that human-readable format, colors must be indicated in the prompt configuration as follows: `\[${COLORNAME}\]`. The specified color remains valid until another color is specified or reset with `\[${NC}\]`. Theoretically, up to [256 colors](https://misc.flogisoft.com/bash/tip_colors_and_formatting) can be used, but I recommend to limit yourself to the colors that `allcolors` outputs, since these are surely supported in the respective terminal.

## Modifying

If you want to modify or adapt the code for other shells, feel free to do so. Only the corresponding references and credits must be preserved. Don't adorn yourself with borrowed plumes, as you didn't come up with this whole soup on your own.

And now have fun!

[^1]: Well, that's actually only half the truth, because this only outputs 16 foreground colors plus 16 background colors in the possible combinations. Additionally there are blinking versions if the terminal supports this attribute. The colors themselves are usually available in a dark and a light version. This should be sufficient in most cases. But if, for example, fifty shades of gray are needed (pun intended), I have something up my sleeve. Type `truecolors` on the command line. If the terminal has the capability, you should now see the color codes for 256 colors. I know, true color would be 16 million colors. The name of the function is rather a reminiscence of the song by Cindy Lauper.
