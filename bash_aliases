
# This file will be sourced by .bashrc.

# Must set this option, else script will not expand aliases.
shopt -s expand_aliases



################################### Aliases ###################################

# Short-hand commands for commonly used programs
alias clr='clear'                   # clear the screen
alias cls='clear'                   # clear the screen
alias vi='vim -p'                   # When using Vim, open multiple files within separate tabs
alias chrome='chromium-browser'     # Linux version of Chrome web browser
alias grc='gnuradio-companion'      # Short hand for GNU Radio Companion
alias du='du -kh'                   # Makes a more readable output.
alias df='df -kTh'                  # Makes a more readable output.
alias ports='netstat -tulanp'       # list all TCP/UDP port
alias update='sudo apt-get update && sudo apt-get upgrade'  # update on one command 
 
# Enables color support of ls, grep, and other colorized utilities
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ls='ls --color=auto'           # color by file type
alias lsl='ls --color=auto -l'       # long form
alias lsa='ls --color=auto -A'       # show hiden files
alias la='ls --color=auto -A'        # show hiden files
alias lsal='ls --color=auto -A -l'   # long form with hiden files
alias ls.='ls --color=auto -d .*'    # show only hidden files
alias ll='ls -alF'
alias l='ls -CF'
 
# Make some possibly destructive commands more safe & interactive
alias rm='rm -I'
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



################################## Functions ##################################

# remove files to tmp directory
function rmt {
    mv $* $HOME/tmp
}

# Function to run upon exit of shell
function _exit {
    echo -e "${BRed}Hasta la vista, baby${NC}"
}
trap _exit EXIT

# kill by process name
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

function ask {
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

function my_ps {
    /bin/ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command
}

# Get IP adress on ethernet
function my_ip {
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

# Find a file that contains a give string
function findfile {
    /usr/bin/find . -name '*'"$@"'*'
}

# remind yourself of an alias (given some part of it)
function showa {
    /bin/grep -i -a1 $@ ~/.bash_aliases | /bin/grep -v '^\s*$'
}
