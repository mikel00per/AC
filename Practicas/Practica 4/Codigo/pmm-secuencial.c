#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv){
  int num_filas=atoi(argv[1]);
  int num_columnas=atoi(argv[1]);
  int chunk=atoi(argv[2]);
  int **matriz1, **matriz2, **resultado;

  matriz1 = (int **)malloc(num_filas*sizeof(int*));
  matriz2 = (int **)malloc(num_filas*sizeof(int*));
  resultado=(int **)malloc(num_filas*sizeof(int*));
  int fila,columna,j;
  struct timespec cgt1,cgt2; double ncgt;

  for (fila=0;fila<num_filas;fila++)
   matriz1[fila] = (int*)malloc(num_filas*sizeof(int));

  for (fila=0;fila<num_filas;fila++)
    matriz2[fila] = (int*)malloc(num_filas*sizeof(int));

  for (fila=0;fila<num_filas;fila++)
   resultado[fila] = (int*)malloc(num_filas*sizeof(int));


    for(fila=0; fila<num_filas; fila++){
    for(columna=0; columna<num_columnas; columna++){
       matriz1[fila][columna]=2;
    }
  }

  printf("Mostramos la matriz1\n");
  for(fila=0; fila<num_filas; fila++){
    for(columna=0; columna<num_columnas; columna++){
       printf("  %d  ", matriz1[fila][columna] );
    }
    printf("\n");
  }


  for(fila=0; fila<num_filas; fila++){
    for(columna=0; columna<num_columnas; columna++){
       matriz2[fila][columna]=2;
    }
  }

  printf("Mostramos la matriz2\n");
  for(fila=0; fila<num_filas; fila++){
    for(columna=0; columna<num_columnas; columna++){
       printf("  %d  ", matriz2[fila][columna] );
    }
    printf("\n");
  }

  printf("Multiplicamos la matrices\n");
pmm-secuencial
  clock_gettime(CLOCK_REALTIME,&cgt1);

    for (fila = 0 ; fila < num_filas ; fila++ ){
     for (columna = 0 ; columna < num_columnas; columna++ ){
        int producto = 0 ;
         for (j = 0 ; j < num_columnas ; j++ ){
            producto += matriz1[fila][j] * matriz2[j][columna];
            resultado[fila][columna] = producto ;
         }
      }
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+ (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
  printf("Tiempo(seg.):%11.9f\t",ncgt);


  printf("Mostramos el resultado\n");
  for(fila=0; fila<num_filas; fila++){
    for(columna=0; columna<num_columnas; columna++){
       printf("  %d  ", resultado[fila][columna] );
    }
    printf("\n");
  }


  for (fila=0;fila<num_filas;fila++)
   free(matriz1[fila]);
  free(matriz1);

  for (fila=0;fila<num_filas;fila++)
   free(matriz2[fila]);
  free(matriz2);

  for (fila=0;fila<num_filas;fila++)
   free(resultado[fila]);
  free(resultado);

}
