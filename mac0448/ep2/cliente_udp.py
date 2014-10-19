#!/usr/bin/python3

from socket import *
import threading
from threading import Thread
from time import sleep
import sys, ssl

RECV_BUFFER = 2048

global writer
chatting = False

if( len(sys.argv)<=1 or len(sys.argv)>4):
  print( "Usage: ./servidor.py ip porta chat_port" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])
chatPort =  int(sys.argv[3])

clientSocket = socket(AF_INET, SOCK_DGRAM)

class ListenerSocket(object):

  def __init__(self):
    self.on = True
    self.listen_socket = socket(AF_INET, SOCK_DGRAM)
    self.listen_socket.bind (('', chatPort))

  def listen(self):
    global chatting
    global writer
    while self.on:
      data, addr = self.listen_socket.recvfrom(RECV_BUFFER)
      data = data.decode('utf-8')
      if (len(data) == 0):
        continue
      elif (data.split()[0] == "CONN"):
        print("ENTROU AQUI!!")
        buddyip = data.split()[1]
        buddyport = (int)(data.split()[2])
        chatting = True
        writer = UDPWriter(buddyip,buddyport)
      elif (data.split()[0] == "FILE"):
          file_path = data.split()[1]
          writer.send("SENDING %s" % file_path)
          print("Enviando arquivo --%s--"% file_path)
          writer.send_file( file_path )
          sleep(0.1)
          writer.send("SENT %s" % file_path)
          continue
      elif (data.split()[0] == "SENDING"):
          print ("Comecou a receber arquivo.")
          arq = open(data.split()[1], 'wb')
          while 1:
            data, addr = self.listen_socket.recvfrom(RECV_BUFFER)
            print("data eh --%s--" % data)
            lista_split = data.split()
            if( len(lista_split)>0 and lista_split[0] == b"SENT"):
              break
            if( not data or len(lista_split)==0 or lista_split[0] == "SENT"):
              break
            arq.write(data)
          arq.close()
          print ("Recebeu arquivo inteiro.")
          continue  
      else:
        print("Chegou mensagem")
        print (data)
       
#Comeca listener
lskt = ListenerSocket()
t2 = threading.Thread(target = lskt.listen)
t2.start()

def envia_udp(message, socket):
  socket.sendto( message.encode('utf-8') ,(serverName,serverPort))
  
class UDPWriter(object):

  def __init__(self,buddy_ip,buddy_port):
    self.ip = buddy_ip
    self.port = buddy_port
    self.socket = socket(AF_INET, SOCK_DGRAM)

  def send(self,message):
    self.socket.sendto( message.encode('utf-8') ,(self.ip,self.port))
    
  def send_file(self, file_path):
    arq = open(file_path, 'rb')
    for line in arq.readlines():
      self.socket.sendto( line ,(self.ip,self.port))
    arq.close()
    print("Terminou de enviar o arquivo.")

try:
  while 1:
    comando = input('Escreva a mensagem: ')
    mensagem = ""
    global writer
    if (chatting):
      if(comando.split()[0] == "FILE"):
        writer.send(comando)
      else:
        writer.send(comando)
    else:
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
      elif( comando == "chat"):
          buddy = input('Escreva o nick do usuario com quem deseja conversar: ')
          envia_udp("CHAT " + usuario + " " + buddy, clientSocket)
          data,addr = clientSocket.recvfrom(RECV_BUFFER)
          data = data.decode('utf-8')
          print (data)
          if data.split()[0] == "NOK":
            print("Failed: Cannot start chat")
            continue
          else:
            print("You started a connection with %s" %buddy)
            buddyip = data.split()[1]
            buddyport = (int)(data.split()[2])
            chatting = True
            writer = UDPWriter(buddyip,buddyport)
          #  myip = clientSocket.getpeername()[0]
          #  writer.send("CONN "+ myip + " " + str(chatPort) + " " + usuario)       
except (KeyboardInterrupt, SystemExit):
  print ('\nReceived keyboard interrupt, quitting program.')
