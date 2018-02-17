<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      1.1.0
-->

# Bash Dotfiles
**Bash Dotfiles** is a mash up of my bash profile/resource files, scripts, functions,
aliases and other bash stuff I have created, found, or more likely ripped off from others.
Therefore, out of respect, guilt, and a morbid fear of lawyers, I maintain a reasonably
complete list of sources.  Check out the references / sources and you may find
a few additional gems.

### Bash
According to the bash man page, .bash_profile is executed for login shells,
while .bashrc is executed for interactive non-login shells.

When you login (type username and password) via console, either sitting at the
machine, or remotely via ssh: .bash_profile is executed to configure your shell
before the initial command prompt.  But, if you’re already logged into your
machine and open a new terminal window (xterm) inside Gnome or KDE, then
.bashrc is executed before the window command prompt. .bashrc is also run when
you start a new bash instance by typing /bin/bash in a terminal.

### Command Line Editing
[GNU Readline][03] is a software library that provides line-editing and history capabilities
for interactive programs with a command-line interface,
such as [Bash][01] and [Python interactive shell][02].

Although the Readline library comes with a set of Emacs-like keybindings installed by default
(located in `/etc/inputrc`),
it is possible to use a different set of keybindings.
Any user can customize programs that use Readline by putting commands in an `$HOME/.inputrc` file.
If that file does not exist or cannot be read, the ultimate default is `/etc/inputrc`.

* [LINUX FU: CUSTOM BASH COMMAND COMPLETION](https://hackaday.com/2018/01/19/linux-fu-custom-bash-command-completion/)
* [A ~/.inputrc for Humans](https://www.topbug.net/blog/2017/07/31/inputrc-for-humans/)
* [Inputrc Syntax](https://ss64.com/bash/syntax-inputrc.html)
* [The most important command-line tip - incremental history searching with .inputrc](http://codeinthehole.com/tips/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/)
* [Use vi shortcuts in terminal](http://vim.wikia.com/wiki/Use_vi_shortcuts_in_terminal)

### References / Sources
* [shopt manual page](http://ss64.com/bash/shopt.html)
* [Advanced Bash-Scripting Guide: Samples](http://tldp.org/LDP/abs/html/sample-bashrc.html)

### Aliases and Functions
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
* [Advanced Bash-Scripting Guide: Aliases](http://tldp.org/LDP/abs/html/aliases.html})
* [Advanced Bash-Scripting Guide: Functions](http://tldp.org/LDP/abs/html/functions.html)
* [Hayne of Tintagel](http://hayne.net/MacDev/Bash/aliases.bash)
* [30 Handy Bash Shell Aliases For Linux](http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html)

### Install
To clone these Bash scripts and use them on another system, execute the following:

    cd ~
    rm .bashrc .bash_logout
    sudo apt-get install wmctrl python python-pip
    sudo pip install virtualenv virtualenvwrapper
    git clone https://github.com/jeffskinnerbox/.bash.git
    ln -s ~/.bash/inputrc ~/.inputrc
    ln -s ~/.bash/bashrc ~/.bashrc
    ln -s ~/.bash/bash_login ~/.bash_login
    ln -s ~/.bash/bash_logout ~/.bash_logout
    ln -s ~/.bash/bash_profile ~/.bash_profile
    ln -s ~/.bash/dircolors.old ~/.dircolors


[01]:https://www.gnu.org/software/bash/
[02]:https://www.digitalocean.com/community/tutorials/how-to-work-with-the-python-interactive-console
[03]:https://tiswww.case.edu/php/chet/readline/rltop.html
[04]:
[05]:
[06]:
[07]:
[08]:
[09]:
[10]:
