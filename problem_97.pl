#! /usr/bin/perl

use strict;
use warnings;

sub last_ten {
    my $c = shift;
    my @c = split "", $c;
    my $from = $#c < 9 ? 0 : $#c - 9;
    my $to = $#c;
    return join "", @c[$from .. $to];
}

my $a = 4096;

for( my $i = 1; $i < 652538; $i++ ) {
    $a *= 4096;
    $a = last_ten( $a );
}

$a = last_ten( 2 * $a );
$a = last_ten( 28433 * $a );
$a++;

print "Answer: $a\n";
