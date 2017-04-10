#include <stdio.h>

char my_string[20];

void function(char c) {
   my_string[0] = c;
   my_string[1] = 0;
}

void function(char *str) {
   int i;
   for (i=0; str[i]!=0; i++) {
      my_string[i] = str[i];
   }
}

int main() {
   function('h');
   printf(my_string);
   printf("\n");
   function("Hola!\n");
   printf(my_string);

   return 0;
}
