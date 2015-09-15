#! /usr/bin/perl 

use Calendar::Simple;

my $first_sundays;
for( my $year = 1901; $year < 2001; $year++ ) {
  for( my $month = 1; $month <= 12; $month++ ) {
    my @month = calendar( $month, $year );
      my $days = 0;
      map { $days++ if defined $_ } @{$month[0]};
      $first_sundays++ if $days == 7;
  }
}

print $first_sundays;
