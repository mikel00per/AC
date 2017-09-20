#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
 #include <omp.h>
#else
 #define omp_get_thread_num() 0
#endif

main(int argc, char **argv) {

  int i, n = 7,chunk, a[n],suma=0;

  if(argc < 2) {
    fprintf(stderr,"\nFalta chunk \n");
    exit(-1);
  }

  chunk = atoi(argv[1]);

  for (i=0; i<n; i++)
    a[i] = i;

  #pragma omp parallel
  {
    #pragma omp for firstprivate(suma) lastprivate(suma) schedule(static,chunk)

    for (i=0; i<n; i++){
      suma = suma + a[i];
      printf(" thread %d suma a[%d] suma=%d \n",
      omp_get_thread_num(),i,suma);
    }

    #pragma omp master
    {
      printf("Dentro de la region paralela\n");
      printf("thread padre --> %d ==>\n",omp_get_thread_num());
      printf("omp_get_num_threads() --> %d\n",omp_get_num_threads());
      printf("omp_get_num_procs() --> %d\n",omp_get_num_procs());
      printf("omp_in_parallel() -->%d\n", omp_in_parallel());
    }
  }

  printf("/------------------------------/\nFuera de 'parallel for' suma=%d\n",suma);
  printf("thread padre --> %d ==>\n",omp_get_thread_num());
  printf("omp_get_num_threads() --> %d\n",omp_get_num_threads());
  printf("omp_get_num_procs() --> %d\n",omp_get_num_procs());
  printf("omp_in_parallel() -->%d\n", omp_in_parallel());

}
