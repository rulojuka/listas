/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP3 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#define nmax 100
#include <stdio.h>
#include <math.h>

void le_entrada(int *n, double A[][nmax], double B[]){
  int i,j,k;
  int linhas;
  double x;
  scanf("%d ",n);
  linhas = (*n)*(*n);
  for(k=0;k<linhas;k++){
    scanf("%d %d %lf ",&i,&j,&x);
    A[i][j] = x;
  }
  for(k=0;k<(*n);k++){
    scanf("%d %lf ",&i,&x);
    B[i]=x;
  }
}

double maior_mod(int n, double B[]){
  double maior = 0;
  int i;
  for(i=0;i<n;i++)
    if(fabs(B[i])>maior)
      maior = fabs(B[i]);
  return maior;
}

double norma2_sem_overflow(int n, double B[]){
  double norma_quad = 0;
  double maior = 0;
  int i;
  maior = maior_mod(n,B);
  if(maior==0)
    return 0;

  for(i=0;i<n;i++){
    norma_quad += (B[i]/maior) * (B[i]/maior);
  }

  return sqrt(norma_quad) * maior;
}

double calcula_refletor(int n, double B[]){
  double tau;
  double gama;
  double beta;
  int i;

  beta = maior_mod(n,B);
  if(beta==0)
    return 0;
  for(i=0;i<n;i++)
    B[i]/=beta;

  tau = norma2_sem_overflow(n,B);
  if(B[0]<0)
    tau = -tau;

  B[0] += tau;
  gama = B[0]/tau;
  for(i=1;i<n;i++){
    B[i]/=B[0];
  }
  B[0] = -tau * beta;
  return gama;
}


int main(){
  int n;
  double A[nmax][nmax];
  double b[nmax];
  double norma;
  int p[nmax];
  int ret;
  int i;

  le_entrada(&n, A, b);

  printf("b eh :" );
  for(i=0;i<n;i++)
    printf("%lf ",b[i]);
  printf("\n");

  norma = norma2_sem_overflow(n,b);

  printf("Norma: %lf\n",norma);

  return 0;
}
