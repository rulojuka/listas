#include <unistd.h> /* fork */
#include <sys/wait.h> /* wait */
#include <stdlib.h> /* exit */
#include <sys/stat.h> /*chmod*/
#include <sys/types.h> /*tiypes*/
#include <errno.h> /*stderr errno*/
#include <stdio.h>
#include <string.h>

#define MAX_LINE 500
#define MAX_WORD 100


#define INVALID_ID 0
#define PROTEGE "protegepracaramba"
#define PROTEGE_ID 1
#define LIBERA "liberageral"
#define LIBERA_ID 2
#define RODEVEJA "rodeveja"
#define RODEVEJA_ID 3
#define RODE "rode"
#define RODE_ID 4

int descobre_comando(char *comando){
  if( strcmp(comando,PROTEGE) == 0)
    return PROTEGE_ID;
  if( strcmp(comando,LIBERA) == 0)
    return LIBERA_ID;
  if( strcmp(comando,RODEVEJA) == 0)
    return RODEVEJA_ID;
  if( strcmp(comando,RODE) == 0)
    return RODE_ID;

  return INVALID_ID;
}

int main(int argc, char **argv){
  char comando[MAX_WORD], argumentos[MAX_WORD];
  char buffer[MAX_LINE];
  int cmd_id;
  int permissao;
  int status=0;
  char * args[] = { "arg", NULL };
  char * env[] = { NULL };
 

  while ( fgets ( buffer, MAX_LINE, stdin ) != NULL){
    sscanf(buffer, " %[^ ] %[^\n]",comando,argumentos);

    cmd_id = descobre_comando(comando);
    switch(cmd_id){
      case PROTEGE_ID:
        if( chmod(argumentos,0) < 0 )
          fprintf(stderr, "Deu errado.\n");
        else
          printf("Protegeu pra caramba o arquivo %s\n",argumentos);
        break;

      case LIBERA_ID:
        permissao = strtol("777", 0, 8); /* Transforma para octal*/
        if( chmod(argumentos,permissao) < 0 )
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
          execve(argumentos,args,env);
          /*execve substitui imagem do processo, o filho nunca passa por aqui*/
        }
        break;

      case RODE_ID:
        if( fork() ){ 
          /* Pai não faz nada, continua executando normalmente*/
        }
        else{
          execve(argumentos,args,env);
          exit(0);
        }
        break;

      default:
        printf("Comando invalido\n");
        break;
    }
  }
  return 0;
}

