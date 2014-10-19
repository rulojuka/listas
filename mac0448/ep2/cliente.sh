#!/bin/bash

echo "Usage: ./cliente.py [tcp|udp] ip porta chat_port"

echo $1

if [ "$1" == "tcp" ]; then
  echo "entra no tcp"
  ./cliente_tcp.py $2 $3 $4
else
  echo "entra no udp"
  ./cliente_udp.py $2 $3 $4
fi
