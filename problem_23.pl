
use strict;
use warnings;

use Memoize;

sub mu {
    my $n = shift;
    return 1 if $n == 1;
    for( my $i = 2; $i <= $n; $i++ ) {
        if( $n % $i == 0 ) {
            return 0 if( ( $n / $i ) % $i == 0 );
            return (-1) * mu( $n / $i );
        }
    }
}

sub dividers_sum {
    my $n = shift;
    return 0 if $n == 1;
    my $sum = 0;
    for( my $i = 2; $i <= $n; $i++ ) {
        if( $n % $i == 0 ) {
            $sum -= mu( $i ) * ( dividers_sum( $n / $i ) + $n / $i );
        }
    }
    return $sum;
}

memoize( 'mu' );
memoize( 'dividers_sum' );

my @abundant;
foreach (1..28123) {
    push @abundant, $_ if dividers_sum( $_ ) > $_;
}

my @nums;
foreach my $i (@abundant) {
    foreach my $j (@abundant) {
        $nums[$i+$j] = 1;
    }
}

my $sum = 0;
foreach (1..28123) {
    $sum += $_ if !defined $nums[ $_ ];
}

print "Answer: $sum\n";
