/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include <stdio.h>
#include "include/constantes.h"
#include "include/io.h"
#include "include/testa_cholesky.h"
#include "include/testa_lu.h"

int main(){
  int n;
  double A[nmax][nmax];
  double b[nmax];
  int p[nmax];

  le_entrada(&n, A, b);

  /* DESCOMENTE EXATAMENTE UMA DAS LINHAS ABAIXO */

  /*printf("CHOL row:\n");  testa_cholesky(n,A,b,0,0,1);*/
  /*printf("CHOL col:\n");  testa_cholesky(n,A,b,1,0,1);*/
  /*printf("LU row:\n");  testa_lu(n,A,b,p,0,0,1);*/
  printf("LU col:\n");  testa_lu(n,A,b,p,1,0,1);

  return 0;
}
