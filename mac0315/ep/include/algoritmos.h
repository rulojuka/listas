#ifndef ALGORITMOS_H
#define ALGORITMOS_H

#define DEBUG

#include<cstdio>

#include"estruturas.h"
#include"simplex.h"

void obtem_solucao_inicial(Grafo *g, Arvore *t, int root);
void cria_arvore_inicial(Grafo *g, Arvore *t, int root);

void simplex_para_redes(Grafo *g, Arvore *t);

void imprime_resposta_final(Grafo *g, Arvore *t);

#endif