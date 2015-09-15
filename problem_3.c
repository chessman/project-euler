#include <stdio.h>
#include <string.h>
#include <math.h>

int main( ) 
{
  unsigned long i = 2, n = 600851475143;
  while( 1 ) {
    unsigned long a = n / i;
    unsigned long b = n % i;
    if( b ) {
      i++;
    } else {
      n = a;
      if( a == 1 ) {
        printf( "Answer: %lu\n", i );
	break;
      }
    }
  }

}
