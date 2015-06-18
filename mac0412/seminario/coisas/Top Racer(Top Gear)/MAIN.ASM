
;;----------------------------------------------------------------
;;                    SOUND DRIVER ROUTINE 
;;----------------------------------------------------------------

;
START
	CLRP			; clear direct page flag

	MOV	X,#$CF		; stack pointer
	MOV	SP,X		;

	MOV	A,#$00		; clear RAM 000h-0EFh
	MOV	X,A
_STC10
	MOV	(X)+,A
	CMP	X,#$EF+1
	BNE	_STC10

	MOV	X,A		; work ram clear 100h-7ffh
_STC20
	MOV	!$100+X,A
	MOV	!$200+X,A
	MOV	!$300+X,A
	MOV	!$400+X,A
	MOV	!$500+X,A
	MOV	!$600+X,A
	MOV	!$700+X,A
	INC	X
	BNE	_STC20

	INC	A		; A=1
	CALL	ESASET		; EDL & ESA (ECHO) set
	SET1	FLGS.5		; echo off

	MOV	A,#$60
	MOV	Y,#MVOLL	; volume left
	CALL	APUS
	MOV	Y,#MVOLR	; volume right
	CALL	APUS

	MOV	A,#>SOURCE_WAVE
	MOV	Y,#DIR		; source directory
	CALL	APUS		; 19 byte

	MOV	A,#$90		; mov	a,#0f0h  ; inputport reset
	MOV	!CONT,A		; timer stop
	MOV	A,#$010		; 2ms (125us * 16) set
	MOV	!TMSET,A	; timer data set
	MOV	TMP,A
	MOV	A,#$081		; timer start
	MOV	!CONT,A

MAINLOOP			; 2mS
	; ------- echo parameter set -------
	MOV	Y,#010		; 10 data set
_STT24
	CMP	Y,#005
	BEQ	_STT25
	BCS	_STT26

	CMP	EKIN,ECLR	; echo clear chu ?
	BNE	_STT28		; EON EFB EVOR EVOL
_STT25
	BBS	EKIN.7,_STT28	; echo kinshi chu ? (FLG)
_STT26
	MOV	A,!DSETA-1+Y
	MOV	!APUADD,A	; write address
	MOV	A,!DSETD-1+Y
	MOV	X,A
	MOV	A,(X)
	MOV	!APUDT,A	; data write
_STT28
	DBNZ	Y,_STT24	; 18 byte

	MOV	KEYONS,Y	; 0 clear
	MOV	KEYOFFS,Y	; 0 clear

	; ------- randam calculate -------
	MOV	A,RDM		; random keisan
	EOR	A,RDM+1
	LSR	A
	LSR	A
	NOTC			; d1 check
	ROR	RDM		; random 1 set
	ROR	RDM+1		; randam 2 set

START40
	MOV	Y,!TMDT		; timer read
	BEQ	START40

;--------------- 2mS goto
	PUSH	Y

	MOV	A,#$020		; 8 count (2ms * 8 = 16ms)
	MUL	YA
	CLRC
	ADC	A,CNT
	MOV	CNT,A
	BCC	START50
;--------------- 16ms     *  sound effects
;CALL EFFECT
	CMP	EKIN,ECLR	;
	BEQ	START50
	INC	EKIN
;---------------

START50
	POP	Y		; timer count

	MOV	A,TMP		; tmp = 20h(normal)
	MUL	YA
	CLRC
	ADC	A,TMPD		; tempo counter up
	MOV	TMPD,A
	BCC	START60

	CALL	!CHA		; music routine 
	MOV	X,#000		; fl0 & port0 check
	CALL	!FLSET		; x = fl?
MAINLOOP_GO
	BRA	MAINLOOP

START60
	MOV	A,SF0
	BEQ	MAINLOOP_GO

	MOV	X,#000		; hokan routin (8 ch.)
	MOV	KEYD,#$001	; key data set
_STT62
	MOV	A,ADD+1+X
	BEQ	_STT64		; kami = 0
	CALL	!TRRY		; pan move & sweep & vib check
_STT64
	INC	X
	INC	X
	ASL	KEYD		;
	BNE	_STT62		; channel end ? (8ch)
	BRA	MAINLOOP_GO


DSETA	;	$2C  ,$3C  ,$0D,$4D,$6C,$4C,$5C,$3D,$2D ,$5C
	DB	EVOLL,EVOLR,EFB,EON,FLG,KON,KOF,NON,PMON,KOF
DSETD		;1    2    3    4    5    6      7   8    9    10
	DB	EVOL,EVOR,EFBS,EONS,FLGS,KEYONS,T00,NONS,MONS,KEYOFFS

;------------------------------------------------

FLSET
	MOV	A,SF0+X		; flag set flx
	MOV	!PORT0+X,A	; flag return
_FL02
	MOV	A,!PORT0+X	; flag read
	CMP	A,!PORT0+X	; 2 kai check
	BNE	_FL02		;
	MOV	FL0+X,A		; new data
	RET




;------------------------------------------------
;		Freq. data set
;------------------------------------------------
DSSR
	RET
DSS
	CMP	Y,#DD0		; drams check
	BCC	_DSS0
	;------	 drams set [x=channel  a=sno] -----
	CALL	!SNOSET		; sno data set
	MOV	Y,#C3		; (takasa)
_DSS0
	CMP	Y,#XXX		; tai or yyy ?
	BCS	DSSR

	MOV	A,FKIN		; kinshi flag check
	AND	A,KEYD
	BNE	DSSR

	MOV	A,Y
	AND	A,#$07F		; fre. set & flag set
	CLRC			; key trans. add.
	ADC	A,KTPS
	CLRC
	ADC	A,!PTPS+X
	MOV	!SWPD+X,A	; ontei store

	MOV	A,!TUND+X
	MOV	!SWPDW+X,A	; sweep shosuten ika

	MOV	A,!VIBCS+X	;
	LSR	A
	MOV	A,#000
	ROR	A
	MOV	!VIBC+X,A	; count data (00h or 80h)

	MOV	A,#000
	MOV	VIBHC+X,A	; vib hold
	MOV	!VIBCC+X,A	; vib change
	MOV	!TREC+X,A	; tre count = 0
	MOV	TREHC+X,A	; tre hold

	OR	VOLS,KEYD	; vol set flag
	OR	KEYONS,KEYD	; keyon

	MOV	A,!SWSC+X	; sweep check
	MOV	SWPC+X,A	; sweep (counter)
	BEQ	_DSS6		; not sweep

	MOV	A,!SWSHC+X
	MOV	SWPHC+X,A	; sweep (hold)

	MOV	A,!SWSK+X	; sws or swk ?
	BNE	_DSS3

	MOV	A,!SWPD+X	; (sws)
	SETC			;
	SBC	A,!SWSS+X	;
	MOV	!SWPD+X,A	;
