#ifndef ENTRADA_H
#define ENTRADA_H

#include<cstdio>
#include<cstdlib>

#include"estruturas.h"

#ifndef MAXLINE
#define MAXLINE 256 // Tamanho máximo de uma linha da entrada
#endif

void le_entrada(Grafo *g);
void imprime_entrada(Grafo *g);

#endif