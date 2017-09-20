#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

struct {
	int a;
	int b;
} s[5000];

main(){
	int i, ii;
	int X1, X2, *R;
	double t1, t2, tiempo;
	R = (int*)malloc(40000*sizeof(int));

	// Inicialización R,S
	for (i=0 ; i<40000 ; i++)
		R[i] = 0;
	for (i=0 ; i<5000 ; i++){
		s[i].a = 0;
		s[i].b = 0;
	}
	t1 = omp_get_wtime();
	// Cálculo del algoritmo
	for (ii=0 ; ii<40000 ; ii++){
		X1=0; X2=0;
		for (i=0 ; i<5000 ; i+=2){
			X1 += 2*s[i].a + ii;
			X1 += 2*s[i+1].a + ii;
			X2 += 3*s[i].b - ii;
			X2 += 3*s[i+1].b - ii;
		}
		if (X1<X2)
			R[ii] = X1;
		else  R[ii] = X2;
	}

	t2 = omp_get_wtime();
	tiempo = t2-t1;
	printf("R[0] = %d\t", R[0]);
	printf("R[39999] = %d", R[39999]);
	printf("\nTiempo de proceso: %f segundos.\n", tiempo);
	free(R);
}
