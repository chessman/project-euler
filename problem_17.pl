#! /usr/bin/perl

use Lingua::EN::Numbers qw(num2en num2en_ordinal);

my $str;
foreach (1 .. 1000) {
  $_ = num2en( $_ );
  s/[ -]//g;
  $str = $str . $_;
}

print "Answer: ", length( $str ), "\n";
