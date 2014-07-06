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
		printf("Arvore depois da primeira atualizacao:\n");
		imprime_arvore(g, t);
#endif
		break; //TODO tirar isso aqui!
	};
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
	atualiza_y(t,n,custo);
	atualiza_arvore(t,n);
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

void atualiza_y(Arvore *t, int n, int (* custo)[MAX_NOS] ){
	// A árvore T-e-f é separada em duas árvores, T_u (contém u) e T_v (contém v)

	// c = y_v - y_u - custo[u][v] (Oposto em relação ao c_e do Chvátal)
	// Esse número é sempre positivo, pois representa a melhoria em custo
	// do arco de entrada para 1 unidade.

	// Para atualizar o y, podemos dizer que todos os y_k da árvore T_v diminuem em c,
	// pois tal melhoria se aplica a todos os vértices desse lado de u->v

	// Analogamente, podemos aumentar todos os y_k da árvore T_u, pois os valores de y_k
	// são relativos. Assim, facilitamos a implementação e sempre atualizamos a árvore (T_u ou T_v)
	// que NÃO contém a raiz (árvore S), por ser mais fácil de utilizar nosso vetor s[x].
	int f,k;
	int c;

	int u,v;
	u = (*t).u;
	v = (*t).v;

	c = (*t).y[ v ] - (*t).y[ u ] - custo[u][v]; // c > 0 sempre

	//Precisamos agora saber se S = T_v ou S = T_u
	// Tal informação já está em (*t).depois. Se depois==true => S = T_v, c.c., S=T_u
	if((*t).depois) // Se S = T_v
		c=-c; // Então eu devo subtrair valores ao invés de somar.

	f = k = (*t).sai; // Filho no arco f, portanto, pertencente à S

	(*t).y[k]+=c; // Atualiza y para o vértice de f que pertence a S

	// Atualiza y para todos a árvore S, utilizando o vetor de sucessores para descobrir
	// quando a árvore acaba (profundidade atual é menor ou igual a inicial)
	for( k=(*t).s[k]; (*t).d[k] > (*t).d[f]; k=(*t).s[k]){
		(*t).y[k]+=c;
	}

}

void atualiza_arvore(Arvore *t, int n){
	int a,b;
	int i,j;
	int r,k;
	int e1,e2,f1,f2; // e2 e f2 pertencem a S

	int c_atual; //Para atualizar D. Para cada árvore S_k, o novo d*[x] = d_x + c_k
			// para qualquer x pertencente a S_k. c_k = c_k-1 + 2
	int ant,atual,prox;

	if((*t).depois){
		e1=(*t).u;
		e2=(*t).v;
	}
	else{
		e1=(*t).v;
		e2=(*t).u;
	}
	f2=(*t).sai;
	f1=(*t).p[f2];


	//ATUALIZANDO S

	//Step 0: Inicializa a,b,i
	a = f1;
	while( (*t).s[a] != f2 )
		a = (*t).s[a];
	b = (*t).s[e1];
	i = e2;
	// a é o predecessor de f2
	// b é o sucessor de e1
	// S* sai de logo depois de a e entre exatamente entre e1 e b
	// i é o nó atual do caminho e2 ~> f2 (pivot stem)

	//Step 1: Acha o último nó k de S1 e inicializa r
	k=i;
	while( (*t).d[ (*t).s[k] ] > (*t).d[i] )
		k = (*t).s[k];
	r = (*t).s[k];
	//Step 2: Se estiver no final de S*, remove S e insere S*
	while(true){
		if(i==f2){
			if(e1==a){ // Se S* continua no mesmo lugar de S
				(*t).s[e1]=e2;
				(*t).s[k]=r;
			}
			else{ // Caso geral
				(*t).s[a] = r;
				(*t).s[e1] = e2;
				(*t).s[k]=b;
			}
			break;
		}
		//Step 3: Sobe no caminho e2 ~> f2 e atualiza s[k]
		j = i;
		i = (*t).p[i];
		(*t).s[k] = i;
		//Step 4: Ache o último nó k do lado esquerdo de S_t
		k = i;
		while((*t).s[k]!=j)
			k = (*t).s[k];
		//Step 5: Se o lado direito de S_t é não-vazio então atualiza s[k],
		// acha o último nó k em S_t e atualiza r
		if((*t).d[r] > (*t).d[i]) // Se o lado direito é não-vazio
			(*t).s[k] = r; // Atualiza s[k]
		while((*t).d[ (*t).s[k] ] > (*t).d[i]){
			k = (*t).s[k];
		}
		r = (*t).s[k];
		// Step 6: Retorne ao Step 2.
	}

	//ATUALIZANDO D
	atual = e2;
	prox = (*t).p[atual];

	c_atual = (*t).d[e1] - (*t).d[e2] + 1;

	while( atual != (*t).s[k]){ //Enquanto atual pertence a S*
		if(atual == prox){ // Subiu no pivot stem
			prox = (*t).p[atual];
			c_atual+=2;
		}
		(*t).d[atual] += c_atual;
		atual = (*t).s[atual];
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