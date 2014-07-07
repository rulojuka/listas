#ifndef ESTRUTURAS_H
#define ESTRUTURAS_H

#include<cstdio>
#include<vector>

#define sz(x) ( (int)x.size() )

#ifndef MAX_NOS
#define MAX_NOS 100 // Número máximo de nós do grafo original
#endif

#ifndef MAX_ARESTAS
#define MAX_ARESTAS (MAX_NOS * MAX_NOS) // Número máximo de arestas do grafo original
#endif

#define INF 1000000000
// MAX_INT é 2147483647

using namespace std;

struct Aresta{
	int origem,destino,custo;
};

struct Arvore{
	// Estruturas da árvore
	int root; // Raiz - Continua a mesma por todo o problema.
	int p[MAX_NOS], d[MAX_NOS]; // Pai e profundidade
	bool pracima[MAX_NOS]; // true indica um arco i->p[i] e false indica um arco p[i]-> i
	int x[MAX_NOS]; // Solução do problema atual
	int y[MAX_NOS]; // Vetor de custos atuais de cada nó

	// Estruturas da iteracao: 'e', 'f', 'join' e ciclo
	int u,v; // Vértices do arco de entrada e
	int join; // Primeiro antecessor comum dos vértices u e v
	int sai; // Endpoint de f, tal que o arco f é composto por f - p[f]
	vector<int> ciclo; // Ciclo gerado em T+e começando em join e no mesmo sentido de e
	bool forward[MAX_NOS]; // Atualizado em atualiza_ciclo: true indica que o arco com endpoint i segue no mesmo sentido que e
	bool depois; //Recebe true se f está entre v e j e false se f está entre u e j
};

struct Grafo{
	int n; // Número de vértices
	int b_t[MAX_NOS]; // Vetor transposto de oferta e demanda. Ele será utilizado
	// no lugar de <origem>, <destino> e <quantidade> para generalizar o algoritmo.
	// Aqui, b_t[x]>0 representa demanda e b_t[x]<0 representa fonte.
	int custo[MAX_NOS][MAX_NOS];

	int n_arestas;
	Aresta lista[MAX_ARESTAS];
};

int join(Arvore *t, int u, int v);
void imprime_arvore(Grafo *g, Arvore *t);
bool examina(Grafo *g, Arvore *t);

#endif