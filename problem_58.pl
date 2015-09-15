#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say switch);

sub is_prime {
    my $p = shift;
    return 0 if $p < 2;

    return 1 if $p == 2;
    return 0 if( $p % 2 == 0 );

    for( my $i = 3; $i < sqrt( $p ); $i+=2 ) {
        return 0 if $p % $i == 0;
    }
    return 1;
}

my $primes = 0;
my $nums = 1;
my $x = 1;
LOOP: while( 1 ) {
    $x += 2;
    foreach (qw( 3 2 1 0 )) {
        if( $_ ) {
            my $y = $x**2 - $_ * ($x - 1);
            $primes++ if is_prime( $y );
        }
        $nums++;
        last LOOP if( $primes / $nums < 0.1 );
    }
}

print "Answer: $x\n";
