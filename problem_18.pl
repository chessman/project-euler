#! /usr/bin/perl -w

use List::Util qw(max);
use feature qw(say);

my @sum_row;
while(<>) {
  my @row = split / /;
  my @tmp_row;
  if( not @sum_row ) {
    @sum_row = @row;
    next;
  }
  push @tmp_row, $row[0] + $sum_row[0];
  foreach my $i ( 1 .. $#row-1 ) {
    push @tmp_row, $row[ $i ] + max( $sum_row[ $i-1 ], $sum_row[ $i ] );
  }
  push @tmp_row, $row[ $#row ] + $sum_row[ $#sum_row ];
  @sum_row = @tmp_row;
}
print "Answer: ", max( @sum_row ), "\n";
