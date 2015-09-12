/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#ifndef IO_H
#define IO_H

#include "constantes.h"

/* Le entrada conforme enunciado, com índices comecando do 0 */
void le_entrada(int *n, double A[][nmax], double B[]);
void imprime_matriz(int n, double A[][nmax]);
void imprime_vetor(int n, double b[]);
void imprime_vetor_inteiro(int n, int b[]);

#endif