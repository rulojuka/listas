#!/usr/bin/python3

from socket import *
from threading import Thread
import threading
from time import sleep
from time import ctime
import sys, select

def envia(mensagem, sock):
  sock.send( mensagem.encode('utf-8') )
  peer_name = sock.getpeername()
  log( "Enviando para %s:%d : ---%s---" % (peer_name[0], peer_name[1], mensagem ))

def log(event):
  arquivo = open('log.txt', 'a')
  log_line = ctime() + "\n\t\t" + event + "\n"
  #print (log_line)
  arquivo.write(log_line)
  arquivo.close()

global lista_usuarios
lista_usuarios = []

class HeartbeatChecker(object):

  def __init__(self, time, max_falhas):
    self.on = True
    log("Iniciou Thread HB.")
    self.delay = time
    self.max_falhas = max_falhas

  def check(self):
    tupla_antiga = (0,0,0)
    while self.on:
      for entrada in lista_usuarios:
        #print ("Hb de " + str(entrada[0]) + " eh " + str(entrada[2]))
        tupla_antiga = entrada
        lista_usuarios.remove(tupla_antiga)
        nick = tupla_antiga[0]
        sock = tupla_antiga[1]
        falhas = tupla_antiga[2] + 1
        if(falhas <= self.max_falhas):
          tupla_nova = (nick, sock, falhas)
          lista_usuarios.append(tupla_nova)
        else:
          msg = "Usuario " + str(entrada[0]) + " foi desconectado do sistema por não responder ao Heartbeat."
          print (msg)
          log(msg)
      sleep(self.delay)
    log("Fechou Thread HB.")

def zera_heartbeat(sock):
  tupla_antiga = (0,0,0)
  for entrada in lista_usuarios:
    if(entrada[1] == sock):
      tupla_antiga = entrada
      lista_usuarios.remove(tupla_antiga)
      tupla_nova = (tupla_antiga[0], tupla_antiga[1] , 0)
      lista_usuarios.append(tupla_nova)
      nick = str(tupla_antiga[0])
      peer_name = sock.getpeername()
      ip_porta = peer_name[0] + ":" + str(peer_name[1])
      log("Zerando heartbeat de " + nick + " (" + ip_porta + ")")
      continue

if( len(sys.argv)==1 or len(sys.argv)>2 ):
  print( "Usage: ./servidor.py porta")
  sys.exit(0)

serverPort = int(sys.argv[1])
fd_list = []
TAMANHO_FILA = 5
RECV_BUFFER = 2048

#Comeca a ouvir heartbeat
hb = HeartbeatChecker(1, 3)
t = threading.Thread(target = hb.check)
t.start()


serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(TAMANHO_FILA)

# Add server socket to the list of readable connections
fd_list.append(serverSocket)
msg = "Chat server started on port " + str(serverPort)
print( msg )
log( msg )

try:
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
        msg = "Client (%s, %s) connected" % addr
        print( msg )
        log ( msg )

      #Some incoming message from a client
      else:
        data = sock.recv(RECV_BUFFER).decode('utf-8')
        peer_name = sock.getpeername()
        log( "Recebeu de %s:%d: ---%s---" % (peer_name[0], peer_name[1], data ))
        comando = data.split()[0]
        if( comando == "LOGIN" ):
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
          usuario = data.split()[1]
          for entrada in lista_usuarios:
            if(entrada[0] == usuario):
              socket_atual = entrada[1] #TODO fechar esse socket.
              lista_usuarios.remove( entrada )
        elif( comando == "CLOSE" ):
          sock.close()
          fd_list.remove(sock)
except (KeyboardInterrupt, SystemExit):
  print ('\nReceived keyboard interrupt, quitting program.')
  hb.on = False
  serverSocket.close()
