#########################################################################
# BASH Config File							#
# Name: .bashrc								#
# Path: /home/$user/							#
# Based on Vagubunt's .bashrc (http://vagubunt.wordpress.com)		#
#									#
# Modified by Thomas Bernard						#
# Last changes: 20.01.2023 (or later)					#
#									#
# Some commands may not work on all distros, e.g. netstat on Arch-Linux	#
#									#
# THIS FILE with its associated files MAY OR MAY NOT WORK WITH OTHER	#
# SHELLS THAN BASH!							#
#									#
# CHANCES ARE THAT IT HAS TO BE MODIFIED AND PROBABLY RENAMED TO WORK	#
# WITH OTHER SHELLS!							#
# ksh configuration is typically found in ~/.kshrc, zsh uses ~/.zshrc	#
#									#
# YOU HAVE BEEN WARNED!							#
#									#
#########################################################################
#
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#
#----------------------------------------------------------------------------------------------------
# Backup the current .bashrc and .bashrc_*-files without overwriting the last backup. You'll never know...
# Watch for the number of backups in this folders.
# At first we look for the backup folder. If not exist create one
# If you're running another shell, e.g. zsh, it's mandatory to rename (directory and) file names accordingly
if [ -d ~/shellcfg/backup ]; then :
	else mkdir ~/shellcfg/backup
fi
#
if [ -f ~/shellcfg/backup/bashrc.backup ]; then
	cp -f -b ~/.bashrc ~/shellcfg/backup/bashrc.backup
    else
	cp -u ~/.bashrc ~/shellcfg/backup/bashrc.backup
fi
#
if [ -f ~/shellcfg/backup/alias.backup ]; then
	cp -f -b ~/shellcfg/.alias ~/bash_backup/alias.backup
    else
	cp -u ~/shellcfg/.alias ~/shellcfg/backup/alias.backup
fi
#
if [ -f ~/shellcfg/backup/functions.backup ]; then
	cp -f -b ~/shellcfg/.functions ~/shellcfg/backup/functions.backup
    else
	cp -u ~/shellcfg/.functions ~/shellcfg/backup/functions.backup
fi
#
if [ -f ~/shellcfg/backup/colors.backup ]; then
	cp -f -b ~/shellcfg/.colors ~/shellcfg/backup/colors.backup
    else
	cp -u ~/shellcfg/.colors ~/shellcfg/backup/colors.backup
fi
#
if [ -f ~/shellcfg/backup/what_shell.backup ]; then
	cp -f -b ~/shellcfg/.what_shell ~/shellcfg/backup/what_shell.backup
    else
	cp -u ~/shellcfg/.what_shell ~/shellcfg/backup/what_shell.backup
fi
cd ~
#----------------------------------------------------------------------------------------------------
# Read global settings if there are such things.
# It makes no sense to throw this in /etc/bash.bashrc.
#
if [ -f /etc/bashrc ]; then
        . /etc/bash.bashrc
fi
#
#----------------------------------------------------------------------------------------------------
# Define language variable
LANG=de_DE.UTF-8	# substitute de_DE.UTF-8 with your desired one
export LANG 
#
#----------------------------------------------------------------------------------------------------
# activates completion features (maybe activated already in /etc/bash.bashrc or /etc/profile
#if [ -f /etc/bash_completion.d ]; then
#	./etc/bash_completion
#fi
#
#----------------------------------------------------------------------------------------------------
# set variable identifying the chroot you work in (used in the prompt below)
# the file /etc/debian_chroot must be present and have content, otherwise almost nothing will happen
#
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    #debian_chroot=$(cat /etc/debian_chroot)
#fi
#----------------------------------------------------------------------------------------------------
# START COLORS, FUNCTIONS, & ALIASES
# Let us have some fancy colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#
# ALIASES
# if aliases can be found in ~/shellcfg/.aliases use it.
    if [ -f ~/shellcfg/alias ]; then
    . ~/shellcfg/.alias
    fi
#
# FUNCTIONS
# if functions can be found in ~/shellcfg/.functions use it.
    if [ -f ~/shellcfg/.functions ]; then
    . ~/shellcfg/.functions
    fi
#
# Colors
# if colors can be found in ~/shellcfg/.colors use it.
    if [ -f ~/shellcfg/.colors ]; then
    . ~/shellcfg/.colors
    fi
#
# Shell
# If ~/shellcfg/.what_shell can be found use it.
    if [ -f ~/shellcfg/.what_shell ]; then
    . ~/shellcfg/.what_shell
    fi
