from socket import *
serverName = 'localhost'
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))
message = raw_input('Input lowercase sentence:')
clientSocket.send(message)
modifiedMessage = clientSocket.recv(2048)
print modifiedMessage
clientSocket.close()
