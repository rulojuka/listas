#!/usr/bin/python3

from socket import *
from threading import Thread
import threading
from time import sleep
from time import ctime
from time import time
import sys, select, ssl

class UserEntry(object):
  def __init__(self, nickname, sock, failed_heartbeats, chat_port, is_chatting):
    self.nickname = nickname
    self.socket = sock
    self.failed_heartbeats = failed_heartbeats
    self.chat_port = chat_port
    self.is_chatting = is_chatting
    self.login_time = int( time() )
    
  def refresh(self):
    self.failed_heartbeats = 0
  
  def one_more_fail(self):
    self.failed_heartbeats = self.failed_heartbeats + 1


class HeartbeatChecker(object):

  def __init__(self, time, max_failures):
    self.on = True
    log("Starting HeartbeatChecker thread...")
    self.delay = time
    self.max_failures = max_failures

  def check(self):
    while self.on:
      for entry in user_list:
        entry.one_more_fail()
        log("Checking %s: %d failures" % (entry.nickname, entry.failed_heartbeats))
        if(entry.failed_heartbeats > self.max_failures):
          msg = "User " + entry.nickname + " did not respond the heartbeat and has been disconnected."
          user_list.remove( entry )
          print (msg)
          log(msg)
      sleep(self.delay)
    log("Closing HeartbeatChecker thread...")
    
def send(msg, sock):
  sock.send( msg.encode('utf-8') )
  peer_name = sock.getpeername()
  log( "[TCP] Enviando para %s:%d : ---%s---" % (peer_name[0], peer_name[1], msg ))

def udp_send(msg, sock, ip, port):
  sock.sendto( msg.encode('utf-8') ,(ip,port))
  log( "[UDP] Enviando para %s:%d : ---%s---" % (ip, port, msg ))

def log(event):
  log_file = open('log.txt', 'a')
  log_line = ctime() + "\n\t\t" + event + "\n"
  #print (log_line)
  log_file.write(log_line)
  log_file.close()

global user_list
global udp_user_list
user_list = []
udp_user_list = []

def refresh_heartbeat(sock):
  for entry in user_list:
    if(entry.socket == sock):
      entry.refresh()
      peer_name = sock.getpeername()
      ip_port = peer_name[0] + ":" + str(peer_name[1])
      log("Refreshing heartbeat of " + entry.nickname + " (" + ip_port + ")")
      break
      
def close_connection(sock):
  #peer_name = sock.getpeername()
  #msg = "Closing connection with %s:%d" % (peer_name[0], peer_name[1])
  #print(msg)
  #log (msg)
  #sock.close()
  fd_list.remove(sock)

#MAIN
if( len(sys.argv)==1 or len(sys.argv)>2 ):
  print( "Usage: ./servidor.py porta")
  sys.exit(0)

serverPort = int(sys.argv[1])
fd_list = []
udp_fd_list = []

TAMANHO_FILA = 5
RECV_BUFFER = 2048

#Comeca a ouvir heartbeat
hb = HeartbeatChecker(1, 3)
t = threading.Thread(target = hb.check)
t.start()


serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(TAMANHO_FILA)
serverSocket = ssl.wrap_socket(serverSocket,
                             server_side=True,
                             certfile="server.crt",
                             keyfile="server.key")
                             
udp_serverSocket = socket(AF_INET, SOCK_DGRAM)
udp_serverSocket.bind(('', serverPort))

# Add server socket to the list of readable connections
fd_list.append(serverSocket)
fd_list.append(udp_serverSocket)
msg = "Chat server started on port " + str(serverPort)
print( msg )
log( msg )

try:
  while 1:
    # Get the list sockets which are ready to be read through select
    # Implementa multiplexacao
    read_sockets,write_sockets,error_sockets = select.select(fd_list,[],[])
    
    for sock in read_sockets:
      if(sock.type==2): #UDP
        data, addr = udp_serverSocket.recvfrom(RECV_BUFFER)
        data = data.decode('utf-8')
        log( "[UDP] Recebeu de %s:%d: ---%s---" % (addr[0], addr[1], data ))
        comando = data.split()[0]
        if( comando == "LOGIN" ):
          usuario = data.split()[1]
          print("Usuario --%s--"% usuario)
          chat_port = data.split()[2]
          new_entry = UserEntry(usuario,sock,0, chat_port, 0)
          found = False
          for entry in udp_user_list:
            if (entry.nickname == usuario):
              found = True
          if(found == False):
            udp_user_list.append( new_entry )
            udp_send("OK", sock, addr[0], addr[1])
          else:
            udp_send("NOK", sock, addr[0], addr[1])
          print(str(len(udp_user_list)) + " usuarios logados.")
        elif( comando == "LIST" ):
            mensagem=""
            for entry in udp_user_list:
              time_logged_in = int(time()) - entry.login_time
              linha = entry.nickname + " " + str(time_logged_in) + "\n"
              mensagem += linha
            if(len(udp_user_list) > 0):
              udp_send(mensagem,sock, addr[0], addr[1])
            else:
              udp_send("Ninguém online.",sock, addr[0], addr[1])
      else: #TCP
        #New connection
        mensagem = ""
        if sock == serverSocket:
          # Handle the case in which there is a new connection recieved through server_socket
          sockfd, addr = serverSocket.accept()
          fd_list.append(sockfd)
          msg = "Client (%s, %s) connected" % addr
          print( msg )
          log ( msg )

        #Some incoming message from a client
        else:
          data = sock.recv(RECV_BUFFER).decode('utf-8')
          if not data: #Fecha conexão
            close_connection(sock)
            continue
          peer_name = sock.getpeername()
          log( "[TCP] Recebeu de %s:%d: ---%s---" % (peer_name[0], peer_name[1], data ))
          comando = data.split()[0]
          if( comando == "LOGIN" ):
            usuario = data.split()[1]
            chat_port = data.split()[2]
            new_entry = UserEntry(usuario,sock,0, chat_port, 0)
            found = False
            for entry in user_list:
              if (entry.nickname == usuario):
                found = True
            if(found == False):
              user_list.append( new_entry )
              send("OK", sock)
            else:
              send("NOK", sock)
            print(str(len(user_list)) + " usuarios logados.")
          elif( comando == "LIST" ):
            for entry in user_list:
              time_logged_in = int(time()) - entry.login_time
              linha = entry.nickname + " " + str(time_logged_in) + "\n"
              mensagem += linha
            if(len(user_list) > 0):
              send(mensagem,sock)
            else:
              send("Ninguém online.",sock)
          elif( comando == "HB" ):
            refresh_heartbeat(sock)
          elif( comando == "LOGOUT" ):
            usuario = data.split()[1]
            for entry in user_list:
              if(entry.nickname == usuario):
                mensagem = "User " + str(usuario) + " logged out."
                print(msg)
                log (msg)
                user_list.remove( entry )
          elif( comando == "CHAT" ):
            usuario = data.split()[1]
            buddy = data.split()[2]
            log ("%s pediu para conectar-se com %s" %(usuario,buddy))
            find = 0
            for entry in user_list:
              if (entry.nickname == buddy):
                find = 1
            if (find == 0):
              send("NOK", sock)
            for entry in user_list:
                if (entry.nickname == buddy):
                  if (entry.is_chatting == 1):
                    send("NOK", sock)
                  else:
                    ip = entry.socket.getpeername()[0]
                    print (ip)
                    send("OK " + ip + " " + str(entry.chat_port), sock)
            
          
          
except (KeyboardInterrupt, SystemExit):
  print ('\nReceived keyboard interrupt, quitting program.')
  hb.on = False
  serverSocket.close()
