#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub gen_seq {
    my $func = shift;
    my $m = shift;
    my $n = shift;

    my $res = {};
    my $i = 0;
    while (++$i) {
        my $x = $func->($i);
        last if ($x >= $n);
        if ($x >= $m) {
            $x =~ /(\d\d)(\d\d)/;
            push @{$res->{$1}}, $2;
        }
    }
    return $res;
}

my @seq;

push @seq, gen_seq(sub {
        my $n = shift; return $n * ($n + 1) / 2;
    }, 1000, 10000);
push @seq, gen_seq(sub {
        my $n = shift; return $n * $n;
    }, 1000, 10000);
push @seq, gen_seq(sub {
        my $n = shift; return $n * (3 *$n - 1) / 2;
    }, 1000, 10000);
push @seq, gen_seq(sub {
        my $n = shift; return $n * (2 * $n - 1);
    }, 1000, 10000);
push @seq, gen_seq(sub {
        my $n = shift; return $n * (5 *$n - 3) / 2;
    }, 1000, 10000);
push @seq, gen_seq(sub {
        my $n = shift; return $n * (3 *$n - 2);
    }, 1000, 10000);

my %g = ();

for (my $i = 0; $i < @seq; $i++) {
    for (my $j = 0; $j < @seq; $j++) {
        next if $i == $j;
        my %s1 = %{$seq[$i]};
        my %s2 = %{$seq[$j]};
        foreach my $k (keys %s1) {
            foreach my $v (@{$s1{$k}}) {
                push @{$g{$k}}, [$j, $v] if exists $s2{$v};
            }
        }
    }
}

sub find_chain {
    my $n = shift;
    my $v = shift;
    my $prev = shift;
    my @stack = @_;

    if( @stack == @seq ) {
        if ( $stack[0][0] == $n &&
             $stack[0][1] == $v
         ) {
            $stack[0][2] = $prev;
            return @stack;
        } else {
            return ();
        }
    }

    my @n = map {$_->[0];} @stack; 
    if( $n ~~ @n ) {
        return ();
    }

    push @stack, [$n, $v, $prev];

    my @allow = grep { $_->[1] ~~ $seq[$n]->{$v} } @{$g{$v}};
    foreach (@allow) {
        my @s = find_chain($_->[0], $_->[1], $v, @stack);
        return @s if @s;
    }
    return ();
}

my @s;
foreach (keys %{$seq[0]}) {
    @s = find_chain(0, $_, 'x', ());
    last if @s;
}

my $sum = 0;
foreach (@s) {
    $sum += $_->[2] . $_->[1];
}

say $sum;