_DSS3
	MOV	A,!SWSS+X	; + ? (swk)
	CLRC
	ADC	A,!SWPD+X	; now + @

	CALL	!SWPADSET	; sweep data set
_DSS6
	CALL	!SWPDSET	; kkk sss <-- swpd swpdw

;------------------------------------------------
;      fre. data set  kkk & sss  x=channel  bls set

DSSX
	MOV	Y,#000		; S curve hosei
	MOV	A,KKK
	SETC
	SBC	A,#052		; e40 = 52
	BCS	_DSX04		; e40 ijo add

	MOV	A,KKK
	SETC
	SBC	A,#019		; g10 = 19
	BCS	_DSX10		; g10 ijyo

	DEC	Y		; y = 0ffh
	ASL	A
_DSX04
	ADDW	YA,SSS
	MOVW	SSS,YA
_DSX10			; ## ADX CALC [ontei store (kkk,sss)]
	PUSH	X
	MOV	A,KKK
	ASL	A
	MOV	Y,#000
	MOV	X,#024
	DIV	YA,X		; ya/x = a ... y
	MOV	X,A		; x = oct.

	MOV	A,!GFD+1+Y	; high
	MOV	ADX+1,A
	MOV	A,!GFD+Y	; low
	MOV	ADX,A

	MOV	A,!GFD+3+Y	; high
	PUSH	A
	MOV	A,!GFD+2+Y	; low
	POP	Y
	SUBW	YA,ADX		; ya - adx

	MOV	Y,SSS
	MUL	YA		; shimo x 0.???
	MOV	A,Y
	MOV	Y,#000
	ADDW	YA,ADX
	MOV	ADX+1,Y
	ASL	A
	ROL	ADX+1
	MOV	ADX,A
	BRA	_DSX14
_DSX12
	LSR	ADX+1
	ROR	A
	INC	X
_DSX14
	CMP	X,#006		; x = oct.
	BNE	_DSX12
	MOV	ADX,A
	POP	X
			; ## FREQ store  (ADX * BLS)
	MOV	A,!BLS+X	; 0. block su
	MOV	Y,ADX+1		; fre.(high)
	MUL	YA		;
	MOVW	ADX+2,YA	;
	MOV	A,!BLS+X	; 0. block su
	MOV	Y,ADX		; fre.(low)
	MUL	YA		;
	PUSH	Y		; --> low
	MOV	A,!BLS+1+X	; block su
	MOV	Y,ADX		; fre.(low)
	MUL	YA		;
	ADDW	YA,ADX+2
	MOVW	ADX+2,YA	;
	MOV	A,!BLS+1+X	; block su
	MOV	Y,ADX+1		; fre.(high)
	MUL	YA
	MOV	Y,A
	POP	A		; <-- low
	ADDW	YA,ADX+2
	MOVW	ADX+2,YA	; freq. set

	MOV	A,X		; apuch
	XCN	A
	LSR	A
	OR	A,#PL1		; pl1 = 2
	MOV	Y,A		; write address

	MOV	A,ADX+2		; shimo
	CALL	!APUSX		; a=data  y=address
	INC	Y
	MOV	A,ADX+3		; kami

;------------------------------------------------
;      APU data out   acc = write data   y = write add

APUSX
	PUSH	A
	MOV	A,KEYD
	AND	A,FKIN		; kinshi flag check
	POP	A
	BNE	APUSR
APUS
	MOV	!APUADD,Y	; write address
	MOV	!APUDT,A	; data write
APUSR
	RET

;---------------------------------------------
GFD
;dw	0066,0070,0075,0079,0084,0089,0094,0100,0106,0112,0119,0126  ; c00
;dw	0133,0141,0150,0159,0168,0178,0189,0200,0212,0225,0238,0252  ; c10
;dw	0267,0283,0300,0318,0337,0357,0378,0401,0425,0450,0477,0505  ; c20
;dw	0535,0567,0601,0637,0675,0715,0757,0802,0850,0901,0954,1011  ; c30
;dw	1071,1135,1202,1274,1350,1430,1515,1605,1701,1802,1909,2022  ; c40
	;	c00  c01  d00  d01  e00  f00  f01  g00  g01  a00  a01  b00  1.0594631
  ;	DW	2117,2243,2376,2517,2667,2826,2994,3172,3316,3516,3772,3996
  	DW	2143,2270,2405,2548,2700,2860,3030,3211,3402,3604,3818,4045  ; c50
  	DW	4286
;4541,4811,5097,5400,5721,6061,6422,6804,7208,7637,8091  ; c60
; 3=e60 , 4=b50 , 5=g50 , 6=e50 , 7=c51 , 8=b40 , 9=a40 , 10=g40
;--------------------------------------------- 	1.05946317.6560747 = 07.a8h


;---------------------------------------------

ADSET
	MOV	Y,#000		; block address set
	MOV	A,[ADS]+Y
	INCW	ADS
	PUSH	A		; shimo
	MOV	A,[ADS]+Y
	INCW	ADS
	MOV	Y,A		; kami
	POP	A
	RET


;---------------------------------------------

KS00		; \\\\\ music first initialize
	MOV	SF0,A		; fl0 --> sf0
	ASL	A
	beq	ks04		; 000h = end

	MOV	X,A		; shoki data set
	MOV	A,!GFT-2+1+X	; block add. shoki set
	MOV	Y,A
	MOV	A,!GFT-2+X
	MOVW	ADS,YA
	MOV	SF0C,#002	; count
