#!/usr/bin/python3

from socket import *
import threading
from threading import Thread
from time import sleep
import sys, ssl


if( len(sys.argv)<=1 or len(sys.argv)>4):
  print( "Usage: ./servidor.py ip porta" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])

clientSocket = socket(AF_INET, SOCK_DGRAM)

def envia_udp(message, socket):
  socket.sendto( message.encode('utf-8') ,(serverName,serverPort))
  
envia_udp("Testando", clientSocket)
print("terminou")


