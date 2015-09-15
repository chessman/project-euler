#! /usr/bin/perl 


my $sum = 1;

my $dist = 0;
my $elem = 1;
for( my $i = 1; $i <= 500; $i++ ) {
    $dist += 2;
    $elem += $dist;
    $sum += 4 * $elem + 6 * $dist;
    $elem += 3 * $dist;
}

print $sum;
