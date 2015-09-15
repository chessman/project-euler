#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define N 10000000

static int sieve_init( unsigned int *sieve, unsigned int n )
{
  unsigned int i, j;
  memset( sieve, 1, ( n + 1 ) * sizeof( unsigned int ) );

  sieve[0] = 0;
  sieve[1] = 0;

  for( i = 2; i <= sqrt( n ); i++ ) {
    if( sieve[ i ] ) {
      for( j = 2 * i; j <= n; j += i ) {
	sieve[ j ] = 0;
      }
    }
  }
}

int main( )
{
    unsigned int *sieve = malloc( sizeof( int ) * ( N + 1 ) );
    sieve_init( sieve, N );

    unsigned int res;
    unsigned int n = 3, i;

    while( ( n += 2 ) < N ) {
        if( sieve[n] ) continue;
        for( i = n - 1; i > 0; i-- ) {
            if( !sieve[i] ) continue;
            double x = sqrt( ( n - i ) / 2 );
            if( x == (unsigned int) x ) break;
        }
        if( i == 0 ) break;
    }
    printf( "Answer: %d\n", n );
}
