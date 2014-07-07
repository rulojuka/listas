#ifndef SIMPLEX_H
#define SIMPLEX_H

#define DEBUG

#include<cstdlib>

#include"estruturas.h"

void simplex(Grafo *g, Arvore *t, int (* custo)[MAX_NOS]);
bool pivoteia(Aresta *lista, int n, int (* custo)[MAX_NOS], int *y, int *u, int *v);
void atualiza(Arvore *t, int n, int u, int v, int (* custo)[MAX_NOS]);
void atualiza_e(Arvore *t, int u, int v);
void encontra_f(Arvore *t);
void atualiza_ciclo(Arvore *t, int n);
void atualiza_depois(Arvore *t, int n);
void atualiza_x(Arvore *t, int n);
void atualiza_y_e_d(Arvore *t, int n, int (* custo)[MAX_NOS]);

#endif
