#! /usr/bin/perl 

use List::MoreUtils qw/ uniq /;
use feature qw(say);

my @keylog;
my @digits;

while(<>) {
  push @keylog, $_;
}

foreach (@keylog) {
  @d = split //;
  $digits[ $d[ 0 ] ] .= $d[ 1 ] . $d[ 2 ];
  $digits[ $d[ 1 ] ] .= $d[ 2 ];
}

foreach $i (0 .. $#digits) {
  @dig = split // , $digits[ $i ];
  foreach $d (@dig) {
    $digits[ $i ] .= $digits[ $d ];
  }
  $digits[ $i ] = join '', uniq sort split // , $digits[ $i ];
}
@keys = sort { length $digits[ $b ] <=> length $digits[ $a ] } 0 .. $#digits;
foreach $key (@keys) {
  $key = undef if !grep {/$key/} @keylog;
}
say "Answer: ", join '', @keys;
