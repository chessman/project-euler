#!/usr/bin/perl

use strict;
use warnings;

use feature qw(say);
use List::Util qw(first);
use List::MoreUtils qw(all notall each_array);

my @vals_rank = qw( A K Q J T 9 8 7 6 5 4 3 2 );
my %vals_rank = map { $vals_rank[$_] => $_ } (0 .. $#vals_rank);

sub max_card {
    my @vals = @_;
    return first { $_ ~~ @vals } @vals_rank;
}

sub min_card {
    my @vals = @_;
    return first { $_ ~~ @vals } reverse @vals_rank;
}

sub dest {
    my $v1 = shift;
    my $v2 = shift;
    my $i1 = $vals_rank{$v1};
    my $i2 = $vals_rank{$v2};
    return abs( $i1 - $i2 );
}

sub equal_suit {
    my @suits = @_;
    my $s = shift @suits;
    return 0 if notall { $_ eq $s } @suits;
    return 1;
}

sub how_many_vals {
    my @vals = @_;
    my %vals_number;
    foreach my $v (@vals) {
        $vals_number{$v}++;
    }
    return %vals_number;
}

sub sort_vals{
    my @vals = @_;
    sort { $vals_rank{$a} <=> $vals_rank{$b} } @vals;
}

sub streight_flash {
    my @cards = @_;
    if( flush( @cards ) ) {
        return streight( @cards );
    }
    return 0;
}

sub four_of_a_kind {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my %vals_num = how_many_vals(@vals);
    foreach my $v (keys %vals_num) {
        return [$v, grep { $_ ne $v } @vals ] if $vals_num{$v} == 4;
    }
    return 0;
}

sub full_house {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my %vals_num = how_many_vals(@vals);
    my $pair = 0;
    my $three = 0;
    my $v1;
    my $v2;
    foreach my $v (keys %vals_num) {
        ($pair, $v1) = ($pair + 1, $v) if $vals_num{$v} == 2;
        ($three, $v2) = ($three + 1,$v) if $vals_num{$v} == 3;
    }
    return [sort_vals($v1,$v2)] if $pair && $three;
    return 0;
}

sub flush {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my @suits = map { $_->[1] } @cards;
    my $max_card =max_card(@vals);
    return 0 unless equal_suit(@suits);
    return [$max_card];
}

sub streight {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my $max_card =max_card(@vals);
    my $min_card =min_card(@vals);
    my %vals_num = how_many_vals(@vals);
    return 0 unless dest($max_card, $min_card) == 4 &&
                    all { $_ == 1 } values %vals_num;
    return [$max_card];
}

sub three_of_a_kind {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my %vals_num = how_many_vals(@vals);
    my $v;
    foreach my $v (keys %vals_num) {
        return [$v, sort_vals( grep { $_ ne $v } @vals )] if $vals_num{$v} == 3;
    }
    return 0;
}

sub two_pairs {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my %vals_num = how_many_vals(@vals);
    my $pair = 0;
    my @v;
    foreach my $v (keys %vals_num) {
        ($pair, $v[$pair]) = ($pair + 1, $v) if $vals_num{$v} == 2;
    }
    return [sort_vals(@v), grep { !($_ ~~ @vals) } @vals] if $pair == 2;
    return 0;
}

sub one_pair {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my %vals_num = how_many_vals(@vals);
    my $v;
    foreach my $v (keys %vals_num) {
        return [$v, sort_vals( grep { $_ ne $v } @vals )] if $vals_num{$v} == 2;
    }
    return 0;
}

sub high_card {
    my @cards = @_;
    my @vals = map { $_->[0] } @cards;
    my @sorted = sort_vals( @vals );
    return [@sorted];
}

my @hand_rank = (
    \&streight_flash,
    \&four_of_a_kind,
    \&full_house,
    \&flush,
    \&streight,
    \&three_of_a_kind,
    \&two_pairs,
    \&one_pair,
    \&high_card
);

sub compare_hands {
    my $p1_cards = shift;
    my $p2_cards = shift;
    foreach my $hr (@hand_rank) {
        my $r1 = $hr->(@$p1_cards);
        my $r2 = $hr->(@$p2_cards);
        return 1 if( $r1 && !$r2 );
        return 0 if( !$r1 && $r2 );
        if( $r1 && $r2 ) {
            my $iter = each_array( @$r1, @$r2 );
            while( my ($v1, $v2) = $iter->() ) {
                return 1 if $vals_rank{$v1} < $vals_rank{$v2};
                return 0 if $vals_rank{$v1} > $vals_rank{$v2};
            }
        }
    }
}

sub str_to_cards {
    my $str = shift;
    my @cards = split " ", $str;
    return map { my $suit = chop $_;
                 [ $_, $suit ]; } @cards;
}

my $res = 0;
while(<>) {
    my @cards = map { my $suit = chop $_;
                 [ $_, $suit ]; } split ' ';
    my @p1_cards = @cards[0 .. 4];
    my @p2_cards = @cards[5 .. 9];

    $res++ if compare_hands( \@p1_cards, \@p2_cards );
}

say "Answer: $res";
