#include <stdio.h>
#ifdef _OPENMP
 #include <omp.h>
#else
 #define omp_get_thread_num()0
#endif

main(){
  int i, n = 7;
  int a[n], suma = 0;    // Inicizo suma fura de parallel
  for (i=0; i<n; i++)
    a[i] = i;

  #pragma omp parallel private(suma)
  {
    printf("\nAntes de omp for\n");

    #pragma omp for
    for (i=0; i<n; i++){
      /*
      * Solo funcionará correctamente en la primera hebra el resto funciona con
      * basura ya que está inicializada fura del parallel.
      */
      suma = suma + a[i];
      printf("thread %d suma a[%d] \n", omp_get_thread_num(), i);
    }

    printf("\n* Fuera del bucle\n* thread %d suma = %d\n", omp_get_thread_num(), suma);
  }

  printf("\n* Fuera de parallel\n* thread %d suma = %d\n", omp_get_thread_num(), suma);
}
