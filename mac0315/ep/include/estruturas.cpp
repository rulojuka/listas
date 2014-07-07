#include"estruturas.h"

// Retorna o primeiro vértice comum entre os caminhos u~>root e v~>root
int join(Arvore *t, int u, int v){
	// Iguala as profundidades
	while( (*t).d[u] > (*t).d[v] )
		u = (*t).p[u];
	while( (*t).d[u] < (*t).d[v] )
		v = (*t).p[v];

	// Sobe na arvore ate encontrar o join
	while(u!=v){
		u=(*t).p[u];
		v=(*t).p[v];
	}
	// Retorna o join
	return u;
}

void imprime_arvore(Grafo *g, Arvore *t){
	int i;
	int n = (*g).n;
	printf("Pai:                  ");
	for(i=0; i<n; i++){
		printf(" % d",(*t).p[i]);
	}
	printf("\n");
	printf("Profundidade:         ");
	for(i=0; i<n; i++){
		printf(" % d",(*t).d[i]);
	}
	printf("\n");
	printf("pracima?              ");
	for(i=0; i<n; i++){
		if((*t).d[i]==1)
			printf("  *");
		else
			printf(" % d",(*t).pracima[i]==true);
	}
	printf("\n");
	printf("Artificial?           ");
	for(i=0; i<n; i++){
		if((*t).d[i]==1)
			printf("  *");
		else{
			if((*t).pracima[i])
				printf(" % d",(*g).custo[ i ][ (*t).p[i] ]>=INF);
			else
				printf(" % d",(*g).custo[ (*t).p[i] ][ i ]>=INF);
		}
	}
	printf("\n");
	printf("x:                    ");
	for(i=0; i<n; i++){
		if((*t).d[i]==1)
			printf("  *");
		else
			printf(" % d",(*t).x[i]);
	}
	printf("\n");
	printf("y:                    ");
	for(i=0; i<n; i++){
		printf(" % d",(*t).y[i]);
	}
	printf("\n");

}

// Examina (e retorna true) se uma árvore t não contém arcos artificiais
bool examina(Grafo *g, Arvore *t){
	int n = (*g).n;
	for (int i = 0; i < n; ++i){
		if(i==(*t).root) continue;
#ifdef DEBUG
		printf("Testando arco com endpoints %d e %d\n", i ,(*t).p[i]);
#endif
		if((*t).pracima[i]==false){ // Se aresta da árvore é p[i] -> i
			if((*g).custo[ (*t).p[i] ][ i ]>=INF) // Verifica se ela nao existe
				return false;
		}
		else{ // Se aresta da árvore é i -> p[i]
			if((*g).custo[ i ][ (*t).p[i] ]>=INF) // Verifica se ela nao existe
				return false;
		}
	}
	return true;
}
