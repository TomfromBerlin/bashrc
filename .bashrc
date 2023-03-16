#
#################################################################################
# BASH Config File                                                              #
# Name: .bashrc                                                                 #
# Path: /$home/$user/                                                           #
#                                                                               #
# made by TomfromBerlin                                                         #
# https://github.com/TomfromBerlin                                              #
# Last changes: 04.03.2023                                                      #
#                                                                               #
#                                                                               #
#         Some commands or functions may not work on all distros                #
#     THERE IS A CHANCE THAT IT HAS TO BE MODIFIED AND PROBABLY RENAMED         #
#                      TO WORK WITH OTHER SHELLS!                               #
#                                                                               #
#################################################################################
#
#################################################################################
#                                                                               #
#      Everything below this line comes without warranty of any kind.           #
#                    Use these files at your own risk!                          #
#                                                                               #
#################################################################################
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#
#################################################################################
# put the following lines in your /etc/bash.bashrc
## Prevent doublesourcing
# if [ -z "$BASHRCSOURCED" ]; then
#  BASHRCSOURCED="Y"
#
## Set default umask for non-login shell only if it is set to 0
#    [ `umask` -eq 0 ] && umask 022
#
#################################################################################
#
#----------------------------------------------------------------------------------------------------
# Backup the current .bashrc and associated files without overwriting the last backup. You'll never know...
# At first we look for the backup folder. If not exist create one
if [[ -d $HOME/.shellcfg/backup ]]; then : ; else mkdir $HOME/.shellcfg/backup; fi
# Now we will make backups, but only if changes are made
if [[ -f $HOME/.shellcfg/backup/bashrc.backup ]]; then cp -up -b $HOME/.bashrc $HOME/.shellcfg/backup/bashrc.backup; else cp -up $HOME/.bashrc $HOME/.shellcfg/backup/bashrc.backup; fi
if [[ -f $HOME/.shellcfg/backup/shell_alias.backup ]]; then cp -up -b $HOME/.shellcfg/shell_alias $HOME/.shellcfg/backup/shell_alias.backup; else cp -up $HOME/.shellcfg/shell_alias $HOME/.shellcfg/backup/shell_alias.backup; fi
if [[ -f $HOME/.shellcfg/backup/shell_functions.backup ]]; then cp -up -b $HOME/.shellcfg/shell_functions $HOME/.shellcfg/backup/shell_functions.backup; else cp -up $HOME/.shellcfg/shell_functions $HOME/.shellcfg/backup/shell_functions.backup; fi
if [[ -f $HOME/.shellcfg/backup/shell_colors.backup ]]; then cp -up -b $HOME/.shellcfg/shell_colors $HOME/.shellcfg/backup/shell_colors.backup; else cp -up $HOME/.shellcfg/shell_colors $HOME/.shellcfg/backup/shell_colors.backup; fi
if [[ -f $HOME/.shellcfg/backup/what_shell.backup ]]; then cp -up -b $HOME/.shellcfg/what_shell $HOME/.shellcfg/backup/what_shell.backup; else cp -up $HOME/.shellcfg/what_shell $HOME/.shellcfg/backup/what_shell.backup; fi
# and we go back to home
cd $HOME/  || return
#
#----------------------------------------------------------------------------------------------------
# Read global settings if there are such things.
# It makes no sense to throw this in /etc/bash.bashrc.
#
if [[ -f /etc/bash.bashrc ]]; then . /etc/bash.bashrc; fi
#
#----------------------------------------------------------------------------------------------------
# activates bash completion features (probably already activated in /etc/bash.bashrc or /etc/profile)
if [[ -f /etc/bash_completion ]]; then . /etc/bash_completion; fi
#
# If you have your own bash_completion file put it in ~/.bash_completion.d
if [[ -d $HOME/bash_completion.d ]]; then for ownbcfile in ~/.bash_completion.d/* ; do [ -f "$ownbcfile" ] && . "$ownbcfile"; done; fi
#
# Some developers put their own bash_completion in /etc/bash_completion.d
# We will use it, if present
if [[ -d /etc/bash_completion.d ]]; then for bcfile in /etc/bash_completion.d/* ; do [ -f "$bcfile" ] && . "$bcfile"; done; fi
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
if [[ -x /usr/bin/dircolors ]]; then test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"; fi
if [[ -f $HOME/.shellcfg/shell_colors ]]; then . $HOME/.shellcfg/shell_colors; else echo -e "Where have all the colors gone..."; fi
if [[ -f $HOME/.shellcfg/shell_alias ]]; then . $HOME/.shellcfg/shell_alias; else echo -e "There will be no or less aliases, since the alias file is missing."; fi
if [[ -f $HOME/.shellcfg/shell_functions ]]; then . $HOME/.shellcfg/shell_functions; else echo -e "\n\e[1;32m Unfortunately, some functions are not available,\n because the file \e[33;31m"$HOME"/.config/shellcfg/functions\e[49m\e[1;32m is missing.\n"; fi
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
export PATH=$PATH	# This will read when an interactive shell will be started
# export PATH=$PATH$( shopt -s globstar; printf ':%s' "$PWD"/**/; ) # append all subdirectories of $HOME to path
#----------------------------------------------------------------------------------------------------
#
#####################################################################################################
# BASH Builtin-Settings... (-s Enable (set) each optname; -u Disable (unset) each optname; -q Suppresses normal output; the return status indicates whether the optname is set or unset. If multiple optname arguments are given with -q, the return status is zero if all optnames are enabled; non-zero otherwise.
# more under https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin
#.......................................................................
ulimit -S -c 0		# We don not want coredumps (state of memory at a certain time, generally when a program crashed)
set -o notify
set -o noclobber	# if set bash will not overwrite existing files when using the redirection operands >, >&, >> 
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
# turn off
shopt -u mailwarn       # no notification of incoming mails
unset MAILCHECK         # check for new mails
#----------------------------------------------------------------------------------------------------
# BASH HISTORY
# You can bind the up and down arrow keys to search through Bash's history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind Space:magic-space
#----------------------------------------------------------------------------------------------------
# SCREEN
# checks the window size after each command and updates the number of rows and columns
shopt -s checkwinsize
# ---------------------------------------------------------------------------------------------------
HISTFILESIZE=1000 # How many entries should be stored in history?
HISTSIZE=100 # Only load the last 1000 lines from your ~/.bash_history -- if you need an older entry, just grep that file.
HISTCONTROL=ignoreboth #... or force ignoredups and ignorespace, ignore consecutive entries 
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups:erasedups # ignore duplicates, do not overwrite GNU Midnight Commanders setting of 'ignorespace'.
HISTTIMEFORMAT="%H:%M > " # time format used in the history
HISTIGNORE="&:?:??" # do not remember trivial 1- and 2-letter commands
# Save each history entry immediately (protects against terminal crashes/disconnections, and interleaves
# commands from multiple terminals in correct chronological order).
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
#----------------------------------------------------------------------------------------------------
# export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts
export COLORTERM=truecolor
export VISUAL=nano
export EDITOR="$VISUAL"
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
# At first we are looking for a file named "$HOME/.config/shellcfg/logos/raspberrypi". It must be a text file (or be empty) or you will see garbage on the screen
# Then we look for lolcat...
if [ -f $HOME/.shellcfg/logos/raspberrypi~ ] && [ -x /usr/games/lolcat ]; then /usr/games/lolcat $HOME/.shellcfg/logos/raspberrypi;
# If we were successful we have an output, and we are done: the prompt will pop up.
# Otherwise continue here...
else
# animated intro (Start)
#clear
# ...but we need the file $HOME/.shellcfg/shell_colors to be present.
if [[ -f "$HOME"/.shellcfg/shell_colors ]]; then echo -e " ";
for i in {1..80} ; do spin; done; echo "";
echo -e "${NC}";
echo -e "${WHITE}Welcome "$(whoami)". ${NC}";
echo -e "${NC}";
echo -e "${NC}";
echo -e "${WHITE}OS:			${LIGHTGREEN}" "$(uname -o)";
if [[ -f /etc/lsb-release ]]; then echo -e "${WHITE}Distribution:		${LIGHTGREEN} "$(lsb_release -ds)" "$(lsb_release -rs)" "$(lsb_release -c)""; else if [[ -f /etc/os-release ]]; then echo -e "${WHITE}Distribution:		${LIGHTGREEN} "$(distname)" "$(distver)""; else :; fi; fi;
echo -e "${WHITE}Kernel Release:		${LIGHTGREEN}" "$(uname -r)";
echo -e "${WHITE}Kernel Version:		${LIGHTGREEN}" "$(uname -v)";
echo -e "${WHITE}Architecture:		${LIGHTGREEN}" "$(uname -m)";
echo -e "${WHITE}Hostname:		${LIGHTGREEN}" "$(uname -n)";
echo -e "${NC}";
if [[ -f $HOME/.shellcfg/what_shell ]]; then echo -e "${WHITE}SHELL:			${LIGHTGREEN}" "$(. $HOME/.shellcfg/what_shell)"; fi;
echo -e "$NC";
if [[ -x /bin/free ]]; then echo -e "${LIGHTCYAN}";free -h;echo "";
echo -e "${NC}"; fi;
if [[ -x /bin/netstat ]]; then echo -e "${LIGHTBLUE}";netstat -i;echo "";
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
if [[ -n "$force_color_prompt" ]]; then
    if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it is compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	    color_prompt=yes
        case $USER in
            "root") PS_COLOR='\e[0;31m' ;;
            *) PS_COLOR='\e[0;35m' ;;
        esac
    else
    	color_prompt=
    fi
