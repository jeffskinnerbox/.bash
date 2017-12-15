#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.1.0
#
# Check out these posts:
# Using Git and Github to Manage Your Dotfiles - http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# Managing dot files with Git - http://blog.sanctum.geek.nz/managing-dot-files-with-git/
#
# This script will setup the .bash directory, and in general, make the .bashrc
# resource file usable.  This should be usable when you logout and log back in.

# First make a backup of anything you plan to blow away
cd ~
mkdir ~/tmp/old_bash_files
mv .dircolors .bash .bashrc .bash_history .bash_login .bash_logout .bash_profile ~/tmp/old_bash_files

# make the additional directories that you need
mkdir -p ~/.bash

# download and install Bash resource files from GitHub
cd ~
git clone http://github.com/jeffskinnerbox/.bash

# install virtualenv
sudo apt-get install python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper

# create the virtual links to the Bash resource file
ln -s ~/.bash/bashrc ~/.bashrc
ln -s ~/.bash/bash_login ~/.bash_login
ln -s ~/.bash/bash_logout ~/.bash_logout
ln -s ~/.bash/bash_profile ~/.bash_profile
ln -s ~/.bash/dircolors.old ~/.dircolors

# download and install Vim resource files from GitHub
cd ~
git clone http://github.com/jeffskinnerbox/.vim

# create the virtual links to the Vim resource file
cd ~
mkdir ~/tmp/old_vim_files
mv  .vimrc .gvimrc ~/tmp/old_vim_files
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

