CC = gcc
CFLAGS=-Wall -ansi

all: cria-resultado

run: cria-resultado
	./results/cria-resultado results/io/*.txt

cria-resultado: results/cria-resultado.c
	cc $(CFLAGS) results/cria-resultado.c -o results/cria-resultado

clean:
	rm -f results/cria-resultado
	rm -f results/io/*.out
