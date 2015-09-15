#!/usr/bin/perl

use strict;

use feature qw(say);
use Memoize;

memoize('s');
sub s {
    my $x = shift;
    my $m = shift;

    return 1 if $m == 0 && $x == 0;
    return 0 if $m == 0;
    return 0 if $x < 0;
    return &s( $x, $m - 1 ) + &s( $x - $m, $m );
}

my $res = &s(100, 99);

say "Answer: $res";
