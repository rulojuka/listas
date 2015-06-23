00 {INN} 60 ; Le o numero e armazena na posiçao 60
01 {LDA} 60 ; Coloca o valor da posiçao e joga no acumulador
02 {JLE} 71 ; se o numero for <= 0 joga pra 71
03 {SUB} 61 ; subtrai 10
04 {JGT} 71 ; se for >10 vai pro 71
05 {ADD} 61 ; k esta no acumulador
06 {STA} 63 ; copia de k no 63
07 {INN} 70 ; entrada
08 {LDA} 70 ; joga pro acc
09 {SUB} 65 ; subtrai com o menor valor 
10 {JGE} 13 ; se for maior que o menor valor
11 {LDA} 70 ; joga a entrada pro acc
12 {STA} 65 ; guarda no menor valor 
13 {LDA} 70 ; carrega entrada
14 {SUB} 64 ; subtrai do menor valor
15 {JLE} 18 ; se for menor que o maior valor pula pro 18
16 {LDA} 70 
17 {STA} 64 
18 {LDA} 70
19 {ADD} 66 ; soma
20 {STA} 66 ; colocamos na memoria de novo
21 {LDA} 63 ; carregamos k
22 {SUB} 67 ; decrementamos
23 {STA} 67 ; guardamos k
24 {JGT} 07 ; se k for maior que 0 volta pra 07
25 {LDA} 66 ; carregamos a soma
26 {DIV} 60 ; dividimos por k
27 {STA} 66 ; guardamos a media
28 {PRN} 64 
29 {PRN} 65 
30 {PRN} 66 
31 {STP} 00 ; terminou o codigo
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
61 +0010
;
;
64 -9999
65 +9999
66 +0000
67 +0001	