KS04
	MOV	A,FKIN		; key off
	EOR	A,#0FFH
	TSET1	!KEYOFFS	; keyoff set
	RET

KS10		; \\\\\ music second initialize
	MOV	X,#014		; shoki data set
	MOV	KEYD,#080H
_LOOP
	MOV	A,#0FFH
	MOV	!PVOD+X,A	; part vol

	MOV	A,#010		; pan data set
	CALL	!PANX		; pand & panf  set    (a=0)

	MOV	!SNOS+X,A	; sound number
	MOV	!TUND+X,A	; tun shoki set
	MOV	!PTPS+X,A	; part tran. set
	MOV	!SWSC+X,A	; sweep count
	MOV	VIBD+X,A	; vib depth
	MOV	TRED+X,A	; tre depth

	DEC	X
	DEC	X		; - 2
	LSR	KEYD
	BNE	_LOOP

	MOV	MVOC,A		; mvol count (a=0)
	MOV	EVOC,A		; evol count
	MOV	TMPC,A		; tempo count set
	MOV	KTPS,A		; key trans. set
	MOV	BLC,A		; block count
	MOV	WAVS,A		; source

	MOV	MVO,#0C0H	; main volume set
	MOV	TMP,#020H	; tempo data set
CHAR
	RET

;------------------------------------------------
;		music enso routin
;------------------------------------------------

CHA
	MOV	Y,FL0S
	MOV	A,FL0		;
	MOV	FL0S,A
	CMP	Y,FL0		; y = fl0s
	BNE	KS00		; [1]first initial
	MOV	A,SF0		; play chu ?
	BEQ	CHAR		; -> ret
	MOV	A,SF0C		;
	BEQ	TXH		; [4-] playing
	DBNZ	SF0C,KS10	; [2]  second intial
				; [3]  third initial 
KS20		; \\\\\ music third initialize
	CALL	!ADSET		; block address set (Z=kami)
	BNE	KS40		; kami	= 0 ?
	MOV	Y,A		; shimo = 0 ?
	BEQ	KS00		; music end ?
KS24
	DEC	BLC
	BPL	KS26
	MOV	BLC,A		; blc=0 or 129 ijo
KS26
	CALL	!ADSET		; kurikaeshi ?
	MOV	X,BLC		; blc = 0 ?
	BEQ	KS20		;
	MOVW	ADS,YA		; kurikaeshi ads set
	BRA	KS20

KS40
	MOVW	ADX+2,YA	; adx+2,+3 set
	MOV	Y,#015		; shoki address set (8ch)
_LLP
	MOV	A,[ADX+2]+Y	; part sento add. set
	MOV	!ADD+Y,A	; add.
	DEC	Y
	BPL	_LLP

	MOV	X,#000		; shoki data set
	MOV	KEYD,#001H
_LOOP
	MOV	A,ADD+1+X
	BEQ	_SKIP
	MOV	A,!SNOS+X
	BNE	_SKIP
	MOV	A,#000
	CALL	!SNOSET		; sno data set
_SKIP
	MOV	A,#000
	MOV	PTC+X,A		; pt  count = 0
	MOV	PVOC+X,A	; vol move count
	MOV	PANC+X,A	; pan move count
	INC	A
	MOV	NGC+X,A		; Nagasa count set (ngo)
	INC	X
	INC	X		; + 2
	ASL	KEYD
	BNE	_LOOP

		; \\\\\ MUSIC PLAY MAIN ROUTINE
TXH
	MOV	X,#000		; channel count
	MOV	VOLS,X		; vols reset
	MOV	KEYD,#001H	; key data set
TX00
	MOV	CHN,X		; now channel (0,2,4,6,8,10,12,14) store
	MOV	A,ADD+1+X
	BEQ	TX60		; kami = 0 (no use channel)

	DEC	NGC+X		; timer dec
	BNE	TX20		; not data read timing 
TX10
	CALL	!DATA_IN	; data in & inc add
	BNE	TX15		; block end ?

	MOV	A,PTC+X		; pattern chu ?
	BEQ	KS20		; -> end
	CALL	!ADDSET		; pattern start add set
	DEC	PTC+X		; pattern end ?
	BNE	TX10		; pattern repeat
	MOV	A,!ADT+X	; add restore (pattern end)
	MOV	ADD+X,A
	MOV	A,!ADT+1+X
	MOV	ADD+1+X,A
	BRA	TX10		;
TX15
	BMI	TX16		; d7 = 1 ?
			; \\\ [$00-$7F]
	MOV	!NGS+X,A	; Nagasa Store
	CALL	!DATA_IN	; data in & inc add
	BMI	TX16		; d7 = 1 ?

	PUSH	A		; % & vol
	XCN	A		; (kami)
	AND	A,#007H
	MOV	Y,A
	MOV	A,!GATE+Y	; Gate off (%) table data get
	MOV	!NGG+X,A	; gate time(%)[0-255] set
	POP	A		; (shimo)
	AND	A,#00FH
	MOV	Y,A
	MOV	A,!VOLT+Y	; volume table data get
	MOV	!VOL+X,A	; volume[0-255] set

	;CALL	!DATA_IN	; data in & inc add
	BRA	TX10		; 91/05/07

TX16
	CMP	A,#SNO		; special flag ?
	BCC	TX17
			; \\\ [SNO-$FF]
	CALL	!SPFX		; special flag
	BRA	TX10
TX17			; \\\ [$80-SNO]
	CALL	!DSS		; freq. data set

TX18
	MOV	A,!NGS+X	
	MOV	NGC+X,A		; nagasa counter set
	MOV	Y,A

	MOV	A,!NGG+X	; Gate off (step) set
	MUL	YA
	MOV	A,Y
	BNE	TX19
	INC	A		; a = 1 (minimam case)
TX19
	MOV	NGO+X,A
	BRA	TX40

TX20
TX22
	CALL	!KEYCH		; keyoff & sweep & vib check
TX40
	CALL	!SWPCH		; sweep check (next data)
TX60
	INC	X		; channel up (0,2,4,6,8,10,12,14) 
	INC	X		;
	ASL	KEYD		;
	BNE	TX00		; channel end ? (8ch)


