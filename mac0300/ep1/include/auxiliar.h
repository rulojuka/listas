/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#ifndef AUXILIAR_H
#define AUXILIAR_H

#include "constantes.h"

/*
 * Verifica se o valor x é zero.
 * A implementação atual verifica se x < EPS, com o EPS inicialmente em 1e-9,
 * porém tal implementação pode ser alterada para x==0, se necessário.
 * Retorna 1 se for igual, 0 caso contrário.
*/
int is_zero(double x);

/*
 * Troca dois doubles de lugar.
*/
void swap(double *x, double *y);

/*
 * Transpoe uma matriz quadrada n x n
*/
void transpose(int n, double A[][nmax]);

/*
 * Troca as linhas x e y de uma matriz A(n x n) caso x!=y
 */
void troca_linhas(int n, double A[][nmax], int x, int y);

#endif
