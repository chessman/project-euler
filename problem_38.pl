#! /usr/bin/perl

use strict;
use warnings;

use List::Util qw(first);

sub is_pandigital {
    my %t ;
    foreach (@_) {
        foreach (split "", $_) {
            return 0 if $_ == 0;
            $t{$_}++;
            return 0 if $t{$_} > 1;
        }
    }
    return -1 if( first { !defined $t{$_} } (1 .. 9) );
    return 1;
}

my $res = 0;

#918273645 is known solution
foreach ( [ 9, 9 ], [ 98, 91 ],
          [ 987, 918 ], [ 9876, 9182 ] ) {
    my $a = $_->[0];
    my $b = $_->[1];
    foreach( $b .. $a ) {
        my $i = 2;
        my $t = $_;
        my $r = $_;
        while( 1 ) {
            $r .= $i * $t;
            my $pd = is_pandigital( $r );
            last unless $pd;
            if( $pd == 1 ) {
                $res = $r if $r > $res;
                last;
            }
            $i++;
        }
    }
}

print "Answer: ", $res, "\n" ;
