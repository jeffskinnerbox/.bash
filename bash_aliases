# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.0.7
#
# DESCRIPTION:
# This script contains Bash aliases and functions and should be sourced within
# the Bash resource file, .bashrc
#
# USAGE:
#   1. Save this file as ~/.bash/bash_aliases
#   2. Add the following line somewhere within your ~/.bashrc or ~/.bash_profile:
#      source ~/.bash/bash_aliases
#



################################### Aliases ###################################

# Must set this option, else script will not expand aliases.
shopt -s expand_aliases

# Short-hand commands for commonly used programs
if [ "${OPSYS}" = 'Linux' ]; then
    # When using Vi, use Vim with multiple files within separate tabs
    if [ $(wmctrl -m | grep Name | awk '{ print $2 }') = 'i3' ]; then
        alias vi='vim -p'       # if in i3 window manager, open in current window
    else
        alias vi='vim -g -p'    # if not in i3 window manager, use GUI mode (open new window)
    fi
    else
        # open Vim in a seperate window
        alias vim='gnome-terminal --execute vim "$@"'
fi

alias clr='clear'                       # clear the screen
alias cls='clear'                       # clear the screen
alias chrome='chromium-browser'         # Linux version of Chrome web browser
alias grc='gnuradio-companion'          # Short hand for GNU Radio Companion
alias du='du -kh'                       # Makes a more readable output of estimated file space usage
alias df='df -kh'                       # Makes a more readable output of file system disk space usage
alias ports='netstat -tulanp'           # list all TCP/UDP port

# update Debien / Ubuntu distro in one commandline
#alias update='sudo apt-get update && sudo apt-get upgrade'
alias update='sudo apt-get update && sudo apt-get dist-upgrade'

# Enables color support of ls, grep, and other colorized utilities
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add some easy shortcuts for formatted directory listings and add a touch of color.
if [ "${OPSYS}" = 'OS X' ]; then
    alias ls='ls -G'                    # color by file type
    alias lsl='ls -G -l'                # long form
    alias lsa='ls -G -A'                # show hiden files
    alias la='ls -G -A'                 # show hiden files
    alias lsal='ls -G -A -l'            # long form with hiden files
    alias ls.='ls -G -d .*'             # show only hidden files
else
    alias ls='ls --color=auto'          # color by file type
    alias lsl='ls --color=auto -l'      # long form
    alias lsa='ls --color=auto -A'      # show hiden files
    alias la='ls --color=auto -A'       # show hiden files
    alias lsal='ls --color=auto -A -l'  # long form with hiden files
    alias ls.='ls --color=auto -d .*'   # show only hidden files
fi
alias ll='ls -alF'
alias l='ls -CF'

# Make some possibly destructive commands more safe & interactive
if [ "${OPSYS}" = 'OS X' ]; then
    alias rm='rm -i'
else
    alias rm='rm -I'
fi
alias mv='mv -i'
alias cp='cp -i'

alias meminfo='free -m -l -t'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'  # top 10 processes eating memory
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'  # top 10 processes eating CPU
alias path='echo -e ${PATH//:/\\n}'                 # pretty-print PATH

# Quick navigation of the directory
# See http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

# display all iptables rules
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'

# Pretty print formatting for text, source code, markup, and other similar kinds of content.
alias pf_json='python -m json.tool'                        # pretty format JSON
alias pp_json='python -m json.tool | pygmentize -l json'   # pretty print JSON

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


################################## Functions ##################################

# Remove files to Trash (this located at ~/.local/share/Trash) instead of deleting them.
# Trash is part of the FreeDesktop.org Trash Specification. It remembers the name,
# original path, deletion date, and permissions of each trashed file.
# Also see utilities list-trash, restore-trash, and empty-trash.
function rmt {
    trash $*                 # NOTE: for Mac OX, you must do "brew install trash"
}

# Move files to $HOME/tmp instead of deleting them
function rmtmp {
    mv $* $HOME/tmp
}

# Set the title of the terminal window
function term_title {
    echo -ne "\033]0;$*\007"
}

# This function will be automatically run upon exit of shell
function _exit {
    echo -e "${BRed}Hasta la vista from $(uname -n), baby!${NColor}"
    sleep 1
}
trap _exit EXIT

