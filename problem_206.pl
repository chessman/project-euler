#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use bignum;

my @t = qw( 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 0 );

my $n = 1010101030;
while( 1 ) {
    my $sq = $n ** 2;
    my @sq = split "", $sq;
    for (my $i = $#sq; $i >= 0; $i -= 2 ) {
        if( $sq[$i] != $t[$i] ) {
            $sq -= $sq[$i] * 10 ** (@sq - $i - 1) - $t[$i] * 10 ** (@sq - $i - 1);
            if( $sq[$i] > $t[$i] ) {
                $sq += 10 ** (@sq - $i);
                @sq = split "", $sq;
            }
        }
    }
    my $sqrt = sqrt( $sq );
    last if $sqrt == int $sqrt;
    $n = int $sqrt + 1;
}
say "Answer: $n";
