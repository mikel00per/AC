#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv){

  void funcA() {
    printf("En funcA: esta sección la ejecuta el thread %d\n",omp_get_thread_num());
  }

  void funcB() {
    printf("En funcB: esta sección la ejecuta el thread %d\n",omp_get_thread_num());
  }

  #pragma omp parallel sections
  {
    #pragma omp section
      (void) funcA();
    #pragma omp section
      (void) funcB();
    }
}
