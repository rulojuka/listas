#!/usr/bin/python

from socket import *
import sys

if( len(sys.argv)==1 ):
  print "Usage: ./servidor.py ip porta"
  sys.exit(0)
  
serverName = sys.argv[1]
serverPort = int(sys.argv[2])
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))

print "Digite HELP para ver os comandos disponiveis."
while 1:
  comando = raw_input('Escreva o comando: ')
  mensagem = ""
  if( comando=="login" ):
    usuario = raw_input('Escreva seu nickname: ')
    mensagem = "LOGIN " + usuario
  elif( comando=="list" ):
    mensagem = "LIST"
  elif( comando=="logout" ):
    mensagem = "LOGOUT"

  clientSocket.send(mensagem)
  
  
  
  
  
clientSocket.close()