;------------------------------------------------
;	tempo move  tmp mvol pan move keisan & gain set
;------------------------------------------------
TMPY
	MOV	A,TMPC		; tmp move chu ?
	BEQ	EVOY

	MOVW	YA,TMPADW	; move keisan
	ADDW	YA,TMPW
	DBNZ	TMPC,_TMP20	; dec & bne
				; tmpc = 0 (move end)
	MOVW	YA,TMPC		; y <- tmpm , a <- 00
_TMP20
	MOVW	TMPW,YA

;------------------------------------------------
;		evol move
;------------------------------------------------
EVOY
	MOV	A,EVOC		; evo move chu ?
	BEQ	MVOY

	MOVW	YA,EVOLADW	; move keisan
	ADDW	YA,EVOLW
	MOVW	EVOLW,YA

	MOVW	YA,EVORADW	; move keisan
	ADDW	YA,EVORW
	DBNZ	EVOC,_EVO20	; dec & bne

	MOVW	YA,EVOC		; y <- evolm , a <- 00
	MOVW	EVOLW,YA
	MOV	Y,EVORM		;
_EVO20
	MOVW	EVORW,YA

;------------------------------------------------
;		mvol move
;------------------------------------------------
MVOY
	MOV	A,MVOC		; mvol move chu ?
	BEQ	_MVO40

	MOVW	YA,MVOADW	; move keisan
	ADDW	YA,MVOW
	DBNZ	MVOC,_MVO10	; dec & bne
				; mvoc = 0 (move end)
	MOVW	YA,MVOC		; y <- mvom , a <- 00
_MVO10
	MOVW	MVOW,YA
	MOV	VOLS,#0FFH	; mvo set

_MVO40
	MOV	X,#000		; vol set keyon & end
	MOV	KEYD,#001H	; key data set (8ch)
_MVO42
	MOV	A,ADD+1+X
	BEQ	_MVO46		; kami = 0
	CALL	!VOLY		; tre pan move & vol set
_MVO46
	INC	X
	INC	X
	ASL	KEYD
	BNE	_MVO42
	RET



;------------------------------------------------
;		special flag check
;------------------------------------------------

SPFT
	DW	SNOX,PANX,PAMX,VIBX,VOFX,MV1X,MV2X,TP1X,TP2X
	DW	KTPX,PTPX,TREX,TOFX,PV1X,PV2X,PATX,VCHX,SWKX,SWSX,SOFX
	DW	TUNX,ECVX,EOFX,EDLX,EV2X,SWPX,WAVX
SPFP
	DB	0001,0001,0002,0003,0000,0001,0002,0001,0002
	DB	0001,0001,0003,0000,0001,0002,0003,0001,0003,0003,0000
	DB	0001,0003,0000,0003,0003,0003,0001

SPFX
	ASL	A
	MOV	Y,A
	MOV	A,!SPFT-SNO-SNO+256+1+Y		; high
	PUSH	A
	MOV	A,!SPFT-SNO-SNO+256+Y		; low
	PUSH	A

	MOV	A,Y
	LSR	A
	MOV	Y,A
	MOV	A,!SPFP-SNO+128+Y	;
	BEQ	DATA_INR

;------------------------------------------------
;            data in  &  inc address

DATA_IN
	MOV	A,[ADD+X]	; data in
ADD_INC
	INC	ADD+X
	BNE	DATA_INR
	INC	ADD+1+X
DATA_INR
	MOV	Y,A		; flag set
	RET




;------------------------------------------------
;		sound no.
;------------------------------------------------
SNOX
;------------------------------------------------
;    Sound No. data set  [INIT & DRAMUS]
;------------------------------------------------
SNOSET
	MOV	!SNOS+X,A	; sno store
	MOV	Y,A		; d7 check
	BPL	_SNOS1
			; for DRAMUS
	SETC
	SBC	A,#DD0
	CLRC
	ADC	A,WAVS		; bias add.
_SNOS1
	MOV	Y,#006		; x=channel a=sno
	MUL	YA
	MOVW	ADX,YA
	CLRC
	ADC	ADX,#<SOURCE_SOD
	ADC	ADX+1,#>SOURCE_SOD

	MOV	A,FKIN		; kinshi flag check
	AND	A,KEYD
	BNE	_SNOS99

	PUSH	X
	MOV	A,X		; apuch
	XCN	A
	LSR	A
	OR	A,#004
	MOV	X,A		; write address

	MOV	Y,#000		; 1st data in
	MOV	A,[ADX]+Y	; sound data set
	BPL	_SNOS4		; noise ?

	AND	A,#01FH		; noise clock store
	AND	FLGS,#020H
	TSET1	!FLGS		; noise clock store
	OR	NONS,KEYD	; noise channel store
	MOV	A,Y		; y = 0 (=dd0)
	BRA	_SNOS8
_SNOS4
	MOV	A,KEYD		; normal sno
	TCLR1	!NONS		; noise channel clear
_SNOS6
	MOV	A,[ADX]+Y	; sound data set
_SNOS8
	MOV	!APUADD,X	; write address
	MOV	!APUDT,A	; data write
	INC	X
	INC	Y
	CMP	Y,#004
	BNE	_SNOS6		; tensou data 4

	POP	X
	MOV	A,[ADX]+Y	; 5 ban me (block su)
	MOV	!BLS+1+X,A	; block su store
	INC	Y
	MOV	A,[ADX]+Y	; 6 ban me (block su)
	MOV	!BLS+X,A	; block su store
_SNOS99
	RET


;------------------------------------------------
;		pan data set
;------------------------------------------------

PANX
	MOV	!PANF+X,A	; pan flag store
	AND	A,#01FH
	MOV	!PAND+X,A	; pan data
	MOV	A,#000
	MOV	!PANDW+X,A
	RET

;------------------------------------------------
;		pan move
;------------------------------------------------
PAMX
	MOV	PANC+X,A	; pan (count)
	PUSH	A		; count --> x
	CALL	!DATA_IN	; data in & inc add
	MOV	!PANM+X,A	; pan (mokuteki)
	SETC
	SBC	A,!PAND+X	; pan (now data)
	POP	X		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOV	!PANADW+X,A	; + shimo
	MOV	A,Y		; kami
	MOV	!PANAD+X,A	; + kami
	RET


