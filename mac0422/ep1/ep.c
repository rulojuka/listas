#include <unistd.h> /* fork */
#include <sys/wait.h> /* wait */
#include <stdlib.h> /* exit */
#include <sys/stat.h> /*chmod*/
#include <sys/types.h> /*types*/
#include <errno.h> /*stderr errno*/
#include <stdio.h>
#include <string.h>

#define MAX_LINE 500
#define MAX_WORD 500


#define INVALID_ID 0
#define PROTEGE "protegepracaramba"
#define PROTEGE_ID 1
#define LIBERA "liberageral"
#define LIBERA_ID 2
#define RODEVEJA "rodeveja"
#define RODEVEJA_ID 3
#define RODE "rode"
#define RODE_ID 4
#define SAIA "exit"
#define SAIA_ID 5

int descobre_comando(char *comando){
  if( strcmp(comando,PROTEGE) == 0)
    return PROTEGE_ID;
  if( strcmp(comando,LIBERA) == 0)
    return LIBERA_ID;
  if( strcmp(comando,RODEVEJA) == 0)
    return RODEVEJA_ID;
  if( strcmp(comando,RODE) == 0)
    return RODE_ID;
  if( strcmp(comando,SAIA) == 0)
    return SAIA_ID;

  return INVALID_ID;
}

int main(int argc, char **argv){
  char comando[MAX_WORD], argumentos[MAX_WORD];
  char buffer[MAX_LINE];
  int cmd_id;
  int permissao_libera, permissao_protege;
  int status=0;
  char * args[] = { "arg", NULL };
  char * env[] = { NULL };
 
  permissao_libera = strtol("777", 0, 8);
  permissao_protege = 0;
  
  printf("<%d>:$ ",getpid());
  while ( fgets ( buffer, MAX_LINE, stdin ) != NULL){
    strcpy(comando,"");
    strcpy(argumentos,"");
    sscanf(buffer, " %[^ \n] %[^\n]",comando,argumentos);
    cmd_id = descobre_comando(comando);
    switch(cmd_id){
      case PROTEGE_ID:
        if( chmod(argumentos,permissao_protege) < 0 )
          fprintf(stderr, "Deu errado.\n");
        else
          printf("Protegeu pra caramba o arquivo %s\n",argumentos);
        break;

      case LIBERA_ID:
        if( chmod(argumentos,permissao_libera) < 0 )
          fprintf(stderr, "Deu errado.\n");
        else
          printf("Liberou geral o arquivo %s\n",argumentos);
        break;

      case RODEVEJA_ID:
        if( fork() ){
          wait(&status);
          printf("=> programa '%s' retornou com codigo %d\n",argumentos,status);
        }
        else{
	  printf("Rodando %s com pid: %d\n",argumentos,getpid());
          execve(argumentos,args,env); /*TODO arrumar isso aqui pra aceitar parametros direito no proximo ep*/
          /*execve substitui imagem do processo, o filho nunca passa por aqui*/
	  printf("NAO ERA PRA PASSAR POR AQUI\nPASSE APENAS O ENDERECO DO PROGRAMA SEM PARAMETROS.\n");
	  exit(-1);
        }
        break;

      case RODE_ID:
        if( fork() ){ 
          /* Pai não faz nada, continua executando normalmente*/
	  printf("\n");
        }
        else{
	  printf("Rodando %s com pid: %d em background.\n",argumentos,getpid());
          execve(argumentos,args,env);
          exit(0); 
        }
        break;

      case SAIA_ID:
        exit(0);
        break;

      default:
        printf("Comando invalido\n");
        break;
    }
    printf("<%d>:$ ",getpid());
  }
  return 0;
}

