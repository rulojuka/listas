/*
 * Nome: Alessandro Wagner Palmeira
 * NUSP: 6850476
 * EP1 de MAC300 - Métodos Numéricos de Álgebra Linear
 * */

#include "tempo.h"
#include <sys/time.h>
#include <stddef.h>

unsigned long long tempo_em_microsegundos(){
  struct timeval tempo;
  unsigned long long resp = 0L;
  gettimeofday(&tempo, NULL);
  resp = (unsigned long long) (tempo.tv_sec * 1000000);
  resp += (unsigned long long) (tempo.tv_usec);
  return resp;
}