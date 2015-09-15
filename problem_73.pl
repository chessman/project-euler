#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use POSIX;

sub gcd {
    my ($a, $b) = @_;
    ($a, $b) = ($b, $a) if $a > $b;
    while ($a) {
        ($a, $b) = ($b % $a, $a);
    }
    return $b;
}

my $res = 0;
foreach my $b ( 2 .. 12000 ) {
    foreach my $a ( floor($b / 3) + 1 .. ceil($b / 2) - 1 ) {
        my $d = gcd( $a, $b );
        next if $d > 1;
        $res++;
    }
}

say "Answer: $res";
