#include"entrada.h"

// Lê entrada e cria o grafo g
void le_entrada(Grafo *g){
	FILE *entrada;
	char buffer [MAXLINE];
	int a,b,c;
	int origem,destino;
	int x;
	int n;

	Aresta aresta;
	int count=0;

	entrada = fopen ("problema.dat" , "r");
	if (entrada == NULL){
		printf("Erro lendo arquivo. Fechando programa.\n");
		exit(-1);
	}
	else{
		fscanf(entrada, " %d %d %d %d " ,&((*g).n), &origem, &destino, &x);
		n = (*g).n;
		// Inicializa grafo
		for(int i=0; i<n; i++){ //Limpa as listas e inicializa b_t com zeros
			(*g).b_t[i]=0;
			for(int j=0; j<n; j++){
				(*g).custo[i][j]=-1;
				(*g).artificial[i][j]=1; //Inicializa todos os arcos como artificiais
			}
		}
		(*g).b_t[origem]=-x; // Inicializa a origem em b_t
		(*g).b_t[destino]=x; // Inicializa o destino em b_t

		while ( ! feof (entrada) ){
			if ( fgets (buffer , MAXLINE , entrada) == NULL ) break;
			sscanf(buffer, " %d %d %d ",&a,&b,&c);
			//Adiciona aresta no grafo
			(*g).custo[a][b]=c;
			(*g).artificial[a][b]=0; //Adiciona arco como nao-artificial
			//Adiciona aresta na lista de arestas
			aresta.origem=a;
			aresta.destino=b;
			aresta.custo=c;
			(*g).lista[count++]=aresta;
		}
		(*g).n_arestas=count;
		fclose (entrada);
	}
}

void imprime_entrada(Grafo *g){
	int n = (*g).n;
	printf("Nós: %d\n",n);
	printf("B transposto:");
	for(int i=0; i<n; i++){
		printf(" %d",(*g).b_t[i]);
	}
	printf("\nGrafo de custos:\n");
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			if((*g).artificial[i][j]==false)
				printf("%d -> %d (%d)\n",i,j,(*g).custo[i][j]);
		}
	}
	printf("Lista de arestas:\n");
	for(int i=0; i<(*g).n_arestas; i++){
		printf("%d -> %d (%d)\n",(*g).lista[i].origem,(*g).lista[i].destino,(*g).lista[i].custo);
	}
}