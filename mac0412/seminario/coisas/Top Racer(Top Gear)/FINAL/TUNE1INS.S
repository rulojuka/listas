
	ORG	$3a00
SOURCE_SOD

 db       000h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       001h,0FFh,0E6h,0b8h,010h,000h; fbass.so
 db       002h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       003h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       004h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       005h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       006h,0FFh,0C0h,0b8h,007h,000h; senseh88.so
; db       006h,0FFh,0F1h,0b8h,007h,000h; harpsi.so
; db       006h,0FFh,0F0h,0b8h,007h,000h; ac_piano.so
; db       006h,0FFh,0E3h,0b8h,007h,000h; fm08.so
; db       006h,0FFh,0EBh,0b8h,007h,000h; fm07.so
; db       006h,0FFh,0F3h,0b8h,00Fh,000h; fm06.so
; db       006h,0FFh,0F2h,0b8h,00Fh,000h; fm02.so
; db       006h,0F5h,0E7h,0b8h,003h,000h; sawstrin.so
; db       006h,0FFh,0EBh,0b8h,003h,000h; new_elec.so
; db       006h,0FFh,0E7h,0b8h,007h,000h; fm01.so
 db       007h,0FFh,0F1h,0b8h,007h,000h; harpsi.so
 db       008h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       009h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
 db       00ah,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;10
 db       00bh,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;11
 db       00ch,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;12
 db       00dh,0FFh,0E0h,0b8h,007h,0A8h; bdr.so
 db       00eh,0FFh,0E0h,0b8h,007h,0A8h; rvbs1.so
 db       00fh,0FFh,0E0h,0b8h,003h,0D2h; doomt150.so
; db       010h,0FFh,0E0h,0b8h,001h,0EAh; cowb_75.so
; db       011h,0FFh,0E0h,0b8h,007h,0A8h; setchh.so
; db       012h,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;18
; db       013h,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;19
; db       014h,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;20


	ORG	$3C00
SOURCE_WAVE
	dw	sample1,sample1+$489 	;0
	dw	sample2,sample2+$a2 ;90	;1
	dw	sample1,sample1+$489	;3
     ;	dw	sample3,sample3+$d26	;2
	dw	sample1,sample1+$489	;3
	dw	sample1,sample1+$489	;4
	dw	sample1,sample1+$489	;5
	dw	sample6,sample6+$83a 	;6
	dw	sample7,sample7+$1b	;7
	dw	sample1,sample1+$489	;8
	dw	sample1,sample1+$489	;9
	dw	sample1,sample1+$489	;10
	dw	sample1,sample1+$489	;11
	dw	sample1,sample1+$489	;12
	dw	sample13,sample13+$0	;13
	dw	sample14,sample14+$0	;14
	dw	sample15,sample15+$0	;15
	dw	sample16,sample16+$0	;16
	dw	sample17,sample17+$0	;17
	dw	sample1,sample1+$489	;18
;	dw	sample1,sample1+$489	;19
;	dw	sample1,sample1+$489	;20
;	dw	sample1,sample1+$489	;20
					;
	ORG	$3C80

sample1
sample2
       include	fbass.asm ;synbass.asm
;sample5
 ;	include	dist_w30.asm
sample6
	include senseh88.asm ;fm08.asm ;fm02.asm ;sawstring.asm ;new_elec.asm ;fm01.asm ;mncity50.asm	;dist_w30.asm	;new_elec.asm	;dist_w30.asm
sample7
	include harpsi.asm
sample13
	include bdr.asm
sample14
	include rvbs1.asm
sample15
	include doomt150.asm
sample16
 ;	include cowb_75.asm
sample17
 ;	include setchh.asm
