#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

package Sieve;

sub init {
    my $class = shift;
    my $n = shift;
    my @primes = (1) x $n;
    $primes[0] = 0;
    $primes[1] = 0;
    foreach my $i ( 2 .. int(sqrt($n)) ) {
        next unless $primes[$i];
        for( my $j = 2 * $i; $j <= $n; $j += $i ) {
            $primes[$j] = 0;
        }
    }
    my $self = {
        primes => \@primes,
    };
    bless $self, $class;
    return $self;
}

sub test {
    my $self = shift;
    my $n = shift;
    return $self->{primes}->[$n];
}

sub iter {
    my $self = shift;
    my $n = shift // 2;
    return sub {
       while( defined( my $t = $self->test($n) ) ) {
           $n++;
           return $n - 1 if $t;
       }
       return undef;
    }
}

my $sieve = Sieve->init(1000000);
my $iter = $sieve->iter;

while( my $p = $iter->() ) {
    my $n = 0;
    my @p = split "", $p;
    my %p;
    $p{$_}++ foreach (@p);
    foreach my $d ( grep { $p{$_} > 1 } @p ) {
        my $res = 0;
        foreach (0 .. 9) {
            my $newp = $p;
            $newp =~ s/$d/$_/g;

            #filter numbers with leading zeros
            next if $newp < 10 ** (length($newp) - 1);
            $res++ if $sieve->test($newp);
        }

        if( $res == 8 ) {
            say "Answer: $p";
            exit 0;
        }
    }
}
