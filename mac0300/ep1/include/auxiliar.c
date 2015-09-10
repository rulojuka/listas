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
