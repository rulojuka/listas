#include<stdio.h>
#include"include/definido_positivo.h"
#include"include/io.h"
#include"include/constantes.h"

void transpose(int n, double A[][nmax]);
void swap(double *x, double *y);

int solveCholeskyCol (int n, double A[][nmax], double b[]);
int solveCholeskyRow (int n, double A[][nmax], double b[]);

int main(){
  int n;
  double A[nmax][nmax];
  double b[nmax];
  le_entrada(&n, A, b);

  /* Cholesky */
  /*
  printf("Antes do Cholesky\n");
  imprime_matriz(n, A);
  cholrow(n, A);
  printf("Depois do Cholesky\n");
  */

  /* Forward subtitution */
  /*
  forwcol(n,A,b);
  imprime_vetor(n,b);
  */


  /* Resolve usando Cholesky */
  /*
  printf("A eh:\n");
  imprime_matriz(n, A);
  printf("b eh:\n");
  imprime_vetor(n,b);
*/
  /* orientado a linhas*/
  if( solveCholeskyRow(n,A,b) == 0 ){

  /* orientado a colunas*/
  /*solveCholeskyCol(n,A,b);*/

  printf("x eh:\n");
  imprime_vetor(n,b);

  }
  else{
    printf("Matriz nao pode ser resolvida usando Cholesky.\n");
  }
  return 0;
}

void transpose(int n, double A[][nmax]){
  int i,j;
  printf("transpondo\n");
  for(i=0;i<n;i++)
    for(j=i+1;j<n;j++)
      swap(&A[i][j], &A[j][i]);
}

void swap(double *x, double *y){
  double aux;
  aux = *x;
  *x = *y;
  *y = aux;
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
