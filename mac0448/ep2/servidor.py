#!/usr/bin/python3

from socket import *
from threading import Thread
from time import sleep
import sys, select

def envia(mensagem, sock):
  sock.send( mensagem.encode('utf-8') )
  print( "Enviando para o cliente: ---%s---" % mensagem  )

global LIMITE_HB
LIMITE_HB = 5

global lista_usuarios
lista_usuarios = []
global recebeu_heartbeat
recebeu_heartbeat = []
def atualiza_heartbeat(time): # aumenta o tempo desde o último HB
  tupla_antiga = (0,0,0)
  while heartbeat_flag:
    for entrada in lista_usuarios:
      #print ("Hb de " + str(entrada[0]) + " eh " + str(entrada[2]))
      tupla_antiga = entrada
      lista_usuarios.remove(tupla_antiga)
      nick = tupla_antiga[0]
      sock = tupla_antiga[1]
      tempo = tupla_antiga[2] + 1
      if(tempo < LIMITE_HB):
        tupla_nova = (nick, sock, tempo)
        lista_usuarios.append(tupla_nova)
      else:
        print ("Usuario " + str(entrada[0]) + " foi desconectado do sistema por não responder ao Heartbeat.")

      continue
    sleep(time)

def zera_heartbeat(sock):
  tupla_antiga = (0,0,0)
  for entrada in lista_usuarios:
    if(entrada[1] == sock):
      tupla_antiga = entrada
      lista_usuarios.remove(tupla_antiga)
      tupla_nova = (tupla_antiga[0], tupla_antiga[1] , 0)
      lista_usuarios.append(tupla_nova)
      continue

if( len(sys.argv)==1 or len(sys.argv)>2 ):
  print( "Usage: ./servidor.py porta")
  sys.exit(0)

serverPort = int(sys.argv[1])
fd_list = []
TAMANHO_FILA = 5
RECV_BUFFER = 2048

#Comeca a ouvir heartbeat
heartbeat_flag = 1
thread = Thread(target = atualiza_heartbeat, args = (3, ))
thread.start()

serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(TAMANHO_FILA)

# Add server socket to the list of readable connections
fd_list.append(serverSocket)
print( "Chat server started on port " + str(serverPort))


while 1:
  # Get the list sockets which are ready to be read through select
  # Implementa multiplexacao
  read_sockets,write_sockets,error_sockets = select.select(fd_list,[],[])

  for sock in read_sockets:
    #New connection
    mensagem = ""
    if sock == serverSocket:
      # Handle the case in which there is a new connection recieved through server_socket
      sockfd, addr = serverSocket.accept()
      fd_list.append(sockfd)
      print( "Client (%s, %s) connected" % addr )

    #Some incoming message from a client
    else:
      data = sock.recv(RECV_BUFFER).decode('utf-8')
      print( "Recebeu do cliente: ---%s---" % data )
      comando = data.split()[0]
      print( "Comando eh --%s--" % comando )
      if( comando == "LOGIN" ):
        print( "entrou no login" )
        usuario = data.split()[1]
        entrada = (usuario,sock,0) # nick, socket, tempo_desde_o_ultimo_HB
        if(lista_usuarios.count( entrada ) == 0):
          lista_usuarios.append( entrada )
        mensagem = "User " + str(usuario) + " logged in."
        print(str(len(lista_usuarios)) + " usuarios logados.")
        envia(mensagem,sock)
      elif( comando == "LIST" ):
        for entrada in lista_usuarios:
          mensagem += entrada[0] + '\n'
        envia(mensagem,sock)
      elif( comando == "HB" ):
        zera_heartbeat(sock)
      elif( comando == "LOGOUT" ):
        #TODO Descobre nick do usuario
        usuario = data.split()[1]
        lista_usuarios.remove( usuario )
        #TODO FECHAR O SOCKET DO USUARIO
      elif( comando == "CLOSE" ):
        sock.close()
        fd_list.remove(sock)

heartbeat_flag = 0
server_socket.close()
