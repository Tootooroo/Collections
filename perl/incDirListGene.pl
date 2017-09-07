#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;
use Cwd;
use Encode;
use Data::Dumper;
use JSON;

# Where to begin and recursive down.
my $ROOT_PATH = @ARGV[0];
# Value of macro or some variable.
my $VAR_LIST_PATH = @ARGV[1];
# The name of files that we want to process.
my $TARGET_FILE= @ARGV[2];

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
    my $match = undef;
    my $variable = undef;
    my $substitute_key = undef;
    my $substitute_val = undef;
    
    if ($_[0] ne $TARGET_FILE) {
       return;
    }
    
    open FILE, $file;
    
    while ($row = <FILE>) {
        # Content of -I match
        if($row =~ m/(-I[^\\\n ]*)/i) {
            $match = $1;            
        }
        
        # substitute content of variable 
        # into Content of -I option.
        if ($row =~ m/\$\(([^\)]*)\)/) {
            $substitute_key = $1;
            $substitute_val = # Get from JSON.
            $row =~ s/\$\($substitute\)/$substitute_val/;
        }
    }
    
    close FILE;
}

# subroutine to generate include.lnt
sub include_lnt_gen {
    
}

# main
&iterator($ROOT_PATH, \&deal_with_file);
