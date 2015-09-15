#include <stdio.h>
#include <math.h>

static int is_prime( unsigned long p )
{
  if( p < 2 ) {
    return 0;
  }

  if( p == 2 ) return 1;
  if( p % 2 == 0 ) return 0;

  unsigned long i;
  for( i = 3; i <= sqrt( p ); i+=2 ) {
    if( p % i == 0 ) {
      return 0;
    }
  }
  return 1;
}

int main( ) 
{
    int n = 11;
    int prime_num = 0, prime_sum = 0;
    while( n++ ) {
        if( !is_prime( n ) ) {
            continue;
        }
        int fail = 0, t = n;
        while( t /= 10 ) {
            if( !is_prime( t ) ) {
                fail = 1;
                break;
            }
        }

        if( fail ) continue;

        fail = 0, t = n;

        while( 1 ) {
            int r = t, n = 1;
            while( r / 10 ) { r /= 10; n *= 10; }
            t -= r * n;
            if( !t ) break;
            if( !is_prime( t ) ) {
                fail = 1;
                break;
            }
        }
        
        if( fail ) continue;

        prime_num++;
        prime_sum += n;
        if( prime_num == 11 ) {
            break;
        }
    }
    printf( "Answer: %d\n", prime_sum );
}