# remove all directories and their files
function rm_dir {
    echo -e ${ALERT}
    ask "This will delete all directories and their files.  Consider using rmdir = remove only empty directories, rmt = move directories and file to trash, or rmtmp = move the directory to $HOME/tmp. Do you wish to proceed?"
    if [ $? -eq 0 ]; then
        if [ "${OPSYS}" = 'Linux' ]; then
            # -r "recursive" descend the directory structure and do the deletion
            rm -r $*
        fi
        if [ "${OPSYS}" = 'OS X' ]; then
            # -r "recursive" -f "force" (suppress confirmation messages)
            #-i stands for interactive; it makes rm prompt you before deleting each and every file
            rm -rf $*
        fi
        echo -e ${NColor}
        return;
    fi
    echo "Aborted."
    echo -e ${NColor}
}

# A way to remove all files in a directory except for some directories, and files.
# After much searching I devised a way to do it using find.
#
#find -E . -regex './(dir1|dir2|dir3)' -and -type d -prune -o -print -exec rm -rf {} \;
#
# Essentially it uses regex to select the directories to exclude from the results
# then removes the remaining files.

# kill the X Server
function killX {
    echo -e ${ALERT}
    ask "This will kill the X Server.  Do you wish to proceed?"
    if [ $? -eq 0 ]; then
        if [ "${OPSYS}" = 'Linux' ]; then
            sudo kill -9 $( ps -e | grep Xorg | awk '{ print $1 }' )
            echo -e ${NColor}
            return;
        fi
    fi
    echo "Aborted."
    echo -e ${NColor}
}

# kill a process by giving its process name
function killps {
    local pid pname sig="-TERM"   # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi

    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} )
    do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

# Print a line of text (i.e. a question) and then ask for yes or no responses
function ask {
    echo -n "$@" '[ yes/no ] ' ; read ans
    case "$ans" in
        yes|Yes) return 0 ;;
        *) return 1 ;;
    esac
}

# Print all the processes associated with you
function my_ps {
    /bin/ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command
}

# Returns a UUID in the form of xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
function get_uuid {
	cat /proc/sys/kernel/random/uuid
}

# Retrieves user password, and places result in $userConfirmedPassword
function promptPassword {
	local passwordAttemptOne="a"
	local passwordAttemptTwo="b"
	while [[ $passwordAttemptOne != $passwordAttemptTwo ]]
	do
		read -s -p "Enter or retry password:
" passwordAttemptOne
		read -s -p "Confirm password:
" passwordAttemptTwo
	done
	userConfirmedPassword=$passwordAttemptOne
}

# Determines if user is root. If yes, then continue. If not, exits after printing error message.
function mustBeRoot {
if [[ $(id -u) != 0 ]]; then
	echo "This must be run as root!"
	exit
fi
}

# Waits for the process PID specified by first parameter to end. Useful in conjunction
# with $! to provide process control and/or PID files.
function waitForProcess {
	while ps --no-headers -p $1 &> /dev/null
	do
		sleep 0.1
	done
}

# Get Window Manager
# an alternative on Ubuntu "echo $DESKTOP_SESSION"
function my_wm {
    wmctrl -m | grep Name | awk '{ print $2 }'
}

# Get Operating System
function my_os {
    if [ "$(uname)" == "Darwin" ]; then
        # your running on Mac OS X platform
        echo "Apple OS X"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # your running on Linux platform
        echo "Linux"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        # your running on Windows NT platform
        echo "Microsoft Windows NT"
    fi
}

# Get IP address
# http://askubuntu.com/questions/95910/command-for-determining-my-public-ip
# curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' | sed -e 's/<.*$//'
function my_ip {
    # local IP addresses provided to the system
    /sbin/ifconfig | grep -B1 "inet addr" | awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' | awk -F: '{ print $1 ": " $3 }'

    # extenal IP address
    curl ipecho.net/plain ; echo "   - external IP address"
}

# Moving thought the current directory and its sub-directories,
# find a file that contains a give string
function findfile {
    /usr/bin/find . -name '*'"$@"'*'
}

# remind yourself of an alias (given some part of it)
function showa {
    /bin/grep -i -a1 $@ ~/.bash/bash_aliases | /bin/grep -v '^\s*$'
}
