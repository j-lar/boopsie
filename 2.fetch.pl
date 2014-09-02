#!/usr/bin/perl
use strict;
use warnings;
use File::Fetch;

my $url = 'http://public.boopsie.com/_test/boopsie_test.tsv';
my $path = '_test/boopsie_test.tsv';
my $dir = glob('/tmp/boopsie_challenge');

# create directory for all the stuff we'll be doing
if ( ! -d $dir ) {
  unless(mkdir $dir) {
    die "Couldn't create base directory\n$!\n";
  }
}

# downlad to the dir we created
my $download = File::Fetch->new(uri => $url );
my $fetcher = $download->fetch ( to => $dir) or die "failed... $download->error";