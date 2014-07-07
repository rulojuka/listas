#include"simplex.h"

// Otimiza o "Transhipment Problem" para uma dada intância do problema e um vetor de custos
void simplex(Grafo *g, Arvore *t, int (* custo)[MAX_NOS]){
	int u,v; //Pivô é o arco u->v
	while( pivoteia(&((*g).lista[0]), (*g).n_arestas, custo, (*t).y , &u, &v) ){
#ifdef DEBUG
		printf("Pivo escolhido foi (%d,%d) = %d\n", u,v,custo[u][v]);
#endif
		atualiza(t, (*g).n, u, v, custo);
#ifdef DEBUG
		printf("Arvore depois da atualizacao:\n");
		imprime_arvore(g, t);
#endif
	}
	return;
}

// Encontra o próximo pivô u->v. Se não existem mais pivôs, retorna false.
// A regra de pivoteamento utilizada é a do maior mérito.
// Teoricamente, apenas as arestas não pertencentes a T deveriam ser testadas. Porém,
// as arestas que pertencem a T nunca serao escolhidas pois nao melhoram a solução.
// Assim, optei por não fazer essa distinção.
bool pivoteia(Aresta *lista, int n, int (* custo)[MAX_NOS], int *y, int *u, int *v){
	int a,b,atual;
	int menor=0;
	(*u)=(*v)=-1;
	for (int i = 0; i < n; ++i){
		a = lista[i].origem;
		b = lista[i].destino;
		atual = y[ a ] - y[ b ] + custo[a][b];
#ifdef DEBUG
		printf("Testando (%d %d) = %d\n", a,b,custo[a][b]);
		printf("atual eh %d\n",atual);
#endif
		if(atual < menor){
			menor = atual;
			(*u) = a;
			(*v) = b;
		}
	}
	return (menor < 0);
}

// Atualiza a árvore T para T+e-f sendo 'e' o arco u->v e 'f' o arco de saída determinado
// unicamente pela regra de Cunningham, descrito na seção Termination and Initialization
// do Chvátal.
// Atualiza também os vetores x e y e todos os vetores auxiliares.
void atualiza(Arvore *t, int n, int u, int v, int (* custo)[MAX_NOS]){
	atualiza_e(t,u,v);
	atualiza_ciclo(t, n);
#ifdef DEBUG
	for (int i = 0; i < sz((*t).ciclo); ++i)
		printf("%d ",(*t).ciclo[i]);
	printf("\n");
#endif
	encontra_f(t);
	atualiza_x(t,n);
	atualiza_arvore(t,n);
	atualiza_y(t,n,custo); //precisa que p e pracima estejam corretos.
	return;
}

// Determina u->v como arco de entrada em T
void atualiza_e(Arvore *t, int u, int v){
	(*t).u = u;
	(*t).v = v;
}

// Adiciona todos os vertices do ciclo gerado em  T+e no sentido u->v~>u ao vector ciclo
// Essa funcao pode ser feita em apenas uma passagem no grafo, mas achei mais claro
// fazer em duas passadas (a primeira acontece no join), sendo essa implementação
// assintóticamente equivalente.
// Também atualiza vetor com o sentido dos arcos.
void atualiza_ciclo(Arvore *t, int n){
	int i;
	int j,atual;

	vector<int> aux;

	(*t).join = j = join(t,(*t).u,(*t).v);
	(*t).ciclo.clear();

	(*t).ciclo.push_back( j ); // Adicionando o join.

	aux.clear();
	atual = (*t).u;
	while(atual!=j){ // Adicionando os vértices u ~> join no vetor auxiliar.
		aux.push_back(atual);
		atual = (*t).p[atual];
	}
	for (int i = 0; i < sz(aux); ++i){
		(*t).ciclo.push_back( aux[ sz(aux)-i-1] ); // Adicionando os vértices na ordem inversa.
	}

	atual = (*t).v;
	while(atual!=j){ // Adicionando os vértices v ~> join.
		(*t).ciclo.push_back( atual );
		atual = (*t).p[atual];
	}

	// Atualiza sentidos.
	// * No caminho j ~> u, todos os arcos que apontam para o pai (pracima[i] = true) são reversos.
	// * No caminho v ~> j, todos os arcos que apontam para o filho (pracima[i] = false) são reversos.

	for(i = 1; (*t).ciclo[i]!=(*t).v; ++i){ // Caminho j(exclusive) ~> u (inclusive)
		atual = (*t).ciclo[i];
		(*t).forward[atual] = !(*t).pracima[atual];
	}
	for(; i<sz((*t).ciclo); ++i){ // Caminho v(inclusive) ~> j (exclusive)
		atual = (*t).ciclo[i];
		(*t).forward[atual] = (*t).pracima[atual];
	}
}