;------------------------------------------------
;		vibrate
;------------------------------------------------
VIBX
	MOV	!VIBHS+X,A	; vib hold
	CALL	!DATA_IN	; data in & inc add
	MOV	!VIBCAD+X,A	; vib speed (+@)
	CALL	!DATA_IN	; data in & inc add

;------------------------------------------------
;		vibrate off
;------------------------------------------------
VOFX
	MOV	VIBD+X,A	; vib depth
	MOV	!VIBDM+X,A	; vib depth mokuteki
	MOV	A,#000
	MOV	!VIBCS+X,A	; vib change count
	RET

;------------------------------------------------
;		vibrate change
;------------------------------------------------
VCHX
	MOV	!VIBCS+X,A	; vib change count
	PUSH	A
	MOV	Y,#000
	MOV	A,VIBD+X	;
	POP	X
	DIV	YA,X		; ya/x = a ... y
	MOV	X,CHN
	MOV	!VIBAD+X,A
	RET

;------------------------------------------------
;		main volume change
;------------------------------------------------
MV1X
	MOV	A,#000
	MOVW	MVOW,YA		; main vol
	RET

;------------------------------------------------
;		main volume move
;------------------------------------------------
MV2X
	MOV	MVOC,A		; mvol (count)
	CALL	!DATA_IN	; data in & inc add
	MOV	MVOM,A		; mvol (mokuteki)
	SETC
	SBC	A,MVO		; mvol (now data)
	MOV	X,MVOC		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOVW	MVOADW,YA	; + @
	RET

;------------------------------------------------
;		tempo change
;------------------------------------------------
TP1X
	MOV	A,#000
	MOVW	TMPW,YA		; tempo
	RET

;------------------------------------------------
;		tempo move
;------------------------------------------------
TP2X
	MOV	TMPC,A		; tmp (count)
	CALL	!DATA_IN	; data in & inc add
	MOV	TMPM,A		; tmp (mokuteki)
	SETC
	SBC	A,TMP		; tmp (now data)
	MOV	X,TMPC		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOVW	TMPADW,YA	; + @
	RET

;------------------------------------------------
;		key tras.
;------------------------------------------------
KTPX
	MOV	KTPS,A		; key trans. store
	RET

;------------------------------------------------
;		part key tras.
;------------------------------------------------
PTPX
	MOV	!PTPS+X,A	; key trans. store
	RET

;------------------------------------------------
;		tremolo
;------------------------------------------------
TREX
	MOV	!TREHS+X,A	; tre hold
	CALL	!DATA_IN	; data in & inc add
	MOV	!TRECAD+X,A	; tre speed (+@)
	CALL	!DATA_IN	; data in & inc add

;------------------------------------------------
;		tremolo off		; a = 0
;------------------------------------------------
TOFX
	MOV	TRED+X,A	; tre depth
	RET

;------------------------------------------------
;		sweep kurikaeshi
;------------------------------------------------
SWKX
	MOV	A,#001		;
	BRA	SWSX0
SWSX
	MOV	A,#000
SWSX0
	MOV	!SWSK+X,A	; a = 0

	MOV	A,Y
	MOV	!SWSHC+X,A	; hold
	CALL	!DATA_IN	; data in & inc add
	MOV	!SWSC+X,A	; count
	CALL	!DATA_IN	; data in & inc add
	MOV	!SWSS+X,A	; + @
	RET

;------------------------------------------------
;		sweep off		; a = 0
;------------------------------------------------
SOFX
	MOV	!SWSC+X,A	;
	RET

;------------------------------------------------
;		part vol set
;------------------------------------------------
PV1X
	MOV	!PVOD+X,A	; vol set
	MOV	A,#000
	MOV	!PVODW+X,A
	RET

;------------------------------------------------
;		part vol move
;------------------------------------------------
PV2X
	MOV	PVOC+X,A	; vol (count)
	PUSH	A		; count --> x
	CALL	!DATA_IN	; data in & inc add
	MOV	!PVOM+X,A	; vol (mokuteki)
	SETC
	SBC	A,!PVOD+X	; vol (now data)
	POP	X		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOV	!PVOADW+X,A	; + shimo
	MOV	A,Y		; kami
	MOV	!PVOAD+X,A	; + kami
	RET

;------------------------------------------------
;		part tune
;------------------------------------------------
TUNX
	MOV	!TUND+X,A	; tune set
	RET

;------------------------------------------------
;		rythm pattern
;------------------------------------------------
PATX
	MOV	!ADP+X,A	; pattern add. (low)
	CALL	!DATA_IN	; data in & inc add
	MOV	!ADP+1+X,A	; pattern add. (high)
	CALL	!DATA_IN	; data in & inc add
	MOV	PTC+X,A		; rythm pattern count
	MOV	A,ADD+X		; add taihi
	MOV	!ADT+X,A
	MOV	A,ADD+1+X
	MOV	!ADT+1+X,A
ADDSET
	MOV	A,!ADP+X	; pattern add. (low)
	MOV	ADD+X,A
	MOV	A,!ADP+1+X	; pattern add. (high)
	MOV	ADD+1+X,A
	RET

;------------------------------------------------
;		echo on channel & volume
;------------------------------------------------
ECVX
	MOV	EONS,A		; echo channel set
	CALL	!DATA_IN	; data in & inc add
	MOV	A,#000
	MOVW	EVOLW,YA
	CALL	!DATA_IN	; data in & inc add
	MOV	A,#000
	MOVW	EVORW,YA
	CLR1	FLGS.5		; write enable
	RET

;------------------------------------------------
;		echo volume move
;------------------------------------------------
EV2X
	MOV	EVOC,A		; evol (count)
	CALL	!DATA_IN	; data in & inc add
	MOV	EVOLM,A		; evol (mokuteki)
	SETC
	SBC	A,EVOL		; evol (now data)
	MOV	X,EVOC		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOVW	EVOLADW,YA	; + @
	CALL	!DATA_IN	; data in & inc add
	MOV	EVORM,A		; evor (mokuteki)
	SETC
	SBC	A,EVOR		; evor (now data)
	MOV	X,EVOC		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOVW	EVORADW,YA	; + @
	RET


