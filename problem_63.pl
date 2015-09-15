#! /usr/bin/perl

use strict;
use warnings;

use bignum;

use feature qw(say switch);

my $res = 0;

foreach my $a ( 1 .. 9 ) {
    my $b = $a;
    my $c = 0;
    while( 1 ) {
        $c++;
        $b = $a ** $c;
        my $d = split "", $b;
        last if $d < $c;
        $res++;
    }
}

say "Answer: $res";
