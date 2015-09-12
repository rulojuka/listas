#include"sistemas_gerais.h"
#include"auxiliar.h"
#include"definido_positivo.h"
#include<math.h>

int pivoteamento_parcial(int n, double A[][nmax], int p[], int k){
    int i;
    int pivo;
    double maior;
    pivo = k;
    maior = fabs(A[k][k]);
    for(i=k+1;i<n;i++){
      if( fabs(A[i][k]) > maior ){
        pivo = i;
        maior = fabs(A[i][k]);
      }
    }
    if( is_zero(maior) ) /*Matriz singular*/
      return -1;
    p[k] = pivo;
    troca_linhas(n,A,k,pivo);
    return 0;
}

void forwcolunitario (int n, double A[][nmax], double b[]){
  int i,j;
  for(j=0;j<n;j++){
    for(i=j+1;i<n;i++){
      b[i] -= A[i][j] * b[j];
    }
  }
}

void forwrowunitario (int n, double A[][nmax], double b[]){
  int i,j;
  for(i=0;i<n;i++){
    for(j=0;j<i;j++){
      b[i] -= A[i][j] * b[j];
    }
  }
}

int lucol(int n, double A[][nmax], int p[]){
  int i,j,k;
  for(k=0;k<n;k++){

    /* Pivoteamento parcial */
    if( pivoteamento_parcial(n,A,p,k) == -1)
      return -1;

    /* Calcula multiplicadores */
    for(i=k+1;i<n;i++){
      A[i][k] /= A[k][k];
    }

    /* Operações orientadas a coluna */
    for(j=k+1;j<n;j++){
      for(i=k+1;i<n;i++){
        A[i][j] -= A[i][k] * A[k][j];
      }
    }
  }
  return 0;
}

int lurow(int n, double A[][nmax], int p[]){
  int i,j,k;
  for(k=0;k<n;k++){

    /* Pivoteamento parcial */
    if( pivoteamento_parcial(n,A,p,k) == -1)
      return -1;

    /* Calcula multiplicadores */
    for(i=k+1;i<n;i++){
      A[i][k] /= A[k][k];
    }

    /* Operações orientadas a linha */
    for(i=k+1;i<n;i++){
      for(j=k+1;j<n;j++){
        A[i][j] -= A[i][k] * A[k][j];
      }
    }
  }
  return 0;
}

int sscol(int n, double A[][nmax], int p[], double b[]){
  int i;

  /* Calcula Pb */
  for(i=0;i<n;i++){
    swap(&b[i], &b[p[i]]);
  }

  /* Calcula y de Ly=Pb e salva em b*/
  forwcolunitario(n,A,b);

  /* Calcula x de Ux=y e salva em b */
  if( backcol(n,A,b,0) == -1)
    return -1;

  return 0;
}



int ssrow(int n, double A[][nmax], int p[], double b[]){
  int i;

  /* Calcula Pb */
  for(i=0;i<n;i++){
    swap(&b[i], &b[p[i]]);
  }

  /* Calcula y de Ly=Pb e salva em b*/
  forwrowunitario(n,A,b);

  /* Calcula x de Ux=y e salva em b */
  if( backrow(n,A,b,0) == -1)
    return -1;

  return 0;
}
