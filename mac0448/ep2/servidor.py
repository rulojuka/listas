#!/usr/bin/python

from socket import *
import sys, select

if( len(sys.argv)==1 ):
  print "Usage: ./servidor.py porta"
  sys.exit(0)

serverPort = int(sys.argv[1])
fd_list = []
TAMANHO_FILA = 5
RECV_BUFFER = 2048

serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(TAMANHO_FILA)

# Add server socket to the list of readable connections
fd_list.append(serverSocket)
print "Chat server started on port " + str(serverPort)

while 1:
  # Get the list sockets which are ready to be read through select
  read_sockets,write_sockets,error_sockets = select.select(fd_list,[],[])

  for sock in read_sockets:
    #New connection
    print sock
    if sock == serverSocket:
      # Handle the case in which there is a new connection recieved through server_socket
      sockfd, addr = serverSocket.accept()
      fd_list.append(sockfd)
      print "Client (%s, %s) connected" % addr
     
    #Some incoming message from a client
    else:
      data = sock.recv(RECV_BUFFER)
      print "Recebeu dados: " + data
      modifiedMessage = data.upper()
      sock.send(modifiedMessage)

server_socket.close()
