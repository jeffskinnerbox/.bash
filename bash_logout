# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.1.0
#
# DESCRIPTION:
# This file will be executed by Bash when a login shell exits.



# when leaving the console, clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

