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
my $file = glob('/tmp/boopsie_challenge/boopsie_test.tsv');
my $table_name = "info";

open (FILE, $file)
  or die "Could not open $file $!";

# get header and put in array
my $header = <FILE>;
my @schema = split("\t", $header);

#drop db if exists, create db, reconnect using new db, create table
$dbh -> do("DROP DATABASE IF EXISTS `$database`;");
$dbh -> do("CREATE DATABASE `$database`;");
$dbh = DBI -> connect("dbi:mysql:dbname=$database:$host",$user,$password);
$dbh -> do("CREATE TABLE $table_name ($schema[0] VARCHAR(256), $schema[1] VARCHAR(256), $schema[2] VARCHAR(8), $schema[3] VARCHAR(10), $schema[4] VARCHAR(256));");

#import from boopsie_test.tsv into db, ignoring first line
$dbh -> do("LOAD DATA INFILE '$file' 
		   INTO TABLE info
		   FIELDS TERMINATED by '\t'
		   LINES TERMINATED BY '\n'
		   IGNORE 1 LINES
		   ($schema[0], $schema[1], $schema[2], $schema[3], $schema[4]);"
		  );
`mysqldump -u$user -p'$password' $database > /tmp/boopsie_challenge/boopsie_test.sql`