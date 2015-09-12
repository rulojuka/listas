#ifndef SISTEMAS_GERAIS_H
#define SISTEMAS_GERAIS_H

#include "constantes.h"

/* Calcula a decomposicao LU orientada a colunas e a linhas*/
int lucol(int n, double A[][nmax], int p[]);
int lurow(int n, double A[][nmax], int p[]);

/* Resolve um sistema linear utilizando a decomposição LU */
int sscol(int n, double A[][nmax], int p[], double b[]);
int ssrow(int n, double A[][nmax], int p[], double b[]);

#endif