Alessandro Wagner Palmeira
NUSP: 6850476
EP3_maior - MAC0337 - Computação Musical
Prof. Marcelo Queiroz

----------------------------------------

Devido à falta de tempo no final do semestre, só consegui implementar o patch
[simula_sala].

Vou descrever abaixo rapidamente o que cada sub-patch faz:

- atualiza_vetor.pd
  Funciona como o tabwrite, porém soma ao invés de sobrescrever

- calcula_coordenada.pd
  Calcula a coordenada de uma fonte virtual

- calcula_distancia_entre_vetores.pd

- calcula_indice_maximo.pd
  Calcula o índice máximo dentre todas as salas. Utilizado para fazer uma iteração
  em n^3 nas salas virtuais

- calcula_raio_inicial.pd
  Calcula o raio em metros equivalente à porção inicial da simulação

- checa_distancia.pd
  Verifica se uma certa fonte está dentro do raio inicial.

- for_inicial_final_incremento.pd
  Cria um for no estilo do C ( for(i=ini; i<=N; i+=inc) ) para percorrer os deltas.

- le_entrada_do_arquivo_texto.pd

- posicao_da_fonte_ijk.pd
  Calcula as coordenadas da fonte que está na sala ijk.

- sorteia_indice.pd
  Sorteia um t entre delta e delta+0.1 e converte esse valor para um indice.

- sorteia_n_vezes.pd
  Chama sorteia_indice e sorteia_paredes n vezes.

- sorteia_paredes.pd
  Sorteia o número de paredes atravessadas por um raio da porção tardia.


