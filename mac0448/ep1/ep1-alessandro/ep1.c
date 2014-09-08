/* Por Prof. Daniel Batista <batista@ime.usp.br>
 * Em 12/08/2013
 *
 * Um c�digo simples (n�o � o c�digo ideal, mas � o suficiente para o
 * EP) de um servidor de eco a ser usado como base para o EP1. Ele
 * recebe uma linha de um cliente e devolve a mesma linha. Teste ele
 * assim depois de compilar:
 *
 * ./servidor 8000
 *
 * Com este comando o servidor ficar� escutando por conex�es na porta
 * 8000 TCP (Se voc� quiser fazer o servidor escutar em uma porta
 * menor que 1024 voc� precisa ser root).
 *
 * Depois conecte no servidor via telnet. Rode em outro terminal:
 *
 * telnet 127.0.0.1 8000
 *
 * Escreva sequ�ncias de caracteres seguidas de ENTER. Voc� ver� que
 * o telnet exibe a mesma linha em seguida. Esta repeti��o da linha �
 * enviada pelo servidor. O servidor tamb�m exibe no terminal onde ele
 * estiver rodando as linhas enviadas pelos clientes.
 *
 * Obs.: Voc� pode conectar no servidor remotamente tamb�m. Basta saber o
 * endere�o IP remoto da m�quina onde o servidor est� rodando e n�o
 * pode haver nenhum firewall no meio do caminho bloqueando conex�es na
 * porta escolhida.
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <time.h>
#include <unistd.h>
#include <sys/stat.h> /* Para medir o tamanho do arquivo. */
#include <fcntl.h> /* open() */

#define LISTENQ 1
#define MAXDATASIZE 100
#define MAXLINE 4096
#define MAX_DATA_BUFFER 4096

#define USER "USER"
#define QUIT "QUIT"
#define PASS "PASS"
#define SYST "SYST"
#define PASV "PASV"
#define LIST "LIST"
#define GET "RETR"
#define TYPE "TYPE"
#define PUT "STOR"

#define USER_CMD 1
#define PASS_CMD 2
#define QUIT_CMD 3
#define SYST_CMD 4
#define PASV_CMD 5
#define LIST_CMD 6
#define GET_CMD 7
#define TYPE_CMD 8
#define PUT_CMD 9

int retorna_funcao(char *s){
  char comando[MAXLINE];
  sscanf(s, "%s", comando); 
  if(strcmp(comando,USER)==0)
    return USER_CMD;
  if(strcmp(comando,PASS)==0)
    return PASS_CMD;
  if(strcmp(comando,QUIT)==0)
    return QUIT_CMD;
  if(strcmp(comando,SYST)==0)
    return SYST_CMD;
  if(strcmp(comando,PASV)==0)
    return PASV_CMD;
  if(strcmp(comando,LIST)==0)
    return LIST_CMD;
  if(strcmp(comando,GET)==0)
    return GET_CMD;
  if(strcmp(comando,TYPE)==0)
    return TYPE_CMD;
  if(strcmp(comando,PUT)==0)
    return PUT_CMD;

  return -1;
}

