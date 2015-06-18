;	ORG	$3a00
	ORG	$2A00
SOURCE_SOD

sod:
;          son DA    SR gain  blk No.   source name
;---------------------------------------------------
 db       000h,0ffh,0Ffh,0b8h,003h,000h; t_piano.so
 db       001h,0ffh,0f0h,0ffh,00Fh,000h; dist_w30.so
 db       002h,0FFh,0E0h,0b8h,009h,000h; moog_bas.so
 db       003h,0FFh,0ECh,0b8h,007h,000h; atomosph.so
; db       003h,0FFh,0E0h,0b8h,007h,0A8h; setchh.so
 db       004h,0FFh,0E0h,0b8h,007h,0A8h; rvbs1.so
 db       005h,0FFh,0E0h,0b8h,007h,0A8h; bdr.so
; db       006h,0FFh,0ECh,0b8h,007h,000h; atomosph.so
 db       006h,0FFh,0E0h,0b8h,00Fh,000h; pforgan.so
; db       002h,0FFh,0A8h,0b8h,00Fh,000h; dist_w30.so
; db       002h,0FFh,0F1h,0b8h,047h,000h; cym_w30.so
; db       003h,0FFh,0E0h,0b8h,007h,0A8h; setchh.so
; db       004h,0FFh,0E0h,0b8h,007h,0A8h; bdr.so
;; db       004h,0FFh,0E0h,0b8h,000h,0C3h; p3tom.so
; db       005h,0FFh,0E0h,0b8h,007h,0A8h; rvbs1.so
; db       006h,0FFh,0EDh,0b8h,009h,000h; moog_bas.so
; db       007h,0FFh,0ECh,0b8h,007h,000h; atomosph.so
; db       008h,0FFh,0E0h,0b8h,00Fh,000h; pforgan.so
; db       008h,0FFh,0EBh,0b8h,003h,000h; new_elec.so
; db       008h,0FFh,0F1h,0b8h,007h,000h; harpsi.so
; db       007h,0FFh,0EBh,0b8h,003h,000h; new_elec.so
; db       007h,0FFh,0E0h,0b8h,00Fh,000h; trum1.so
; db       007h,0FFh,0EDh,0b8h,01Eh,000h; gclass.so
;mncity50	8560	1179	D-10 Mid Night City (Romantic!)
; db       007h,0FFh,0EAh,0b8h,007h,000h; digi_vox.so
; db       007h,0FFh,0E0h,0b8h,00Fh,000h; bgstr50.so
; db       007h,0FFh,0E0h,0b8h,01Eh,000h; bgstr.so
; db       007h,0FFh,0EBh,0b8h,00Fh,000h; fm14l.so
; db       007h,0FFh,0F1h,0b8h,007h,000h; harpsi.so
; db       008h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
; db       009h,0FFh,0F1h,0b8h,003h,000h; t_piano.so
; db       00ah,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;10
; db       00bh,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;11
; db       00ch,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;12
; db       00dh,0FFh,0E0h,0b8h,007h,0A8h; bdr.so
; db       00eh,0FFh,0E0h,0b8h,007h,0A8h; rvbs1.so
; db       00fh,0FFh,0E0h,0b8h,003h,0D2h; doomt150.so
; db       010h,0FFh,0E0h,0b8h,001h,0EAh; cowb_75.so
; db       011h,0FFh,0E0h,0b8h,007h,0A8h; setchh.so
; db       012h,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;18
; db       013h,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;19
; db       014h,0FFh,0F1h,0b8h,003h,000h; t_piano.so ;20


;	ORG	$3C00
	ORG	$2C00
SOURCE_WAVE
	dw 	sample1,sample1+$d26
	dw	sample1,sample1+$d26 	;1
	dw	sample2,sample2+$2be	;2
	dw	sample3,sample3+$c4e	;3
      	dw	sample4,sample4+$0	;4
	dw	sample5,sample5+$0	;5
	dw	sample6,sample6+$264	;6
;	dw	sample7,sample7+$2BE	;7
;	dw	sample8,sample8+$C4E 	;8
;	dw	sample9,sample9+$264	;9
;;	dw	sample1,sample1+$489	;9
;;	dw	sample1,sample1+$489	;10
;;	dw	sample1,sample1+$489	;11
;;	dw	sample1,sample1+$489	;12
;;	dw	sample13,sample13+$0	;13
;;	dw	sample14,sample14+$0	;14
;;	dw	sample15,sample15+$0	;15
;	dw	sample16,sample16+$0	;16
;	dw	sample17,sample17+$0	;17
;	dw	sample1,sample1+$489	;18
;;	dw	sample1,sample1+$489	;19
;;	dw	sample1,sample1+$489	;20
;;	dw	sample1,sample1+$489	;20
;					;
;	ORG	$3C80
;
sample1
 	include dist_w30.asm
sample2
 	include moog_bas.asm
sample3
 	include atomosph.asm
sample4
	include rvbs1.asm
sample5
	INCLUDE BDR.ASM
sample6
	INCLUDE pforgan.asm
sample9
 	include setchh.asm
sample12
       include	fbass.asm ;synbass.asm
sample14
	include senseh88.asm ;fm08.asm ;fm02.asm ;sawstring.asm ;new_elec.asm ;fm01.asm ;mncity50.asm	;dist_w30.asm	;new_elec.asm	;dist_w30.asm
sample15
	include harpsi.asm
sample16
sample17
sample18
	include doomt150.asm
sample19       include	marimba.asm
sample20
 	include	clsd_h1.asm	  
sample21
