#!/usr/bin/perl
use strict;
use warnings;
use File::Fetch;
use LWP::Simple

my $domain = 'www.boopsie.com';
my $url = 'http://public.boopsie.com';
my $path = '_test/boopsie_test.tsv'
my $dir = glob('~/boopsie_challenge');

# get IP address of public.boopsie.com (combine with download and check if up?)

my $ip = exec(dig +short $url);

## detect if www.boopsie.com is up. verify it's not a dns issue by check without www

if (! head($url)) {
  die "$url is not reachable."
}
else {
  print "$url is up!";
}


# create directory for all the stuff we'll be doing
unless(mkdir $dir) {
  die "Couldn't create base directory\n$!\n"
}

my $download = File::Fetch->new(uri => '$url/$path' );
my $fetcher = $download->fetch ( to => $dir) or die "failed... $download->error";
