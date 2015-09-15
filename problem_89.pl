#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

my @rules = (
    ['IIII', 'IV'],
    ['VIV', 'IX'],
    ['XXXX', 'XL'],
    ['LXL', 'LC'],
    ['CCCC', 'CD'],
    ['DCD', 'CM'],
);

sub optimize {
    my $str = shift;
    my $t = $str;
    foreach (@rules) {
        $t =~ s/$_->[0]/$_->[1]/g;
    }
    return optimize($t) if $t ne $str;
    return $t;
}

my $sum1 = 0;
my $sum2 = 0;

while( <> ) {
    $sum1 += length($_);
    $sum2 += length(optimize($_));
}

say "Answer: " . ($sum1 - $sum2);
