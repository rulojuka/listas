#include"simplex.h"

// Otimiza o "Transhipment Problem" para uma dada intância do problema e um vetor de custos
void simplex(Grafo *g, Arvore *t, int (* custo)[MAX_NOS]){
	int u,v; //Pivô é o arco u->v
	while( pivoteia(&(g->lista[0]), g->n_arestas, custo, t->y , &u, &v) ){
		atualiza(t, g->n, u, v, custo);
#ifdef DEBUG
	printf("Arvore depois da atualizacao:\n");
	imprime_arvore(g, t);
#endif
	}
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
		if(atual < menor){
			menor = atual;
			(*u) = a;
			(*v) = b;
		}
	}
#ifdef DEBUG
	if(menor<0)
		printf("Pivo escolhido foi (%d,%d) = %d\n", *u,*v,custo[*u][*v]);
#endif
	return (menor < 0);
}

// Atualiza a árvore T para T+e-f sendo 'e' o arco u->v e 'f' o arco de saída determinado
// unicamente pela regra de Cunningham, descrito na seção Termination and Initialization
// do Chvátal.
// Atualiza também os vetores x e y e todos os vetores auxiliares.
void atualiza(Arvore *t, int n, int u, int v, int (* custo)[MAX_NOS]){
	atualiza_e(t,u,v);
	atualiza_ciclo(t, n);
	encontra_f(t);
	atualiza_depois(t,n);
	atualiza_x(t,n);
	atualiza_y_e_d(t,n,custo); //precisa que p e pracima estejam corretos.
}

// Determina u->v como arco de entrada em T
void atualiza_e(Arvore *t, int u, int v){
	t->u = u;
	t->v = v;
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


	t->join = j = join(t,t->u,t->v);
	t->ciclo.clear();

	t->ciclo.push_back( j ); // Adicionando o join.


	aux.clear();
	atual = t->u;
	while(atual!=j){ // Adicionando os vértices u ~> join no vetor auxiliar.
		aux.push_back(atual);
		atual = t->p[atual];
	}
	for (int i = 0; i < sz(aux); ++i){
		t->ciclo.push_back( aux[ sz(aux)-i-1] ); // Adicionando os vértices na ordem inversa.
	}

	atual = t->v;
	while(atual!=j){ // Adicionando os vértices v ~> join.
		t->ciclo.push_back( atual );
		atual = t->p[atual];
	}

#ifdef DEBUG
	printf("Atualizou ciclo. Novo ciclo e: ");
	for (int i = 0; i < sz(t->ciclo); ++i)
		printf("%d ",t->ciclo[i]);
	printf("\n");
#endif

	// Atualiza sentidos.
	// * No caminho j ~> u, todos os arcos que apontam para o pai (pracima[i] = true) são reversos.
	// * No caminho v ~> j, todos os arcos que apontam para o filho (pracima[i] = false) são reversos.

	for(i = 1; i<sz(t->ciclo) && t->ciclo[i]!=t->v; ++i){ // Caminho j(exclusive) ~> u (inclusive)
    // i<sz(t->ciclo) impede que um Segmentation Fault quando v = j
		atual = t->ciclo[i];
		t->forward[atual] = !t->pracima[atual];
	}
	for(; i<sz(t->ciclo); ++i){ // Caminho v(inclusive) ~> j (exclusive)
		atual = t->ciclo[i];
		t->forward[atual] = t->pracima[atual];
	}
}

// Acha arco de saída f, retornando o vertice que o representa.
void encontra_f(Arvore *t){
	//   * f tem que ser reverso, ou seja, ter sentido contrário a 'e' no ciclo.
	//   * O seu valor x[i] deve ser máximo.
	//   * Dentre todos os candidatos, o primeiro encontrado seguindo o ciclo no mesmo
	//   sentido de e, começando do join, será escolhido. (Regra de Cunningham)

	// Nosso ciclo está no formato j ~> u -> v ~> j, portanto, a escolha será o primeiro
	// arco reverso de x mínimo.

	int menor=INF, escolhido;
	int i;
	int atual,valor;

	// Setamos i=1 para pularmos a raiz join, cujo arco não pertence ao ciclo
	for(i = 1; i<sz(t->ciclo); ++i){
		atual = t->ciclo[i];
		if(t->forward[atual]==false){
			valor = t->x[atual];
			if(valor < menor){ // Por não usarmos >=, escolheremos automaticamente
				menor = valor; // o primeiro candidato.
				escolhido = atual;
			}
		}
	}
	// Se maior_modulo for igual a 0, o pivô é degenerado e o algoritmo continua normalmente.
	t->sai=escolhido;
#ifdef DEBUG
	if( t->pracima[ t->sai ] )
		printf("Encontrou f. Arco eh (%d,%d)\n", t->sai, t->p[ t->sai ]);
	else
		printf("Encontrou f. Arco eh (%d,%d)\n", t->p[ t->sai ], t->sai);
#endif
}

