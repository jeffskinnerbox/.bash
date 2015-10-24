# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.0.5
#
# DESCRIPTION:
# This file is executed for interactive non-login shells, while .bash_profile
# is executed for login shells.
#
# NOTE:
# If you mess up  your .bashrc file, such that the shell isn't usable,
# run the following to create a usable shell
# bash --rcfile /etc/bashrc



#########################  Test for Interactive Shell #########################
# If not running interactively, don't do anything and just leave
case $- in
    *i*) ;;
      *) return;;
esac



#########################  Test for Operating System  #########################
if [ "$(uname)" == "Darwin" ]; then
    # your running on Mac OS X platform
    OPSYS="OS X"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # your running on Linux platform
    OPSYS="Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # your running on Windows NT platform
    OPSYS="Win"
fi



########################### Define Terminal Colors ############################
if [ -f $HOME/.bash/bash_colors ]; then
    source $HOME/.bash/bash_colors
fi



################################ Define Aliases ################################
if [ -f $HOME/.bash/bash_aliases ]; then
    source $HOME/.bash/bash_aliases
fi



#################### Setup for Python Virtual Environments ####################
# you first must do the following install - pip install virtualenvwrapper
if [ -f ${HOME}/.bash/virtualenvwrapper.sh ]; then
    export WORKON_HOME="$HOME/.virtualenvs"
    source ${HOME}/.bash/virtualenvwrapper.sh
fi



############################## Set Shell Options ##############################
shopt -s checkwinsize           # update the values of LINES and COLUMNS
shopt -s cdspell                # minor errors in cd command are corrected



############################# Environment Variable #############################
export TERM="xterm-256color"    # full color Xterm
export EDITOR=vim               # set the default editor to vim.



############################# Command Line Editing #############################
set -o vi                       # set commandline editor to vi editing mode



############################# Command Line History #############################
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth     # don't put duplicate lines or lines starting with space in the history
shopt -s histappend        # append to the history file, don't overwrite it
shopt -s cmdhist           # save multiple-line commands in history



################################## Set Paths ##################################
# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
    PATH="${HOME}/bin:${PATH}"
fi

# Added by the Heroku Toolbelt
PATH="$PATH:/usr/local/heroku/bin"

export PATH

# Set MANPATH so it includes users' private man if it exists
if [ -d "${HOME}/man" ]; then
    MANPATH="${HOME}/man:${MANPATH}"
fi

# Set INFOPATH so it includes users' private info if it exists
if [ -d "${HOME}/info" ]; then
    INFOPATH="${HOME}/info:${INFOPATH}"
fi

# Set PYTHONPATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
    PYTHONPATH="${HOME}/bin:${PYTHONPATH}"
fi



################################################################################
#
## make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac
#
## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
##force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "${OPSYS}" = 'Linux' ]; then
#    if [ "$color_prompt" = yes ]; then
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    else
#        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    fi
#    unset color_prompt force_color_prompt
#
#    # If this is an xterm set the title to user@host:dir
#    case "$TERM" in
#    xterm*|rxvt*)
#        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#        ;;
#    *)
#        ;;
#    esac
#else
#    PS1="$"
#fi
#
################################################################################

# enable programmable completion features
# You don't need to enable this if it's # already enabled in /etc/bash.bashrc
# and /etc/profile sources /etc/bash.bashrc.
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
  fi
fi

# set the bash command line prompt to color according to active virtualenv,
# git branch and return status of last command.
if [ -f ${HOME}/.bash/bash_prompt ]; then
    source $HOME/.bash/bash_prompt
fi
