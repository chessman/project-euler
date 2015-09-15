#! /usr/bin/perl

use strict;
use warnings;

use bignum;

sub rev {
    return join "", reverse split "", $_[0];
}

sub is_palindrome {
    my $a = shift;
    return $a == rev($a);
}

my $res = 0;

my $i = 10000;

NEXT: while( $i-- ) {
    my $j = 50;
    my $a = $i;
    while( $j-- ) {
        $a += rev( $a );
        next NEXT if is_palindrome( $a );
    }
    $res++;
}

print "Ansewer: $res\n";
