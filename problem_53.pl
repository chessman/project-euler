#! /usr/bin/perl 

my @c;

push @c, [ 0 ];    #C(0,0)
push @c, [ 1, 1 ]; #C(0,1) C(1,1)

my $greater_than_million;

foreach my $n (2..100) {
    my @vals;
    push @vals, 1;  #C(0,n)
    push @vals, $n; #C(1,n)
    foreach my $k (2..$n - 1) {
        my $val = $c[$n-1][$k] + $c[$n-1][$k-1];
        push @vals, $val;
        $greater_than_million++ if( $val > 1000000 );
    }
    push @vals, 1; #C(n,n)
    push @c, \@vals;
}

print "Answer: $greater_than_million\n";
