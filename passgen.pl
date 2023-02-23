#!/bin/perl

# use module
use Time::HiRes qw(gettimeofday);
use Crypt::RandPasswd;

my $arg1 = int($ARGV[0]);

if($arg1 == NULL) {
    die "Usage: perl passgen.pl <arg1>...\n";
  }

my $start_time = gettimeofday();

# generate password
my $word = Crypt::RandPasswd->word($arg1, $arg1);
$word =~ s/(.)/int(rand(2)) ? uc($1) : lc($1)/eg;
$word = ucfirst($word);
print $word;

my $end_time = gettimeofday();
my $elapsed_time = ($end_time - $start_time) * 1000;

printf "\nElapsed time: %.3f milliseconds\n", $elapsed_time;
