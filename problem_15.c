#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#define N 21

int main( )
{
  unsigned long M[ N ][ N ];
  int i, j;

  memset( M, 0, sizeof( M ) );

  M[ 0 ][ 0 ] = 1;

  for( i = 0; i < N; i++ ) {
    for( j = 0; j < N; j++ ) {
      if( i ) {
	M[ i ][ j ] += M[ i - 1 ][ j ];
      }
      if( j ) {
        M[ i ][ j ] += M[ i ][ j - 1 ];
      }
    }
  }

  printf( "Answer: %lu\n", M[ N - 1 ][ N - 1 ] );
}
