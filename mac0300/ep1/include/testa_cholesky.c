/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include "testa_cholesky.h"
#include "definido_positivo.h"
#include "tempo.h"
#include "io.h"
#include <stdio.h>

int testa_cholesky(int n, double A[][nmax], double b[], int modo, int imprime_solucao, int imprime_tempo){
 	unsigned long long mark0,mark1,mark2,mark3;

/*
 	if(imprime_solucao){
 		printf("A eh:\n");
 		imprime_matriz(n, A);
 		printf("b eh:\n");
 		imprime_vetor(n,b);
 	}
*/

 	mark0 = tempo_em_microsegundos();

 	if(modo==0){
 		if( cholrow(n,A) == -1 )
 			return -1;
 	}
 	else{
 		if( cholcol(n,A) == -1 )
 			return -1;
 	}

 	mark1 = tempo_em_microsegundos();

 	if(modo==0){
 		if(forwrow(n,A,b) == -1)
 			return -1;
 	}
 	else{
 		if(forwcol(n,A,b) == -1)
 			return -1;
 	}

 	mark2 = tempo_em_microsegundos();

 	if(modo==0){
 		if(backrow(n,A,b,1) == -1)
 			return -1;
 	}
 	else{
 		if(backcol(n,A,b,1) == -1)
 			return -1;
 	}

 	mark3 = tempo_em_microsegundos();


 	if(imprime_tempo){
    printf("| %6.2lf | %.2lf | %.2lf\n",converte_milisegundo(mark1-mark0),converte_milisegundo(mark2-mark1),converte_milisegundo(mark3-mark2));
  }


 	if( imprime_solucao == 1){
 		printf("x eh:\n");
 		imprime_vetor(n,b);
 	}

 	return 0;
}
