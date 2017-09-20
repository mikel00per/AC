#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char ** argv){

	struct timespec cgt1, cgt2;
	int N, a=3, i;
	int *y, *x;

	if(argc < 2){
		printf("Introduzca El tamaño N:\n");
		exit(-1);
	}

	N=atoi(argv[1]);

	y = malloc(sizeof(int) * N+1);
	x = malloc(sizeof(int) * N+1);

	if(y == NULL || x == NULL){
		printf("No se ha podido reservar memoria\n");
		exit(-1);
	}

	// inicializacion
	for(i=1; i<=N; ++i){
		x[i]=i+1;
		y[i]=i+2;
	}

	// daxpy
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (i=1; i<=N; i++)
		y[i]+= a*x[i];
	clock_gettime(CLOCK_REALTIME,&cgt2);
	double ncgt=(double)(cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo transcurrido en segundos: %0.4f\n", ncgt);

	return 0;
}
