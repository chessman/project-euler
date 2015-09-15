#! /usr/bin/perl -w

use bignum;

my $fib1 = 1;
my $fib2 = 1;
my $count = 2;
while( 1 ) {
  $count++;
  ($fib1, $fib2) = ($fib2, $fib1 + $fib2);
  last if length( $fib2 ) >= 1000;
} 
print "Answer: $count\n";
