#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use List::Util qw(sum);
use bignum;
use Memoize;

sub e_cont_frac {
    my $n = shift;
    return 2 if $n == 0;
    return 2 * ( int( $n / 3 ) + 1 ) if ( $n - 1 ) % 3 == 1;
    return 1;
}

memoize('p');
sub p {
    my $n = shift;
    return 1 if $n == -1;
    return e_cont_frac( 0 ) if $n == 0;
    return e_cont_frac( $n ) * p( $n - 1 ) + p( $n - 2 );
}

my $res = sum( split "", p(99) );
say "Answer: $res";
