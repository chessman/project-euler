#include <stdio.h>
#include <string.h>

int main( void ) 
{
  char str[ 7 ];
  int i = 1, cnt = 0, d = 1, ans = 1, len;
  while( 1 ) {
   len = sprintf( str, "%u", i++ );
   cnt += len;
   if( cnt >= d ) {
     ans *= str[ len - ( cnt - d + 1 ) ] - '0';
     d *= 10;
     if( d > 1000000 ) break;
   } 
  }
  printf( "Answer: %u\n", ans );
  return 0;
}
