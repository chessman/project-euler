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
    int n = 1000000;
    int num = 0;
    while( n-- ) {
        if( !is_prime( n ) ) continue;
        if( has_zero( n ) ) continue;
        int r = n;
        int circular = 1;
        while( (r = rotate(r)) != n ) {
            if( !is_prime( r ) ) {
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
