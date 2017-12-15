# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.1.0
#
# DESCRIPTION:
# This file is executed for login shells, while .bashrc is executed for
# interactive non-login shells.



# source the users .bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
    source "${HOME}/.bashrc"
fi

