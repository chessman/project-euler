#include <stdio.h>
#include <string.h>
#include <math.h>

int main( )
{
#define N 2000000

  //eratosthenes sieve
  unsigned int sieve[ N ];
  unsigned int i, j;
  memset( sieve, 1, sizeof( sieve ) );

  unsigned long sum = 0;

  for( i = 2; i <= sqrt( N ); i++ ) {
    if( sieve[ i ] ) {
      for( j = 2 * i; j < N; j += i ) {
	sieve[ j ] = 0;
      }
    }
  }

  for( i = 2; i < N; i++ ) {
    if( sieve[ i ] ) {
      sum += i;
    }
  }

  printf( "Answer: %lu\n", sum );
}
