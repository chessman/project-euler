#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

my $res = 1;
my $line = 1;
my ($best_base, $best_exp) = split ",", <>;

while(<>) {
    $line++;
    my ($base, $exp) = split ",";

    if( $exp > $best_exp ) {
        ($res, $best_base, $best_exp) = ($line, $base, $exp)
            if $base ** ($exp/$best_exp) > $best_base;
    } else {
        ($res, $best_base, $best_exp) = ($line, $base, $exp)
            if $base > $best_base ** ($best_exp/$exp);
    }
}

say "Answer: $res";
