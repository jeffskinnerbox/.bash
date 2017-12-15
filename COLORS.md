<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      1.1.0
-->

# Colorizing Directory Listings
[`dircolors`][01] is a utility for color settings of ls, grep, etc.
comes with default settings but is also [configurable][02].
`dircolors` outputs a sequence of shell commands to set up the terminal
for color output.

`dircolors` prints out `LS_COLORS='...'; export LS_COLORS`,
so eval'ing `$(dircolors)` effectively sets the `LS_COLORS` environment variable.
Therefore, the typical usage is:

    eval "$(dircolors [option] … [file])"

If `file` is specified, `dircolors` reads it to determine which colors to use
for which file types and extensions.

To print the (compiled-in) default color configuration database, run

    dircolors --print-database

To make `dircolors` read your personalized colors from `~/.dircolors` file,
you can put the following lines in your `~/.bashrc`:

    test -r $HOME/.dircolors && eval "$(dircolors $HOME/.dircolors)"

You can use xterm's 256 color escape codes in your `dircolors` file,
but be aware that they'll only work for xterm compatible terminals.
They won't work on the Linux text console, for example.

The format for 256 color escape codes is `38;5;colorN` for foreground colors
and `48;5;colorN` for background colors.
So for example:

    .mp3  38;5;160                     # Set fg color to color 160
    .flac 48;5;240                     # Set bg color to color 240
    .ogg  38;5;160;48;5;240            # Set fg color 160 *and* bg color 240.
    .wav  01;04;05;38;5;160;48;5;240   # Pure madness: make bold (01), underlined (04), blink (05), fg color 160, and bg color 240!

# Creeate Your Own .dircolors File
To create your `.dircolors` file,
generate a default starter file with

    cd ~
    dircolors -p > .dircolors

You can then edit this as you see fit.
Alternatively, you could pluck something of the net like
[Solarized Color Theme for GNU ls][03].

For example, if you can't stand big bold blue directory listings,
change the bold attribute from "01" to "00" (none) but keep the blue color.
It will lighten things up a bit.

    FILE 00         # normal file
    DIR 00;34       # directory
    LINK 01;36      # symbolic link

or, change the "01" to an "07", making your debian packages really stand out!

    .gz  01;31
    .bz2 01;31
    .deb 07;31
    .rpm 01;31
    .jar 01;31

There are no default colors for well known language extensions.
So if you would like C/C++ source to show up as green and header files as yellow:

    # audio formats
    .ogg 01;35
    .mp3 01;35
    .wav 01;35

    # programming languages
    .c 00;32
    .cc 00;32
    .cpp 00;32
    .h 00;33

To help set up your personal `.dircolors` file,
here is a little shell-script that displays every available color combination
for you to select from.



[01]:http://linux.die.net/man/1/dircolors
[02]:http://www.bigsoft.co.uk/blog/index.php/2008/04/11/configuring-ls_colors
[03]:https://github.com/seebi/dircolors-solarized
