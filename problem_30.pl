#! /usr/bin/perl 

use warnings;
use strict;

my $n = 0;

my $res;
while( $n++ < 100000 ) {
    my $sum = 0;
    $sum += $_ foreach split //, $n;
    if( $sum % 10 == 0 ) {  
        foreach( 0 .. 9 ) {
            my $d = $n.$_;
            my $sum5;
            $sum5 += $_*$_*$_*$_*$_ foreach split //, $d;
            $res += $d if( $d == $sum5 );
        }
    }
}

print "Answer: $res\n";
