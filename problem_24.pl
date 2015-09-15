#!/usr/bin/perl

my @digits = (0 .. 9);

sub permute {
    my @items = @_;
    my $n = 0;
    return sub {
        $n++, return @items if $n==0;
        my $i;
        my $p = $n;
        for ($i=1; $i<=@items && $p%$i==0; $i++) {
            $p /= $i;
        }
        my $d = $p % $i;
        my $j = @items - $i;
        return if $j < 0;
        @items[$j+1..$#items] = reverse @items[$j+1..$#items];
        @items[$j,$j+$d] = @items[$j+$d,$j];
        $n++;
        return @items;
    };
}

my $it = permute( @digits );

my $i = 999999;
while( $i-- ) {
    $it->();
}

print "Answer:", $it->(), "\n";
