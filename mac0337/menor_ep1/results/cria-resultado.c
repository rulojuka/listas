#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define MAX_LINE 100

#define LARGA "Larga"
#define ESTREITA "Estreita"

int main(int argc, char *argv[]){
  FILE *entrada, *saida;
  char buffer[MAX_LINE];
  char nome_saida[MAX_LINE];
  char tipo[MAX_LINE];
  int i;
  double volume,soma_larga,soma_estreita;
  int count_larga,count_estreita;
  if(argc==1){
    printf("Usage: ./cria-resultado <input1> <input2> ...\n");
    printf("An inputX.out file will be created for each input file.\n");
    exit(0);
  }
  for(i=1;i<argc;i++){
  
    /* Lê arquivos */
    entrada = fopen (argv[i] , "r");
	  if (entrada == NULL){
		  printf("Erro lendo arquivo. Fechando programa.\n");
		  exit(-1);
	  }
    strcpy(nome_saida, argv[i]);
    strcat(nome_saida, ".out");
    saida = fopen(nome_saida, "w");
	  if (saida == NULL){
		  printf("Erro criando arquivo. Fechando programa.\n");
		  exit(-1);
	  }

    /*Parsing da entrada*/
    soma_larga = soma_estreita = 0.0;
    count_larga = count_estreita = 0;
    while ( 1 ){
      if( fgets ( buffer, MAX_LINE, entrada ) == NULL) break;      
      sscanf(buffer, "%[^:] ",tipo);        
      if( fgets ( buffer, MAX_LINE, entrada ) == NULL) break;
      if( fgets ( buffer, MAX_LINE, entrada ) == NULL) break;
      sscanf(buffer, "%*[^:]: %lf",&volume);
      
      if( strcmp(tipo,LARGA)==0 ){
        /*printf("Larga: ");*/
        count_larga++;
        soma_larga+=volume;
      }
      else{
        /*printf("Estreita: ");*/
         count_estreita++;
        soma_estreita+=volume;
      }
      /*printf("%lfdb\n\n",volume);*/
    }
    
    /*Imprime media no arquivo e na tela*/
    fprintf(saida,"Média larga: %lf (%d amostras)\n",(soma_larga/count_larga), count_larga);
    fprintf(saida,"Média estreita: %lf (%d amostras)\n",(soma_estreita/count_estreita), count_estreita);
    
    printf("Arquivo %s:\n",nome_saida);
    printf("Média larga: %lf (%d amostras)\n",(soma_larga/count_larga), count_larga);
    printf("Média estreita: %lf (%d amostras)\n\n",(soma_estreita/count_estreita), count_estreita);

  }
	return 0;
}