;------------------------------------------------
;		echo off
;------------------------------------------------
EOFX
	MOVW	EVOLW,YA	; ya = 00
	MOVW	EVORW,YA	; EVOL "00" set
	SET1	FLGS.5		; write disable
	RET

;------------------------------------------------
;	echo delay time & feed back
;------------------------------------------------
EDLX
	CALL	!ESASET		; EDL & ESA set
	CALL	!DATA_IN	; data in & inc add
	MOV	EFBS,A		; EFB = feed back
	CALL	!DATA_IN	; data in & inc add
;FILSET
	MOV	Y,#008		; a = fil no.
	MUL	YA
	MOV	X,A		; table add.
	MOV	Y,#00FH		; tenso address set
_FILS20
	MOV	A,!FILD+X
	CALL	!APUS		; a=data  y= address
	INC	X
	MOV	A,Y
	CLRC
	ADC	A,#010H
	MOV	Y,A
	BPL	_FILS20		; until 07fh

	MOV	X,CHN
	RET

;------------------------------------------------
ESASET
	MOV	ECLR,A		; echo delay time

	MOV	Y,#EDLY		; EDL[$7D] = delay time
	MOV	!APUADD,Y
	MOV	A,!APUDT
	CMP	A,ECLR
	BEQ	_ESA50

	AND	A,#00FH
	EOR	A,#0FFH
	BBC	EKIN.7,_ESA10	; kinshi chu ?
	CLRC
	ADC	A,EKIN
_ESA10
	MOV	EKIN,A		; echo kinshi time

	MOV	Y,#004
_ESA20
	MOV	A,!DSETA-1+Y	; EON EFB EVOL EVOR
	MOV	!APUADD,A	; write address
	MOV	A,#000H
	MOV	!APUDT,A	; data write
	DBNZ	Y,_ESA20	;

	MOV	A,FLGS
	OR	A,#020H
	MOV	Y,#FLG		; [$6C]	FLG echo off
	CALL	!APUS		; a=data  y=address
	MOV	A,ECLR
	MOV	Y,#EDLY		; [$7D]	EDL = delay time
	CALL	!APUS		; a=data  y=address
_ESA50
	ASL	A		; ESA set
	ASL	A
	ASL	A
	EOR	A,#0FFH
	SETC
	ADC	A,#0D0H		; 0d0h = echo end add.	** henko **
	MOV	Y,#ESA		; [$6D]	ESA = echo start add.
	JMP	!APUS		; a=data  y=address


;------------------------------------------------
;		source count
;------------------------------------------------
WAVX
	MOV	WAVS,A		;
	RET			;





;----------------------------------------
;        sweep check (next data)
;----------------------------------------
SWPCH
	MOV	A,SWPC+X	;
	BNE	SWPADSETR

	MOV	A,[ADD+X]	; next data check
	CMP	A,#SWP
	BNE	SWPADSETR	; not [swp] ?

	CALL	!ADD_INC	; inc add
	CALL	!DATA_IN	; data in & inc add
SWPX
	MOV	SWPHC+X,A	; sweep (hold)

	CALL	!DATA_IN	; data in & inc add
	MOV	SWPC+X,A	; sweep (counter)

	CALL	!DATA_IN	; data in & inc add
	CLRC			; key trans. add.
	ADC	A,KTPS
	ADC	A,!PTPS+X

;----------------------------------------
SWPADSET
	AND	A,#07FH		; $
	MOV	!SWPM+X,A	; sweep (mokuteki)
	SETC			;
	SBC	A,!SWPD+X	; moku - now
	MOV	Y,SWPC+X	; sweep count
	PUSH	Y
	POP	X		; count --> x
	CALL	!DIVX		; x=count a=sa c=+,-
	MOV	!SWPADW+X,A	; + shimo
	MOV	A,Y
	MOV	!SWPAD+X,A	; + kami
SWPADSETR
	RET

;----------------------------------------

SWPDSET
	MOV	A,!SWPD+X	; kkk sss <-- swpd swpdw
	MOV	KKK,A
	MOV	A,!SWPDW+X	;
	MOV	SSS,A
	RET


;----------------------------------------
; div keisan  from tp2 & mv2 & pam & swp (x=count a=sa)
;----------------------------------------

DIVX
	NOTC			; c=1 plus
	ROR	TTT		; data store
	BPL	_DIV10		; plus ?
	EOR	A,#0FFH		; minus
	INC	A
_DIV10
	MOV	Y,#000		; sa --> 00 sa ( y a )
	DIV	YA,X		; 00 sa / count --> a ... y
	PUSH	A		; kami
	MOV	A,#000
	DIV	YA,X		; sa 00	 / count --> a
	POP	Y		; ya data set
	MOV	X,CHN		;
MINUSC
	BBC	TTT.7,_DIV90	; ttt d7=1 ?
	MOVW	ADX,YA		; minus
	MOVW	YA,T00		; #$0000 STORE
	SUBW	YA,ADX
_DIV90
	RET



;-----------------------------------------------------------

;----------------------------------------
;            part vol move
;----------------------------------------
VOLY
	MOV	A,PVOC+X	; vol move chu ?
	BEQ	TREY

	MOV	A,#<PVODW	; move keisan
	MOV	Y,#>PVODW
	DEC	PVOC+X
	CALL	!ADDWS		; vols set

;----------------------------------------
;            tremolo check
;----------------------------------------
TREY
	MOV	Y,TRED+X	; tre chu ?
	BEQ	TRE22

	MOV	A,!TREHS+X	; hold chu ?
	CBNE	TREHC+X,TRE20
	OR	VOLS,KEYD	; vol set flag

	MOV	A,!TREC+X	; trec = a
	BPL	TRE02		; trec = 080h ijo ?

	INC	Y		; tred = 0ffh ?
	BNE	TRE02
	MOV	A,#080H
	BRA	TRE04
TRE02
	CLRC			; speed keisan
	ADC	A,!TRECAD+X
