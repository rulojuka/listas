#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define nmax 700

int main(){
  int n,i,j,k;
  int caso;
  char atual[2];
  double A[nmax][nmax],M[nmax][nmax],b[nmax],x[nmax];
  FILE *fp;
  char filename[100];

  for(caso = 1; caso<=9; caso++){
    if(caso>=8) n=700;
    else n = caso*100;

    atual[1] = 0;
    atual[0] = '0' + caso;
    strcpy(filename,"a");
    strcat(filename,atual);
    strcat(filename,".dat");

    printf("filename atual eh --%s--\n",filename);

    srand(853);

    for (i=0; i<n; i++){
      for (j=0; j<n; j++)
        M[i][j]= 10*((float)rand()/RAND_MAX-0.5);
    }


    for (i=0; i<n; i++){
      for (j=0; j<n; j++){
        A[i][j]= 0;
        for (k=0; k<n; k++)
          A[i][j]+= M[i][k]*M[j][k];
      }
    }

// Constroe a solucao descrita acima.

    for (i=0; i<n; i++)
      x[i]= 1+i%(n/100);

// Calcula b =  A x (de novo, veja o produto orientado a linha).

    for (i=0; i<n; i++){
      b[i]= 0;
      for(j=0; j<n; j++)
        b[i]+= A[i][j]*x[j];
    }

// Grava o arquivo de saida com n, A e b.

    fp= fopen(filename,"wt");

    fprintf(fp,"%d",n);

    if(caso<8){
      for (i=0; i<n; i++){
        for (j=0; j<n; j++)
          fprintf(fp,"\n%3d %3d % .20e",i,j,A[i][j]);
      }
    }
/* singulares */
    else if(caso ==8){
      if (i==n/2){
        for (j=0; j<n; j++){
          fprintf(fp,"\n%3d %3d % .20e",i,j,A[0][j]);
        }
      }
      else{
        for (j=0; j<n; j++){
          fprintf(fp,"\n%3d %3d % .20e",i,j,A[i][j]);
        }
      }
    }
    else{
      if (i==n-1){
        for (j=0; j<n; j++)
          fprintf(fp,"\n%3d %3d % .20e",i,j,A[0][j]);
      }
      else{
        for (j=0; j<n; j++)
          fprintf(fp,"\n%3d %3d % .20e",i,j,A[i][j]);
      }
    }

    for (i=0; i<n; i++){
      fprintf(fp,"\n%3d % .20e",i,b[i]);
    }

    fclose(fp);

  }
  return 0;
}