# If these -files do not live in ~/shellcfg/, you'll have a - more or less default - command prompt and perhaps that's about it - almost...
# END COLORS, FUNCTIONS, & ALIASES
fi
#
#----------------------------------------------------------------------------------------------------
#
# sudo hint (should be defined in /etc/bash.bashrc definiert)
#if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    #case " $(groups) " in *\ admin\ *)
    #if [ -x /usr/bin/sudo ]; then
   #cat <<-EOF
   #Um einen Befehl oder ein Programm als Administrator auszuführen "sudo <Befehl> benutzen".
   #Für mehr Details den Befehl "man sudo_root" im Terminal eingeben.

#EOF
    #fi
   #esac
#fi
#----------------------------------------------------------------------------------------------------
#
if [ -x /bin/most ]; then
    export PAGER=“most” #shows man pages in color (run sudo apt install most, if not present)
fi
#
#----------------------------------------------------------------------------------------------------
# It's the directories on the $PATH that show us the way
PATH=$PATH
# export PATH=$PATH:/place/with/the/file              #modify and uncomment this line to add folders to default path
#----------------------------------------------------------------------------------------------------
#
########################################################################
# Settings... (-s = set; -u = unset)
# more under http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
#.......................................................................
ulimit -S -c 0		# We don't want coredumps (state of memory at a certain time, generally when a program crashed)
set -o notify
set -o noclobber	# if set, bash will not overwrite existing files when using the redirection operands >, >&, and >>
#set -o ignoreeof
set -o nounset
#set -o xtrace		# helpfull while debugging.
#----------------------------------------------------------------------------------------------------
# anschalten
shopt -s autocd         # if only a directory name is entered, the directory is automatically changed
#shopt -s cdable_vars   # Set path variable, e.g. export ne="/etc/network/"
#shopt -s checkhash
shopt -s checkjobs      # before exiting an interactive shell, all running and stopped jobs are checked
shopt -s no_empty_cmd_completion # Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line
shopt -s cmdhist        # multi-line commands are saved in the same history entry - simplifies later editing
shopt -s lithist        # only in connection with "shopt -s cmdhist"; multiline entries are saved with embedded newlines instead of semicolons
shopt -s histappend     # Command history is appended to the existing one and is not overwritten.
shopt -s histreedit
shopt -s histverify
shopt -s nocaseglob     # Bash matches filenames in a case-insensitive fashion when performing filename expansion
#shopt -s extglob       # usefull for programmable completion
shopt -u cdspell        # if set, cdspell corrects minor typos in connection with the "cd" command
#----------------------------------------------------------------------------------------------------
# abschalten
shopt -u mailwarn
unset MAILCHECK         # no notification of incoming mails
#----------------------------------------------------------------------------------------------------
# UMOUNT VS. UNMOUNT
# Deutsche Fehlermeldung, wenn umount nicht richtig verwendet wird.
alias unmount='echo -e "${RED}Syntaxfehler${NC}: der Befehl lautet ${GREEN}umount${NC} (das ${RED}n${NC} nach dem ${RED}u${NC} weglassen)"';
#
# English error msg, when using umount incorrectly
# alias unmount='echo -e "${RED}Syntax Error${NC}: Please use ${GREEN}umount${NC} (without ${RED}n${NC} after ${RED}u${NC})"';
#
#----------------------------------------------------------------------------------------------------
# BASH HISTORY
# You can bind the up and down arrow keys to search through Bash's history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
# 
export HISTFILESIZE=100 # How many entries should be stored in history?
export HISTCONTROL=ignoredups # ignore duplicates
export HISTCONTROL=ignoreboth # ignore consecutive entries
export HISTTIMEFORMAT="%H:%M > " # time format used in the history
export HISTIGNORE="&:bg:fg:ll:h:dd" # commands that should not be included in the history
#----------------------------------------------------------------------------------------------------
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts
#----------------------------------------------------------------------------------------------------
# SCREEN
# checks the window size after each command and updates the number of rows and columns
shopt -s checkwinsize
#----------------------------------------------------------------------------------------------------
#
# Preparation for the animated intro when entering the interactive shell
spin ()
{
echo -ne "${RED}-"
echo -ne "${WHITE}\b|"
echo -ne "${BLUE}\bx"
sleep .01
echo -ne "${RED}\b+${NC}"
}
#################################################################################
## This is where the actual screen output starts
##
# At first we are looking for a file named ".logo". It has to live in your home dir.
# It must contain ascii art (or be empty) or it will produce garbage.
if [ -f ~/.logo ]; then
    # Also we look for lolcat, a little funny tool that will output simple (b/w) ascii art
    # with nice colors. If not installed, run "sudo apt install lolcat".
    if [ -x /usr/games/lolcat ]; then
    lolcat ~/.logo
    fi
