#! /usr/bin/perl 

sub gcd {
    my ($a, $b) = @_;
    return $a if $b == 0; 
    return gcd( $b, $a % $b );
}

my $nom = 1;
my $denom = 1;
foreach my $a (1..9) {
    foreach my $x (1..9) {
        foreach my $y (1..9) {
            next if $x == $y;
            next if $x/$y > 1;
            my @n = ( 10 * $a + $x, 10 * $x + $a );
            my @d = ( 10 * $y + $a, 10 * $a + $y );
            foreach (0, 1) {
               if( $n[$_]/$d[$_] == $x/$y ) {
                   $nom *= $x;
                   $denom *= $y;
               }
            }
        }
    }
}

my $res = $denom / gcd( $nom, $denom );

print "Answer: $res\n" ;
