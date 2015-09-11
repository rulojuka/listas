#include"sistemas_gerais.h"
#include"auxiliar.h"
#include<math.h>

int lurow(int n, double A[][nmax], int p[]){
  int i,j,k;
  double maior;
  int pivo;
  for(k=0;k<n;k++){

    /* Pivoteamento parcial */
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

    for(i=k+1;i<n;i++){
      A[i][k] /= A[k][k];
      for(j=k+1;j<n;j++){
        A[i][j] -= A[i][k] * A[k][j];
      }
    }
  }
  return 0;
}