else
#
# animated intro (Start)
# If ~/.logo and/or lolcat can't be found, we have an alternative and more informative output
#clear
echo -e " ";
for i in `seq 1 80` ; do spin; done ;echo "";
echo -ne "${WHITE}Welcome "`whoami`". ${NC}";
echo -e " ";
echo -e "${NC}"
echo -e "${LIGHTGRAY}SHELL:				${LIGHTGREEN}$MYSHELL ${LIGHTCYAN} (Version ${BASH_VERSION%.*})";
echo -e " ";
echo -e "${LIGHTGRAY}Host Name:		${LIGHTGREEN}" `uname -n`;
echo -e "${LIGHTGRAY}OS:		    	${LIGHTGREEN}" `uname -o`;
echo -e "${LIGHTGRAY}Kernel Release:		${LIGHTGREEN}" `uname -r`;
echo -e "${LIGHTGRAY}Kernel Version:    	${LIGHTGREEN}" `uname -v`;
echo -e "${LIGHTGRAY}Architecture:       	${LIGHTGREEN}" `uname -m`;
echo -e "$NC";
echo -e "${LIGHTCYAN}RAM:${LIGHTGREEN}";free -h;echo"";
echo -e "${NC}";
echo -e "${LIGHTCYAN}";netstat -i;echo "";  # not available in Arch-Linux
echo -e " ";
echo -e "${NC}";
# echo -ne "${LIGHTGREEN}";date '+%A, der %d.%m.%Y';
for i in `seq 1 80` ; do spin; done ;echo "";
fi
# animated intro (End)
echo -e "${NC}";
#----------------------------------------------------------------------------------------------------
#
#Clock in terminal (more or less useless since we have time output at the prompt
#
#clock ()
#{
#while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
#}
#
#----------------------------------------------------------------------------------------------------
# PROMPT
# Do we have color output? In most cases we do, but lets test it.
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
#----------------------------------------------------------------------------------------------------
#################################################################################################################################################
# Code fuer den Prompt:							# Codes for the prompt:							#
# \@ = Zeit								# \@ = time								#
# \u = aktueller Benutzer						# \u = current user							#
# \h = Rechnername							# \h = computer name 							#
# \t = Zeit								# \t = time								#
# \d = Datum								# \d = date								#
# \W = aktuelles Verzeichnis						# \W = current directory						#
# \w = kompleter Pfad zum aktuellen Verzeichnis				# \w = full path to current directory					#
# \n = neue Zeile							# \n = new line								#
# \j = Anzahl der z.Z. verwalteten Prozesse				# \j = number of currently managed processes				#
# \s = Name der Shell							# \s = shell name							#
# \v = die Version der Bash						# \v = the version of bash						#
# \\ = ein \								# \\ = a \								#
# \[ und \] = Alles was dazwischen steht wird nicht ausgegeben.		# \[ \] = Everything between \[ and \] is not output.			#
# Farbcodes gehören zwischen diese Zeichen, sonst kommt es zu		# Color codes belong between these characters, e.g. \[${LIGHTCYAN}\]	#
# Anzeigefehlern, e.g. \[${LIGHTCYAN}\] resp. \[\e[1;36m\].		# resp. \[\e[1;36m\], otherwise display errors will occur.		#
# Escape-Codes gehören _nicht_ dazwischen.				# Escape codes _do not_ belong in between.				#
# (Das sind nur die wichtigsten Escape-Codes, eine komplette Liste	# (These are only the most important escape codes, a complete list	#
# findet ihr in der Manpage der Bash <Befehl "man bash"> oder unter	# can be found in the bash manpage <command "man bash"> or under	#
# www.gnu.org/software/bash/manual/html_node/Printing-a-Prompt.html)	# www.gnu.org/software/bash/manual/html_node/Printing-a-Prompt.html)	#
#################################################################################################################################################
#
if [ "$color_prompt"=yes ]; then
    #PS1="\n\Systemzeit \A\n\u@\h: \w\a\:\$ "
    PS1="\n\[${LIGHTGRAY}\]Systemzeit \A\n\[${LIGHTCYAN}\]\u \[${YELLOW}\]@ \[${LIGHTGREEN}\]\h \[${LIGHTCYAN}\]\w\[${NC}\]:\$ "
else
    PS2="\n\Systemzeit \A\n\u@\h: \w\a\:\$ "
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
#	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	PS1="\n\[${LIGHTGRAY}\]Systemzeit \A\n\[${LIGHTBLUE}\]\u \[${YELLOW}\]@ \[${LIGHTGREEN}\]\h \[${LIGHTGREEN}\]\w\[${NC}\]:\$ "
    ;;
*)
    ;;
esac
