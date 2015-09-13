/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include<stdio.h>
#include"include/definido_positivo.h"
#include"include/sistemas_gerais.h"
#include"include/io.h"
#include"include/constantes.h"
#include"include/auxiliar.h"
#include"include/tempo.h"

int solveCholeskyCol (int n, double A[][nmax], double b[]);
int solveCholeskyRow (int n, double A[][nmax], double b[]);

  unsigned long long mark0,mark1,mark2,mark3;
int main(){
  int n;
  double A[nmax][nmax];
  double b[nmax];
  int p[nmax];

  le_entrada(&n, A, b);

  /* Resolve usando Cholesky */
  /*
  printf("A eh:\n");
  imprime_matriz(n, A);
  printf("b eh:\n");
  imprime_vetor(n,b);
*/
  /* orientado a linhas*/

  if( solveCholeskyCol(n,A,b) == 0 ){

  /* orientado a colunas*/
  /*solveCholeskyCol(n,A,b);*/

  /*printf("x eh:\n");
  imprime_vetor(n,b);*/

  }
  else{
    printf("Matriz nao pode ser resolvida usando Cholesky.\n");
  }

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


int solveCholeskyCol (int n, double A[][nmax], double b[]){

  mark0 = tempo_em_microsegundos();

  if( cholcol(n,A) == -1 )
    return -1;
  /* Agora A guarda o fator de Cholesky */

  mark1 = tempo_em_microsegundos();

  if(forwcol(n,A,b) == -1)
    return -1;

  mark2 = tempo_em_microsegundos();

  /* Agora b guarda y, tal que C^t * y = b*/

  /* Migué para testar o backcol com trans=0 */
/*
  transpose(n,A);
  if(backcol(n,A,b,0) == -1)
    return -1;
*/
  if(backcol(n,A,b,1) == -1)
    return -1;
  /* Agora b guarda x tal que A * x = b */
  mark3 = tempo_em_microsegundos();
  printf("%llu %llu %llu\n",mark1-mark0, mark2-mark1,mark3-mark2);
  return 0;
}

int solveCholeskyRow (int n, double A[][nmax], double b[]){

  mark0 = tempo_em_microsegundos();

  if( cholrow(n,A) == -1 )
    return -1;
  mark1 = tempo_em_microsegundos();
  /* Agora A guarda o fator de Cholesky */
  if(forwrow(n,A,b) == -1)
    return -1;
  mark2 = tempo_em_microsegundos();
  /* Agora b guarda y, tal que C^t * y = b*/
/* Migué para testar o backrow com trans=0 */
/*
  transpose(n,A);
  if(backrow(n,A,b,0) == -1)
    return -1;
*/
  if(backrow(n,A,b,1) == -1)
    return -1;
  mark3 = tempo_em_microsegundos();
  printf("%llu %llu %llu\n",mark1-mark0, mark2-mark1,mark3-mark2);
  /* Agora b guarda x tal que A * x = b */
  return 0;
}
