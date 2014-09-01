#!/usr/bin/perl
use strict;
use warnings;
use DBI;

#import from boopsie_test.tsv into db
open (FILE, $file)
  or die "Could not open $file $!";

my @data = {};
while (<FILE>) {
  chomp;
  my @data = split("\t");
}

foreach (@data) {
  print "$_\n";
}
