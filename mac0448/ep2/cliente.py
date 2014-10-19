#!/usr/bin/python3

from socket import *
import threading
from threading import Thread
from time import sleep
import sys, ssl
lock = threading.Lock()

RECV_BUFFER = 2024

global writer
chatting = False

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
        
class ListenerSocket(object):

  def __init__(self):
    self.on = True

  def listen(self):
    global chatting
    global writer
    while self.on:
      chatfd, chataddr = listener.accept()
      print (chataddr)
      while 1:
        data = chatfd.recv(RECV_BUFFER).decode('utf-8')
        if (len(data) == 0):
          continue
        if (data.split()[0] == "CONN"): 
          chatting = True
          buddyip = data.split()[1]
          buddyport = (int)(data.split()[2])
          buddy = data.split()[3]
          writer = TCPWriter(buddyip,buddyport)
          writer.connect()
          print("You are connected to %s."% buddy)
          print(chatting)
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
            data = chatfd.recv(RECV_BUFFER)
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
        elif (data.split()[0] == "DISCONNECT"):
          writer.disconnect()
          break
        else:
          print (data)
          
          
class TCPWriter(object):

  def __init__(self,buddy_ip,buddy_port):
    self.ip = buddy_ip
    self.port = buddy_port
    self.socket = socket(AF_INET, SOCK_STREAM)
    
  def connect(self):
    global chatting
    self.socket.connect((self.ip, self.port))
    chatting = True
   
  def disconnect(self):
    global chatting
    print("Seu chat foi encerrado.")
    self.socket.close()
    chatting = False

  def send(self,message):
    envia(message, self.socket)
    
  def send_file(self, file_path):
    arq = open(file_path, 'rb')
    for line in arq.readlines():
      lock.acquire()
      self.socket.send( line )
      lock.release()
    arq.close()
    print("Terminou de enviar o arquivo.")

      
if( len(sys.argv)<=1 or len(sys.argv)>4):
  print( "Usage: ./servidor.py ip porta chat_port" )
  sys.exit(0)

serverName = sys.argv[1]
serverPort = int(sys.argv[2])
chatPort =  int(sys.argv[3])

clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket = ssl.wrap_socket(clientSocket,		
                           ca_certs="server.crt",
                           cert_reqs=ssl.CERT_REQUIRED)
clientSocket.connect((serverName,serverPort))

listener = socket(AF_INET, SOCK_STREAM)
listener.bind(('', chatPort))
listener.listen(5)

sender = socket(AF_INET, SOCK_STREAM)

#Comeca heartbeat
hb = Heartbeat(clientSocket, 1)
t = threading.Thread(target = hb.beat)
t.start()

#Comeca listener
lskt = ListenerSocket()
t2 = threading.Thread(target = lskt.listen)
t2.start()


usuario = "anonymous"
try:
  while 1:
    comando = input('Escreva a mensagem: ')
    if (chatting):
      if(comando.split()[0] == "FILE"):
        writer.send(comando)
      elif(comando.split()[0] == "DISCONNECT"):
        writer.send(comando)
        writer.disconnect()
      else:
        writer.send(comando)
    else:
      mensagem = ""
      if( comando=="login" ):
        usuario = input('Escreva seu nickname: ')
        mensagem = "LOGIN " + usuario + " " + str(chatPort)
        envia(mensagem, clientSocket)
        data = clientSocket.recv(2048).decode('utf-8')
        if (data.split()[0] == "OK"):
          print("Login feito com sucesso")
        else:
          print("Login falhou")
          usuario = "anonymous"
          continue        
        hb.beating = True
      elif( comando=="list" ):
        mensagem = "LIST"
        envia(mensagem, clientSocket)
        data = clientSocket.recv(2048).decode('utf-8')
        words = data.split('\n')
        print("Lista de usuários:")
        for word in words:
          print (word)
      elif( comando=="logout" ):
        mensagem = "LOGOUT " + usuario
        envia(mensagem, clientSocket)
        hb.beating = False
      elif( comando=="quit" or comando=="exit"):
        hb.on = False
        envia("CLOSE", clientSocket)
        break
      elif( comando == "chat"):
        buddy = input('Escreva o nick do usuario com quem deseja conversar: ')
        envia("CHAT " + usuario + " " + buddy, clientSocket)
        data = clientSocket.recv(2048).decode('utf-8')
        print (data)
        if data.split()[0] == "NOK":
          print("Failed: Cannot start chat")
          continue
        else:
          print("You started a connection with %s" %buddy)
          buddyip = data.split()[1]
          buddyport = (int)(data.split()[2])
          print (buddyip)
          print (buddyport)
          chatting = True
          writer = TCPWriter(buddyip,buddyport)
          writer.connect()
          myip = clientSocket.getpeername()[0]
          writer.send("CONN "+ myip + " " + str(chatPort) + " " + usuario)
except (KeyboardInterrupt, SystemExit):
  print ('\nReceived keyboard interrupt, quitting program.')
  hb.on = False
  clientSocket.close()

hb.on = False
clientSocket.close()

