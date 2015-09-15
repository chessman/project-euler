#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define N 1000000

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

    unsigned int res_r = 0, res;
    unsigned int n, next, d = 1;

    while( ++d < N ) {
        n = d;
        if( !sieve[n] ) continue;
        unsigned int r = 1;
        next = n;
        while( n < N ) {
            next++;
            while( next < N && !sieve[ next ] ) next++;
            if( next == N ) break;
            n += next;
            if( n < N ) {
                r++;
                if( res_r < r && sieve[n] ) {
                    res_r = r;
                    res = n;
                }
            }
        }
    }

    printf( "Answer: %d\n", res );
}
