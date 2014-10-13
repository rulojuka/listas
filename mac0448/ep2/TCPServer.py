from socket import *
serverPort = 12000
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(1)
print "The server is ready."
while 1:
  connectionSocket, addr = serverSocket.accept()
  print "Aceitou mais uma conexao."
  message = connectionSocket.recv(1024)
  modifiedMessage = message.upper()
  connectionSocket.send(modifiedMessage)
  connectionSocket.close()
