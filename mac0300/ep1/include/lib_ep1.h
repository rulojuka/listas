#ifndef LIB_EP1_H
#define LIB_EP1_H

#include "constantes.h"

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
int cholcol(int n, double A[][nmax]);

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
int cholrow(int n, double A[][nmax]);

int forwcol (int n, double A[][nmax], double b[]);
int forwrow (int n, double A[][nmax], double b[]);

int backcol (int n, double A[][nmax], double b[], int trans);
int backrow (int n, double A[][nmax], double b[], int trans);

#endif