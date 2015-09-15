#! /usr/bin/perl

use strict;
use warnings;

use List::Util qw(first sum);

my %res;

sub is_pandigital {
    my %t ;
    foreach (@_) {
        foreach (split "", $_) {
            return 0 if $_ == 0;
            $t{$_}++;
            return 0 if $t{$_} > 1;
        }
    }
    return 0 if( first { !defined $t{$_} } (1 .. 9) );
    return 1;
}

my %p;

#there are only 3 possible variants:
#digits * digits = digits
#     1        4 =      4
#     2        3 =      4
#     3        3 =      3
foreach ( [ [ 1, 9 ], [ 1234, 9876 ] ],
          [ [ 12, 98 ], [ 123, 987 ] ],
          [ [ 123, 987 ], [ 123, 987 ] ] ) {
    my $a = $_->[0];
    my $b = $_->[1];
    my $need_digits = 9 - (split("", $a->[0]) + split("", $b->[0]));
    foreach my $i ($a->[0] .. $a->[1]) {
        foreach my $j ($b->[0] .. $b->[1]) {
            my $k = $i * $j;
            last if split("", $k) > $need_digits;
            $p{$k} = 1 if is_pandigital( $i, $j, $k );
        }
    }
}

print "Answer: ", sum( keys %p ), "\n" ;
