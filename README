# Bash Dotfiles

## Bash
According to the bash man page, .bash_profile is executed for login shells,
while .bashrc is executed for interactive non-login shells.

When you login (type username and password) via console, either sitting at the
machine, or remotely via ssh: .bash_profile is executed to configure your shell
before the initial command prompt.  But, if you’ve already logged into your
machine and open a new terminal window (xterm) inside Gnome or KDE, then
.bashrc is executed before the window command prompt. .bashrc is also run when
you start a new bash instance by typing /bin/bash in a terminal.

### References / Sources
 - http://ss64.com/bash/shopt.html
 - http://tldp.org/LDP/abs/html/sample-bashrc.html

## Aliases and Functions
A Bash alias is essentially nothing more than a keyboard shortcut, an
abbreviation, a means of avoiding typing a long command sequence.  Bash does
not expand arguments within the alias body, or expand an alias itself with Linux
"compound constructs," such as if/then statements, loops, and functions, nor
will alias’ expand recursively.

In Bash, a function is like a subroutine, a code block that implements a set of
operations, that performs a specified task. Wherever there is repetitive code,
when a task repeats with only slight variations in procedure, then consider
using a function.

### References / Sources
 - http://tldp.org/LDP/abs/html/aliases.html
 - http://tldp.org/LDP/abs/html/functions.html
 - http://hayne.net/MacDev/Bash/aliases.bash
 - http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
  
## Install
 To clone these Bash scripts and use them on another system, execute the following:
 ```sh
 cd ~
 git clone https://github.com/jeffskinnerbox/dotbash.git ~/.bash
 ln -s ~/.bash/bash_aliases ~/.bash_aliases
 ln -s ~/.bash/bash_logout ~/.bash_logout
 ln -s ~/.bash/bash_profile ~/.bash_profile
 ln -s ~/.bash/bashrc ~/.bashrc
 cd ~/.bash
 ```

# Managing the Git Repository and GitHub

## Creating the GitHub Repository
Goto GitHub and create the new repository
```sh
goto https://github.com/jeffskinnerbox
<create empty repository called 'dotbash'>
```

## Creating the Local Git Repository
Make the .bash directory, move into it, and initialize it as a git repository
```sh
cd ~
mkdir .bash
cd .bash
git init
<Create a README, bash_aliases, bash_logout, bash_profile, and bashrc files>
git add .
git commit -m 'Initial creation of Bash scripts for Linux box'
```

## Loading the GitHub Repository for the First Time
Within the ~.bash directory, use git to load the files to GitHub
```sh
cd ~/.bash
git remote add origin https://github.com/jeffskinnerbox/dotbash.git
git push -u origin master
```


# TO DO LIST
 COLORS-Dircolors - http://www.linux-sxs.org/housekeeping/dircolor.html
 http://ubuntuforums.org/showthread.php?t=41538
 
 BASH shell aliases I can't live without - http://bicchi.blogspot.com/2007/03/bash-shell-aliases-i-cant-leave-without.html
 Git Basics - Tips and Tricks - http://git-scm.com/book/en/Git-Basics-Tips-and-Tricks
 
 

 see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
 for examples

 Change / Setup bash custom prompt
   http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
   http://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/2009/09/04
   https://wiki.archlinux.org/index.php/Color_Bash_Prompt
   http://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/
   sane bash environment - https://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc

   FULL 256 COLOR SUPPORT FOR VIM AND/OR XTERM ON UBUNTU 12.04 - http://emerg3nc3.wordpress.com/2012/07/28/full-256-color-support-for-vim-andor-xterm-on-ubuntu-12-04/
 
  http://tldp.org/LDP/abs/html/index.html
  http://www.caliban.org/bash
  http://www.shelldorado.com/scripts/categories.html
  http://www.dotfiles.org
 
 Shell Prompt - for many examples, see:
       http://www.debian-administration.org/articles/205
       http://www.askapache.com/linux/bash-power-prompt.html
       http://tldp.org/HOWTO/Bash-Prompt-HOWTO
       https://github.com/nojhan/liquidprompt
