#!/usr/bin/perl
use strict;
use warnings;

my $base_dir = "/opt/boopsie/test";
my $file = "/tmp/boopsie_challenge/boopsie_test.tsv";
open (my $fh, $file)
  or die "Could not open file '$file' $!";

while ( my $row = <$fh> ) {
	chomp $row;
	my @array = split("\t", $row);
	mkdir -p "/opt/boopsie/test/$array[2]/$array[3]";
	print "$base_dir/$array[2]/$array[3]\n";
	#unless(open FILE, '>'.$file) {
	#	die "Couldn't do it, Cap'n. $!\n";
	#}
	#print FILE $array[4];
	#print "$array[0]\n";
}
