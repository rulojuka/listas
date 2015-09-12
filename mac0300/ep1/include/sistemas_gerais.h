#ifndef SISTEMAS_GERAIS_H
#define SISTEMAS_GERAIS_H

#include "constantes.h"

int lucol(int n, double A[][nmax], int p[]);
int lurow(int n, double A[][nmax], int p[]);
int sscol(int n, double A[][nmax], int p[], double b[]);
int ssrow(int n, double A[][nmax], int p[], double b[]);

#endif