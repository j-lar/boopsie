#!/usr/bin/perl
use strict;
use warnings;
use File::Path;

my $base_dir = "/opt/boopsie/test";
my $file = "/tmp/boopsie_challenge/boopsie_test.tsv";

open (my $fh, $file)
  or die "Could not open file '$file' $!";
while ( my $row = <$fh> ) {
	chomp $row;
	my @array = split("\t", $row);
	
	unless (-d "$base_dir/$array[2]/$array[3]") {
		mkpath("$base_dir/$array[2]/$array[3]") or die "Error: $!";
		}

	unless(open FILE, '>'."$base_dir/$array[2]/$array[3]/$array[0].txt") {
		die "Couldn't do it, Cap'n. $!\n";
	}
	print FILE $array[4];
}

`tar czvpf - /opt/boopsie/test | gpg --symmetric --cipher-algo aes256 -o /tmp/boopsie_challenge/boopsie_test.tar.gz.gpg`
