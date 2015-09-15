#include <stdio.h>
#include <math.h>

int main( ) 
{
  unsigned int i, j;
  unsigned int sum = 0;
  for( i = 0; i < 334; i++ ) {
    if( i % 5 ) {
      sum += i * 3;
    }
  }
  for( i = 0; i < 200; i++ ) {
    if( i % 3 ) {
      sum += i * 5;
    }
  }
  for( i = 0; i < 67; i++ ) {
    sum += i * 15;
  }
  printf( "Answer: %u\n", sum );
}
