#include"io.h"
#include<stdio.h>

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
      printf("%.5e ",A[i][j]);
    }
    printf("\n");
  }
}

void imprime_vetor(int n, double b[]){
  int i;
  for(i=0;i<n;i++){
    printf("%.5e\n",b[i]);
  }
}

void imprime_vetor_inteiro(int n, int b[]){
  int i;
  for(i=0;i<n;i++){
    printf("%d\n",b[i]);
  }
}