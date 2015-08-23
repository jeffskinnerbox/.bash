# Maintainer:   jeff.irland@gmail.com
# Version:      1.0.2
#
# This file will be executed by Bash when a login shell exits.

# when leaving the console, clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# see functions in bash_aliases
#_exit
