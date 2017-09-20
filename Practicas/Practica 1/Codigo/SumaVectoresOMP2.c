#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv)
{
int i;
double cgt1,cgt2; double ncgt; //para tiempo de ejecución

//Leer argumento de entrada (nº de componentes del vector)
if (argc<2){
  printf("Faltan nº componentes del vector\n");
  exit(-1);
}

unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

// No sé porque pero no me funciona con ifdef y debería..
// Da un error de compilación que no sabía resolver. Y la única manera que he 
// encontrado ha sido decomentando estas lineas.
// #ifdef VECTOR_LOCAL
double v1[N], v2[N], v3[N]; // Tamaño variable local
// #endif

#ifdef VECTOR_GLOBAL
if (N>MAX) N=MAX;
#endif

#ifdef VECTOR_DYNAMIC
double *v1, *v2, *v3;
v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
v2 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
v3 = (double*) malloc(N*sizeof(double));
if ( (v1==NULL) || (v2==NULL) || (v3==NULL) ){
  printf("Error en la reserva de espacio para los vectores\n");
  exit(-2);
}
#endif

#pragma omp parallel private(i)
{

#pragma omp sections
{

//Inicializacion del primer vector
#pragma omp section
  for(i=0; i<N/2; i++){
   v1[i] = N*0.1+i*0.1;
}

#pragma omp section
  for(i=N/2; i<N; i++){
  v1[i] = N*0.1+i*0.1;
}

//Inicializacion del segundo vector
#pragma omp section
  for(i=0; i<N/2; i++){
  v2[i] = N*0.1-i*0.1;
}

#pragma omp section
  for(i=N/2; i<N; i++){
  v2[i] = N*0.1-i*0.1;
  }
}

cgt1=omp_get_wtime();

//Calcular suma de vectores
#pragma omp sections
{
  #pragma omp section
  for(i=0; i<N/2; i++){
    v3[i] = v1[i] + v2[i];
  }

  #pragma omp section
  for(i=N/2; i<N; i++){
    v3[i] = v1[i] + v2[i];
  }
}

cgt2=omp_get_wtime();
ncgt=(double) (cgt2-cgt1);

//Imprimir resultado de la suma y el tiempo de ejecución
#ifdef PRINTF_ALL
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N);
  #pragma omp master
  for(i=0; i<N; i++)
    printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n", i,i,i,v1[i],v2[i],v3[i]);

#else
#pragma omp master
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f)/\n",
  ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
#endif
}
#ifdef VECTOR_DYNAMIC
free(v1); // libera el espacio reservado para v1
free(v2); // libera el espacio reservado para v2
free(v3); // libera el espacio reservado para v3
#endif
return 0;
}
