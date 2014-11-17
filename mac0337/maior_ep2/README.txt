Todos os patches descritos na parte 1 do enunciado, com exceção da
  FMtresportadoras~.pd foram implementados.

Além disso, outros patches auxiliares foram adicionados. eles são os seguintes:

- ARlinear~.pd: Auxiliar para criar o ARtambor~.pd
- calcula_indice~.pd: Auxiliar para calcular o envelope de índice para o bloco
  de madeira
- FMdinamica_antiga~.pd: FMdinamica conceitualmente errada que eu estava utilizando
  antes de entender exatamente o funcionamento da mesma. Deixei ela aqui pois os
  sons criados são bastante próximos dos reais. Para utilizá-la, salve um backup
  da FMdinamica~.pd e renomeie a FMdinamica_antiga~.pd para FMdinamica~.pd
- inverte.pd: Subpatch auxiliar para calcular a inversa da função phi(a)

Instrumentos:
- toca_orgao.pd: Recebe mensagens do tipo (Frequencia, duração) e toca uma nota
  equivalente, com detune 0.

Peça:
  Por falta de tempo, apenas uma demonstração de utilização do patch toca_orgao
  foi implementado. A minha idéia inicial era tocar a Toccata e Fuga em Dm de
  Johann Sebastian Bach a partir do arquivo MIDI que está no arquivo tar.gz
