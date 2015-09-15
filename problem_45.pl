#!/usr/bin/perl

my $n = 143;

#triangle is also hexagonal -> ignore it

while( $n++ ) {
    my $c = $n * ( 2 * $n - 1 );

    my $p = ( sqrt( 24 * $c + 1 ) + 1 ) / 6;
    next if $p != int( $p );
    
    print "Answer: $c\n";
    last;
}
