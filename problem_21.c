#include <stdio.h>
#include <string.h>
#include <math.h>

int main( ) 
{
#define N 10000

  int divisors_sum[ N ];
  memset( divisors_sum, 0, sizeof( divisors_sum ) );

  int i, j, sum = 0;
  for( i = 1; i < N; i++ ) {
    for( j = 1; j <= i / 2; j++ ) {
      if( i % j == 0 ) {
	divisors_sum[ i ] += j;
      }
    }

    if( divisors_sum[ i ] < i &&
	divisors_sum[ divisors_sum[ i ] ] == i ) {
      sum += i + divisors_sum[ i ];
    }
  }

  printf( "Answer: %u\n", sum );
}
