#!/usr/bin/perl


my @coins = qw(200 100 50 20 10 5 2 1);

sub permutations {
    my $sum = shift;
    my $coins = shift;

    return 0 if( @$coins == 0 || $sum < 0 );
    return 1 if( $sum == 0 );

    my ($c, @coins) = @$coins;

    return permutations( $sum - $c, $coins ) + permutations( $sum, \@coins );
}

print "Answer:", permutations( 200, \@coins ),"\n";
