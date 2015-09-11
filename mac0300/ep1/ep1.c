#include<stdio.h>
#include"include/definido_positivo.h"
#include"include/sistemas_gerais.h"
#include"include/io.h"
#include"include/constantes.h"
#include"include/auxiliar.h"

int solveCholeskyCol (int n, double A[][nmax], double b[]);
int solveCholeskyRow (int n, double A[][nmax], double b[]);

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

  /*if( solveCholeskyRow(n,A,b) == 0 ){*/

  /* orientado a colunas*/
  /*solveCholeskyCol(n,A,b);*/
/*
  printf("x eh:\n");
  imprime_vetor(n,b);

  }
  else{
    printf("Matriz nao pode ser resolvida usando Cholesky.\n");
  }*/

  /* Decomposicao LU */

  printf("A eh:\n");
  imprime_matriz(n, A);
  printf("b eh:\n");
  imprime_vetor(n, b);

  lurow(n,A,p);

  printf("A decomposicao LU de A eh:\n");
  imprime_matriz(n, A);
  printf("p eh:\n");
  imprime_vetor_inteiro(n,p);


  ssrow(n,A,p,b);

  printf("b eh:\n");
  imprime_vetor(n,b);
  return 0;
}


int solveCholeskyCol (int n, double A[][nmax], double b[]){
  if( cholcol(n,A) == -1 )
    return -1;
  /* Agora A guarda o fator de Cholesky */

  if(forwcol(n,A,b) == -1)
    return -1;
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
  return 0;
}

int solveCholeskyRow (int n, double A[][nmax], double b[]){
  if( cholrow(n,A) == -1 )
    return -1;
  /* Agora A guarda o fator de Cholesky */
  if(forwrow(n,A,b) == -1)
    return -1;
  /* Agora b guarda y, tal que C^t * y = b*/
/* Migué para testar o backrow com trans=0 */
/*
  transpose(n,A);
  if(backrow(n,A,b,0) == -1)
    return -1;
*/
  if(backrow(n,A,b,1) == -1)
    return -1;
  /* Agora b guarda x tal que A * x = b */
  return 0;
}
