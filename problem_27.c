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
    int a, b, n;
    int res = 0, res_a, res_b;
    for( b = 2; b < 1000; b++ ) {
        if( !is_prime(b) ) continue;
        for( a = -999; a < 999; a += 2 ) {
            int v = b;
            n = 0;
            do {
                v += 2*n + 1 + a;
                if( v < 0 ) break;
                n++;
            } while( is_prime(v) );
            if( res < n + 1 ) { 
                res = n + 1;
                res_a = a;
                res_b = b;
            }
        }
    }

    printf( "Answer: %d\n", res_a*res_b );
}
