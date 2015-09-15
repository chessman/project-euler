#! /usr/bin/perl

use strict;
use warnings;

use List::Util qw(first);

sub is_pandigital {
    my $x = shift;
    my @x = split "", $x;
    my %t ;
    foreach (@x) {
        return 0 if ( $_ == 0 || $_ > @x );
        $t{$_}++;
        return 0 if $t{$_} > 1;
    }
    return 0 if( first { !defined $t{$_} } (1 .. @x) );
    return 1;
}

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

#9-digits and 8-digits pandigital numbers are divided by 3
my $res = 7654321;

$res-- until( is_pandigital( $res ) and is_prime( $res ) );

print "Answer: ", $res, "\n" ;