// Acha arco de saída f, retornando o vertice que o representa.
void encontra_f(Arvore *t){
	//   * f tem que ser reverso, ou seja, ter sentido contrário a 'e' no ciclo.
	//   * O seu valor x[i] deve ser máximo.
	//   * Dentre todos os candidatos, o primeiro encontrado seguindo o ciclo no mesmo
	//   sentido de e, começando do join, será escolhido. (Regra de Cunningham)

	// Nosso ciclo está no formato j ~> u -> v ~> j, portanto, a escolha será o primeiro
	// arco reverso de x máximo.

	int maior=-1, escolhido;
	int i;
	int atual,valor;

	// Setamos i=1 para pularmos a raiz join, cujo arco não pertence ao ciclo
	for(i = 1; i<sz((*t).ciclo); ++i){
		atual = (*t).ciclo[i];
		if((*t).forward[atual]==false){
			valor = (*t).x[atual];
			printf("i=%d, Testando %d > %d\n",i, valor, maior);
			if(valor > maior){ // Por não usarmos >=, escolheremos automaticamente
				maior = valor; // o primeiro candidato.
				escolhido = atual;
			}
		}
	}
	// Se maior_modulo for igual a 0, o pivô é degenerado e o algoritmo continua normalmente.
	(*t).sai=escolhido;
}

// Atualiza a quantidade de material escoado por cada aresta
void atualiza_x(Arvore *t, int n){
	int sai = (*t).sai;
	int quantidade = (*t).x[sai];
	int atual;
	int u,v;
	v = (*t).v;
	u = (*t).u;
	bool depois; //Recebe true se f está entre v e j e false se f está entre u e j

	//Descobre se f está antes ou depois de e (no sentido de e)
	depois=false;
	atual=(*t).v;
	while(atual!=(*t).join){
		if(sai==atual){
			depois=true;
			break;
		}
		atual=(*t).p[atual];
	}

	// Atualiza o vetor x.
	for (int i = 0; i < sz((*t).ciclo); ++i){
		atual=(*t).ciclo[i];
		if((*t).forward[atual])
			(*t).x[atual]+=quantidade;
		else
			(*t).x[atual]-=quantidade;
	}
	(*t).depois=depois;

	// Tudo está quase atualizado, porém, os vértices entre e e f
	// estão apontando para os valores das arestas erradas.
	// O trecho a seguir inverte e corrige os apontamentos.
	//TODO conferir exaustivamente essa funcao!!!
	//TODO conferir se isso não é anulado pela atualização do p[x]
	//TODO ver se não é possível atualizar o pracima[] aqui.
	if(depois)
		atual = v;
	else
		atual = u;

	while(atual!=sai){
		(*t).x[ (*t).p[atual] ] = (*t).x[atual];
		atual = (*t).p[atual];
	}
	if(depois)
		(*t).x[v]=quantidade; //Pois agora esse vertice representa a aresta e
	else
		(*t).x[u]=quantidade; //Pois agora esse vertice representa a aresta e

#ifdef DEBUG
	printf("O nó escolhido foi %d, com o arco (%d,%d) = %d (o arco pode ser em qualquer direcao)\n",sai,sai,(*t).p[sai],(*t).x[sai]);
#endif
	return;
}


// Precisa que os vetores p[] e pracima[] já estejam atualizados.
void atualiza_y(Arvore *t, int n, int (* custo)[MAX_NOS] ){

	// Em uma versão anterior do EP, eu utilizei o método descrito no Chvátal
	// de atualizar somente a árvore S, que não contém a raiz.
	// Apesar desse método ser mais rápido, tem uma implementação mais complexa
	// pois adiciona um vetor auxiliar sucessor[x] e não permite uma inicialização
	// do y em uma árvore intermediária.

	// Assim, resolvi usar uma simples DFS para "resolver" o sistema linear y
	// Apesar de um pouco mais lenta, tem a mesma complexidade (O(v+e)) e deixa
	// o código inteiro muito mais limpo.

	vector<int> filhos[MAX_NOS]; //Um vector para cada nó
	vector<int> fila;

	int atual,pai;

	for (int i = 0; i < n; ++i){
		filhos[i].clear();
	}
	for (int i = 0; i < n; ++i){
		if(i==(*t).root) continue;
		filhos[ (*t).p[i] ].push_back(i);
	}

	// Cria uma fila tal que se v vem depois de u, então quando v tiver seu y
	// calculado, y(u) já estará atualizado.

	fila.clear();
	fila.push_back( (*t).root );
	for(int i =0; i<n; ++i){
		atual = fila[i];
		for (int j = 0; j < sz(filhos[atual]); ++j){
			fila.push_back(filhos[i][j]);
		}
	}

	// Atualizando y e d
	(*t).y[ (*t).root ]=0;
	(*t).d[ (*t).root ]=1;
	for (int i = 1; i < n; ++i){
		atual = fila[i];
		pai = (*t).p[atual];
		(*t).d[atual] = (*t).d[pai] + 1;
		if( (*t).pracima[atual] )
			(*t).y[atual] = (*t).y[pai] - custo[atual][pai];
		else
			(*t).y[atual] = (*t).y[pai] + custo[pai][atual];
	}
	return;
}

void atualiza_arvore(Arvore *t, int n){
	int ant,atual,prox;
	int f2; //f2 é o endpoint de f que está em S
	f2 = (*t).sai;
	int e1,e2; //e2 é o endpoint de e que está em S, e1 é o outro endpoint
	int u,v;
	u = (*t).u;
	v = (*t).v;
	if((*t).d[ u ] > (*t).d[ v ]){
		e1 = v;
		e2 = u;
	}
	else{
		e1 = u;
		e2 = v;
	}

	//ATUALIZANDO P
	ant = e2;
	atual = (*t).p[ant];
	prox = (*t).p[atual];
	while(ant!=f2){
		(*t).p[atual] = ant;
		ant = atual;
		atual = prox;
		prox = (*t).p[atual];
	}
	(*t).p[e2]=e1;

}