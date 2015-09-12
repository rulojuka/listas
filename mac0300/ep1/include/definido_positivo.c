/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include "definido_positivo.h"
#include "auxiliar.h"
#include<math.h>

int cholcol(int n, double A[][nmax]){
  int i,j,k;
  for(k=0;k<n;k++){

    /* Calcula R[k][k] */
    for(j=0;j<k;j++){
      A[k][k] -= A[k][j] * A[k][j]; /* 1 FLOP */
    }

    /* Verifica se matriz é definida-positiva */
    if(A[k][k] <= 0)
      return -1;
    else
      A[k][k] = sqrt(A[k][k]);

    /* Calcula R[i][k] para i>k */
    for(i=k+1;i<n;i++){
      for(j=0;j<k;j++){
        A[i][k] -= A[i][j] * A[k][j]; /* 1 FLOP */
      }
      A[i][k] /= A[k][k]; /* 1 FLOP */
    }

  }
  return 0;
}

int cholrow(int n, double A[][nmax]){
  int i,j,k;
  for(i=0;i<n;i++){

    /* Calcula R[i][j] para j<i */
    for(j=0;j<i;j++){
      for(k=0;k<j;k++){
        A[i][j] -= A[i][k]*A[j][k]; /* 1 FLOP */
      }
      A[i][j] /= A[j][j]; /* 1 FLOP */
    }

    /* Calcula R[i][i] */
    for(k=0;k<i;k++){
      A[i][i] -= A[i][k] * A[i][k]; /* 1 FLOP */
    }

    /* Verifica se matriz é definida-positiva */
    if(A[i][i] <= 0){
      return -1;
    }
    else
      A[i][i] = sqrt(A[i][i]);

  }
  return 0;
}

int forwcol (int n, double A[][nmax], double b[]){
  int i,j;
  for(j=0;j<n;j++){
    if( is_zero(A[j][j]) )
      return -1;
    b[j] /= A[j][j];

    for(i=j+1;i<n;i++){
      b[i] -= A[i][j] * b[j];
    }
  }
  return 0;
}

int forwrow (int n, double A[][nmax], double b[]){
  int i,j;
  for(i=0;i<n;i++){
    for(j=0;j<i;j++){
      b[i] -= A[i][j] * b[j];
    }
    if( is_zero(A[i][i]) )
      return -1;
    b[i] /= A[i][i];
  }
  return 0;
}

int backcol(int n, double A[][nmax], double b[], int trans){
  int i,j;
  if(trans == 0)
  {
    for(j=n-1;j>=0;j--){
      if( is_zero(A[j][j]) )
        return -1;
      b[j] /= A[j][j];
      for(i=j-1;i>=0;i--){
        b[i] -= A[i][j] * b[j];
      }
    }
  }
  else{
    for(j=n-1;j>=0;j--){
      for(i=j+1;i<n;i++){
        b[j] -= A[i][j] * b[i];
      }
      if( is_zero(A[j][j]) )
        return -1;
      b[j] /= A[j][j];
    }
  }
  return 0;
}

int backrow (int n, double A[][nmax], double b[], int trans){
  int i,j;

  if(trans==0){
    for(i=n-1;i>=0;i--){
      for(j=i+1;j<n;j++){
        b[i] -= A[i][j] * b[j];
      }
      if( is_zero(A[i][i]) )
        return -1;
      b[i] /= A[i][i];
    }
  }
  else{
    for(i=n-1;i>=0;i--){
      if( is_zero(A[i][i]) )
        return -1;
      b[i] /= A[i][i];
      for(j=0;j<i;j++){
        b[j] -= A[i][j] * b[i];
      }
    }
  }
  return 0;
}
