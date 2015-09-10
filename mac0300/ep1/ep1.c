#include<stdio.h>
#include<math.h>

#define nmax 1000
#define EPS 1E-9

void le_entrada(int *n, double A[][nmax], double B[]);
void imprime_matriz(int n, double A[][nmax]);
void imprime_vetor(int n, double b[]);
void transpose(int n, double A[][nmax]);
void swap(double *x, double *y);

int cholcol(int n, double A[][nmax]);
int cholcol_opt(int n, double A[][nmax]);
int cholrow(int n, double A[][nmax]);

int is_zero(double x);
int forwcol (int n, double A[][nmax], double b[]);
int forwrow (int n, double A[][nmax], double b[]);
int backcol (int n, double A[][nmax], double b[], int trans);
int backrow (int n, double A[][nmax], double b[], int trans);

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

void imprime_matriz(int n, double A[][nmax]){
  int i,j;
  for(i=0;i<n;i++){
    for(j=0;j<n;j++){
      printf("%lf ",A[i][j]);
    }
    printf("\n");
  }
}

void imprime_vetor(int n, double b[]){
  int i;
  for(i=0;i<n;i++){
    printf("%lf\n",b[i]);
  }
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

/*
 * Implementa a decomposição de Cholesky com uma implementação orientada a
 * colunas que utiliza somente a parte triangular inferior da matriz A e retorna
 * a resposta nessa mesma parte de A.
 *
 * Os valores são calculados nessa ordem (exemplo n=4):
 * 1 X X X
 * 2 5 X X
 * 3 6 8 X
 * 4 7 9 10
 *
 * Valor de retorno: 0 se a decomposição foi calculada com sucesso e -1 se a
 * matriz nao for definida positiva.
 *
 * */
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

/*Versão otimizada*/
int cholcol_opt(int n, double A[][nmax]){
  int i,j,k;
  double diagonal_atual; /* Evita leitura repetida de A[k][k] */
  double soma; /* Evita escrita repetida de A[k][k] e A[i][k] */
  for(k=0;k<n;k++){

    soma = 0.0;
    for(j=0;j<k;j++){
      soma += A[k][j] * A[k][j];
    }
    A[k][k] -= soma;

    if(A[k][k] <= 0)
      return -1;
    else
      diagonal_atual = A[k][k] = sqrt(A[k][k]);

    for(i=k+1;i<n;i++){
      soma = 0.0;
      for(j=0;j<k;j++){
        soma += A[i][j] * A[k][j];
      }
      A[i][k] = (A[i][k] - soma) / diagonal_atual;
    }

  }
  return 0;
}

/*
 * Implementa a decomposição de Cholesky com uma implementação orientada a
 * linhas que utiliza somente a parte triangular inferior da matriz A e retorna
 * a resposta nessa mesma parte de A.
 *
 * Os valores são calculados nessa ordem (exemplo n=4):
 * 1 X X X
 * 2 3 X X
 * 4 5 6 X
 * 7 8 9 10
 *
 * Valor de retorno: 0 se a decomposição foi calculada com sucesso e -1 se a
 * matriz nao for definida positiva.
 *
 * */
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
    if(A[i][i] <= 0)
      return -1;
    else
      A[i][i] = sqrt(A[i][i]);

  }
  return 0;
}

int is_zero(double x){
  return fabs(x) < EPS;
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
