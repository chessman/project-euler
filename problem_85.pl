#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub all_types_rects {
    my ($n, $m) = @_;
    return $n * ($n + 1) * $m * ($m + 1) / 4;
}

my $res;
my $diff = 2000000;
foreach my $n (1 .. 200) {
    foreach my $m (1 .. 200) {
        #say "($n, $m)";
        my $s = &all_types_rects($n, $m);
        my $d = abs($s - 2000000);
        if ( $d < $diff) {
            $diff = $d;
            $res = $n * $m;
        }
    }
}

say "Answer: $res";
