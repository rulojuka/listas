#!/usr/bin/python3

from socket import *
import threading
from threading import Thread
from time import sleep
import sys

def envia(mensagem, sock):
  sock.send( mensagem.encode('utf-8') )

class Heartbeat(object):

  def __init__(self, sock, time):
    self.on = True
    self.isRunning = False
    self.delay = time
    self.sock = sock

  def beat(self):
    while self.on:
      if( self.isRunning ):
        envia("HB", self.sock)
        sleep(self.delay)

if( len(sys.argv)<=1 or len(sys.argv)>3):
  print( "Usage: ./servidor.py ip porta" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))

#Comeca heartbeat
hb = Heartbeat(clientSocket, 1)
t = threading.Thread(target = hb.beat)
t.start()

usuario = ""

print( "Digite HELP para ver os comandos disponiveis.")
while 1:
  comando = input('Escreva o comando: ')
  mensagem = ""
  if( comando=="login" ):
    usuario = input('Escreva seu nickname: ')
    mensagem = "LOGIN " + usuario
    hb.isRunning = True
  elif( comando=="list" ):
    mensagem = "LIST"
  elif( comando=="logout" ):
    mensagem = "LOGOUT " + usuario
    hb.isRunning = False
  elif( comando=="quit" or comando=="exit"):
    break
  else:
    continue
  envia(mensagem, clientSocket)

hb.on = False
envia("CLOSE", clientSocket)
clientSocket.close()

