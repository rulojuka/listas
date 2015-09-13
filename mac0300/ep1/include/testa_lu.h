/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#ifndef TESTA_LU_H
#define TESTA_LU_H

#include "constantes.h"

/*
 * Resolve o problema Ax=b usando a Decomposição LU (LUx=Pb).
 * Entradas:
 *   modo (0 -> orientado a linhas / 1 -> orientado a colunas)
 *   imprime_solucao (0 -> false / 1 -> true)
 *   imprime_tempo (0 -> false / 1 -> true)
 * Valor de retorno:
 *   -1 se a matriz é singular
 *    0 caso contrário.
 *    Nesse caso, a solução do sistema Ax=b estará disponível em b[].
 * */
int testa_lu(int n, double A[][nmax], double b[], int p[], int modo, int imprime_solucao, int imprime_tempo);

#endif
