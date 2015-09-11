#include<math.h>
#include"constantes.h"

int is_zero(double x){
  return fabs(x) < EPS;
}

void swap(double *x, double *y){
  double aux;
  aux = *x;
  *x = *y;
  *y = aux;
}

void transpose(int n, double A[][nmax]){
  int i,j;
  for(i=0;i<n;i++)
    for(j=i+1;j<n;j++)
      swap(&A[i][j], &A[j][i]);
}

void troca_linhas(int n, double A[][nmax], int x, int y){
  int j;
  if(x==y) return;

  for(j=0;j<n;j++){
    swap(&A[x][j], &A[y][j]);
  }
}