#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(int argc, char ** argv){

  int N, i, j, k, suma=0, c;
  int *A, *B, *C;
  struct timespec cgt1,cgt2;

  if(argc < 2){
    printf("Introduzca El numero de filas/columnas:\n");
    exit(-1);
  }

  N = atoi(argv[1]);

  // reservamos memoria
  A = malloc(sizeof(int) * N * N);
  B = malloc(sizeof(int) * N * N);
  C = malloc(sizeof(int) * N * N);

   if((A || B || C) == 0){
  //if(A == NULL || B == NULL || C == NULL){
    printf("No se ha podido reservar memoria\n");
    exit(-1);
  }

  // inicializamos la matriz A y B
  for(i=0; i<N; ++i){
    for(j=0; j<N; ++j){
      A[i*N+j] = i+j+1;
      B[i*N+j] = i+j*2;
      C[i*N+j] = 0;
    }
  }

  // algoritmo de multiplicacion de matrices cuadradas
  clock_gettime(CLOCK_REALTIME,&cgt1);

  for(i=0; i<N; ++i)
    for(j=0; j<N; ++j)
      for(k=0; k<N; ++k)
        C[i*N+j] += A[i*N+k] * B[k*N+j];

  clock_gettime(CLOCK_REALTIME,&cgt2);
  double ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("Resultado:\nC[0][0]=%d, C[%d][%d]=%d\n", C[0], N-1, N-1, C[(N-1)*N+(N-1)]);
  printf("Tiempo transcurrido en segundos: %0.6f\n", ncgt);

  // liberamos memoria
  free(A); free(B); free(C);
}
