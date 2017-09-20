#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#define VECTOR_DYNAMIC

#ifdef VECTOR_GLOBAL
  #define MAX 33554432 //=2^25
  double matriz[MAX*MAX], vector[MAX], vTotal[MAX];  //denotaremos siempre por comodidad una matriz cuadrada de orden n como un vector de tamaño n x n
#endif

int main(int argc, char** argv){
  int i, j, chunk, kind;
  double suma, ncgt, start, end;

  if (argc<4){
    printf("Te ha faltado por introducir algún dato\nDebes introducir en este dorden:\n-Dimension de la matriz \n-Tipo de scchedule(1 static, 2 dynamic, 3 guided)\n-Chunk\n");
    exit(-1);
  }
  unsigned int TAM = atoi(argv[1]);

  if((atoi(argv[2])==1)||(atoi(argv[2])==2)||(atoi(argv[2])==3))
    kind = atoi(argv[2]);
  else{
    printf("Error en el tipo de schedule usad 1 static, 2 dynamic, 3 guided\n");
    exit(-1);
  }

  chunk = atoi(argv[3]);
  omp_set_schedule(kind,chunk);
  #ifdef VECTOR_LOCAL
    double matriz[TAM*TAM], vector[TAM], vTotal[TAM];
  #endif

  #ifdef VECTOR_GLOBAL
    if (TAM>MAX)
      TAM=MAX;
  #endif

  #ifdef VECTOR_DYNAMIC
    double *matriz, *vector, *vTotal;
    matriz = (double*) malloc(TAM*TAM*sizeof(double));
    vector = (double*) malloc(TAM*sizeof(double));
    vTotal = (double*) malloc(TAM*sizeof(double));

    if ( (matriz==NULL) || (vector==NULL) || (vTotal==NULL) ){
      printf("Error a la hora de reservar memoria para alguno de los vectores y/o 'matriz'\n");
      exit(-2);
    }
  #endif

  #pragma omp parallel for default(none) private(j) shared (TAM, matriz, vector, vTotal, i)
  for(i=0; i<TAM; i++){
    for(j=0; j<TAM; j++){
      if(j < i)
        matriz[(i*TAM)+j] = 0.0;
      else
        matriz[(i*TAM)+j] = TAM*0.1+j*0.1;
    }
    vector[i] = TAM*0.1-i*0.1;
    vTotal[i] = 0.0;
  }

  start=omp_get_wtime();

  #pragma omp parallel for default(none) private(j) shared(TAM, matriz, vector, vTotal, i) firstprivate(suma) lastprivate(suma) schedule(runtime)
  for(i=0; i<TAM; i++){
    suma=0.0;

    #pragma omp parallel for default(none) private(j) shared(TAM, matriz, vector, vTotal, i) firstprivate(suma) lastprivate(suma) schedule(runtime)
    for(j=(TAM-1); j>=i; j--)
      suma = suma + (matriz[(i*TAM)+j]*vector[j]);

    vTotal[i]=suma;
  }
  end=omp_get_wtime(); //obtenemos el tiempo de la ejecución
  ncgt=end - start;

  #ifdef PRINTF_ALL
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N);
    for(i=0; i<TAM; i++)
      printf("vTotal[%d] = %f /\n",i,vTotal[i]);
  #else
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ vTotal[0]=%f / vTotal[%d]=%f /\n", ncgt,TAM,vTotal[0],(int) TAM-1,vTotal[(int)TAM-1]);
  #endif

  #ifdef VECTOR_DYNAMIC //liberamos el espacio reservado
    free(matriz);
    free(vector);
    free(vTotal);
  #endif
  return 0;
}
