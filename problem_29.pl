#! /usr/bin/perl 

sub degree {
    my $n = shift;
    for( my $i = 2; $i <= sqrt($n); $i++ ) {
        my $p = $i * $i;
        my $d = 2;
        while( $p < $n ) {
            $p *= $i;
            $d++;
        }
        return $d if $p == $n;
    }
    return 0;
}

my $a = 2;
my $b = 100;

my $num;
foreach ($a..$b) {
    my $d = degree( $_ );
    my $n = $b - $a + 1;
    if( $d == 0 ) {
        $num += $n;
    } else {
        my @r;
        for( my $i = $a; $i <= $b; $i++ ) {
            for( my $s = 1; $s < $d; $s++ ) {
                my $t = ( $d * $i ) / $s;
                if( $t == int($t) &&
                    $t >= $a && $t <= $b ) {
                    $r[$i] = 1;
                }
            }
        }
        $num += $n - grep {$_} @r;
    }
}

print "Answer: $num\n";
