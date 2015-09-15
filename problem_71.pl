#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

#neighbour in same Farey sequance
my ($ra, $rb) = (2, 5);
while( 1 ) {
    my ($a, $b) = ($ra + 3, $rb + 7);
    last if $b > 1000000;
    ($ra, $rb) = ($a, $b);
}

say "Answer: $ra";
