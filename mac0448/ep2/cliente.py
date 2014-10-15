#!/usr/bin/python

from socket import *
from threading import Thread
from time import sleep
import sys

def heartbeat(time):
  while heartbeat_flag:
    clientSocket.send("HB")
    print "Mandou HB"
    sleep(time)

if( len(sys.argv)==1 ):
  print "Usage: ./servidor.py ip porta"
  sys.exit(0)
  
serverName = sys.argv[1]
serverPort = int(sys.argv[2])
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))

#Comeca heartbeat
heartbeat_flag = 1
thread = Thread(target = heartbeat, args = (3, ))
thread.start()

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
  elif( comando=="quit" or comando=="exit"):
    break

  print "passou por aqui"
  clientSocket.send(mensagem)

heartbeat_flag = 0
clientSocket.send("CLOSE")
clientSocket.close()



