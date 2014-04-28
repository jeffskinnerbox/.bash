# Notes
In here are instructions on the creation, maintenance, and use of this repository
via [git][01] and [GitHub][02].  For more information, check out these posts:

## Managing the Git Repository and GitHub
===
### Creating the GitHub Repository
Goto GitHub and create the new repository

    goto https://github.com/jeffskinnerbox
    <create empty repository called 'dotbash'>

### Creating the Local Git Repository
Make the .bash directory, move into it, and initialize it as a git repository

    cd ~
    mkdir .bash
    cd .bash
    git init
    <Create a README, bash_aliases, bash_logout, bash_profile, and bashrc files>
    git add .
    git commit -m 'Initial creation of Bash scripts for Linux box'

### Loading the GitHub Repository for the First Time
Within the ~.bash directory, use git to load the files to GitHub

    cd ~/.bash
    git remote add origin https://github.com/jeffskinnerbox/dotbash.git
    git push -u origin master

### Updating the Local Git Repository
Within the .vim directory, do a "get status" to see what will be included in the commit,
add files (or remove) that are required, and then do the commit to the local git repository.

    git status
    git add <files>   (or git rm <files>)
    git commit --dry-run
    git commit

### Updating the Remote (i.e. GitHub) Repository
To which shows you the URL that Git has stored for the shortname to for
the remote (GitHub) repository:

    git remote -v

Now to push your files to the GitHub repository

    git push -u origin master

To retrieve these updates on another system, use

    git pull origin master

## Sources / Credits

* [Using Git and Github to Manage Your Dotfiles][03]
* [Managing dot files with Git][04]


[01]:http://git-scm.com/
[02]:https://github.com/
[03]:http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
[04]:http://blog.sanctum.geek.nz/managing-dot-files-with-git/
