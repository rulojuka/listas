#include<stdio.h>
#include<math.h>

#define nmax 100

void le_entrada(int *n, double A[][nmax], double B[]);
void imprime_matriz(int n, double A[][nmax]);
int cholcol(int n, double A[][nmax]);

int main(){
  int n;
  double A[nmax][nmax];
  double B[nmax];
  le_entrada(&n, A, B);
  printf("Antes do Cholesky\n");
  imprime_matriz(n, A);
  cholcol(n, A);
  printf("Depois do Cholesky\n");
  imprime_matriz(n, A);
  return 0;
}


void le_entrada(int *n, double A[][nmax], double B[]){
  int i,j,k;
  int linhas;
  double x;
  scanf("%d ",n);
  linhas = (*n)*(*n);
  for(k=0;k<linhas;k++){
    scanf("%d %d %lf ",&i,&j,&x);
    A[i-1][j-1] = x;
  }
  for(k=0;k<(*n);k++){
    scanf("%d %lf ",&i,&x);
    B[i-1]=x;
  }
}

void imprime_matriz(int n, double A[][nmax]){
  int i,j;
  for(i=0;i<n;i++){
    for(j=0;j<n;j++){
      printf("%lf ",A[i][j]);
    }
    printf("\n");
  }
}

int cholcol(int n, double A[][nmax]){ /*Ainda nao verifica se eh definida positiva*/
  int i,j,k;
  for(k=0;k<n;k++){

    /*Calcula R[k][k]*/
    /*A[k][k] = A[k][k];*/
    for(j=0;j<k;j++){
      A[k][k] -= A[k][j] * A[k][j];
    }
    A[k][k] = sqrt(A[k][k]);
    
    for(i=k+1;i<n;i++){ /*Calcula R[i][k] para i>k*/
      /*A[i][k] = A[i][k]*/
      for(j=0;j<k;j++){
        A[i][k] -= A[i][j] * A[k][j];
      }
      A[i][k] /= A[k][k];
    }

  }
  return 0;
}









