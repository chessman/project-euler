#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use List::Util qw(min);

my $m;
while( <> ) {
    my @t = split ",";
    push @$m, \@t;
}

my $n = @{$m->[0]};
my $d;
$d->[0][0] = $m->[0][0];

foreach my $i ( 0 .. $n - 1 ) {
    foreach my $j ( 0 .. $n - 1 ) {

        next if $i == 0 && $j == 0;

        my $left = $d->[$i][$j-1] // 'Inf';
        my $top = $d->[$i-1][$j] // 'Inf';

        $d->[$i][$j] = $m->[$i][$j] + min( $left, $top );
    }
}

my $res = $d->[$n-1][$n-1];
say "Answer: $res";
