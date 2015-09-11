#ifndef IO_H
#define IO_H

#include "constantes.h"

void le_entrada(int *n, double A[][nmax], double B[]);
void imprime_matriz(int n, double A[][nmax]);
void imprime_vetor(int n, double b[]);
void imprime_vetor_inteiro(int n, int b[]);

#endif