#include"sistemas_gerais.h"
#include"auxiliar.h"
#include"definido_positivo.h"
#include<math.h>

#include<stdio.h>
#include"io.h"

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

int ssrow(int n, double A[][nmax], int p[], double b[]){
  int i;

  /* Calcula Pb */
  for(i=0;i<n;i++){
    swap(&b[i], &b[p[i]]);
  }

  printf("Pb eh:\n");
  imprime_vetor(n,b);

  /* Calcula y de Ly=Pb e salva em b*/
  if( forwrow(n,A,b) == -1) /* FIXME precisa usar um forwrow alterado para que A[i][i] seja 1 */
    return -1;

  printf("y eh:\n");
  imprime_vetor(n,b);

  /* Calcula Ux=y e salva em b */
  if( backrow(n,A,b,0) == -1) /* FIXME precisa usar um forwrow alterado para que A[i][i] seja 1 */
    return -1;

  return 0;
}