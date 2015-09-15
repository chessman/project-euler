#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

int dividers_cnt( int p )
{
  int div = 1, cnt, i;
  for( i = 2; i <= p; i++ ) {
    cnt = 1;
    while( ( p % i ) == 0 ) {
      cnt++;
      p /= i;
    }
    div *= cnt;
  }
  return div;
}

int main( ) 
{
  int i, p = 1, j = 1;

  while( 1 ) {
    j++;
    p += j;
    if( dividers_cnt( p ) > 500 ) {
      break;
    }
  }

  printf( "Answer: %u\n", p );
}
