#! /usr/bin/perl

use strict;
use warnings;

my $i = 1;
while( 1 ) {
    $i++;
    for( my $j = $i - 1; $j > 0; $j-- ) {
        my $a = $i * ( 3 * $i - 1 ) / 2;
        my $b = $j * ( 3 * $j - 1 ) / 2;

        my $root1 = ( 1 + sqrt( 1 + 24 * ($a + $b) ) ) / 6;
        next if $root1 != int( $root1 );

        my $root2 = ( 1 + sqrt( 1 + 24 * ($a - $b) ) ) / 6;
        next if $root2 != int( $root2 );

        my $res = $a - $b;
        print "Answer: $res\n";
        exit 1;
    }
}
