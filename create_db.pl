#!/usr/bin/perl
use strict;
use warnings;
use DBI;

# print "Enter DB host:\n";
# chomp( my $host = <STDIN> );
# print "Enter DB user with create access:\n";
# chomp( my $user = <STDIN> );
print "Enter DB password\n";
chomp( my $password = <STDIN> );
my $host = "localhost";
my $user = "root";
my $database = "libraries";
my $dbh = DBI -> connect("dbi:mysql::$host",$user,$password);
my $file = glob('~/boopsie_challenge/boopsie_test.tsv');

open (FILE, $file)
  or die "Could not open $file $!";

# get header and put in array
my $header = <FILE>;
my @schema = split("\t", $header);

#drop if exists, create, reconnect using db, create table
$dbh -> do("DROP DATABASE IF EXISTS `$database`;");
$dbh -> do("CREATE DATABASE `$database`;");
$dbh = DBI -> connect("dbi:mysql:dbname=$database:$host",$user,$password);
$dbh -> do("CREATE TABLE info ($schema[0] VARCHAR(256), $schema[1] VARCHAR(256), $schema[2] VARCHAR(8), $schema[3] VARCHAR(10), $schema[4] VARCHAR(256));");

#import from boopsie_test.tsv into db
open (FILE, $file)
  or die "Could not open $file $!";

my @data = {};
while (<FILE>) {
  chomp;
  my @data = split("\t");
}

for my $data (@data) {
  print $data . "\n";
}
