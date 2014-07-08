#ifndef ALGORITMOS_H
#define ALGORITMOS_H

//#define DEBUG

#include<cstdio>

#include"estruturas.h"
#include"simplex.h"

bool obtem_solucao_inicial(Grafo *g, Arvore *t, int root);
bool checa_viabilidade(Grafo *g);
void busca(int atual, int destino, int * visitado, vector<int> *arestas);
void cria_arvore_inicial(Grafo *g, Arvore *t, int root);
void cria_arco_artificial(Grafo *g, int origem, int destino);

void simplex_para_redes(Grafo *g, Arvore *t);

void imprime_resposta_final(Grafo *g, Arvore *t);

#endif
