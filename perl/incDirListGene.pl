#!/usr/bin/perl
use warnings;

use Path::Tiny;
use Cwd;

sub iterator {
    my $DIR_PATH = $_[0];
    my $deal_with = $_[1];
    my $dir = undef;
    my $upper = getcwd;   
            
    opendir DIR, $DIR_PATH or die "Can not open ".$DIR_PATH."\n";
    my @filelist = readdir DIR;
    
    chdir $DIR_PATH;    
    
    foreach $dir (@filelist) {        
        if ($dir eq "." || $dir eq "..") {
            next;
        }
        if (-f $dir) {
            # Text-files
            &$deal_with($dir);                 
        } else {
            # Directory
            &iterator($dir, \&$deal_with); 
        }
    }
    # go back to upper
    chdir $upper;
}

# Get include path in Makefile
sub deal_with_file {    
    my $file = $_[0];
    my $row = undef;
    
    if ($_[0] ne "Makefile") {
       return;
    }
    
    open FILE, $file;
    
    while ($row = <FILE>) {
        print $row;
    }
    
    # Filter out the PRE_INCLUDE content.
    
    # Generate include.lnt file.
    
    close FILE;
}

# main
&iterator("E:\\CODE\\GL8600\\gbn\\src", \&deal_with_file);