int cria_socket(){
  int sock;
  if ((sock = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
    perror("socket :(\n");
    exit(2);
  }
  return sock;
}

void envia_mensagem(char *s, int fd){
  write(fd, s, strlen(s));
}

int main (int argc, char **argv) {
  /* Os sockets. Um que ser� o socket que vai escutar pelas conex�es
   * e o outro que vai ser o socket espec�fico de cada conex�o */
  int listenfd, connfd;
  /* Informa��es sobre o socket (endere�o e porta) ficam nesta struct */
  struct sockaddr_in servaddr;
  /* Retorno da fun��o fork para saber quem � o processo filho e quem
   * � o processo pai */
  pid_t childpid;
  /* Armazena linhas recebidas do cliente */
  char	recvline[MAXLINE + 1];
  /* Armazena o tamanho da string lida do cliente */
  ssize_t  n;

  /*********** MINHAS VARIAVEIS *************/
  char usuario[MAXLINE], senha[MAXLINE], mensagem[MAXLINE];
  int comando;
  int datafd, data_transfer_fd; /*Sockets de dados*/
  struct sockaddr_in dataaddr;
  char *buffer;
  int a,b,c,d; /*bytes do ip*/
  int x,y; /*bytes de port*/
  int porta;
  FILE *fp;
  int data_len;
  char ch;
  char dados[MAXLINE];
  int topo;
  char data_buffer[MAX_DATA_BUFFER + 10];
  char endereco_arquivo[MAXLINE];
  off_t tamanho_arquivo;
  struct stat st;
  int arquivo_fd;
  int leu_bytes;
  
  char tipo='A'; /*Tipo de transmissao*/

  if (argc != 2) {
    fprintf(stderr,"Uso: %s <Porta>\n",argv[0]);
    fprintf(stderr,"Vai rodar um servidor de echo na porta <Porta> TCP\n");
    exit(1);
  }

  /* Cria��o de um socket. Eh como se fosse um descritor de arquivo. Eh
   * possivel fazer operacoes como read, write e close. Neste
   * caso o socket criado eh um socket IPv4 (por causa do AF_INET),
   * que vai usar TCP (por causa do SOCK_STREAM), j� que o FTP
   * funciona sobre TCP, e ser� usado para uma aplica��o convencional sobre
   * a Internet (por causa do n�mero 0) */
  if ((listenfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
    perror("socket :(\n");
    exit(2);
  }

  /* Agora � necess�rio informar os endere�os associados a este
   * socket. � necess�rio informar o endere�o / interface e a porta,
   * pois mais adiante o socket ficar� esperando conex�es nesta porta
   * e neste(s) endere�os. Para isso � necess�rio preencher a struct
   * servaddr. � necess�rio colocar l� o tipo de socket (No nosso
   * caso AF_INET porque � IPv4), em qual endere�o / interface ser�o
   * esperadas conex�es (Neste caso em qualquer uma -- INADDR_ANY) e
   * qual a porta. Neste caso ser� a porta que foi passada como
   * argumento no shell (atoi(argv[1]))
   */
  bzero(&servaddr, sizeof(servaddr));
  servaddr.sin_family      = AF_INET;
  servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
  servaddr.sin_port        = htons(atoi(argv[1]));
  if (bind(listenfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) == -1) {
    perror("bind :(\n");
    exit(3);
  }


  /* Como este c�digo � o c�digo de um servidor, o socket ser� um
   * socket passivo. Para isto � necess�rio chamar a fun��o listen
   * que define que este � um socket de servidor que ficar� esperando
   * por conex�es nos endere�os definidos na fun��o bind. */
  if (listen(listenfd, LISTENQ) == -1) {
    perror("listen :(\n");
    exit(4);
  }

  printf("[Servidor no ar. Aguardando conexoes na porta %s]\n",argv[1]);
  printf("[Para finalizar, pressione CTRL+c ou rode um kill ou killall]\n");

  /* O servidor no final das contas � um loop infinito de espera por
   * conex�es e processamento de cada uma individualmente */
  for (;;) {
    /* O socket inicial que foi criado � o socket que vai aguardar
     * pela conex�o na porta especificada. Mas pode ser que existam
     * diversos clientes conectando no servidor. Por isso deve-se
     * utilizar a fun��o accept. Esta fun��o vai retirar uma conex�o
     * da fila de conex�es que foram aceitas no socket listenfd e
     * vai criar um socket espec�fico para esta conex�o. O descritor
     * deste novo socket � o retorno da fun��o accept. */
    if ((connfd = accept(listenfd, (struct sockaddr *) NULL, NULL)) == -1 ) {
      perror("accept :(\n");
      exit(5);
    }

    /* Agora o servidor precisa tratar este cliente de forma
     * separada. Para isto � criado um processo filho usando a
     * fun��o fork. O processo vai ser uma c�pia deste. Depois da
     * fun��o fork, os dois processos (pai e filho) estar�o no mesmo
     * ponto do c�digo, mas cada um ter� um PID diferente. Assim �
     * poss�vel diferenciar o que cada processo ter� que fazer. O
     * filho tem que processar a requisi��o do cliente. O pai tem
     * que voltar no loop para continuar aceitando novas conex�es */
    /* Se o retorno da fun��o fork for zero, � porque est� no
     * processo filho. */
    if ( (childpid = fork()) == 0) {
      /**** PROCESSO FILHO ****/
      printf("[Uma conexao aberta]\n");
      /* J� que est� no processo filho, n�o precisa mais do socket
       * listenfd. S� o processo pai precisa deste socket. */
      close(listenfd);

      /* Agora pode ler do socket e escrever no socket. Isto tem
       * que ser feito em sincronia com o cliente. N�o faz sentido
       * ler sem ter o que ler. Ou seja, neste caso est� sendo
       * considerado que o cliente vai enviar algo para o servidor.
       * O servidor vai processar o que tiver sido enviado e vai
       * enviar uma resposta para o cliente (Que precisar� estar
       * esperando por esta resposta)
       */

      /* ========================================================= */
      /* ========================================================= */
      /*                         EP1 IN�CIO                        */
      /* ========================================================= */
      /* ========================================================= */
      /* TODO: � esta parte do c�digo que ter� que ser modificada
       * para que este servidor consiga interpretar comandos FTP */
      envia_mensagem("220 Bem vindo ao servidor FTP.\r\n",connfd);
      while ((n=read(connfd, recvline, MAXLINE)) > 0) {
        recvline[n]=0;
        printf("[Cliente conectado no processo filho %d enviou:] ",getpid());
        if ((fputs(recvline,stdout)) == EOF) {
          perror("fputs :( \n");
          exit(6);
        }
        else{
          comando = retorna_funcao(recvline);
          switch( comando ){

            case(USER_CMD):
              sscanf(recvline, "%*s %s",usuario);
              sprintf(mensagem, "331 Password required for %s\r\n", usuario);
              envia_mensagem(mensagem,connfd);
              break;

            case (PASS_CMD):
              sscanf(recvline, "%*s %s",senha);
              sprintf(mensagem, "230 User %s logged in\r\n", usuario);
              envia_mensagem(mensagem,connfd);
              break;

            case (SYST_CMD):
              envia_mensagem("215 UNIX Type: L8\r\n",connfd);
              break;

            case (PASV_CMD):
              datafd = cria_socket(); /* Cria socket para comunica��o de dados*/
              bzero(&dataaddr, sizeof(dataaddr));

              /*Seta protocolo, endere�o e porta*/
              dataaddr.sin_family      = AF_INET;
              dataaddr.sin_addr.s_addr = htonl(INADDR_ANY);
              dataaddr.sin_port        = htons(0);

              /* Bind: Relaciona datafd �s informa��es representadas em dataaddr. */
              if ( bind(datafd, (struct sockaddr *)&dataaddr, sizeof(dataaddr)) == -1) {
                perror("datafd bind :(\n");
                exit(3);
              }
              data_len = sizeof(dataaddr);
              if ( getsockname(datafd, (struct sockaddr *)&dataaddr, &data_len) == -1) {
                perror("datafd getsockname :(\n");
                exit(3);
              }
              /* Listen: Instrui o kernel a come�ar a escutar por conex�es no socket. */
              if ( listen(datafd, LISTENQ) == 1){
                perror("listen :(\n");
                exit(4);
              }

              /* Descobre IP do pr�prio servidor... */
              buffer = inet_ntoa(servaddr.sin_addr);
              sscanf(buffer,"%d.%d.%d.%d ",&a,&b,&c,&d);
              /* ... e porta do pr�prio socket de dados ... */
              porta = (int) ntohs(dataaddr.sin_port);

              /* ... e envia para o cliente. */
              /* TODO isso depende do pc, tem que usar a funcao certa.*/
              x = porta/256;
              y = porta%256;
              sprintf(mensagem, "227 Entering Passive Mode (%d,%d,%d,%d,%d,%d).\r\n",a,b,c,d,x,y);
              envia_mensagem(mensagem,connfd);

              /*Trava processo at� uma conex�o acontecer no datafd*/
              if ((data_transfer_fd = accept(datafd, (struct sockaddr *) NULL, NULL)) == -1 ) {
                perror("accept :(\n");
                exit(5);
              }
              /*Agora que a conex�o em data_transfer_fd est� feita, n�o precisamos mais do datafd. */
              close(datafd);
              break;

            case(LIST_CMD): /* Este comando sup�e que um data_transfer_fd j� esteja configurado. */
              envia_mensagem("150 Opening ASCII mode data connection for file list\r\n",connfd);
              /* Roda o comando ls no shell. */
              fp = popen ("ls -l", "r");
              /* Troca todos os \n por \r\n e salva na string dados. */
              dados[0]=0;
              topo = 0;
              while ((ch=fgetc(fp)) != EOF){
                /*printf("%c", ch);*/
                if (ch == '\n'){
                  dados[topo] = '\r';
                  dados[++topo]=0;
                }
                dados[topo] = ch;
                dados[++topo]=0;
              }

              /* Envia a string dados pelo canal de dados e fecha o canal*/
              write (data_transfer_fd, dados, strlen(dados));
              close(data_transfer_fd);
	      pclose(fp);
              envia_mensagem("226 Transfer complete\r\n",connfd);
              break;
	      
	    case(TYPE_CMD):
	      sscanf(recvline, "%*s %c",&tipo);
	      sprintf(mensagem,"200 Type set to %c\r\n",tipo);
              envia_mensagem(mensagem,connfd);
	      break;

            case(GET_CMD): /* Este comando sup�e que um data_transfer_fd j� esteja configurado. */
              sscanf(recvline, "%*s %s",endereco_arquivo);
	      if( (arquivo_fd = open(endereco_arquivo, O_RDONLY, S_IREAD)) < 0 ){
		sprintf(mensagem,"550 %s: Arquivo ou diret�rio n�o encontrado\r\n",endereco_arquivo);
		envia_mensagem(mensagem,connfd);
	      }
	      else {
		stat(endereco_arquivo,&st);
		tamanho_arquivo = st.st_size;
		if(tipo=='I'){
		  sprintf(mensagem,"150 Opening BINARY mode data connection for %s (%d bytes)\r\n",endereco_arquivo, tamanho_arquivo);
		  envia_mensagem(mensagem,connfd);
		}
		while( (leu_bytes = read(arquivo_fd, data_buffer, MAX_DATA_BUFFER))>0 ){
		  write (data_transfer_fd, data_buffer, leu_bytes);
		}
		close(arquivo_fd);
		close(data_transfer_fd);
		envia_mensagem("226 Transfer complete\r\n",connfd);
	      }
              break;
	     
	    case(PUT_CMD):
	      sscanf(recvline, "%*s %s",endereco_arquivo);
	      if( (arquivo_fd = open(endereco_arquivo, O_WRONLY | O_CREAT)) < 0 ){
		sprintf(mensagem,"550 %s: N�o foi poss�vel criar o arquivo.\r\n", endereco_arquivo);
		envia_mensagem(mensagem,connfd);
	      }
	      else{
		if(tipo=='I'){
		    sprintf(mensagem,"150 Opening BINARY mode data connection for %s\r\n",endereco_arquivo);
		    envia_mensagem(mensagem,connfd);
		}
		while( (leu_bytes = read(data_transfer_fd, data_buffer, MAX_DATA_BUFFER))>0 ){
		  write (arquivo_fd, data_buffer, leu_bytes);
		}
		close(arquivo_fd);
		close(data_transfer_fd);
		envia_mensagem("226 Transfer complete\r\n",connfd);
	      }
	      break;

            case(QUIT_CMD):
              envia_mensagem("221 Goodbye\r\n",connfd);
              exit(0);
              break;

            default:
              break;
          }
        }
      }
      /* ========================================================= */
      /* ========================================================= */
      /*                         EP1 FIM                           */
      /* ========================================================= */
      /* ========================================================= */

      /* Ap�s ter feito toda a troca de informa��o com o cliente,
       * pode finalizar o processo filho */
      printf("[Uma conexao fechada]\n");
      exit(0);
    }
    /**** PROCESSO PAI ****/
    /* Se for o pai, a �nica coisa a ser feita � fechar o socket
     * connfd (ele � o socket do cliente espec�fico que ser� tratado
     * pelo processo filho) */
    close(connfd);
  }
  exit(0);
}
