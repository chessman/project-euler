
use strict;
use warnings;

my @n;
my $d;
my $pal;

sub check_bin_palindrom {
    my @bin = split "", sprintf( "%b", $_[0] );
    my $i;
    for( $i = 0; $i < @bin/2; $i++ ) {
        return 0 if( $bin[$i] != $bin[ $#bin - $i ] );
    }
    return $_[0];
}

my $sum;

foreach my $x (1..999) {
    if($x == 1) {
        @n = (1,2,3);
        $d = 1;
    } elsif( $x == 11 ) {
        @n = (4,5);
        $d = 2;
    } elsif( $x == 101 ) {
        @n = (6);
        $d = 3;
    }

    foreach my $n (@n) {
        if( $n - $d == 0 ) {
            $pal = $x;
            $sum += check_bin_palindrom( $pal );
        } elsif( $n - 2*$d == 0 ) {
            $pal = $x . reverse split "", $x;
            $sum += check_bin_palindrom( $pal );
        } else {
            foreach my $m (0..9) {
                $pal = $x . $m . reverse split "", $x;
                $sum += check_bin_palindrom( $pal );
            }
        }

    }
}

print "Answer: $sum\n";
