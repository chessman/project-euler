#include <stdio.h>
#include <string.h>
#include <math.h>

int main( ) 
{
  unsigned int i = 0, j, line = 0;
  unsigned long sum = 0, res = 0;
  char name[6000][ 20 ];
  FILE *f = fopen( "names.txt", "r" );
  while( fscanf( f, "\"%[^\"]\",", &name[ i++ ] ) != EOF );

  //number of element = i - 1 (EOF extra cycle)
  qsort( name, i - 1, 20, strcmp );

  for( j = 0; j < i; j++ ) {
    sum = 0;
    char *ptr = name[ j ];
    while( *ptr ) {
      sum += *ptr++ - 'A' + 1;
    }
    res += sum * ( j + 1 );
  }
  printf( "Answer: %u\n", res );
}
