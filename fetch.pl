#!/usr/bin/perl
use strict;
use warnings;
use File::Fetch;

my $url = 'http://public.boopsie.com/_test/boopsie_test.tsv';
my $dir = glob('~/boopsie_challenge');
unless(mkdir $dir) {
  die "Couldn't create base directory\n$!\n"
}
#my $file = 'boopsie_test.tsv';
my $download = File::Fetch->new(uri => $url );
my $fetcher = $download->fetch ( to => $dir) or die "failed... $download->error";
