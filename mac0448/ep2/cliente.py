#!/usr/bin/python3

from socket import *
import threading
from threading import Thread
from time import sleep
import sys, ssl
lock = threading.Lock()

def envia(mensagem, sock):
  lock.acquire()
  sock.send( mensagem.encode('utf-8') )
  lock.release()
class Heartbeat(object):

  def __init__(self, sock, time):
    self.on = True
    self.beating = False
    self.delay = time
    self.sock = sock

  def beat(self):
    while self.on:
      if( self.beating ):
        envia("HB", self.sock)
        sleep(self.delay)

if( len(sys.argv)<=1 or len(sys.argv)>3):
  print( "Usage: ./servidor.py ip porta" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket = ssl.wrap_socket(clientSocket,
                           ca_certs="server.crt",
                           cert_reqs=ssl.CERT_REQUIRED)
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
    hb.beating = True
  elif( comando=="list" ):
    mensagem = "LIST"
  elif( comando=="logout" ):
    mensagem = "LOGOUT " + usuario
    hb.beating = False
  elif( comando=="quit" or comando=="exit"):
    break
  else:
    continue
  envia(mensagem, clientSocket)

hb.on = False
envia("CLOSE", clientSocket)
clientSocket.close()

