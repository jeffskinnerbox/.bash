<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      1.1.0
-->

# Notes
In here are instructions on the creation, maintenance, and use of this repository
via [git][01] and [GitHub][02].  For more information, check out these posts:

* [Getting started with Git: Terminology 101](https://opensource.com/article/19/2/git-terminology)
* [The Architecture and History of Git: A Distributed Version Control System](https://medium.com/@willhayjr/the-architecture-and-history-of-git-a-distributed-version-control-system-62b17dd37742)
* [How not to be afraid of GIT anymore](https://medium.freecodecamp.org/how-not-to-be-afraid-of-git-anymore-fe1da7415286)
* [git - the simple guide](http://rogerdudler.github.io/git-guide/)
* [Using Git and Github to Manage Your Dotfiles][03]
* [Managing dot files with Git][04]
* [The most useful git commands](https://orga.cat/posts/most-useful-git-commands)
* [git - the simple guide just a simple guide for getting started with git. no deep shit ;)](http://rogerdudler.github.io/git-guide/)
* [Useful tricks you might not know about Git stash](https://medium.freecodecamp.org/useful-tricks-you-might-not-know-about-git-stash-e8a9490f0a1a)
* [Git Tutorial](http://fab.cba.mit.edu/classes/4.140/doc/git/)
* [What is git?](http://fab.cba.mit.edu/classes/863.16/doc/tutorials/version_control/index.html)
* [The most useful git commands](https://orga.cat/posts/most-useful-git-commands)
* [How to recover from a git mistake](https://opensource.com/article/17/8/recover-dropped-data-stash)
* [13 Git tips for Git's 13th birthday](https://opensource.com/article/18/4/git-tips)
* [A Tutorial on Git Merge](https://dzone.com/articles/a-tutorial-on-git-merge)
* [A guide to Git branching](https://opensource.com/article/18/5/git-branching)
* [Why you should stop using Git rebase](https://medium.com/@fredrikmorken/why-you-should-stop-using-git-rebase-5552bee4fed1)
* [How to reset, revert, and return to previous states in Git](https://opensource.com/article/18/6/git-reset-revert-rebase-commands)
* [Advanced Git Commands: Rewriting History](https://dzone.com/articles/advanced-git-commands-rewriting-history)
* [How to find stuff in Git](https://www.tygertec.com/find-stuff-git/)
* [How to adopt a Git branching strategy](https://medium.freecodecamp.org/adopt-a-git-branching-strategy-ac729ff4f838)
* [An introduction to Git merge and rebase: what they are, and how to use them](https://medium.freecodecamp.org/an-introduction-to-git-merge-and-rebase-what-they-are-and-how-to-use-them-131b863785f)
* [Most common Git mistakes and how to fix them](https://medium.com/@i_AnkurBiswas/common-git-mistakes-and-how-to-fix-them-10184cd5fa77)

## Managing the Git Repository and GitHub
* [Follow these simple rules and you’ll become a Git and GitHub master](https://medium.freecodecamp.org/follow-these-simple-rules-and-youll-become-a-git-and-github-master-e1045057468f)

Use three simple rules when using Git / Github:

1. **Rule #1: Create a Git repository for every new project** -
Every time you start working on something new, you should create a new Git repository and push it to GitHub.
1. **Rule #2: Create a new branch for every new feature** -
When creating a new feature, create a dedicated branch for this new feature,
give it a meaningful name, and commit all the code to that specific branch.
1. **Rule #3: Use Pull Requests to merge code to Master** -
You should never push changes directly to the master branch.
Instead, you should use feature branches as described above,
and open a new Pull Request to merge the feature branch code with the master branch code.

================================================================================

### Creating the GitHub Repository
Goto GitHub and create the new repository

    goto https://github.com/jeffskinnerbox
    <create empty repository called '.bash'>

To do this from the commandline, let first create the local git repository:

    git init
    touch README.md
    curl -s https://raw.githubusercontent.com/jeffskinnerbox/.bash/master/.gitignore > .gitignore
    git add --all
    git commit -m "first commit"

Now push this repository from the command line:

    curl -u 'jeffskinnerbox' https://api.github.com/user/repos -d "{\"name\":\"nonexistent-project\"}"
    git push -u origin master

### Creating Your Remote GitHub Repository
Create a new repository on GitHub.
To avoid errors, do not initialize the new repository with README, license, or gitignore files.
You can add these files when you push your project to GitHub.

Go to [GitHub][02] and create the new repository called jupyter-notebook.

    goto https://github.com/jupyter-notebooks

### Creating the Local Git Repository
Make the .bash directory, move into it, and initialize it as a git repository

    cd ~
    mkdir .bash
    cd .bash
    git init

Now create the README, bash_aliases, bash_logout, bash_profile, and bashrc files.

Also create the file .gitignore like this:

    ### ---------- Project Specific ---------- ###


    ### ---------- General ---------- ###

    ### Compiled Source ###
    *.pyc
    *.com
    *.class
    *.dll
    *.exe
    *.o
    *.so

    ### Packages ###
    *.7z
    *.dmg
    *.gz
    *.iso
    *.jar
    *.rar
    *.tar
    *.zip

    ### Logs & Databases ###
    *.log
    *.sql
    *.sqlite

    ### OS Generated Files ###
    *.out
    *.swp
    .DS_Store
    .DS_Store?
    ._*
    .Spotlight-V100
    .Trashes
    Icon?
    ehthumbs.db
    Thumbs.db

```bash
### ------------------------- Project Specific ------------------------- ###

### Videos & Images ###
*.mp4
*.avi
*.webm
*.mkv
*.png
*.jpg
*.tif
*.gif

### Jupyter Files ###
Untitled.ipynb

### ----------------------------- General ------------------------------ ###

### Compiled Source ###
*.pyc
*.com
*.class
*.dll
*.exe
*.o
*.so

### Packages ###
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

### backup file ###
*.backup

### Unit Test / Coverage Reports
htmlcov/
.tox/
.coverage
.cache
nosetests.xml
coverage.xml

### Logs & Databases ###
*.log
*.sql
*.sqlite
.ipynb_checkpoints
.ropeproject
__pycache__

### OS Generated Files ###
*.out
*.swp
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
Icon?
ehthumbs.db
Thumbs.db
```

Now commit the files to the git repository:

    git add --all
    git commit -m 'Initial creation of Bash scripts for Linux box'

### Loading the GitHub Repository for the First Time
Within the ~.bash directory, use git to load the files to GitHub

    cd ~/.bash
    git remote add origin https://github.com/jeffskinnerbox/.bash.git
    git push -u origin master

### Updating the Local Git Repository
Within the .vim directory, do a "get status" to see what will be included in the commit,
add files (or remove) that are required, and then do the commit to the local git repository.

    git status
    git add --all
    git commit --dry-run
    git commit -m <comment>

#### Store Credentials Within Git
To add a new remote,
use the `git remote add` command on the terminal,
in the directory your repository is stored at.

    cd ~/jupyter-notebooks

    # set your remote repository URL
    git remote add origin https://github.com/jeffskinnerbox/jupyter-notebooks.git

    # verifies the new remote URL
    git remote -v

    # pushes the changes in your local repository up to the remote repository
    git push -u origin master

>**NOTE**: Other operations
[rename an existing remote](https://help.github.com/articles/renaming-a-remote/),
[delete an existing remote](https://help.github.com/articles/removing-a-remote/).


### Updating the Remote Repository (i.e. GitHub)
To which shows you the URL that Git has stored for the shortname for
the remote repository (i.e. GitHub):

    git remote -v

Now to push your files to the GitHub repository

    git push -u origin master

### Retrieving Update From Remote Repository (i.e. GitHub)
To retrieve these updates on another system, use

    git pull origin master

To overwrite everything in the local directory

    git fetch --all
    git reset --hard origin/master

Explanation: `git fetch` downloads the latest from remote without trying to merge or rebase anything.
Then the `git reset` resets the master branch to what you just fetched.
The `--hard` option changes all the files in your working tree to match the files in `origin/master`.
If you have any files that are _not_ tracked by Git,
these files will not be affected.

================================================================================

## Updating a Git Repository

### Updating the Local Git Repository
Within the .vim directory, do a "get status" to see what will be included in the commit,
add files (or remove) that are required, and then do the commit to the local git repository.

    git status
    git add --all
    git commit --dry-run
    git commit -m <comment>

### Retrieving Update From Remote Repository (i.e. GitHub)
To retrieve these updates on another system, use

    git pull origin master

To overwrite everything in the local directory

    git fetch --all
    git reset --hard origin/master

Explanation: `git fetch` downloads the latest from remote without trying to merge or rebase anything.
Then the `git reset` resets the master branch to what you just fetched.
The `--hard` option changes all the files in your working tree to match the files in `origin/master`.
If you have any files that are _not_ tracked by Git,
these files will not be affected.

### Updating the Remote Repository (i.e. GitHub)
To which shows you the URL that Git has stored for the shortname for
the remote repository (i.e. GitHub):

    git remote -v

Now to push your files to the GitHub repository

    git push -u origin master

================================================================================

## Cloning a Git Repository

### Clone This Git Repository
Copy this Git repository into your local systems:

================================================================================

time to install my personal tools on another device.

```bash
# execute the pyenv installer
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# tool to check for window manager
sudo apt-get install wmctrl

# setup your vim environment
cd ~
git clone https://github.com/jeffskinnerbox/.vim.git
ln -s ~/.vim/vimrc ~/.vimrc
mkdir ~/.vim/backup
mkdir ~/.vim/tmp
cd ~/.vim
git submodule init
git submodule update

# install X configuration files
cd ~
git clone https://github.com/jeffskinnerbox/.X.git
ln -s ~/.X/xbindkeysrc ~/.xbindkeysrc
ln -s ~/.X/Xresources ~/.Xresources
ln -s ~/.X/xsessionrc ~/.xsessionrc

# rebuilding $HOME/.Xauthority to avoid MIT magic cookie error
touch ~/.Xauthority
xauth generate :0 . trusted
xauth add ${HOST}:0 . `xxd -l 16 -p /dev/urandom`

# install tools for bash shell
cd ~
rm ~/.bashrc ~/.bash_logout
git clone https://github.com/jeffskinnerbox/.bash.git
ln -s ~/.bash/bashrc ~/.bashrc
ln -s ~/.bash/bash_login ~/.bash_login
ln -s ~/.bash/bash_logout ~/.bash_logout
ln -s ~/.bash/bash_profile ~/.bash_profile
ln -s ~/.bash/dircolors.old ~/.dircolors

# setup pyenv by executing the pyenv installer
curl -s https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
pyenv install 3.6.4         # install python 3.6.4 via pyenv
pyenv rehash                # assure the pyenv shims are updated
```



[01]:http://git-scm.com/
[02]:https://github.com/
[03]:http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
[04]:http://blog.sanctum.geek.nz/managing-dot-files-with-git/
[05]:
[06]:
[07]:
[08]:
[09]:
[10]:
