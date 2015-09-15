#! /usr/bin/perl 

use warnings;
use strict;

sub factorial {
    my $n = shift;
    return 1 if $n == 0;
    return 1 if $n == 1;
    return $n * factorial( $n - 1 );
}

my %f = map { $_ => factorial( $_ ) } (0..9);

my $n = 10;
my $res;
while( $n++ < 7 * $f{9} ) {
    my $sumf = 0;
    $sumf += $f{$_} foreach split //, $n;
    $res += $n if( $sumf == $n );
}

print "Answer: $res\n";
