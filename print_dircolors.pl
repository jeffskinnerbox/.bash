#!/usr/bin/perl
# 
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.1.0
#
# A utility script to test out dircolors settings without reloading
# Usage: dircolortest <dircolors file>

if ($#ARGV < 0) {
    die "Usage: $0 <dircolors file>\n";
}

if ($#ARGV > 0) {
    warn "Ignoring additional command line arguments\n";
}

# Open the file and get the handle
open DCFILE, $ARGV[0] or
    die "Cannot open dircolors file $ARGV[0]! $!\n";

$line_counter = 0;

while ($line = <DCFILE>) {
    chomp $line;

    # Strip off any comments
    $line =~ s/#.*$//;

    # Strip off leading and trailing whitespace
    $line =~ s/^\s*//;
    $line =~ s/\s*$//;

    if ($line ne '') {
        ($type, $format) = split /\s+/, $line;

        # Ignore the following lines, we don't care about them here
        next if (($type eq 'TERM') || ($type eq 'COLOR') ||
                 ($type eq 'OPTIONS') || ($type eq 'EIGHTBIT'));

        # Just a little enhancement, if the type begins with a .
        if ($type =~ m/^\./) {
            $type = "*$type";
        }

        print "\033[${format}m$type\033[m";

        $line_counter = $line_counter + 1;

        if ($line_counter == 8) {
            print "\n";
            $line_counter = 0;
        } else {
            print "\t";
        }
    }
}

print "\n" if ($line_counter != 0);

close DCFILE;
