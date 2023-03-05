#
#################################################################################
# BASH Config File																#
# Name: .bashrc																	#
# Path: /$home/$user/															#
#																				#
# made by TomfromBerlin															#
# https://github.com/TomfromBerlin												#
# Last changes: 04.03.2023														#
#																				#
#																				#
#			Some commands or functions may not work on all distros				#
#		THERE IS A CHANCE THAT IT HAS TO BE MODIFIED AND PROBABLY RENAMED		#
#						TO WORK WITH OTHER SHELLS!								#
#																				#
#################################################################################
#
#################################################################################
#																				#
#			Everything below this line comes without warranty of any kind.		#
#						Use these files at your own risk!						#
#																				#
#################################################################################
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#
#----------------------------------------------------------------------------------------------------
# Backup the current .bashrc and associated files without overwriting the last backup. You'll never know...
# At first we look for the backup folder. If not exist create one
if [ -d $HOME/.shellcfg/backup ]; then : ; else mkdir $HOME/.shellcfg/backup; fi
# Now we will make backups, but only if changes are made
if [ -f $HOME/.shellcfg/backup/bashrc.backup ]; then cp -up -b $HOME/.bashrc $HOME/.shellcfg/backup/bashrc.backup; else cp -up $HOME/.bashrc $HOME/.shellcfg/backup/bashrc.backup; fi
if [ -f $HOME/.shellcfg/backup/alias.backup ]; then cp -up -b $HOME/.shellcfg/alias $HOME/.shellcfg/backup/alias.backup; else cp -up $HOME/.shellcfg/alias $HOME/.shellcfg/backup/alias.backup; fi
if [ -f $HOME/.shellcfg/backup/functions.backup ]; then cp -up -b $HOME/.shellcfg/functions $HOME/.shellcfg/backup/functions.backup; else cp -up $HOME/.shellcfg/functions $HOME/.shellcfg/backup/functions.backup; fi
if [ -f $HOME/.shellcfg/backup/colors.backup ]; then cp -up -b $HOME/.shellcfg/colors $HOME/.shellcfg/backup/colors.backup; else cp -up $HOME/.shellcfg/colors $HOME/.shellcfg/backup/colors.backup; fi
if [ -f $HOME/.shellcfg/backup/what_shell.backup ]; then cp -up -b $HOME/.shellcfg/what_shell $HOME/.shellcfg/backup/what_shell.backup; else cp -up $HOME/.shellcfg/what_shell $HOME/.shellcfg/backup/what_shell.backup; fi
# and we go back to home
cd $HOME/  || return
#
#----------------------------------------------------------------------------------------------------
# Read global settings if there are such things.
# It makes no sense to throw this in /etc/bash.bashrc.
#
if [ -f /etc/bash.bashrc ]; then . /etc/bash.bashrc; fi
#
#----------------------------------------------------------------------------------------------------
# activates completion features (probably already activated in /etc/bash.bashrc or /etc/profile)
if [ -f /etc/bash_completion ]; then . /etc/bash_completion ; fi
#
# If you have your own bash_completion file put it in ~/.bash_completion.d
if [ -d $HOME/bash_completion.d ]; then
for ownbcfile in ~/.bash_completion.d/* ; do
	[ -f "$ownbcfile" ] && . "$ownbcfile"
done
fi
#
# Some developers put their own bash_completion in /etc/bash_completion.d
# We will use it, if present
if [ -d /etc/bash_completion.d ]; then
for bcfile in /etc/bash_completion.d/* ; do
	[ -f "$bcfile" ] && . "$bcfile"
done
fi
#
#----------------------------------------------------------------------------------------------------
# set variable identifying the chroot you work in (used in the prompt below)
# the file /etc/debian_chroot must be present and have content, otherwise almost nothing will happen
#
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#----------------------------------------------------------------------------------------------------
# START COLORS, FUNCTIONS, & ALIASES
#
if [ -x /usr/bin/dircolors ]; then test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"; fi
if [ -f $HOME/.shellcfg/colors ]; then . $HOME/.shellcfg/colors; else echo -e "Where have all the colors gone..."; fi
if [ -f $HOME/.shellcfg/alias ]; then . $HOME/.shellcfg/alias; else echo -e "There will be no or less aliases, since the alias file is missing."; fi
if [ -f $HOME/.shellcfg/functions ]; then . $HOME/.shellcfg/functions; else echo -e "\n\e[1;32m Unfortunately, some functions are not available,\n because the file \e[33;31m"$HOME"/.shellcfg/functions\e[49m\e[1;32m is missing.\n"; fi
#
# END COLORS, FUNCTIONS, & ALIASES
#
#----------------------------------------------------------------------------------------------------
#
# sudo hint (should be defined in /etc/bash.bashrc)
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
#
#----------------------------------------------------------------------------------------------------
#
# It's the directories on the $PATH that show us the way to our files
PATH=$PATH				# This will read when an interactive shell will be started
export PATH=$PATH:/usr/games/		# separate entries with ":"
#----------------------------------------------------------------------------------------------------
#
#####################################################################################################
# Builtin-Settings... (-s Enable (set) each optname; -u Disable (unset) each optname; -q Suppresses normal output; the return status indicates whether the optname is set or unset. If multiple optname arguments are given with -q, the return status is zero if all optnames are enabled; non-zero otherwise.
# more under https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin
#.......................................................................
ulimit -S -c 0		# We don't want coredumps (state of memory at a certain time, generally when a program crashed)
set -o notify
set -o noclobber	# if set, bash will not overwrite existing files when using the redirection operands >, >&, and >>
# set -o ignoreeof
set -o nounset
# set -o xtrace		# helpfull while debugging.
#----------------------------------------------------------------------------------------------------
# shopt builtin
# anschalten
#
shopt -s autocd         # if only a directory name is entered, the directory is automatically changed
# shopt -s cdable_vars  # Set path variable, e.g. export ne="/etc/network/"
shopt -s checkhash      # If this is set, Bash checks that a command found in the hash table exists before trying to execute it. If a hashed command no longer exists, a normal path search is performed.
shopt -s checkjobs      # before exiting an interactive shell, all running and stopped jobs are checked
shopt -s no_empty_cmd_completion # If Readline is being used Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line.
shopt -s cmdhist        # multi-line commands are saved in the same history entry - simplifies later editing
shopt -s lithist        # only in connection with "shopt -s cmdhist"; multiline entries are saved with embedded newlines instead of semicolons
shopt -s histappend     # Command history is appended to the existing one and is not overwritten.
shopt -s histreedit
shopt -s histverify
shopt -s nocaseglob     # Bash matches filenames in a case-insensitive fashion when performing filename expansion
shopt -s dotglob        # If set, Bash includes filenames beginning with a "." in the results of filename expansion. The filenames "." and ".." must always be matched explicitly, even if dotglob is set.
shopt -s extglob        # usefull for programmable completion
shopt -s cdspell        # if set, cdspell corrects minor typos in connection with the "cd" command
shopt -s dirspell       # If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
#----------------------------------------------------------------------------------------------------
# abschalten
shopt -u mailwarn
unset MAILCHECK         # no notification of incoming mails
#----------------------------------------------------------------------------------------------------
# BASH HISTORY
# You can bind the up and down arrow keys to search through Bash's history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind Space:magic-space
export HISTFILESIZE=100 # How many entries should be stored in history?
export HISTCONTROL=ignoreboth #... or force ignoredups and ignorespace, ignore consecutive entries 
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups:erasedups # ignore duplicates, do not overwrite GNU Midnight Commanders setting of 'ignorespace'.
export HISTTIMEFORMAT="%H:%M > " # time format used in the history
export HISTIGNORE="&:bg:fg:ll:h:dd" # commands that should not be included in the history
#----------------------------------------------------------------------------------------------------
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts
export COLORTERM=truecolor
export VISUAL=nano
export EDITOR="$VISUAL"
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
# At first we are looking for a file named "$HOME/.shellcfg/logos/raspberrypi". It must be a text file (or be empty) or you will see garbage on the screen
# Then we look for lolcat...
if [ -f $HOME/.shellcfg/logos/raspberrypi~ ] && [ -x /usr/games/lolcat ]; then /usr/games/lolcat $HOME/.shellcfg/logos/raspberrypi;
# If we were successful we have an output, and we are done: the prompt will pop up.
# Otherwise continue here...
else
# animated intro (Start)
#clear
# ...but we need the file $HOME/.shellcfg/colors to be present.
if [ -f "$HOME"/.shellcfg/colors ]; then echo -e " ";
for i in {1..80} ; do spin; done; echo "";
echo -e "${NC}";
echo -e "${WHITE}Welcome "$(whoami)". ${NC}";
echo -e "${NC}";
echo -e "${NC}";
echo -e "${WHITE}OS:			${LIGHTGREEN}" "$(uname -o)";
if [ -f /etc/os-release ]; then echo -e "${WHITE}Distribution:		${LIGHTGREEN} "$(DISTNAME)" "$(DISTVER)""; else : ; fi;
echo -e "${WHITE}Kernel Release:		${LIGHTGREEN}" "$(uname -r)";
echo -e "${WHITE}Kernel Version:		${LIGHTGREEN}" "$(uname -v)";
echo -e "${WHITE}Architecture:		${LIGHTGREEN}" "$(uname -m)";
echo -e "${WHITE}Host Name:		${LIGHTGREEN}" "$(uname -n)";
echo -e "${NC}";
if [ -f $HOME/.shellcfg/what_shell ]; then echo -e "${WHITE}SHELL:			${LIGHTGREEN}" "$(. $HOME/.shellcfg/what_shell)"; fi;
echo -e "$NC";
if [ -x /bin/free ]; then echo -e "${LIGHTCYAN}";free -h;echo "";
echo -e "${NC}"; fi;
if [ -x /bin/netstat ]; then echo -e "${LIGHTBLUE}";netstat -i;echo "";
echo -e "${NC}"; fi;
for i in {1..80} ; do spin; done; echo "";
# animated intro (End)
echo -e "${NC}";
fi
fi
echo -e "${YELLOW}";sdate;
#
#----------------------------------------------------------------------------------------------------
# PROMPT
# Do we have color output? In most cases we do, but lets test it.
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it is compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
#
#----------------------------------------------------------------------------------------------------
#
case $USER in
  "root") PS_COLOR='\e[0;31m';;
  *) PS_COLOR='\e[0;32m';;
esac
#
if [ -f "$HOME"/.shellcfg/colors ]; then
    if [ "$color_prompt" = yes ]; then
#	PS1="\n\Systemzeit \A\n\u@\h: \w\a\:\$"
	export PS1="\n\[${WHITE}\]Systemzeit \A\n\[${LIGHTCYAN}\]\[${PS_COLOR}\]\u \[${YELLOW}\]@ \[${LIGHTGREEN}\]\h: \[${LIGHTCYAN}\]\w\[${NC}\]\$"; else PS2="\n\Systemzeit \A\n\u@\h: \w\a\$"; fi
    unset color_prompt force_color_prompt
    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
#	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1\]"
	export PS1="\n\[${WHITE}\]Systemzeit \A\n\[${LIGHTBLUE}\]\[${PS_COLOR}\]\u\[${YELLOW}\]@\[${LIGHTGREEN}\]\h: \[${LIGHTGREEN}\]\w\[${NC}\]\$"
	;;
    *)
        ;;
    esac
else
    if [ "$color_prompt" = yes ]; then PS1="\n\[\e[0;37m\]Systemzeit \A\n\[${PS_COLOR}\]\u\[\e[1;33m\]@\e[1;32m\h: \[\e[1;32m\]\w\\[\e[0m\]\$"; else PS2="\n\[\e]Systemzeit \A\n\u@\h: \w\a\$"; fi
    unset color_prompt force_color_prompt
    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
	Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
#	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	export PS1="\n\[\e[0;37m\]Systemzeit \A\n\[${PS_COLOR}\]\u\[\e[1;33m\]@\[\e[1;32m\]\h: \[\e[1;32m\]\w\[\e[0m\]\$"
        ;;
    *)
        ;;
    esac
fi
#
#################################################################################################################################################
# Code fuer den Prompt:													# Codes for the prompt:													#
# \@ = Zeit																# \@ = time																#
# \u = aktueller Benutzer												# \u = current user														#
# \h = Rechnername														# \h = computer name													#
# \t = Zeit																# \t = time																#
# \d = Datum															# \d = date																#
# \W = aktuelles Verzeichnis											# \W = current directory												#
# \w = kompleter Pfad zum aktuellen Verzeichnis							# \w = full path to current directory									#
# \n = neue Zeile														# \n = new line															#
# \j = Anzahl der z.Z. verwalteten Prozesse								# \j = number of currently managed processes							#
# \s = Name der Shell													# \s = shell name														#
# \v = die Version der Bash												# \v = the version of bash												#
# \\ = ein \															# \\ = a \																#
# \[ und \] = Alles was dazwischen steht wird nicht ausgegeben.			# \[ \] = Everything between \[ and \] is not output.					#
# Farbcodes gehören zwischen diese Zeichen, sonst kommt es zu			# Color codes belong between these characters, e.g. \[${LIGHTCYAN}\]	#
# Anzeigefehlern, e.g. \[${LIGHTCYAN}\] resp. \[\e[1;36m\].				# resp. \[\e[1;36m\], otherwise display errors will occur.				#
# Escape-Codes gehören _nicht_ dazwischen.								# Escape codes _do not_ belong in between.								#
# (Das sind nur die wichtigsten Escape-Codes, eine komplette Liste		# (These are only the most important escape codes, a complete list		#
# findet ihr in der Manpage der Bash <Befehl: man bash> oder unter		# can be found in the bash manpage <command: man bash> or under			#
#							https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt											#
#################################################################################################################################################
# End of .bashrc
#----------------------------------------------------------------------------------------------------
