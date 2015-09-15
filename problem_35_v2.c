#include <stdio.h>
#include <string.h>
#include <math.h>

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

int rotate( int x )
{
    int r = x;
    int n = 1;
    while( r / 10 ) { r /= 10; n *= 10; }
    return 10 * ( x - r * n ) + r;
}

int has_zero( int x )
{
    while( x ) {
        if( x % 10 == 0 ) return 1;
        x /= 10;
    }
    return 0;
}

int main( ) 
{
    //eratosthenes sieve
    unsigned int sieve[ N + 1 ];

    sieve_init( sieve, N );

    int n = N;
    int num = 0;
    while( --n ) {
        if( !sieve[ n ] ) continue;
        if( has_zero( n ) ) continue;
        int r = n;
        int circular = 1;
        while( (r = rotate(r)) != n ) {
            if( !sieve[ r ] ) {
                circular = 0;
                break;
            }
        }
        if( circular ) {
            num++;
        }
    }
    printf( "Answer: %d\n", num );
}
