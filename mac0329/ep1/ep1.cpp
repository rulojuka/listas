#include<stdio.h>
#include<stdlib.h>
#include<string>
#include<string.h>
#include<map>

#define charMAX 500

using namespace std;

map<string,int> instrucoes;
map<int,int> programa;
int maior=0;

void inicializa_map(){
	instrucoes["LDA"]=11;
	instrucoes["STA"]=12;
	instrucoes["ADD"]=21;
	instrucoes["SUB"]=22;
	instrucoes["MUL"]=23;
	instrucoes["DIV"]=24;
	instrucoes["REM"]=25;
	instrucoes["REV"]=29;
	instrucoes["INN"]=31;
	instrucoes["PRN"]=41;
	instrucoes["NOP"]=50;
	instrucoes["JMP"]=51;
	instrucoes["JLE"]=52;
	instrucoes["JDZ"]=53;
	instrucoes["JGT"]=54;
	instrucoes["JEQ"]=55;
	instrucoes["JLT"]=56;
	instrucoes["JGT"]=57;
	instrucoes["JGE"]=58;
	instrucoes["STP"]=70;
}

FILE *leituraEntrada (char *nome){
	FILE *entrada_aux;
	entrada_aux = fopen(nome, "r");
	if (entrada_aux == NULL){
		fprintf(stderr, "ERRO!! Nao consegui abrir o arquivo %s\n", nome);
		exit(-1);
	}
	printf("Arquivo de entrada com as definicoes para o montador: %s\n", nome);
	return entrada_aux;
}

void adiciona(int linha, int valor){
	if(programa[linha]!=0){
		fprintf(stderr, "Erro de sintaxe!");
		exit(-1);
	}
	else{
		programa[linha]=valor;
		//printf("adicionou %d => %d\n",linha,programa[linha]);
	}
}

void analisa(char *atual){
	//printf("Analisando linha --%s--\n",atual);
	int linha;
	char aux[10];
	string comando;
	int endereco;
	int valor;

	sscanf(atual,"%d ",&linha);
	strncpy(aux,atual+4,3);
	aux[3]=0;
	comando=aux;

	if(atual[3]=='{'){
		sscanf(atual,"%*d %*s %d",&endereco);
		adiciona(linha,instrucoes[comando]*100+endereco);
	}
	else{
		sscanf(atual,"%*d %d",&valor);
		adiciona(linha,valor);
	}

	if(linha>maior)
		maior=linha;
}

int main(int argc, char** argv){

	FILE *entrada,*saida;
	char aux[charMAX] ,nomeSaida[charMAX];
	int i;

	entrada = leituraEntrada(argv[1]);
	inicializa_map();

	while (fgets (aux,charMAX,entrada) != NULL){
		if( aux[0] <= '9' && aux[0]>='0' ){
			analisa(aux);
		}
		else if(aux[0] !=';'){
			printf ("\n\nErro de sintaxe!\n\n");
			exit (-1);
		}
	}
	fclose(entrada);

	printf ("digite um nome para a saida : ");
	scanf ("%s", nomeSaida);
	saida = fopen(nomeSaida, "w");
	for(i=0;i<maior;i++)
		if(programa[i]==0)
			fprintf(saida,"\n");
		else
			fprintf(saida,"%+05d\n",programa[i]);
	fclose(saida);

	return 0;
}

