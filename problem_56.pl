#!/usr/bin/perl

use strict;
use warnings;

use bignum;

my $res = 0;
foreach my $a ( 1 .. 99 ) {
    my $b = 1;
    while( $b < 100 ) {
        my $c = $a ** $b++;
        my $s = 0;
        $s += $_ foreach ( split "", $c );
        $res = $s if $s > $res;
    }
}

print "Answer: $res\n";
