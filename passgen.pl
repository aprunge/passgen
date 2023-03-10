#!/bin/perl

# use module
use Time::HiRes qw(gettimeofday);
use Crypt::RandPasswd;

my $arg1 = int($ARGV[0]);
my $arg2 = int($ARGV[1]);

if($arg1 == NULL) {
    die "Usage: perl passgen.pl <arg1> <arg2>...\n";
}

if($arg2 == NULL) {
    die "Usage: perl passgen.pl <arg1> <arg2>...\n";
}

my @special_chars = ('!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', ']', '{', '}', '|', '\\', ';', ':', '\'', '\"', ',', '.', '/', '<', '>', '?');

my $start_time = gettimeofday();

for(my $i; $i <= $arg2; $i += 1){

# generate password
my $word = Crypt::RandPasswd->word($arg1, $arg1);
$word =~ s/(.)/int(rand(2)) ? uc($1) : lc($1)/eg;
$word = ucfirst($word);

my $word_with_special_chars = '';
for (my $i = 0; $i < length($word); $i++) {
    $word_with_special_chars .= substr($word, $i, 1);
    if (int(rand(2))) {
        $word_with_special_chars .= $special_chars[int(rand(@special_chars))];
    }
}

print "\n";
print $word_with_special_chars;
print "\n";

}

my $end_time = gettimeofday();
my $elapsed_time = ($end_time - $start_time) * 1000;

printf "\nElapsed time: %.3f milliseconds\n", $elapsed_time;
