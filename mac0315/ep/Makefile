CC = g++-4.6
CFLAGS = -Wall -ansi -pedantic

I_DIR = include

OBJS = estruturas.o entrada.o algoritmos.o simplex.o

all: simplex_redes.cpp $(OBJS)
	$(CC) -o simplex_redes simplex_redes.cpp $(OBJS) $(CFLAGS)

%.o: $(I_DIR)/%.cpp $(I_DIR)/%.h
	$(CC) -c $< $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o *~ include/*~
