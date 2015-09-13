/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include<stdio.h>
#include"include/constantes.h"
#include"include/io.h"

int main(){
  int n;
  double A[nmax][nmax];
  double b[nmax];
  int p[nmax];

  le_entrada(&n, A, b);

  printf("col: ");
  testa_cholesky(n,A,b,1,0,1);

/*
  printf("col: ");
  testa_cholesky(n,A2,b2,1,0,1);
*/


  /* Decomposicao LU */
/*
  printf("A eh:\n");
  imprime_matriz(n, A);
  printf("b eh:\n");
  imprime_vetor(n, b);

  lurow(n,A,p);
  lucol(n,A,p);

  printf("A decomposicao LU de A eh:\n");
  imprime_matriz(n, A);
  printf("p eh:\n");
  imprime_vetor_inteiro(n,p);

  ssrow(n,A,p,b);
  sscol(n,A,p,b);*/

  /*printf("x eh:\n");
  imprime_vetor(n,b);*/
  return 0;
}
