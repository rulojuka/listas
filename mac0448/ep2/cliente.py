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
while 1:
  message = raw_input('Input lowercase sentence:')
  clientSocket.send(message)
  modifiedMessage = clientSocket.recv(2048)
  print modifiedMessage
clientSocket.close()
