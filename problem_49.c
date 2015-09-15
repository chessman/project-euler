#include <stdio.h>
#include <math.h>

#define DIGITS 4

static int is_prime( unsigned long p )
{
  if( p < 2 ) {
    return 0;
  }

  unsigned long i;
  for( i = 2; i <= sqrt( p ); i++ ) {
    if( p % i == 0 ) {
      return 0;
    }
  }
  return 1;
}

static int n_digit( int x, int n ) 
{
  return (int) ( x / pow( 10, n ) ) % 10;
}

static int is_permutate( int a, int b, int c )
{
  int a_mask, b_mask, c_mask, i;
  a_mask = b_mask = c_mask = i = 0;
  for( i = 0; i < DIGITS; i++ ) {
    a_mask |= 1 << n_digit( a, i );
    b_mask |= 1 << n_digit( b, i );
    c_mask |= 1 << n_digit( c, i );
  }

  return ( a_mask == b_mask ) && ( b_mask == c_mask );
}

int main( void ) 
{
  int a, b, c;
  for( a = 1111; a < 9999 - 6660; a++ ) {
    b = a + 3330;
    c = b + 3330;
    if( is_permutate( a, b, c ) &&
	is_prime( a ) &&
	is_prime( b ) &&
	is_prime( c ) ) {
      printf( "%u %u %u\n", a, b, c );
    }
  }
}
