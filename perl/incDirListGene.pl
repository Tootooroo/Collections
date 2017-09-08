#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;
use Cwd;
use Encode;
use Data::Dumper;
use JSON;

# Where to begin and recursive down.
my $ROOT_PATH = "E:\\CODE\\GL8600\\gbn\\src";
# Value of macro or some variable.
my $VAR_LIST_FILE = "E:\\CODE\\Others\\perlvarList.json";
# The name of files that we want to process.
my $TARGET_FILE= "Makefile";

sub iterator {
    my $DIR_PATH = $_[0];
    my $deal_with = $_[1];
    my $dir = undef;
    my $upper = getcwd;   
            
    opendir DIR, $DIR_PATH or 
        die "Can not open ".$DIR_PATH."\n";
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
        while ($row =~ m/\$\(([^\)]*)\)/) {
            $substitute_key = $1;
            $substitute_val = 
            $row =~ s/\$\($substitute_key\)/$substitute_val/;
        }
    }
    
    close FILE;
}

# subroutine to generate include.lnt
sub lnt_file_gen {
    
}

# main
my $JSON = new JSON;
my $json_data = do {
    open VAR_FILE, $VAR_LIST_FILE
        or die "Can not open ".$VAR_LIST_FILE."\n";
    local $\;
    <VAR_FILE>
};

my $json_obj = json_decode($json_data);

&iterator($ROOT_PATH, \&deal_with_file, $json_obj);