fi
#
#----------------------------------------------------------------------------------------------------
#
active_shell="$(ps -cp "$$" -o command="")"
if [[ -f $HOME/.shellcfg/shell_colors ]]; then
        trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG
        if [ "$color_prompt" = yes ]; then
	        PS1="\n\[${WHITE}\]Systemzeit \A\n\[${PS_COLOR}\][${active_shell}]: \[${LIGHTCYAN}\]\w\[${NC}\]$ "
	        PS2="\n\[${PS_COLOR}\][${active_shell}] \[${LIGHTCYAN}\] is waiting for input\[${NC}\]: "
            unset color_prompt force_color_prompt
            # If this is an xterm set the title to user@host:dir
            case "$TERM" in
            Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
        #   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1\]"
	        PS1="\n\[${WHITE}\]\A\n\[${GREEN}\][\[${PS_COLOR}\]\[${active_shell}\]\[${GREEN}\]]\[${WHITE}\]: \[${CYAN}\]\w\[${NC}\]$ "
		PS2="\n\[${PS_COLOR}\][${active_shell}] \[${LIGHTCYAN}\]is waiting for user input\[${NC}\]: "
	        ;;
            *)
            ;;
            esac
        fi
else
    trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG
        if [ "$color_prompt" = yes ]; then
            PS1="\n\[\e[0;37m\]Systemzeit \A\n\[${PS_COLOR}\][${active_shell}]: \[\e[1;32m\]\w\[\e[m\]\$ "
            unset color_prompt force_color_prompt
            # If this is an xterm set the title to user@host:dir
            case "$TERM" in
	        Eterm*|alacritty*|aterm|foot|gnome*|interix|konsole*|kterm|putty*|rxvt*|tmux*|xterm*)
        #	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	        PS1="\n\[\e[0;37m\]Systemzeit \A\n\[${PS_COLOR}\][${active_shell}]: \[\e[1;32m\]\w\[\e[m\]$ "
		PS1="\n\[${PS_COLOR}\][${active_shell}] \[\e[1;32m\]is waiting for user input\[\e[m\]: "
            ;;
            *)
            ;;
            esac
        fi
