CC = gcc
CFLAGS = -Wall -ansi -pedantic -lm

I_DIR = include

OBJS = definido_positivo.o io.o constantes.o

all: ep1.c $(OBJS)
	$(CC) -o ep1 ep1.c $(OBJS) $(CFLAGS)

%.o: $(I_DIR)/%.c $(I_DIR)/%.h
	$(CC) -c $< $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o *~ include/*~ ep1
