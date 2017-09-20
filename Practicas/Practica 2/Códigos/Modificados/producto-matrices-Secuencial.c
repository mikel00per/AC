#include <stdlib.h> // biblioteca con atoi()
#include <stdio.h>
#include<time.h>// biblioteca donde se encuentra la función clock_gettime()

#define VECTOR_DYNAMIC// descomentar para que los vectores sean variables ...
#define PRINTF_ALL	// dinámicas (memoria reutilizable durante la ejecución)
#ifdef VECTOR_GLOBAL
 #define MAX 33554432 //=2^25
 double matriz[MAX*MAX], vector[MAX], resultado[MAX];
#endif

int main(int argc, char **argv){
	int i,j;
	double suma;
	struct timespec cgt1, cgt2;
	double ncgt;
	if(argc<2){
		printf("No has indicado la capacidad de la matriz cuadrada\n");
		exit(-1);
	}
	unsigned int N = atoi(argv[1]); //como vamos a comparar en varias ocasiones N con el tamaño MAX, la ponemos en mayúscula para
	#ifdef VECTOR_GLOBAL		//indicar que se trata de un entero que puede ser increiblemente grande, pero arbitrario.
	double matriz[N*N], vector[N], resultado[N];
	#endif

	#ifdef VECTOR_GLOBAL
	if(N>MAX)
		N=MAX;
	#endif

	#ifdef VECTOR_DYNAMIC
	double *matriz, *vector, *resultado;
	matriz = (double*) malloc(N*N*sizeof(double));
	vector = (double*) malloc(N*sizeof(double));
	resultado = (double*) malloc(N*sizeof(double));

	if((resultado==NULL) || (matriz==NULL) || (vector==NULL)){ //si N es demasiado grande, igual nuestro pc no puede reservar tanta mem.
		printf("\nError a la hora de reservar memoria para la matriz y/o los vectores\n");
		exit(-2);
	}
	#endif

	//inicialicemos
	for(i=0; i<N; i++){
		for(j=0; j<N; j++)
			matriz[(i*N)+j]=N*0.1 +j*0.1; //así tratamos a la matriz en cuestión como un vector(dimension 1), rellenando todos
		vector[i]=N*0.1-i*0.1;		      //sus campos
		resultado[i]=0.0;
	}
	clock_gettime(CLOCK_REALTIME, &cgt1);

	for(i=0; i<N; i++){
		suma=0.0;
		for(j=0; j<N; j++)
			suma+=matriz[(i*N)+j]*vector[j]; //Aquí hacemos la multiplicación "matriz" * vector
		resultado[i]=suma;
	}
	clock_gettime(CLOCK_REALTIME, &cgt2);
	ncgt=((double)(cgt2.tv_sec-cgt1.tv_sec)+(double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9)))*10.0;

	#ifdef PRINTF_ALL
	printf("Tiempo(seg.):%11.9f / Tamaño del vector: %u / resultado[0]=%f / resultado[%d]=%f \n",ncgt, N, resultado[0], N-1, resultado[N-1]);
	if (N<18){
		for(i=0; i<N; i++)
			printf("\nComponente %d de resultado[%d] = %f", i,i,resultado[i]);
	}
	printf("\n");
	#endif

	#ifdef VECTOR_DYNAMIC
	free(matriz);
	free(vector);
	free(resultado);
	#endif

	return 0;
}
