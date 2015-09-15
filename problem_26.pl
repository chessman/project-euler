#! /usr/bin/perl 


sub next_digit {
    my $n = shift;
    my $r = 1;
    return sub {
        $r = 10*$r;
        my $d = int($r / $n);
        $r = $r % $n;
        return $d;
    }
}

my ($res, $max_p);

for( my $n = 999; $n > 1; $n-- ) {
    last if $n < $max_p;
    my $next_digit = next_digit( $n );
    my $digits;
    my $next = 0;
    #$next = $next_digit->() until( $next );
    $next = $next_digit->();
    $digits .= $next;
    while( 1 ) {
        my $len = length($digits);
        for( my $i = $len - 3; $i >=0; $i-- ) {
            if( substr( $digits, $len - 1, 1 ) eq substr( $digits, $i, 1 ) ) {
                my $p = $len - $i - 1;
                if( substr( $digits, $i - $p, $p ) eq substr( $digits, $i, $p ) ) {
                    ($res, $max_p) = ($n, $p) if( $max_p < $p );
                    goto next_n;
                }
            }
        }
        $digits .= $next_digit->();
    }
    next_n:
}

print "Answer: $res\n";
