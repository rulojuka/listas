#!/usr/bin/python3

from socket import *
from threading import Thread
from time import sleep
import sys, select

def envia(mensagem, sock):
  sock.send( mensagem.encode('utf-8') )

global lista_usuarios
lista_usuarios = []
def atualiza_heartbeat(time):
  while heartbeat_flag:
    for entrada in lista_usuarios:
      entrada[2] += time
      print ("Hb de " + str(entrada[1]) + "eh " + str(entrada[2]))
      if(entrada[1] == sock):
        entrada[2] = 0;
      print("entrou no while")
    sleep(time)

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
    print( "\n" )
    print( "Chegou mensagem: " )
    print( sock )
    mensagem = ""
    if sock == serverSocket:
      # Handle the case in which there is a new connection recieved through server_socket
      sockfd, addr = serverSocket.accept()
      fd_list.append(sockfd)
      print( "Client (%s, %s) connected" % addr )
     
    #Some incoming message from a client
    else:
      print( "Antes do sock.recv" )
      data = sock.recv(RECV_BUFFER)
      print( "Depois do sock.recv" )
      print( "Recebeu do cliente: ---%s---" % data )
      comando = data.split()[0]
      if( comando == "LOGIN" ):
        print( "entrou no login" )
        usuario = data.split()[1]
        entrada = (usuario,sock,0) # nick, socket, tempo_desde_o_ultimo_HB
        if(lista_usuarios.count( entrada ) == 0):
          lista_usuarios.append( entrada ) 
        mensagem = "User " + usuario + " logged in."
      elif( comando == "LIST" ):
        for entrada in lista_usuarios:
          mensagem += entrada[0] + '\n'
      elif( comando == "HB" ):
        for entrada in lista_usuarios:
          if(entrada[1] == sock):
            entrada[2] = 0;
      elif( comando == "LOGOUT" ):
        #TODO Descobre nick do usuario
        usuario = data.split()[1]
        lista_usuarios.remove( usuario )
        #TODO FECHAR O SOCKET DO USUARIO
      elif( comando == "CLOSE" ):
        sock.close()
        fd_list.remove(sock)
        continue
              
      print( "Enviando para o cliente: ---%s---" % mensagem  )
      envia(mensagem,sock)

heartbeat_flag = 0
server_socket.close()



