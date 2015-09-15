#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use List::MoreUtils qw(each_array);

sub equal {
    my $a = shift;
    my $b = shift;
    my $iter = each_array( @$a, @$b );
    while( my ($i, $j) = $iter->() ) {
        return 0 if $i != $j;
    }
    return 1;
}

my $n = 0;
my $bouncy = 0;
while( 1 ) {
    $n++;
    my @n = split "", $n;
    my @m = sort @n;
    next if equal( \@n, \@m );
    @m = reverse @m;
    next if equal( \@n, \@m );
    $bouncy++;
    last if $bouncy / $n >= 0.99;
}

say "Answer: $n";