//Descobre se f está antes ou depois de e (no sentido de e)
void atualiza_depois(Arvore *t, int n){
	bool depois;
	int atual;

	depois=false;
	atual=t->v;
	while(depois==false && atual!=t->join){
		if(t->sai == atual)
			depois=true;
		atual=t->p[atual];
	}
	t->depois=depois;
	t->f2=t->sai;
	t->f1=t->p [ t->sai ];
	if(depois){
		t->e1=t->u;
		t->e2=t->v;
	}
	else{
		t->e1=t->v;
		t->e2=t->u;
	}
#ifdef DEBUG
	printf("Atualizou depois.\n");
	printf("x antes:  ");
	for (int i = 0; i < n; ++i){
		printf("%d ",t->x[i]);
	}
	printf("\n");
#endif
}

// Atualiza a quantidade de material escoada por cada aresta
void atualiza_x(Arvore *t, int n){
	int sai = t->sai;
	int quantidade = t->x[sai];
	int atual,prox;
	int e2,f2;
	e2 = t->e2;
	f2 = t->f2;
	bool depois; //Recebe true se f está entre v e j e false se f está entre u e j
	depois = t->depois;

	// Atualiza o vetor x.
	for (int i = 1; i < sz(t->ciclo); ++i){ // Começa de 1 pois o join não muda
		atual=t->ciclo[i];
		if(t->forward[atual])
			t->x[atual]+=quantidade;
		else
			t->x[atual]-=quantidade;
	}
	// Aqui, todos os x antigos estão atualizados, porem, ainda existe f (com x=0)
	//  e não existe e. Todos os vértices entre v e f2 precisam ser alterados.

	int indice_e2,indice_f2;
	for (int i = 0; i < sz(t->ciclo); ++i){
		if(t->ciclo[i]==e2)
			indice_e2=i;
		if(t->ciclo[i]==f2)
			indice_f2=i;
	}

	if(depois==true){ // Precisamos alterar o caminho f2~>e2
		for(int i=indice_f2; i>indice_e2; i--){
			atual=t->ciclo[i];
			prox =t->ciclo[i-1];
			t->p[atual] = prox;
			t->x[atual] = t->x[prox];
			t->pracima[atual] = !(t->pracima[prox]); //"inverte" o sentido
		}
	}
	else{
		for(int i=indice_f2; i<indice_e2; i++){
			atual=t->ciclo[i];
			prox =t->ciclo[i+1];
			t->p[atual] = prox;
			t->x[atual] = t->x[prox];
			t->pracima[atual] = !(t->pracima[prox]); //"inverte" o sentido
		}
	}
	//Agora, precisamos alterar e2, que apontará para e, e terá e1 como pai.
	t->p[e2] = t->e1;
	t->x[e2] = quantidade; //Fluxo que passa por e sempre é esse
	t->pracima[e2] = !depois; // Devido ao sentido do ciclo

#ifdef DEBUG
	printf("Atualizou x.\n");
	printf("x depois: ");
	for (int i = 0; i < n; ++i){
		printf("%d ",t->x[i]);
	}
	printf("\n");
#endif
}


// Precisa que os vetores p[] e pracima[] já estejam atualizados.
void atualiza_y_e_d(Arvore *t, int n, int (* custo)[MAX_NOS] ){

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
		if(i==t->root) continue;
		filhos[ t->p[i] ].push_back(i);
	}
	// Cria uma fila tal que se v vem depois de u, então quando v tiver seu y
	// calculado, y(u) já estará atualizado.

	fila.clear();
	fila.push_back( t->root );
	for(int i =0; i<n; ++i){
		atual = fila[i];
		for (int j = 0; j < sz(filhos[atual]); ++j){
			fila.push_back(filhos[atual][j]);
		}
	}

	// Atualizando y e d

	t->y[ t->root ]=0;
	t->d[ t->root ]=1;
	for (int i = 1; i < n; ++i){
		atual = fila[i];
		pai = t->p[atual];
		t->d[atual] = t->d[pai] + 1;
		if( t->pracima[atual] ){
			t->y[atual] = t->y[pai] - custo[atual][pai];
		}
		else
			t->y[atual] = t->y[pai] + custo[pai][atual];
		// Retira possíveis overflows e underflows
		if(t->y[atual] > INF )
			t->y[atual] = INF;
		if(t->y[atual] < -INF )
			t->y[atual] = INF;
	}
#ifdef DEBUG
	printf("Atualizou y.\n");
#endif
}
