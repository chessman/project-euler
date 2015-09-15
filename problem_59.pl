#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say switch);
use List::Util qw(sum);

my @enc = split ",", <>;

foreach my $a ( 'a' .. 'z' ) {
    foreach my $b ( 'a' .. 'z' ) {
        foreach my $c ( 'a' .. 'z' ) {
            my @dec;
            my @key = map { ord } ( $a, $b, $c );
            my $k = 0;
            foreach( @enc ) {
                my $dec = $_ ^ $key[$k];
                last if $dec < ord(' ');
                last if $dec > ord('Z') && $dec < ord('a');
                last if $dec > ord('z');
                push @dec, $dec;
                $k = ( $k + 1 ) % 3;
            }
            if( @dec == @enc ) {
                say "Answer: ", sum(@dec);
                exit 0;
            }
        }
    }
}
