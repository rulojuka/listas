/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include "testa_lu.h"
 #include "sistemas_gerais.h"
#include "tempo.h"
#include "io.h"
#include <stdio.h>

 int testa_lu(int n, double A[][nmax], double b[], int p[], int modo, int imprime_solucao, int imprime_tempo){
    unsigned long long mark0,mark1,mark2;
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
    if( lurow(n,A,p) == -1 )
      return -1;
  }
  else{
    if( lucol(n,A,p) == -1 )
      return -1;
  }

  mark1 = tempo_em_microsegundos();

/*
 	if(imprime_solucao){
 		printf("A decomposicao LU de A eh:\n");
    imprime_matriz(n, A);
    printf("p eh:\n");
    imprime_vetor_inteiro(n,p);
 	}
*/

  if(modo==0){
    if( ssrow(n,A,p,b) == -1 )
      return -1;
  }
  else{
    if( sscol(n,A,p,b) == -1 )
      return -1;
  }

  mark2 = tempo_em_microsegundos();

  if(imprime_tempo){
    printf("| %6.2lf |  %.2lf  |\n",converte_milisegundo(mark1-mark0),converte_milisegundo(mark2-mark1));
  }

  if( imprime_solucao == 1){
    printf("x eh:\n");
    imprime_vetor(n,b);
  }

  return 0;
}