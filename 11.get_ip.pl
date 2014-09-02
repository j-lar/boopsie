#!/usr/bin/perl
use strict;
use warnings;
use Socket;

# get IP address of public.boopsie.com
# got this little recipe from the perl cookbook:
# http://bioinfo2.ugr.es/documentation/Perl_Cookbook/ch18_02.htm
my $domain = 'public.boopsie.com';

my @addresses = gethostbyname($domain) or die "Can't resolve $domain: $!\n";
@addresses = map { inet_ntoa($_) } @addresses[4 .. $#addresses];
foreach (@addresses) {
  print "IP address for $domain: $_\n";
}