#include"algoritmos.h"

bool obtem_solucao_inicial(Grafo *g, Arvore *t, int root){
  if (checa_viabilidade(g) == false){
    printf("O problema e inviavel. O simplex nao sera executado.\n");
    return false;
  }
  else{
	  cria_arvore_inicial(g, t, root);
	  atualiza_y_e_d(t, g->n, &(g->custo[0]));
    return true;
  }
}

bool checa_viabilidade(Grafo *g){
  int origem,destino;
  int visitado[MAX_NOS];
  vector<int> arestas[MAX_NOS];

  for(int i=0;i<g->n;i++){
    visitado[i]=0;
    arestas[i].clear();
    if(g->b_t[i]<0)
      origem = i;
    if(g->b_t[i]>0)
      destino = i;
  }

  for(int i=0; i<g->n_arestas; i++){
    arestas[ g->lista[i].origem ].push_back( g->lista[i].destino );
  }

  busca(origem,destino,visitado,arestas);
  return visitado[destino]==1;
}

void busca(int atual, int destino, int * visitado, vector<int> *arestas){
  int prox;
  if(atual==destino)
    return;
  else{
    for(int i=0; i< sz(arestas[atual]); i++){
      prox = arestas[atual][i];
      if( visitado[prox] != 1 ){
        visitado[ prox ] = 1;
        busca(prox,destino,visitado,arestas);
      }
    }
  }
}


// Cria a árvore inicial t, com base no grafo g e em uma raiz dada
void cria_arvore_inicial(Grafo *g, Arvore *t, int root){

// Como descrito na seção "Termination and Initialization" do Chvátal
// a arvore inicial é a seguinte: Escolhendo-se um vertice raiz w qualquer
// criamos a árvore tal que:
//	 t_wj = b_j sempre que b_j>=0, j!=w
//	 t_iw =-b_j sempre que b_i<0, i!=w
//	 criando arcos artificiais sempre que necessário.

// Analogamente, atribuimos o x inicial.

// Assim, escolhendo w como raiz, temos que d[i]=1 e p[i]=w para todo i!=w

// Por fim, precisamos saber se os arcos vao em direção à raiz ou em sentido contrário.
// Para isso, usamos o vetor pracima, que é true se o arco é i -> p[i] e false se o arco é p[i] -> i
	int n = g->n;
	t->root=root;
	for(int i=0; i<n; i++){
		if(i==root){
			t->d[i]=1;
			t->p[i]=-1; // p[root] não é determinado
			t->x[i]=-1; // x[root] não é determinado
		}
		else{
			t->d[i]=2;
			t->p[i]=root;

			if(g->b_t[i]>=0){ // Cria um arco root -> i
				t->x[i]=g->b_t[i];
				t->pracima[i]=false;
				if(g->custo[root][i]==-1){ // Se tal arco não existe no grafo original
					cria_arco_artificial(g, root, i);
				}
			}
			else{ // Vértice atual é fonte (b_t[i]<0). Cria um arco i -> root
				t->x[i]=-(g->b_t[i]); // Para ficar positivo
				t->pracima[i]=true;
				if(g->custo[i][root]==-1){ // Se tal arco não existe no grafo original
					cria_arco_artificial(g, i, root);
				}
			}
		}
	}
}

void cria_arco_artificial(Grafo *g, int origem, int destino){
	Aresta art;
	g->custo[origem][destino] = INF;
	art.origem = origem;
	art.destino = destino;
	art.custo = INF;
	g->lista[g->n_arestas] = art;
	g->n_arestas ++;
}

void simplex_para_redes(Grafo *g, Arvore *t){
	simplex(g,t,&(g->custo[0])); //Simplex final para resolver o problema.

	imprime_resposta_final(g, t);

}

// Calcula o custo de uma solução t e imprime na tela
void imprime_resposta_final(Grafo *g, Arvore *t){
	int custo=0;
	int n = g->n;
	bool impossivel=false;
	printf("Pela aresta (i -> j), passam x unidades.\n");
	for (int i = 0; i < n; ++i){
		if(i==t->root) continue;
		if(t->pracima[i]==false){ // Se aresta da árvore é p[i] -> i
			if( g->custo[ t->p[i] ][ i ] >= INF && t->x[i]>0)
				impossivel=true;
			custo += g->custo[ t->p[i] ][ i ] * t->x[i];
			printf("(%d -> %d) - %d\n",t->p[i],i,t->x[i]);
		}
		else{
			if( g->custo[ i ][ t->p[i] ] >= INF && t->x[i]>0)
				impossivel=true;
			custo += g->custo[ i ][ t->p[i] ] * t->x[i];
			printf("(%d -> %d) - %d\n",i,t->p[i],t->x[i]);
		}
	}
	if(impossivel){
		printf("A solução final contem arcos artificiais com fluxo>0, portanto, nao ha solucao viavel para o problema.\n");

	}
	else{
		printf("O custo total do transporte e %d\n", custo);
	}
}
