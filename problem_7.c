#include <stdio.h>
#include <string.h>
#include <math.h>

char is_prime( unsigned int p )
{
  if( p < 2 ) {
    return 0;
  }

  if( p == 2 ) {
    return 1;
  }

  if( p % 2 == 0) {
    return 0;
  }

  unsigned int i;
  for( i = 3; i <= sqrt( p ); i+=2 ) {
    if( p % i == 0 ) {
      return 0;
    }
  }
  return 1;
}

int main( )
{
  int i = 0, p = 2;
  while( i != 10001 ) {
   if( is_prime( p++ ) ) {
      i++;
    }
  }

  printf( "Answer: %u\n", --p );
}
