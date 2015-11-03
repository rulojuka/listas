#include<stdio.h>

#define MAX 1000 /* Numero maximo de elementos nao nulos da matriz */

struct t{
  int x,y;
  double valor;
};
typedef struct t tupla;

void le_entrada(int *n, tupla *A, int *m, double *v){
  int i;
  tupla atual;
  scanf("%d ",n);
  for(i=0;i<*n;i++){
    scanf("%d %d %lf ",&A[i].x,&A[i].y,&A[i].valor);
  }
  scanf("%d ",m);
  for(i=0;i<*m;i++){
    scanf("%lf ",&v[i]);
  }
}

/*
 * n -> numero de elementos nao nulos em A
 * m -> ordem de A
 * *A -> vetor de tuplas que representam A
 * v -> vetor a ser multiplicado
 * resp -> vetor onde sera entregue a resposta
*/
void multiplica_matriz_por_vetor(int n, int m, tupla *A, double *v, double *resp){
  int i;
  for(i=0;i<m;i++) resp[i]=0.0;
  for(i=0;i<n;i++){
    resp[ A[i].x ] += A[i].valor * v[ A[i].y ];
  }
}

int main(){
  int n; /* Numero de elementos nao nulos na matriz A */
  int m; /* Ordem da matriz A */
  tupla A[MAX];
  tupla atual;
  double v[5],resp[5];

  int i;

  le_entrada(&n,A,&m,v);

  for(i=0;i<n;i++){
    printf("%d %d %lf\n",A[i].x,A[i].y,A[i].valor);
  }

  for(i=0;i<m;i++){
    printf("%lf ",v[i]);
  }
  printf("\n");

  multiplica_matriz_por_vetor(n,m,A,v,resp);


  for(i=0;i<m;i++){
    printf("%lf ",resp[i]);
  }
  printf("\n");

  return 0;
}
