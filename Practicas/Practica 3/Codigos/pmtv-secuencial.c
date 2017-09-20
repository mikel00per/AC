#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#define VECTOR_DYNAMIC
 #ifdef VECTOR_GLOBAL
 #define MAX 33554432 //=2^25
 double matriz[MAX*MAX], vector[MAX], vTotal[MAX];  //denotaremos siempre por comodidad una matriz cuadrada de orden n como un vector de tamaño n x n
#endif

int main(int argc, char** argv){
  int i,j;
  double suma, ncgt;
  struct timespec cgt1,cgt2;

	if (argc<2){
		printf("La dimensión de la matriz no puede ser nula, introducir un valor obviamente positivo\n");
		exit(-1);
  }

  unsigned int TAM = atoi(argv[1]);

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

	clock_gettime(CLOCK_REALTIME,&cgt1);
  for(i=0; i<TAM; i++){
    suma=0.0;
    for(j=(TAM-1); j>=i; j--)
      suma = suma + (matriz[(i*TAM)+j]*vector[j]);
    vTotal[i]=suma;
  }
  
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
	#ifdef PRINTF_ALL
		printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N);
		for(i=0; i<TAM; i++)
		printf("vTotal[%d] = %f /\n",i,vTotal[i]);
	#else
	printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ vTotal[0]=%f / vTotal[%d]=%f /\n", ncgt,TAM,vTotal[0],(int) TAM-1,vTotal[(int)TAM-1]);
	#endif
	#ifdef VECTOR_DYNAMIC
  	free(matriz);
  	free(vector);
  	free(vTotal);
	#endif
	return 0;
}
