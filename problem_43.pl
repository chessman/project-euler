#! /usr/bin/perl

use strict;
use warnings;

use List::Util qw(first sum);

sub is_pandigital {
    my %t ;
    foreach (split "", $_[0]) {
        $t{$_}++;
        return 0 if $t{$_} > 1;
    }

    return keys %t;
}

sub trinity {
    my @t = split "", $_[0];
    return join "", ( @t[ @t == 2 ? 0 : $#t - 1, $#t ], $_[1] );
}

my @a;
for( my $i = 10; $i < 999; $i+=2 ) {
    push @a, $i;
}

foreach my $d (3, 5, 7, 11, 13, 17) {
    my @b;
    foreach my $a (@a) {
        foreach my $i (0 .. 9) {
            my $x = trinity( $a, $i );
            my $b = $a . $i;
            push @b, $b if $x % $d == 0 && is_pandigital( $b );
        }
    }
    @a = @b;
}

@a = grep { is_pandigital( $_ ) == 9 } @a;

my @b;
foreach my $a (@a) {
    my @d = split "", $a;
    my @t;
    $t[$_] = 1 foreach @d;
    foreach (0 .. 9) {
        push @b, ( $_ . $a ) unless $t[$_];
    }
}

print "Answer: ", sum( @b ), "\n";
