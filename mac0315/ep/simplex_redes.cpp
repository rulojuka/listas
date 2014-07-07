// Alessandro Wagner Palmeira
// NUSP: 6850476
// Exercício-Programa de MAC0315
//

#include<cstdio>

#define DEBUG

#include "include/estruturas.h"
#include "include/entrada.h"
#include "include/algoritmos.h"

using namespace std;

int main(){
	// Os dois elementos a seguir definem uma instancia do problema.
	Grafo g; // Representação do grafo de custos. Implementada com lista de
	// adjacencias para economizar nas buscas. Uma lista de arestas gastaria menos
	// memoria, mas dei preferencia para a minimizacao do tempo de execução.
	// De qualquer jeito, a troca entre as duas implementações é trivial.
	Arvore t; // Árvore que representa o estado atual do algoritmo.

	/*Leitura de dados*/
	le_entrada(&g);
#ifdef DEBUG
	imprime_entrada(&g);
#endif

//-------------------------------------------------//

	/*Obtenção da árvore solução inicial*/
	/* Esta árvore pode conter arcos artificiais. */
	obtem_solucao_inicial(&g, &t, 0); //Pode ser qualquer vertice como raiz. 0 foi escolhido arbitrariamente.
#ifdef DEBUG
	printf("Entrada atualizada, com arcos artificiais:\n");
	imprime_entrada(&g);
	printf("Arvore inicial (possivelmente com arcos artificiais):\n");
	imprime_arvore(&g, &t);
#endif
//-------------------------------------------------//

	/*Simplex para redes*/
	//simplex_para_redes(&g,&t);
#ifdef DEBUG
	//imprime_arvore(&g, &t);
#endif

	return 0;
}
