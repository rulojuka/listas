#include"algoritmos.h"

void obtem_solucao_inicial(Grafo *g, Arvore *t, int root){
	cria_arvore_inicial(g, t, root);

#ifdef DEBUG
	printf("Arvore inicial (possivelmente com arcos artificiais):\n");
	imprime_arvore(g, t);
#endif

	simplex(g,t,&((*g).artificial[0])); //Simplex inicial para descobrir a primeira t

#ifdef DEBUG
	printf("Depois da solucao do problema artificial:\n");
	imprime_arvore(g, t);
#endif
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

// Para calcularmos o y, lembramos que temos um sistema do tipo:
//    -y0 +y1         = art_01?
//    -y0     +y2     = art_02?
//	          .
//	          .
//	          .
//    -y0         +yn = art_0n?
// Onde art_xy? é 1 se x->y é artificial e 0 caso contrário.
// Definindo y0=0, temos y1=art_01?, y2=art_02?, ..., yn=art_0n?

// Assim, escolhendo w como raiz, temos que d[i]=1 e p[i]=w para todo i!=w
// Além disso, como qualquer permutação é uma preordem de n, escolhemos s[x]=x+1

// Por fim, precisamos saber se os arcos vao em direção à raiz ou em sentido contrário.
// Para isso, usamos o vetor forward, que é true se o arco é w -> x e false se o arco é x -> w
	int n = (*g).n;
	for(int i=0; i<n; i++){
		if(i==root){
			(*t).d[i]=1;
			(*t).p[i]=-1; // p[root] não é determinado
			(*t).x[i]=-1; // x[root] não é determinado
			(*t).y[i]=0;  // definimos y[root] como 0
		}
		else{
			(*t).d[i]=2;
			(*t).p[i]=root;

			if((*g).b_t[i]>=0){ // Cria um arco root -> i
				(*t).x[i]=(*g).b_t[i];
				(*t).pracima[i]=false;
			}
			else{ // Vértice atual é fonte (b_t[i]<0). Cria um arco i -> root
				(*t).x[i]=-((*g).b_t[i]); // Para ficar positivo
				(*t).pracima[i]=true;
			}
			(*t).y[i]=(*g).artificial[root][i]; //artificial[x][y] = art_x_y?
		}
		(*t).s[i]=i+1;
		if((*t).s[i] == n)
			(*t).s[i]=0;
	}
	(*t).root=root;
}

void simplex_para_redes(Grafo *g, Arvore *t){
	if(examina(g, t)==false){ // Checa se existe solucao para o problema.
		simplex(g,t,&((*g).custo[0])); //Simplex final para resolver o problema.
		imprime_resposta_final(g, t);
	}
	else{
		printf("A solução inicial contem arcos artificiais, portanto, nao ha solucao viavel para o problema.\n");
		printf("Saindo do programa.\n");
	}
}

// Calcula o custo de uma solução t e imprime na tela
void imprime_resposta_final(Grafo *g, Arvore *t){
	int custo=0;
	int n = (*g).n;
	printf("Pela aresta (i -> j), passam x unidades.\n");
	for (int i = 0; i < n; ++i){
		if(i==(*t).root) continue;
		if((*t).pracima[i]==false){ // Se aresta da árvore é p[i] -> i
			custo += (*g).custo[ (*t).p[i] ][ i ] * (*t).x[i];
			printf("(%d -> %d) - %d\n",(*t).p[i],i,(*t).x[i]);
		}
		else{
			custo += (*g).custo[ i ][ (*t).p[i] ] * (*t).x[i];
			printf("(%d -> %d) - %d\n",i,(*t).p[i],(*t).x[i]);
		}
	}
	printf("O custo total do transporte e %d\n", custo);
}
