# The .bashrc-file

--------------------------------------------------------------------------------------------------------------------------

## For detailed information about this repo, please refer to the [wiki](/../../../../../TomfromBerlin/bashrc/wiki)

| ❗ | There is absolutely no warranty, that these files work. They may damage your system. USE IT AT YOUR OWN RISK!|
|-|:-|
| ❗ | If you want to use these files in shells other than bash, the code must be adapted.|

This [.bashrc](/.bashrc) produces a simple but nice output and is suitable for the average user. If you want more functionality while using e.g. GitHub then you should look for other repos like [Voku/dotfiles](../../../../../voku/dotfiles).

Suggestions are always welcome. If errors occur, I would be grateful for information on this and will take them into account accordingly.

## System requirements

This piece is intented to run on a Linux box with Bourne Again Shell (bash) as the default interactive shell.

Note that the amount of time before the command prompt or GUI is available can be increased. The weaker the hardware, the longer it can take (it seems logical).

You will only need the follwing files:

+ [~/.bashrc](/.bashrc) (necessary)
+ [~/.shellcfg/logos/example](/.shellcfg/logos/raspberrypi) (optional, the term "example" is to be understood as a placeholder)
+ [~/.shellcfg/alias](/.shellcfg/alias) (necessary for full functionality)
+ [~/.shellcfg/colors](/.shellcfg/colors) (optional, necessary for color prompt and other color gimmicks)
+ [~/.shellcfg/functions](/.shellcfg/functions) (necessary for enhanced functionality)
+ [~/.shellcfg/what_shell](/.shellcfg/what_shell) (optional, see also wiki page [What-the-(S)hell](/../../../../..//TomfromBerlin/bashrc/wiki/What-the-(S)hell))

The [~/.bashrc](/.bashrc) has to be a script file but without shebang `#!/bin/bash`. The other files must not be script files, only text files. Otherwise an error message will probably appear.

If any of these files (except for [.bashrc](/.bashrc)) are missing, the shell will still work. However, under certain circumstances (e.g., your `/etc/bash.bashrc` as well as your `~/.profile` don't contain alias definitions or functions) no or at least lesser [aliases](/.shellcfg/alias) or [functions](/.shellcfg/functions) will then be available. If [/.shellcfg/colors](/.shellcfg/colors) is missing, the prompt will still appear colored (lack of color support should be the exception), but customization will be more challenging, since you need to use color codes (see wiki page about [configuration of the prompt](/../../../../../TomfromBerlin/bashrc/wiki/Configure-your-prompt-conveniently)).

Other things that come with the zip file may also be important, but not required.

## How to use this

If you want to use this stuff, you need do do a few simple things:

### Downloading as ZIP File
When you downloaded the zip file use the following commands:

```bash
$ cd ~
$ cp -i .bashrc bashrc.old
$ cd </download/directory/>
$ unzip bashrc-main.zip
$ cd bashrc-main
$ cp -iR .bashrc .shellcfg ~/
$ cd ~
$ source .bashrc
```  

### Using Git
Its a bit easier to clone the repo with `git`. The directory will be just called bashrc and you don't have to extract the files. If you want this you can use the following commands:

```bash
$ cd ~
$ cp -i .bashrc bashrc.old
$ git clone https://github.com/TomfromBerlin/bashrc
$ cd bashrc
$ cp -iR .bashrc .shellcfg ~/
$ cd ~
$ source .bashrc
```

`git` should be installed by default on your Linux box. If not, just type `sudo apt-get install git` (replace apt-get according to your distribution's command, e.g. yum or dfn) in the command line and press Enter.

If you leave it as it is, next time you start an interactive shell, the result looks like this (assuming you have [lolcat](/../../../../../TomfromBerlin/bashrc/wiki/Optional-Programs) installed). The colors are slightly different each time you start an interactive shell:

![screenshot of the terminal output with logo](terminal_logo.jpg)

_The logo does not appear every time you issue a command. That would be annoying. You can recall the logo at any time with the command `lolcat ~/.shellcfg/logos/raspberrypi`, or `cat ~/.shellcfg/logos/raspberrypi` for grayscale output._

If you don't want to see a logo, just rename or delete the file in the /.shellcfg/logos/ directory. If the file named "raspberrypi" does not exist (or `lolcat` can't be found), a small text-based intro with some system information is output. Then the result looks like this:

![screenshot of the terminal output with intro](terminal_intro.jpg)

If you want to change the logo read the wiki page on [how to](/../../../../../TomfromBerlin/bashrc/wiki/Changing-the-logo) do it.

If `lolcat` and/or the logo file in ~/.shellcfg/logos directory doesn't exist on your system and you don't see anything at all except the command prompt, the ~/.shellcfg/colors file is probably missing. This is no drama, you can still do your work, albeit less colorful.

Have fun and be nice.

--------------------------------------------------------------------------------------------------

# To do

- [ ] \(Optional) adding a handy rollback feature (rollback should be invoked by one command)
- [ ] \(Optional) make the screen output bilingual 🇩🇪 🇺🇸
- [ ] \(Optional) make more logos in ascii art for other distros and let the system decide wich one has to be shown
- [ ] \(Optional) cancel full time job 🏴‍☠️
- [ ] \(Optional) ❓
- [ ] \(Optional) become rich 💎🍾
- [ ] \(Optional) make more stuff
- [ ] \(Optional) make even more stuff