TRE04
	MOV	!TREC+X,A	; count data
	CALL	!TRESET		; volx set
	BRA	PANY
TRE20
	INC	TREHC+X		; hold chu
TRE22
	MOV	A,#0FFH		; y = depth (tre)
	CALL	!VOLXSET	; volx set

;----------------------------------------
;          pan move & gain set
;----------------------------------------
PANY
	MOV	A,PANC+X	; pan move chu ?
	BEQ	PAN10
PAN02
	MOV	A,#<PANDW
	MOV	Y,#>PANDW
	DEC	PANC+X
	CALL	!ADDWS		; vols set
PAN10
	MOV	A,KEYD
	AND	A,VOLS		; vol set ?
	BEQ	PANR

	MOV	A,!PAND+X	; kami
	MOV	Y,A
	MOV	A,!PANDW+X	; shimo
	MOVW	SSS,YA

PAN20
	MOV	A,X		; kkk sss --> pand set
	XCN	A
	LSR	A		; apuch
	MOV	TTT,A		; r.gain = 0
PAN30
	MOV	Y,KKK		; right gain keisan
	MOV	A,!PANT+1+Y
	SETC
	SBC	A,!PANT+Y	; sa --> a
	MOV	Y,SSS		; shimo
	MUL	YA		; sa x 0.???
	MOV	A,Y		;	   --> a

	MOV	Y,KKK		; kami
	CLRC
	ADC	A,!PANT+Y	; pan data --> a
	MOV	Y,A

	MOV	A,!VOLX+X	; gain data set
	MUL	YA		;

	MOV	A,!PANF+X
	ASL	A
	BBC	TTT.0,PAN32
	ASL	A
PAN32
	MOV	A,Y
	BCC	PAN34

	EOR	A,#0FFH
	INC	A
PAN34
	MOV	Y,TTT		; write address
	CALL	!APUSX		; a=data  y=address

	MOV	Y,#020		; left gain keisan
	MOV	A,#000
	SUBW	YA,SSS		; 20.00 - kkk sss
	MOVW	SSS,YA
	INC	TTT		; l.gain = 1
	BBC	TTT.1,PAN30
PANR
	RET

;----------------------------------------
PANT:	; 0 - 20
	DB	000,001,003,007,013,021,030,041,052,066
	DB	081,094,103,110,115,119,122,124,125,126,127
;*db	127,126,126,125,123,120,116,111,105,098
;*db	089,080,070,060,050,040,030,022,014,006,000


;----------------------------------------
ADDWS
	OR	VOLS,KEYD	; vol set flag
ADDW
	MOVW	ADX,YA		; from vol pan & swp
	MOVW	ADX+2,YA
	PUSH	X
	POP	Y
	CLRC
	BNE	ADDW0		; Z = dec XXX

	ADC	ADX+2,#01FH	; = 0 (move end)

	MOV	A,#000		; low = 0
	MOV	[ADX]+Y,A
	INC	Y		; high = m
	BRA	ADDW2
ADDW0
	ADC	ADX+2,#010H

	CALL	!ADDW1		; low

	INC	Y
ADDW1
	MOV	A,[ADX]+Y	; high
ADDW2
	ADC	A,[ADX+2]+Y
	MOV	[ADX]+Y,A
	RET



;-----------------------------------------------------------

;----------------------------------------
;             keyoff check
;----------------------------------------
KEYCH
	MOV	A,NGO+X		; key off ?
	BEQ	SWPY	

	DEC	NGO+X		; key off ?
	BEQ	KEY02

	MOV	A,#002
	CBNE	NGC+X,SWPY
			; # key off shori
KEY02
	MOV	A,PTC+X		; pattern count
	MOV	ADX+3,A

	MOV	A,ADD+X		; address set
	MOV	Y,ADD+1+X
KEY04
	MOVW	ADX,YA

	MOV	Y,#000H
KEY10
	MOV	A,[ADX]+Y	; data in
	BEQ	KEY16		; block end ?
	BMI	KEY14
KEY12
	INC	Y
	MOV	A,[ADX]+Y	; data in
	BPL	KEY12		; nagasa ?
KEY14
	CMP	A,#XXX		; xxx ?
	BEQ	SWPY		; = tai

	CMP	A,#PAT
	BEQ	KEY18		; pat ?

	CMP	A,#SNO
	BCC	KEY20		; special flag ?

	PUSH	Y		; special flag
	MOV	Y,A
	POP	A
	ADC	A,!SPFP-SNO+Y	; c=1
	MOV	Y,A
	BRA	KEY10

KEY16
	MOV	A,ADX+3		; pattern chu ?
	BEQ	KEY20

	DEC	ADX+3		; pattern end ?
	BNE	KEY17

	MOV	A,!ADT+1+X	; add restore (pattern end)
	PUSH	A
	MOV	A,!ADT+X
	POP	Y
	BRA	KEY04		;
KEY17
	MOV	A,!ADP+1+X	; pattern add. (high)
	PUSH	A
	MOV	A,!ADP+X	; pattern add. (low)
	POP	Y
	BRA	KEY04		;
KEY18
	INC	Y		; pat
	MOV	A,[ADX]+Y	; data in
	PUSH	A		; add. low
	INC	Y		;
	MOV	A,[ADX]+Y	; data in
	MOV	Y,A		; add. high
	POP	A
	BRA	KEY04		;

KEY20
	MOV	A,KEYD		; key off set
	MOV	Y,#KOF		;
	CALL	!APUSX		; keyoff set (a=keyd)


;----------------------------------------
;		sweep check
;----------------------------------------
SWPY
	CLR1	UUU.7		; sweep chu flag

	MOV	A,SWPC+X	; sweep chu ?
	BEQ	VIBY

SWP10
	MOV	A,SWPHC+X	; hold chu ?
	BEQ	SWP20

	DEC	SWPHC+X		; hold chu
	BRA	VIBY

SWP20
	SET1	UUU.7		; sweep chu flag

	MOV	A,#<SWPDW
	MOV	Y,#>SWPDW

	DEC	SWPC+X		; sweep keisan
	CALL	!ADDW

