#include <stdio.h>
#include <math.h>

int main( ) 
{
    int n = 1000, max_num = 0, best_n;
    while( n-- ) {
        int a, c, num = 0, sqrt_b;
        float b;
        for( c = n / 3; c <= n / 2; c++ ) {
            for( a = 1; a < c; a++ ) {
                b = sqrt( c*c - a*a );
                if( b > a &&
                    (int)( b ) == b &&
                    b + a + c == n ) {
                     num++;
                }
            }
        }
        if( max_num < num ) { 
            max_num = num;
            best_n = n;
        }
    }
    printf( "Answer: %d\n", best_n );
}
