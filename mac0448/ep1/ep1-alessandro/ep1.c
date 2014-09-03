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

#define LISTENQ 1
#define MAXDATASIZE 100
#define MAXLINE 4096

#define USER "USER"
#define QUIT "QUIT"
#define PASS "PASS"
#define SYST "SYST"
#define PASV "PASV"

#define USER_CMD 1
#define PASS_CMD 2
#define QUIT_CMD 3
#define SYST_CMD 4
#define PASV_CMD 5

int retorna_funcao(char *s){
  printf("funcao retorna %s\n",s);
  char comando[MAXLINE];
  sscanf(s, "%s", comando); 
  printf("comando = %s\n",comando);
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
   char usuario[MAXLINE], senha[MAXLINE], resposta[MAXLINE];
   char boas_vindas[]="220 Bem vindo ao servidor FTP.\r\n";
   int comando;
   int datafd; /*Socket de dados*/
   struct sockaddr_in dataaddr;
   char recvdata[MAXLINE + 1];
   char *buffer;
   int a,b,c,d; /*bytes do ip*/
   int x,y; /*bytes de port*/

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
                    printf("porta eh %d, a outra eh %d\n",dataaddr.sin_port,servaddr.sin_port);


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
          printf("godz gay\n");
         write(connfd, boas_vindas, strlen(boas_vindas));
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
                    sprintf(resposta, "331 seu usuario e %s\r\n", usuario);
                    break;
                  case (PASS_CMD):
                    sscanf(recvline, "%*s %s",senha);
                    sprintf(resposta, "230 User %s logged in\r\n", usuario);
                    break;
                  case (SYST_CMD):
                    sprintf(resposta, "215 UNIX Type: L8\r\n");
                    break;
                  case (PASV_CMD):
                    printf("Entrou PASV\n");
                    datafd = cria_socket();
                    printf("Criou socket\n");

                    bzero(&dataaddr, sizeof(dataaddr));
                    dataaddr.sin_family      = AF_INET;
                    dataaddr.sin_addr.s_addr = htonl(servaddr.sin_addr.s_addr);
                    dataaddr.sin_port        = htons(0);
                    printf("porta eh %hu, a outra eh %hu\n",dataaddr.sin_port,servaddr.sin_port);
                    if (bind(datafd, (struct sockaddr *)&dataaddr, sizeof(dataaddr)) == -1) {
                      perror("datafd bind :(\n");
                      exit(3);
                    }
                    printf("Terminou bind\n");
                    printf("s_addr: %d sin_port: %d\n",dataaddr.sin_addr.s_addr, dataaddr.sin_port);
                    buffer = inet_ntoa(dataaddr.sin_addr);
                    printf("Long (ip): %ld Ip: %s\n",servaddr.sin_addr.s_addr,buffer);
                    printf("Porta:(unsigned short) %hu\n", dataaddr.sin_port);
                    sscanf(buffer,"%d.%d.%d.%d ",&a,&b,&c,&d);
                    y = dataaddr.sin_port/256;
                    x = dataaddr.sin_port%256;
                    sprintf(resposta, "227 Entering Passive Mode (%d,%d,%d,%d,%d,%d).\r\n",a,b,c,d,x,y);

                    break;
                  case(QUIT_CMD):
                    strcat(resposta, "221 Goodbye\n");
                    exit(0);
                    break;
                  default:
                    break;


               }
            }
            write(connfd, resposta, strlen(resposta));
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
