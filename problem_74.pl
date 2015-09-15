#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use List::Util qw(sum max);
use Memoize;

memoize('fac');
sub fac {
    my $n = shift;
    return 1 if $n == 0;
    return 1 if $n == 1;
    return $n * fac( $n - 1 );
}

my $res = 0;
my @h;
foreach my $n ( 1 .. 1000000 ) {
    my @n;
    while(1) {
        push @n, $n unless grep { $_ == $n } @n;
        if( $h[$n] ) {
            my $d = $h[$n];
            for( my $i = 0; $i < @n; $i++ ) {
                $h[$n[$#n - $i]] = $i + $d;
            }
            last;
        }
        $h[$n] = 1;
        $n = sum( map { fac($_) } split "", $n );
    }
}
$res = grep { defined($_) && $_ == 60 } @h;
say "Answer: $res";
