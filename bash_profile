# Maintainer:   jeff.irland@gmail.com
# Version:      1.0.1
#
# This file is executed for login shells, while .bashrc is executed for
# interactive non-login shells.

# source the users .bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
    source "${HOME}/.bashrc"
fi

