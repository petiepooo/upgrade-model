#include <stdio.h>
void print_array(double* array, int N)
{ for (int i=0;i<N;i++)
  printf("array %i value %.3f\n",i,array[i]);
}
