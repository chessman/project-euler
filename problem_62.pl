#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use List::Util qw(min);

my $i = 1;
my %s;
my $res;
while( 1 ) {
    $i++;
    my $c = $i ** 3;
    my $k;
    my %k;
    foreach (split "", $c) {
        $k{$_}++;
    }

    foreach (0..9) {
        $k .= $k{$_} ? $k{$_} : 0;
    }

    $s{$k}->{cnt}++;
    push @{$s{$k}->{cubes}}, $c;
    if( $s{$k}->{cnt} == 5 ) {
        $res = min( @{$s{$k}->{cubes}} );
        last;
    }
}

say "Answer: $res";
