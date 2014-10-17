#!/usr/bin/python3

from socket import *
from threading import Thread
from time import sleep
import sys

def envia(mensagem, sock):
  sock.send( mensagem.encode('utf-8') )

def heartbeat(time):
  while 1:
    if heartbeat_flag:
      envia("HB", clientSocket)
      print( "Mandou HB" )
    sleep(time)

if( len(sys.argv)<=1 or len(sys.argv)>3):
  print( "Usage: ./servidor.py ip porta" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))

#Comeca heartbeat
heartbeat_flag = 0
thread = Thread(target = heartbeat, args = (3, ))
thread.start()

usuario = ""

print( "Digite HELP para ver os comandos disponiveis.")
while 1:
  comando = input('Escreva o comando: ')
  mensagem = ""
  if( comando=="login" ):
    usuario = input('Escreva seu nickname: ')
    mensagem = "LOGIN " + usuario
    heartbeat_flag = 1
  elif( comando=="list" ):
    mensagem = "LIST"
  elif( comando=="logout" ):
    mensagem = "LOGOUT " + usuario
    heartbeat_flag = 0
  elif( comando=="quit" or comando=="exit"):
    break

  print( "passou por aqui")
  envia(mensagem, clientSocket)

heartbeat_flag = 0
envia("CLOSE", clientSocket)
clientSocket.close()



