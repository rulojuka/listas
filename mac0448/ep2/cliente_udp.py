#!/usr/bin/python3

from socket import *
import threading
from threading import Thread
from time import sleep
import sys, ssl

RECV_BUFFER = 2048

if( len(sys.argv)<=1 or len(sys.argv)>4):
  print( "Usage: ./servidor.py ip porta chat_port" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])
chatPort =  int(sys.argv[3])

clientSocket = socket(AF_INET, SOCK_DGRAM)

def envia_udp(message, socket):
  socket.sendto( message.encode('utf-8') ,(serverName,serverPort))

try:
  while 1:
    comando = input('Escreva a mensagem: ')
    mensagem = ""
    if( comando=="login" ):
      usuario = input('Escreva seu nickname: ')
      mensagem = "LOGIN " + usuario + " " + str(chatPort)
      envia_udp(mensagem, clientSocket)
      data,addr = clientSocket.recvfrom(RECV_BUFFER)
      data = data.decode('utf-8')
      if (data.split()[0] == "OK"):
        print("Login feito com sucesso")
      else:
        print("Login falhou")
        usuario = "anonymous"
        continue
    elif( comando=="list" ):
        mensagem = "LIST"
        envia_udp(mensagem, clientSocket)
        data,addr = clientSocket.recvfrom(RECV_BUFFER)
        data = data.decode('utf-8')
        words = data.split('\n')
        print("Lista de usuários:")
        for word in words:
          print (word)        
except (KeyboardInterrupt, SystemExit):
  print ('\nReceived keyboard interrupt, quitting program.')
