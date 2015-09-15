#include <stdio.h>
#include <string.h>
#include <math.h>

int main( ) 
{
#define N 1000

  unsigned long i, j, sum = 0, tmp;
  for( i = 1; i <= N; i++ ) {
    tmp = 1;
    for( j = 1; j <= i; j++ ) {
      tmp = (tmp * i) % 10000000000;
    }
    sum = (sum + tmp) % 10000000000;
  }

  printf( "Answer: %lu\n", sum );
}