fi
#
#################################################################################################################################################
# Code fuer den Prompt:                                               # Codes for the prompt:                                                   #
# \@ = Zeit                                                           # \@ = time                                                               #
# \u = aktueller Benutzer                                             # \u = current user                                                       #
# \h = Rechnername                                                    # \h = computer name                                                      #
# \t = Zeit                                                           # \t = time                                                               #
# \d = Datum                                                          # \d = date                                                               #
# \W = aktuelles Verzeichnis                                          # \W = current directory                                                  #
# \w = kompleter Pfad zum aktuellen Verzeichnis                       # \w = full path to current directory                                     #
# \n = neue Zeile                                                     # \n = new line                                                           #
# \j = Anzahl der z.Z. verwalteten Prozesse                           # \j = number of currently managed processes                              #
# \s = Name der Shell                                                 # \s = shell name                                                         #
# \v = die Version der Bash                                           # \v = the version of bash                                                #
# \\ = ein \                                                          # \\ = a \                                                                #
# \[ und \] = Alles was dazwischen steht wird nicht ausgegeben.       # \[ \] = Everything between \[ and \] is not output.                     #
# Farbcodes gehören zwischen diese Zeichen, sonst kommt es zu         # Color codes belong between these characters, e.g. \[${LIGHTCYAN}\]	#
# Anzeigefehlern, e.g. \[${LIGHTCYAN}\] resp. \[\e[1;36m\].           # resp. \[\e[1;36m\], otherwise display errors will occur.                #
# Escape-Codes gehören _nicht_ dazwischen.                            # Escape codes _do not_ belong in between.                                #
# (Das sind nur die wichtigsten Escape-Codes, eine komplette Liste    # (These are only the most important escape codes, a complete list        #
# findet ihr in der Manpage der Bash <Befehl: man bash> oder unter    # can be found in the bash manpage <command: man bash> or under           #
#                              https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt                                        #
#################################################################################################################################################
# End of .bashrc
#----------------------------------------------------------------------------------------------------
