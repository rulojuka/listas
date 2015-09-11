#ifndef AUXILIAR_H
#define AUXILIAR_H

#include "constantes.h"

int is_zero(double x);
void swap(double *x, double *y);
void transpose(int n, double A[][nmax]);
void troca_linhas(int n, double A[][nmax], int x, int y);

#endif