;----------------------------------------
;		vib check
;----------------------------------------
VIBY
	CALL	!SWPDSET	; kkk sss <-- swpd swpdw

VIB10
	MOV	A,VIBD+X	; vib chu ?
	BEQ	VIB12

	MOV	A,!VIBHS+X
	CBNE	VIBHC+X,VIB11	; hold chu ?

	MOV	A,!VIBCC+X	;
	CMP	A,!VIBCS+X
	BNE	VIB15		; change chu ?

	MOV	A,!VIBDM+X	; vib change end !
	BRA	VIB17

VIB15
	INC	VIBCC+X		; change chu

	MOV	Y,A		; !vibcc+x = 0 ?
	BEQ	VIB16		; change begin (a=0)

	MOV	A,VIBD+X	; change chu
VIB16
	CLRC
	ADC	A,!VIBAD+X
VIB17
	MOV	VIBD+X,A	;

VIB18
	MOV	A,!VIBC+X	; vib keisan
	CLRC
	ADC	A,!VIBCAD+X
	MOV	!VIBC+X,A	; count data

VIB20
	MOV	TTT,A		; depth keisan

	ASL	A
	ASL	A
	BCC	VIB21		; count data d6=0 ?

	EOR	A,#0FFH

VIB21
	MOV	Y,A
	MOV	A,VIBD+X	; vib depth (%)
	CMP	A,#0F1H
	BCC	VIB24

VIB22
	AND	A,#00FH		;
	MUL	YA
	BRA	VIB25

VIB24
	MUL	YA
	MOV	A,Y		; shosuten ika
	MOV	Y,#000		; kami

VIB25
	CALL	!MINUSAD	; if ttt(d7)=1 then minus + sss

VIB40
	JMP	!DSSX		; fre. set (call)

VIB11
	INC	VIBHC+X		; hold chu
VIB12
	BBS	UUU.7,VIB40	; sweep chu ?
	RET





;----------------------------------------
;            tremolo check
;----------------------------------------
TRRY
	CLR1	UUU.7		; tre chu flag

	MOV	A,TRED+X	; tre chu ?
	BEQ	PNNY

	MOV	A,!TREHS+X	; hold chu ?
	CBNE	TREHC+X,PNNY

	CALL	!TRESETX	; volx set

;----------------------------------------
;           pan move check
;----------------------------------------
PNNY
	MOV	A,!PAND+X	; kami
	MOV	Y,A
	MOV	A,!PANDW+X	; shimo
	MOVW	SSS,YA

	MOV	A,PANC+X	; pan move chu ?
	BEQ	PNN04

	MOV	A,!PANAD+X
	MOV	Y,A
	MOV	A,!PANADW+X	; + @ keisan

	CALL	!HOKAN		; kkk sss <-- data set

PNN04
	BBC	UUU.7,SPPY
	CALL	!PAN20		; vol data set

;----------------------------------------
;            sweep check
;----------------------------------------
SPPY
	CLR1	UUU.7		; sweep chu flag

	CALL	!SWPDSET	; kkk sss <-- swpd swpdw

	MOV	A,SWPC+X	; sweep chu ?
	BEQ	VBBY

	MOV	A,SWPHC+X	; hold chu ?
	BNE	VBBY

	MOV	A,!SWPAD+X
	MOV	Y,A
	MOV	A,!SWPADW+X

	CALL	!HOKAN		; kkk sss <-- data set

;----------------------------------------
;              vib check
;----------------------------------------
VBBY
	MOV	A,VIBD+X	; vib chu ?
	BEQ	VIB12		; uuu d7 check & ret

	MOV	A,!VIBHS+X
	CBNE	VIBHC+X,VIB12	; hold chu ?
VBB10
	MOV	Y,TMPD
	MOV	A,!VIBCAD+X	; vib keisan
	MUL	YA
	MOV	A,Y
	CLRC
	ADC	A,!VIBC+X	; vib count
	JMP	!VIB20		; depth keisan & data set


;----------------------------------------
;          hokan keisan
;----------------------------------------
HOKAN
	SET1	UUU.7		; from sppy
	MOV	TTT,Y		; data store

	CALL	!MINUSC		; if ttt(d7)=1 then minus

	PUSH	Y
	MOV	Y,TMPD		; X 0.???
	MUL	YA		; a = shimo
	MOV	ADX,Y
	MOV	ADX+1,#000

	MOV	Y,TMPD
	POP	A		; a = kami
	MUL	YA
	ADDW	YA,ADX

MINUSAD
	CALL	!MINUSC		; if ttt(d7)=1 then minus

	ADDW	YA,SSS		; sweep keisan
	MOVW	SSS,YA		; data set
	RET


;----------------------------------------
;         tremolo data set
;----------------------------------------
TRESETX
	SET1	UUU.7		; call from trr

	MOV	Y,TMPD
	MOV	A,!TRECAD+X	; tre keisan

	MUL	YA
	MOV	A,Y
	CLRC
	ADC	A,!TREC+X

TRESET
	ASL	A		; volx set
	BCC	TRESET2

	EOR	A,#0FFH

TRESET2
	MOV	Y,TRED+X
	MUL	YA		; tre depth x wave

	MOV	A,Y
	EOR	A,#0FFH		; = 1 - depth
VOLXSET
	MOV	Y,MVO		; main vol x ( 1 - depth )
	MUL	YA		;

	MOV	A,!VOL+X	; vol x
	MUL	YA

	MOV	A,!PVOD+X	; part vol x
	MUL	YA

	MOV	A,Y		; dB
	MUL	YA		; dB

	MOV	A,Y
	MOV	!VOLX+X,A
	RET



;-----------------------------------------------------------
;                  ECHO FILTER DATA
FILD		;					; Filter    (0xfh)
	DB	07FH,000H,000H,000H,000H,000H,000H,000H ; no filter (x1.0)
	DB	058H,0BFH,0DBH,0F0H,0FEH,007H,00CH,00CH ; high pass
	DB	00CH,021H,02BH,02BH,013H,0FEH,0F3H,0F9H ; low  pass
	DB	034H,033H,000H,0D9H,0E5H,001H,0FCH,0EBH ; band pass



;	END
