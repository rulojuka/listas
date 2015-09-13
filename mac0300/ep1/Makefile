CC = gcc
CFLAGS = -Wall -ansi -lm

I_DIR = include

OBJS = definido_positivo.o io.o constantes.o sistemas_gerais.o auxiliar.o tempo.o testa_cholesky.o testa_lu.o

all: ep1.c $(OBJS)
	$(CC) -o ep1 ep1.c $(OBJS) $(CFLAGS)

gera_entrada: gen/genmatsim_gera_direto.cpp
	g++ -o gen/genmatsim_gera_direto gen/genmatsim_gera_direto.cpp $(CFLAGS)
	./gen/gera_entrada.sh

%.o: $(I_DIR)/%.c $(I_DIR)/%.h
	$(CC) -c $< $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o *~ include/*~ ep1 gen/genmatsim_gera_direto
