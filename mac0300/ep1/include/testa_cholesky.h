/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#ifndef TESTA_CHOLESKY_H
#define TESTA_CHOLESKY_H

#include "constantes.h"

/*
 * Resolve o problema Ax=b usando a Decomposição de Cholesky.
 * Entradas:
 *   modo (0 -> orientado a linhas / 1 -> orientado a colunas)
 *   imprime_solucao (0 -> false / 1 -> true)
 *   imprime_tempo (0 -> false / 1 -> true)
 * Valor de retorno:
 *   -1 se a matriz é singular ou não é definida-positiva
 *    0 caso contrário.
 *    Nesse caso, a solução do sistema Ax=b estará disponível em b[].
 * */
int testa_cholesky(int n, double A[][nmax], double b[], int modo, int imprime_solucao, int imprime_tempo);

#endif
