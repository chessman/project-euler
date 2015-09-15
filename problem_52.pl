#! /usr/bin/perl 

sub make_iter {
    my $n = 1;
    my $a = 10;
    my @p;
    sub {
        while( $n += 3 ) {
            if( $n > $a / 6 ) {
                $n = $a + (3 - $a % 3) % 3;
                $a *= 10;
            }
            my @d = split "", $n;
            next if !grep { $_ == 0 or $_ == 5 } @d;
            return $n;
        }
    }
}

sub compare {
    my @a = @{shift()};
    my @b = @{shift()};

    my %am;
    my %bm;
    foreach (@a) { $am{$_}++; }
    foreach (@b) { $bm{$_}++; }
    foreach (keys %am, keys %bm) {
        return 0 if $am{$_} != $bm{$_};
    }
    return 1;
}

my $iter = make_iter; 

my $n;
while( $n = $iter->() ) {
    my @n = split "", $n;
    foreach (2 .. 6) {
        my @t = split "", $_ * $n;
        if( !compare( \@n, \@t ) ) {
            goto NEXT;
        }
    }
    last;
    NEXT:
}

print "Answer: $n\n";
