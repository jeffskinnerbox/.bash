#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.1.0

if [ -f $HOME/.bash/bash_colors ]; then
    source $HOME/.bash/bash_colors
fi

# Using the variables defined in bash_colors, print the colors on the terminal
echo -e ${Black}Black on background${NColor}
echo -e ${UBlack}Underline Black on background${NColor}
echo -e ${BBlack}Bold Black on background${NColor}
echo -e ${On_Black}${BRed}Bold Red on Black background${NColor}
echo " "
echo -e ${Red}Red on background${NColor}
echo -e ${URed}Underline Red on background${NColor}
echo -e ${BRed}Bold Red on background${NColor}
echo -e ${On_Red}${BRed}Bold Red on Red background${NColor}
echo " "
echo -e ${Green}Green on background${NColor}
echo -e ${BGreen}Bold Green on background${NColor}
echo -e ${On_Green}${BRed}Bold Red on Green background${NColor}
echo " "
echo -e ${Blue}Blue on background${NColor}
echo -e ${UBlue}Underline Blue on background${NColor}
echo -e ${BBlue}Bold Blue on background${NColor}
echo -e ${On_Blue}${BRed}Bold Red on Blue background${NColor}
echo " "
echo -e ${Yellow}Yellow on background${NColor}
echo -e ${UYellow}Underline Yellow on background${NColor}
echo -e ${BYellow}Bold Yellow on background${NColor}
echo -e ${On_Yellow}${BRed}Bold Red on Yellow background${NColor}
echo " "
echo -e ${Purple}Purple on background${NColor}
echo -e ${UPurple}Underline Purple on background${NColor}
echo -e ${BPurple}Bold Purple on background${NColor}
echo -e ${On_Purple}${BRed}Bold Red on Purple background${NColor}
echo " "
echo -e ${Cyan}Cyan on background${NColor}
echo -e ${UCyan}Underline Cyan on background${NColor}
echo -e ${BCyan}Bold Cyan on background${NColor}
echo -e ${On_Cyan}${BRed}Bold Red on Cyan background${NColor}
echo " "
echo -e ${White}White on background${NColor}
echo -e ${UWhite}Underline White on background${NColor}
echo -e ${BWhite}Bold White on background${NColor}
echo -e ${On_WHite}${BRed}Bold Red on White background${NColor}
