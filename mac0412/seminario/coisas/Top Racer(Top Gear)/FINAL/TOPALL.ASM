GFT
	DW	TopGearTitle
	dw	level1		
	dw 	level2
	dw 	level3
	dw 	level4
	dw 	fanf1
	dw 	fanf2
	dw  	0D000H, 0D000H
TopGearTitle
	DW	TITLE_channels
	DW	255

TITLE_channels
	DW	titleChan_SS1	;TINKLE1
	DW	titleChan_SS2	;DRUMS
	DW	titleChan_SS3	;BASS
	DW	titleChan_SS4	;CHORDS 1
	DW	titleChan_SS5	;CHORDS 2
	DW	titleChan_SS6	;CHORDS 3
	DW	titleChan_SS7	;TINKLE 2  
	DW	titleChan_SS8	;LEAD
titleChan_SSX
	DB PAT,<titlebar2,>titlebar2,51,0
titleChan_SS1
	DB 	WAV,17
	DB	TP1,55	;27		; tempo
	DB	PV1,150		; part volume
	DB	SNO,SN1		; sound name
	DB	PAN,11	; panpot
	db	ecv,193,127,127	;249 = 1 45678 ;193
	db 	edl,12,255,1

	DB	024,P80+V99			; step_time,gate_time,velocity
 	db 	ptp,0
	DB PAT,<titlebar1,>titlebar1,2	;pos 0 +1
	db pat,<titlebar3,>titlebar3,1	;pos 2
	DB PAT,<titlebar1,>titlebar1,2	;pos 3 +4
	db pat,<titlebar3,>titlebar3,1	;pos 5
	db pat,<titlebar4,>titlebar4,6	;pos 6,7 &8
	db pat,<titlebar5,>titlebar5,2	;pos 9
	db pat,<titlebar4,>titlebar4,2	;pos 10
	db pat,<titlebar5,>titlebar5,2	;pos 11
	db pat,<titlebar4,>titlebar4,2	;pos 12
	db pat,<titlebar5,>titlebar5,2	;pos 13
	db pat,<titlebar3,>titlebar3,1	;pos 14
	db pat,<titlebar4,>titlebar4,12	;pos 15,16,17,18,19,20	
	db pat,<titlebar5,>titlebar5,2	;pos 21
	db pat,<titlebar4,>titlebar4,2	;pos 22
	db pat,<titlebar5,>titlebar5,2	;pos 23
	db pat,<titlebar3,>titlebar3,1	;pos 24
	db pat,<titlebar4,>titlebar4,2 	;pos 25	
	db pat,<titlebar24,>titlebar24,1 	;pos 25	


	db 0
titleChan_SS2
	DB	PV1,250		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,0
	db pat,<titlebar6,>titlebar6,8	;pos 0
	db pat,<titlebar7,>titlebar7,12	;pos 1 and 1/2 pat 2
	db pat,<titlebar8,>titlebar8,1	;pos 0
	db pat,<titlebar7,>titlebar7,16	;pos 1 and 1/2 pat 2
	db pat,<titlebar6,>titlebar6,20	;pos 1 and 1/2 pat 2
	db pat,<titlebar10,>titlebar10,1	;pos 1 and 1/2 pat 2
	db pat,<titlebar9,>titlebar9,5	;BASIC titlebar BEAT 
	db pat,<titlebar36,>titlebar36,1	;BASIC AMD ROLL
	db pat,<titlebar9,>titlebar9,1	;BASIC titlebar BEAT
	db pat,<titlebar37,>titlebar37,1	;4 BY 4 BEAT FOR 32
	db pat,<titlebar8,>titlebar8,1	;ROLL ON IT'S OWN
	db pat,<titlebar9,>titlebar9,3	;BASIC titlebar BEAT 
	db pat,<titlebar36,>titlebar36,1	;BASIC AMD ROLL
	db pat,<titlebar9,>titlebar9,3	;BASIC titlebar BEAT 
	db pat,<titlebar36,>titlebar36,1	;BASIC AMD ROLL
	db pat,<titlebar9,>titlebar9,1	;BASIC titlebar BEAT
	db pat,<titlebar37,>titlebar37,1	;4 BY 4 BEAT FOR 32
	db pat,<titlebar8,>titlebar8,1	;ROLL ON IT'S OWN
	DB PAT,<titlebar6,>titlebar6,64
	db	0

titleChan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,-2		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	DB 	SNO,SN6
	db pat,<titlebar16,>titlebar16,1	;pos 0
	db pat,<titlebar11,>titlebar11,1	;pos 1
	db pat,<titlebar12,>titlebar12,1	;pos 2
	db pat,<titlebar13,>titlebar13,2	;pos 3
	db pat,<titlebar14,>titlebar14,1	;pos 4+5+6+7
	;start of main tune *************
	DB PTP,-2   
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,3  
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,-2   
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,3  
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,-2   
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,3  
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,-2
	DB PAT,<titlebar22,>titlebar22,1
	DB PAT,<titlebar23,>titlebar23,1
	DB PTP,-2   
	db pat,<titlebar21,>titlebar21,10	;pos 8
	DB PTP,3  
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,-2   
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,3  
	db pat,<titlebar21,>titlebar21,2	;pos 8
	DB PTP,-2
	DB PAT,<titlebar22,>titlebar22,1
	DB PAT,<titlebar23,>titlebar23,1
	DB PAT,<titlebar43,>titlebar43,1
	
	db	0


titleChan_SS4	    
	DB	PV1,150		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85 
	db ptp,0	
	db pat,<titlebar15,>titlebar15,1	;pos 0
	;start of main tune *************
	db ptp,0
	DB PAT,<titlebar27,>titlebar27,2
	DB PAT,<titlebar30,>titlebar30,2
	DB PAT,<titlebar27,>titlebar27,2
	DB PAT,<titlebar30,>titlebar30,2
	DB PAT,<titlebar27,>titlebar27,2
	DB PAT,<titlebar30,>titlebar30,2
	DB PTP,3
	DB PAT,<titlebar30,>titlebar30,1
	DB PTP,5
	DB PAT,<titlebar30,>titlebar30,1
	DB PTP,0
	DB PAT,<titlebar27,>titlebar27,12
	DB PAT,<titlebar30,>titlebar30,2
	DB PAT,<titlebar27,>titlebar27,2
	DB PAT,<titlebar30,>titlebar30,2
	DB PTP,3
	DB PAT,<titlebar30,>titlebar30,1
	DB PTP,5
	DB PAT,<titlebar30,>titlebar30,1
	DB PTP,0
	DB PAT,<titlebar27,>titlebar27,2
   
	DB PTP,0		;OS26 PAT 17
	DB PAT,<titlebar33,>titlebar33,1
	db	0

titleChan_SS5
	DB	PV1,150		; part volume
	DB	SNO,SN1		; sound name
	DB	PAN,011		; panpot
	DB	024,P90+V85			; step_time,gate_time,velocity
	db ptp,0
	db pat,<titlebar17,>titlebar17,1	;pos 0
	;start of main tune *************
	db ptp,0
	DB PAT,<titlebar28,>titlebar28,2
	DB PAT,<titlebar31,>titlebar31,2
	DB PAT,<titlebar28,>titlebar28,2
	DB PAT,<titlebar31,>titlebar31,2
	DB PAT,<titlebar28,>titlebar28,2
	DB PAT,<titlebar31,>titlebar31,2
	DB PTP,3
	DB PAT,<titlebar31,>titlebar31,1
	DB PTP,5
	DB PAT,<titlebar31,>titlebar31,1
	DB PTP,0
	DB PAT,<titlebar28,>titlebar28,12
	DB PAT,<titlebar31,>titlebar31,2
	DB PAT,<titlebar28,>titlebar28,2
	DB PAT,<titlebar31,>titlebar31,2
	DB PTP,3
	DB PAT,<titlebar31,>titlebar31,1
	DB PTP,5
	DB PAT,<titlebar31,>titlebar31,1
	DB PTP,0
	DB PAT,<titlebar28,>titlebar28,2

	DB PTP,0		;OS26 PAT 17
	DB PAT,<titlebar34,>titlebar34,1

	db 0
titleChan_SS6
	DB	PV1,150		; part volume
	DB	PAN,011		; panpot
	DB	024,P90+V85			; step_time,gate_time,velocity
	db ptp,7
	db pat,<titlebar15,>titlebar15,1	;pos 0
	;start of main tune *************
	db ptp,0
	DB PAT,<titlebar29,>titlebar29,2
	DB PAT,<titlebar32,>titlebar32,2
	DB PAT,<titlebar29,>titlebar29,2
	DB PAT,<titlebar32,>titlebar32,2
	DB PAT,<titlebar29,>titlebar29,2
	DB PAT,<titlebar32,>titlebar32,2
	DB PTP,3
	DB PAT,<titlebar32,>titlebar32,1
	DB PTP,5
	DB PAT,<titlebar32,>titlebar32,1
	DB PTP,0
	DB PAT,<titlebar29,>titlebar29,12
	DB PAT,<titlebar32,>titlebar32,2
	DB PAT,<titlebar29,>titlebar29,2
	DB PAT,<titlebar32,>titlebar32,2
	DB PTP,3
	DB PAT,<titlebar32,>titlebar32,1
	DB PTP,5
	DB PAT,<titlebar32,>titlebar32,1
	DB PTP,0
	DB PAT,<titlebar29,>titlebar29,2

	DB PTP,0		;OS26 PAT 17
	DB PAT,<titlebar35,>titlebar35,1

	db 0
		      	DB 	PAT,<titlebar2,>titlebar2,052
titleChan_SS7
	DB	PV1,150		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V85			; step_time,gate_time,velocity
	db 	ptp,12
	;db	ecv,65,127,127
	;db 	edl,12,255,1
	db 	sno,sn7
	DB 	PAT,<titlebar18,>titlebar18,002 ;FMAJ TO CMIN
	DB 	PAT,<titlebar19,>titlebar19,001 ;G+ TO BFMAJ
	DB 	PAT,<titlebar18,>titlebar18,002
	DB 	PAT,<titlebar19,>titlebar19,001
	DB 	PAT,<titlebar20,>titlebar20,004 ;CMINOR
	;start of main tune *************
	DB 	PAT,<titlebar20,>titlebar20,002	;CMIN
	DB 	PAT,<titlebar25,>titlebar25,002	;FMAJ
	DB 	PAT,<titlebar20,>titlebar20,002
	DB 	PAT,<titlebar25,>titlebar25,002
	DB 	PAT,<titlebar20,>titlebar20,002
	DB 	PAT,<titlebar25,>titlebar25,002

	DB 	PAT,<titlebar19,>titlebar19,001 ;G+ TO BFMAJ

	DB 	PAT,<titlebar20,>titlebar20,012 ;CMINOR

	DB 	PAT,<titlebar25,>titlebar25,002	;FMAJ
	DB 	PAT,<titlebar20,>titlebar20,002 ;CMINOR
	DB 	PAT,<titlebar25,>titlebar25,002	;FMAJ
	DB 	PAT,<titlebar19,>titlebar19,001 ;G+ TO BFMAJ
	DB 	PAT,<titlebar20,>titlebar20,002 ;CMINOR

	DB PAT,<titlebar26,>titlebar26,01	;END BIT

	db	0
titleChan_SS8
	DB	PV1,225		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V99		; step_time,gate_time,velocity
	db 	ptp,0
	DB 	PAT,<titlebar2,>titlebar2,10
	DB PV1,225,PAT,<titlebar38,>titlebar38,1
	DB PTP,12
	DB PV1,255,PAT,<titlebar39,>titlebar39,1
	DB PAT,<titlebar40,>titlebar40,1
	DB 	PAT,<titlebar2,>titlebar2,4
	db ptp,0
	DB PV1,225,PAT,<titlebar38,>titlebar38,1
	DB PTP,12
	DB PAT,<titlebar39,>titlebar39,1
	DB PAT,<titlebar40,>titlebar40,1
	DB PAT,<titlebar39,>titlebar39,1
	DB PAT,<titlebar41,>titlebar41,1
	DB PAT,<titlebar39,>titlebar39,1
	DB PAT,<titlebar42,>titlebar42,5
 
	DB 0
titlebar2
	db 96
	db KYU,KYU,KYU,KYU
	DB	000
titlebar4
	db g2,c3,ef3,g2,c3,ef3,g2,c3
	db f3,g2,c3,ef3,g2,c3,ef3,d3
	DB	000
titlebar1
	db 12
	db a2,c3,f3,a2,c3,f3,a2,c3
	db g3,a2,c3,f3,a2,c3,f3,a2
	db g2,c3,ef3,g2,c3,ef3,g2,c3
 	db f3,g2,c3,ef3,g2,c3,ef3,d3,000
titlebar3
	db af2,c3,ef3,af2,c3,ef3,af2,c3
	db ef3,af2,c3,ef3,af2,c3,ef3,af2
	db bf2,d3,f3,bf2,d3,f3,bf2,d3
	db f3,bf2,d3,f3,bf2,d3,f3,bf2,000
	
	DB	000
titlebar5
	db a2,c3,f3,a2,c3,f3,a2,c3
	db g3,a2,c3,f3,a2,c3,f3,a2,0
titlebar6
	db sno,sn3,12,c4,c4
	db sno,sn2,G2
	db sno,sn3,c4,0
titlebar7
	db sno,sn4,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4,0
titlebar8
	db sno,sn5,12,c3
	db sno,sn3,c4
	db sno,sn5,c3
	db sno,sn3,c4
	db sno,sn5,c3
	db sno,sn5,c3
	db sno,sn3,c4
	db sno,sn5,c3
	db sno,sn3,c4
	DB SNO,SN5,C3
	db sno,sn5,6,c3,c3,c3,c3,12,c3
	db sno,sn3,c4
	db sno,sn5,c3
	db sno,sn5,c3,0
titlebar9
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn5,C3
	db sno,sn3,c4

	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn5,c3,C3,6,C3,C3,0

titlebar10
	db sno,sn4,24,c3
	db sno,sn3,c4
	db sno,sn4,24,c3
	db sno,sn3,c4
	db sno,sn4,24,c3
	db sno,sn3,c4
	db sno,sn4,24,c3
	db sno,sn3,c4,0
titlebar11
	db vib,24,160,80		;delay,speedofvib,valuetovib
	db sno,sn6
	DB 96,G1,TIE	;START FIRST QUARTER AT G2
	DB D1,TIE,0	; PLAY AND BEND AND PLAY UNTIL 48
titlebar12
	DB 72,BF1,BF1,48,BF1,72,C1,C2,48,C1,000
titlebar13					  ;SWS - BENDONDOWN
	DB 96,G1,TIE,D1,48,TIE,SWK,12,24,-12,D2,SOF,000
	;SWK
	;FIRST BYTE = SEMITONES BELOW FROM WHICH IT WILL COME FROM.
	;SECOND BYTE = SPEED - 1 = DAMN FAST 255= MOGADON SPEED.
	;THIRD = DETUNE IN SEMITONES TO WHICH IT WILL SLIDE
	;SWS
	; AS ABOVE ,BUT IT SEEMS TO BE FROM ABOVE AND NOT BELOW.
titlebar14
	DB 96,BF1,SWK,48,48,-12,BF1,SOF,C1,TIE,D1,TIE,TIE,TIE
	DB TIE,KYU,XXX,XXX,0
titlebar15
	db sno,sn7
	db vib,24,180,60		;delay,speedofvib,valuetovib
	db 96,f3,tie,c3,tie
	db 96,f3,tie,c3,tie
	db 96,af2,tie,bf2,tie
	db 96,f3,tie,c3,tie
	db 96,f3,tie,c3,tie
	db 96,af2,tie,bf2,tie
	db 96,c2,tie,tie,tie,tie,tie
	db sno,sn5,24,c3,c3,12,c3,24,c3,c3,c3,6,c3,c3,12,c3,c3,6,c3,c3,c3,c3,0
titlebar16
	DB 96,kyu,kyu,kyu,48,kyu,SWK,12,24,-7,D2,SOF,000

titlebar17
	db sno,sn7
	db vib,24,180,60		;delay,speedofvib,valuetovib
	db 96,a3,tie,ef3,tie
	db 96,a3,tie,ef3,tie
	db 96,c3,tie,d3,tie
	db 96,a3,tie,ef3,tie
	db 96,a3,tie,ef3,tie
	db 96,c3,tie,d3,tie
	db 96,ef2,tie,tie,tie,tie,tie
	db sno,sn5,24,c3,c3,12,c3,24,c3,c3,c3,6,c3,c3,12,c3,c3,6,c3,c3,c3,c3,0
titlebar18
	db 12,c1,f1,a1,c2,f2,a2,c3,f3,a3,f3,c3,a2,f2,c2,a1,f1
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1,000
	db 000			   
titlebar19
	db c1,ef1,af1,c2,ef2,af2,c3,ef3,af3,ef3,c3,af2,ef2,c2,af1,ef1
	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1,0
       	db 000			
titlebar20
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1,000
	db 000			   
titlebar21
	 db 6,D1,d1,D1,D1,24,d1,d2,12,d1,24,d2,12,d1,24,d2,c2,A1,000

	;db 12,d1,d1,24,d1,d2,12,d1,24,d2,12,d1,24,d2,c2,A1,000
	db 000			   
titlebar22
	DB 12,BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1
	DB C1,C2,C1,C1,C2,C1,C1,C2,C1,C2,C2,C1,C2,C1,C2,C1,0
titlebar23
	DB SWK,12,255,-12,96,D1,TIE,TIE,TIE,SOF,000
titlebar24
	DB 24,EF3,AF2,C3,AF2,EF3,AF2,C3,AF2
	DB F3,BF2,D3,BF2,F3,BF2,D3,BF2

	DB G3,C3,EF3,C3,G3,C3,EF3,C3
	DB G3,C3,AF3,C3,G3,C3,F3,C3
	DB 24,EF3,AF2,C3,AF2,EF3,AF2,C3,AF2
	DB F3,BF2,D3,BF2,F3,BF2,D3,BF2

	DB A3,C3,F3,C3,A3,C3,F3,C3
	DB G3,C3,EF3,C3,G3,C3,EF3,C3
	
	DB A3,C3,F3,C3,A3,C3,F3,C3
	DB G3,C3,EF3,C3,G3,C3,EF3,C3
	DB A3,C3,F3,C3,A3,C3,F3,C3
	DB G3,C3,EF3,C3,G3,C3,EF3,C3
	DB A3,C3,F3,C3,A3,C3,F3,C3
	DB G3,C3,EF3,C3,G3,C3,EF3,C3
	DB A3,C3,F3,C3,A3,C3,F3,C3
	DB G3,C3,EF3,C3,G3,C3,EF3,C3,0

	
	DB AF2,C3,EF3,AF2,C3,EF3,AF2,C3,EF3,AF2,C3,EF3,AF2,C3,EF3,AF2
	DB BF2,D3,F3,BF2,D3,F3,BF2,D3,F3,BF2,D3,F3,BF2,D3,F3,BF2,0
	db sno,sn6
	db 12,g3,bf3,d4,g3,bf3,d4,g3,bf3
	db g3,bf3,d4,g3,bf3,d4,g3,bf3
	db ef3,g3,bf3,ef3,g3,bf3,ef3,g3
	db ef3,g3,bf3,ef3,g3,bf3,ef3,g3
	db c3,ef3,g3,c3,ef3,g3,c3,ef3,g3
	db c3,ef3,g3,c3,ef3,g3,c3,ef3,g3
	db 000
titlebar25
 	DB C1,F1,A1,C2,F2,A2,C3,F3,A3,F3,C3,A2,F2,C2,A1,F1
	DB 0
titlebar26
	;DB 12,KYU
	DB 24,EF3,AF2,D3,AF2,C3,AF2,D3,AF2
	DB F3,BF2,EF3,BF2,D3,BF2,EF3,BF2
	DB G3,C3,F3,C3,EF3,C3,F3,C3
	DB G3,C3,F3,C3,EF3,C3,F3,C3

	DB 24,EF3,AF2,D3,AF2,C3,AF2,D3,AF2
	DB F3,BF2,EF3,BF2,D3,BF2,EF3,BF2

	DB C4,F3,BF3,F3,A3,F3,BF3,F3
	DB G3,C3,F3,C3,EF3,C3,F3,C3
	DB C4,F3,BF3,F3,A3,F3,BF3,F3
	DB G3,C3,F3,C3,EF3,C3,F3,C3
	DB C4,F3,BF3,F3,A3,F3,BF3,F3
	DB G3,C3,F3,C3,EF3,C3,F3,C3
	DB C4,F3,BF3,F3,A3,F3,BF3,F3
	DB G3,C3,F3,C3,EF3,C3,F3,C3
	DB C4,F3,BF3,F3,A3,F3,BF3,F3
	DB G3,C3,F3,C3,EF3,C3,F3,C3,0
titlebar27
	DB SNO,SN7
	DB 12,C2,C2,C2,C2
	DB C3
	DB C2,C2,6,C2
	DB 18,C3
	DB 12,C2,6,C2
	DB 18,C3
	DB SNO,SN7,12,C2,C2,C2,C2,0
titlebar28
	DB SNO,SN7
	DB 12,EF2,EF2,EF2,EF2
	DB EF3
	DB SNO,SN7
	DB EF3,EF3,6,EF2
	DB 18,EF3
	DB SNO,SN7
	DB 12,EF2,6,EF2
	DB 18,EF3
	DB SNO,SN7,12,EF2,EF2,EF2,EF2,0      
      
titlebar29
	DB SNO,SN7
	DB 12,G2,G2,G2,G2
	DB BF3
	DB G2,G2,6,G2
	DB 18,G3
	DB 12,G2,6,G2
	DB 18,G3
	DB 12,G2,G2,G2,G2,0      

titlebar30
	DB SNO,SN7
	DB 12,F2,F2,F2,F2
	DB F3
	DB F2,F2,6,F2
	DB 18,F3
	DB 12,F2,6,F2
	DB 18,F3
	DB 12,F2,F2,F2,F2,0      
titlebar31
	DB SNO,SN7
	DB 12,A2,A2,A2,A2
	DB A3
	DB A2,A2,6,A2
	DB 18,A3
	DB 12,A2,6,A2
	DB 18,A3
	DB 12,A2,A2,A2,A2,0      
titlebar32
	DB SNO,SN7
	DB 12,C3,C3,C3,C3
	DB C4
	DB C3,C3,6,C3
	DB 18,C4
	DB 12,C3,6,C3
	DB 18,C4
	DB 12,C3,C3,C3,C3,0 
titlebar33
	DB 96,AF2,TIE,BF2,TIE,C3,TIE,TIE,TIE
	DB 96,AF2,TIE,BF2,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE,000
titlebar34
    	DB 96,C3,TIE,D3,TIE,EF3,TIE,TIE,TIE
	DB 96,C3,TIE,D3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE,000
titlebar35
	DB 96,EF3,TIE,F3,TIE,G3,TIE,TIE,TIE
	DB 96,EF3,TIE,F3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE,000
titlebar36
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4
	db sno,sn4,12,c3		  
	db sno,sn3,c4
	db sno,sn5,C3
	db sno,sn3,c4

	db sno,sn5,12,c3		  
	db sno,sn3,c4
	db sno,sn5,C3
	db sno,sn3,c4
	db sno,sn5,c3		  
	db sno,sn5,c3
	db sno,sn2,G2
	db sno,sn5,c3
	db sno,sn4,c3		  
	db sno,sn5,c3
	db sno,sn2,G2
	db sno,sn5,c3,C3,C3,C3,6,C3,C3,0

titlebar37
 	DB SNO,SN4,48,C3,C3,C3,C3,0
titlebar38
	DB SNO,SN8
	db vib,24,10,40		;delay,speedofvib,valuetovib
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,C2
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,G1
	DB 96,F1,72,TIE,24,EF1,48,F1,C1,EF1,A1
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,C2
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,EF2
	DB 96,F2,72,TIE,24,A2,48,BF2,C3,24,BF2,A2,F2,BF1,0
 
titlebar39
	DB SNO,SN7
	DB 6
	DB C1,EF1,AF1,C1,EF1,AF1,EF1,AF1
	DB C2,EF1,AF1,C2,AF1,C2,EF2,AF1
	
	DB C2,EF2,C2,EF2,AF2,C2,EF2,AF2
	DB EF2,AF2,C3,EF2,AF2,C3,AF2,C3
	
	DB D3,F3,BF3,D3,F3,BF3,BF2,D3
	DB F3,BF2,D3,F3,F2,BF2,D3,F2
	DB BF2,D3,D2,F2,BF2,D2,F2,BF2
	DB BF1,D2,F2,BF1,D2,F2,F1,BF1,0    
titlebar40
	DB SNO,SN7
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1
	DB EF1,C2,G1,EF1,G1,EF1,C1,G1
	DB EF1,C1,G1,EF1,C1,G1,EF1,C1
	DB G1,EF1,C1,G1,EF1,C1,G1,EF1
	DB C1,G1,EF1,C1,G1,EF1,C1,G1,0
titlebar41
	DB SNO,SN7
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1,0

titlebar42
	DB SNO,SN7
	DB A3,F3,C3,A3,F3,C3,F3,C3
	DB A2,F3,C3,A2,C3,A2,F2,C3
	DB A2,F2,A2,F2,C2,A2,F2,C2
	DB F2,C2,A1,F2,C2,A1,C2,A1
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1,0
titlebar43
	DB PTP,0
	DB SNO,SN8
	db vib,24,10,40		;delay,speedofvib,valuetovib
	DB PTP,-12
	DB 96,C3,48,TIE,D3,EF3,F3,EF3,D3
	DB 72,EF3,D3,48,BF2,96,C3,TIE
	DB 96,C2,48,TIE,D2,EF2,D2,C2,BF1
	DB 96,C2,TIE,TIE,TIE
	DB SNO,SN6
	db	ecv,197,127,127	;249 = 1 45678 ;193
	db 	edl,12,255,1
	DB PTP,12,48,KYU
	DB 24,F2,XXX,F2,XXX,EF2
	DB F2,XXX,BF1,XXX,BF1,C2,D2,EF2,D2,XXX,XXX
	DB 24,F2,XXX,F2,XXX,EF2,BF2,XXX,A2,XXX,F2,XXX,XXX,XXX,KYU,KYU,KYU
	DB 24,F2,XXX,F2,XXX,EF2
	DB F2,XXX,BF1,XXX,BF1,C2,D2,EF2,D2,XXX,XXX
	DB 24,F2,XXX,F2,XXX,EF2,BF2,XXX,A2,XXX,F2,XXX,XXX,XXX,KYU,KYU,KYU,0

level1
	DW	level1_channels
	DW	255

level1_channels
	DW	level1Chan_SS1	;bass
	DW	level1Chan_SS2	;lead
	DW	level1Chan_SS3	;drums
	DW	level1Chan_SS4	;synth backing
	DW	level1Chan_SS8
	DW	level1Chan_SS8
	DW	level1Chan_SS8
	DW	level1Chan_SS8
level1Chan_SS1
	DB 	WAV,17
	DB	TP1,32	;27		; tempo
	DB	PV1,250		; part volume
	DB	SNO,SN1		; sound name
	DB	PAN,11	; panpot
	DB	PTP,-12		; key transpose
     
	;db	ecv,1,127,127
	;db 	edl,5,255,2

	DB	024,P80+V10			; step_time,gate_time,velocity
 	db 	ptp,0
	DB PAT,<tune1bar1,>tune1bar1,001	;g; pattern call
	db 	ptp,-4
	db pat,<tune1bar1,>tune1bar1,001	;d#
	db 	ptp,-7
	db pat,<tune1bar1,>tune1bar1,001	;c
	db 	ptp,0
	db pat,<tune1bar3,>tune1bar3,001 	;G*8 geff#
	db 	ptp,0
	DB PAT,<tune1bar1,>tune1bar1,001	;g; pattern call
	db 	ptp,-4
	db pat,<tune1bar1,>tune1bar1,001	;d#
	db 	ptp,0
	DB PAT,<tune1bar1,>tune1bar1,001	;g; pattern call
	db 	ptp,0
	db pat,<tune1bar4,>tune1bar4,001	;blank,g,g#,a
      	db 	ptp,000
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-5
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,0
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-5
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,2
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,0
	db pat,<tune1bar6,>tune1bar6,001	;pos9pat7	;blank,g,g#,a
	db 	ptp,0
	DB PAT,<tune1bar1,>tune1bar1,001	;bac to pos 2	;;g; pattern call
	db 	ptp,-4
	db pat,<tune1bar1,>tune1bar1,001	;d#
	db 	ptp,0
	DB PAT,<tune1bar1,>tune1bar1,001	;g; pattern call
	db 	ptp,0
	db pat,<tune1bar4,>tune1bar4,001	;blank,g,g#,a
      	db 	ptp,0
	db pat,<tune1bar5,>tune1bar5,001	;position12 pat 4 ;blank,g,g#,a
	db 	ptp,-5
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,2
	db pat,<tune1bar5,>tune1bar5,001	;posblank,g,g#,a
	db 	ptp,-3
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<tune1bar5,>tune1bar5,001	;blank,g,g#,a
	db 	ptp,0
	db pat,<tune1bar7,>tune1bar7,001	;pos17pat8	;blank,g,g#,a
	db	0

level1Chan_SS2
	DB	PV1,250		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot

	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,-12
	DB	SNO,SN6		; sound name
	db 	pat,<tune1bar8,>tune1bar8,004
	db 	pat,<tune1bar9,>tune1bar9,1
	db 	pat,<tune1bar10,>tune1bar10,1
	db 	sno,sn6
	db 	pat,<tune1bar9,>tune1bar9,1
	db 	pat,<tune1bar10,>tune1bar10,1
	db 	sno,sn6
	db 	pat,<tune1bar11,>tune1bar11,1
	db 	pat,<tune1bar12,>tune1bar12,1
	db 	pat,<tune1bar8,>tune1bar8,002
	db 	pat,<tune1bar9,>tune1bar9,1
	db 	pat,<tune1bar10,>tune1bar10,1
	db 	sno,sn6
	db 	pat,<tune1bar11,>tune1bar11,1
	db 	pat,<tune1bar12,>tune1bar12,1
	db 	pat,<tune1bar11,>tune1bar11,1
	db 	pat,<tune1bar13,>tune1bar13,1

	db	0

level1Chan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	pat,<tune1bar14,>tune1bar14,1
 	db 	pat,<tune1bar15,>tune1bar15,1
	db 	pat,<tune1bar16,>tune1bar16,5
 	db 	pat,<tune1bar15,>tune1bar15,1
	db 	pat,<tune1bar14,>tune1bar14,1
 	db 	pat,<tune1bar15,>tune1bar15,1
	db 	pat,<tune1bar16,>tune1bar16,3
 	db 	pat,<tune1bar15,>tune1bar15,1
	db 	pat,<tune1bar16,>tune1bar16,1
 	db 	pat,<tune1bar15,>tune1bar15,1

	db	0


level1Chan_SS4	    
	DB	PV1,190		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db	ecv,9,127,127
	db 	edl,12,255,1
	DB 	PAT,<tune1bar17,>tune1bar17,1
	DB 	PAT,<tune1bar18,>tune1bar18,1
	DB 	PAT,<tune1bar17,>tune1bar17,2
	DB 	PAT,<tune1bar19,>tune1bar19,1
	DB 	PAT,<tune1bar17,>tune1bar17,1
	DB 	PAT,<tune1bar19,>tune1bar19,1
	DB 	PAT,<tune1bar17,>tune1bar17,1
	DB 	PAT,<tune1bar20,>tune1bar20,1
	DB 	PAT,<tune1bar21,>tune1bar21,1
	DB 	PAT,<tune1bar17,>tune1bar17,1
	DB 	PAT,<tune1bar18,>tune1bar18,1
	DB 	PAT,<tune1bar19,>tune1bar19,1
	DB 	PAT,<tune1bar17,>tune1bar17,1
	DB 	PAT,<tune1bar18,>tune1bar18,1
	DB 	PAT,<tune1bar21,>tune1bar21,1
	DB 	PAT,<tune1bar18,>tune1bar18,1
	DB 	PAT,<tune1bar21,>tune1bar21,1

 	db	0

level1Chan_SS8
	DB	PV1,250		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V85		; step_time,gate_time,velocity
	db 	ptp,7
	DB 	PAT,<tune1bar2,>tune1bar2,051

tune1bar2
	;DB	c5,c5,c5,c5,c5,c5,c5,c5,c5,c5	
	db KYU,KYU,KYU,KYU,KYU,KYU,KYU,KYU
	DB	000
tune1bar4
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1	;120,kyu
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1	;120,kyu
	db g1,g1
	db g1,g1
 	db af1,af1
 	db af1,af1
 	db a1,a1
 	db a1,a1
	DB	000
tune1bar1
	db 6,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
 	DB	000
tune1bar3
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
 	db e1,e1
 	db e1,e1
 	db  f1,f1
 	db  f1,f1
 db gf1,gf1
 db gf1,gf1
	DB	000
tune1bar5
	db bf1,bf1,bf1,bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1
	db bf1,000
tune1bar6
 	db d1,d1,d1,d1,d1,d1,d1
 	db d1,d1,d1,d1,d1,d1,d1,d1,d1
	db a1,a1,a1
	db a1,a1,a1
	db bf1,bf1
	db bf1,bf1
 	db a1,a1
 	db a1,a1
	db g1
	db g1
	db  000
tune1bar7
	db d1,d1,d1,d1,d1,d1,d1,d1
	db d1,d1,d1,d1,d1,d1,d1,d1
	db a1,a1,a1
	db a1,a1,a1
	db bf1,bf1
	db bf1,bf1
	db c2,c2,c2,c2,d2,d2,000	
tune1bar8
	db vib,18,40,60		;delay,speedofvib,valuetovib
	db 024,kyu
	;db ev2,60,127,0 
	db g2,12,f2,024,g2,bf2,12,bf2,g2,d2,f2,36,g2
	db 24,kyu
	;db ev2,60,0,127 
	db 024,g2,012,f2,024,g2,24,df3,012,df3,c3,bf2,c3,36,bf2,000
tune1bar9
	db sno,sn6
	db 012,d3,ef3,d3,c3,bf2,c3,d3,024,bf2,012,bf2,024,bf2,c3,d3,36,f3
	db 012,c3,120,c3,24,xxx,000	;144,c3
tune1bar10
	db 012,bf3,a3,g3,f3,g3,a3,bf3,24,g3,12,g3,24,g3,a3,bf3,36,bf3
	db 12,g3,60,g3,24
	db sno,sn15,g4,d4,bf3,12,g3,000
tune1bar11
	;db sno,sn6
 	db 12,ef3,d3,c3,d3,ef3,g3,f3,36,ef3,24,ef3,f3,g3,12,ef3,d3,c3,bf2,c3,d3,ef3,24,d3,12,g2,72,g2,000
tune1bar12
	db 012,ef3,d3,c3,d3,ef3,g3,f3,36,ef3,24,ef3,f3,g3,12,bf3,a3,g3,f3,g3,a3,bf3
	db 24,a3,12,a3,a3,bf3,bf3,a3,a3,g3,000
tune1bar13
	db 12,ef3,d3,c3,d3,ef3,g3,f3,36,ef3,24,ef3,f3,g3,12,bf3,a3,g3,f3
	db g3,a3,bf3,24,a3,12,a3,a3,bf3,bf3,c3,c3,d3,000
tune1bar14
	db sno,sn14,24,kyu,48,c3,c3,c3,12,c3,sno,sn13,12,c3,24,c3
	db sno,sn14,24,c3,sno,sn13,c3
	db sno,sn14,24,c3,sno,sn13,c3
	db sno,sn14,24,c3,sno,sn13,c3
	db sno,sn14,24,c3,000
tune1bar15
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,12,sno,sn14,c3,6,c3,c3,12,c3,6,c3,c3,12
	db c3,6,c3,c3,000
tune1bar16
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,24,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,24,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,24,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,c3,c3,000
tune1bar17
	db sno,sn7
	db pan,0,6,g2,d3,pan,1,g3,g2,pan,2,d3,g3,pan,3,g2,d3,pan,4,bf3,g2,pan,5,d3,a3,pan,6,g2,d3,pan,7,g3,g2
	db pan,8,6,g2,d3,pan,9,g3,g2,pan,10,d3,g3,pan,11,g2,d3,pan,12,bf3,g2,pan,13,d3,a3,pan,14,g2,d3,pan,15,g3,g2
	db pan,16,6,g2,ef3,pan,17,g3,g2,pan,18,ef3,g3,pan,19,g2,ef3,pan,20,bf3,g2,pan,19,ef3,a3,pan,18,g2,pan,17,ef3,pan,16,g3,g2
	db pan,15,6,g2,pan,14,ef3,pan,13,g3,pan,12,g2,pan,11,ef3,pan,10,g3,pan,9,g2
	db pan,8,ef3,pan,7,bf3,pan,6,g2,pan,5,ef3,pan,4,a3,pan,3,g2
	  db pan,2,ef3,pan,1,g3,pan,0,g2
	db 000
tune1bar18
	;db sno,sn10
	db pan,0,6,g2,c3,pan,1,g3,g2,pan,2,c3,g3,pan,3,g2,c3,pan,4,bf3,g2,pan,5,c3,a3,pan,6,g2,c3,pan,7,g3,g2
	db pan,8,6,g2,c3,pan,9,g3,g2,pan,10,c3,g3,pan,11,g2,c3,pan,12,bf3,g2,pan,13,c3,a3,pan,14,g2,c3,pan,15,g3,g2
	db pan,16,6,g2,d3,pan,17,g3,g2,pan,18,d3,g3,pan,19,g2,d3,pan,20,bf3,g2,pan,19,d3,a3,pan,18,g2,pan,17,d3,pan,16,g3,g2
	db pan,15,6,g2,pan,14,d3,pan,13,g3,pan,12,g2,pan,11,e2,pan,10,b2
 	db pan,9,e3,pan,8,e2,pan,7,f2,pan,6,c3,pan,5,f3,pan,4,f2,pan,3,gf2
	db pan,2,df3,pan,1,gf3,pan,0,gf2
	db 000			   
tune1bar19
	;db sno,sn5
	db pan,0,6,bf1,f2,pan,1,bf2,bf1,pan,2,f2,bf2,pan,3,bf1,f2,pan,4,d3,bf1,pan,5,f2,c3,pan,6,bf1,f2,pan,7,bf2,bf1
	db pan,8,6,bf1,f2,pan,9,bf2,bf1,pan,10,f2,bf2,pan,11,bf1,f2,pan,12,d3,bf1,pan,13,f2,c3,pan,14,bf1,f2,pan,15,bf2,bf1
	db pan,16,6,f2,c3,pan,17,f3,f2,pan,18,c3,f3,pan,19,f2,c3,pan,20,a3,f2,pan,19,c3,g3,pan,18,f2,pan,17,c3,pan,16,f3,f2

	db pan,15,6,f2,pan,14,c3,pan,13,f3,pan,12,f2,pan,11,c3,pan,10,f3,pan,9,f2
	db pan,8,c3,pan,7,a3,pan,6,f2,pan,5,c3,pan,4,g3,pan,3,f2
	 db pan,2,c3,pan,1,f3,pan,0,f2
       	db 000			
tune1bar20
	;db sno,sn5
	db pan,0,6,g2,c3,pan,1,g3,g2,pan,2,c3,g3,pan,3,g2,c3,pan,4,bf3,g2,pan,5,c3,a3,pan,6,g2,c3,pan,7,g3,g2
	db pan,8,6,g2,c3,pan,9,g3,g2,pan,10,c3,g3,pan,11,g2,c3,pan,12,bf3,g2,pan,13,c3,a3,pan,14,g2,c3,pan,15,g3,g2
	db pan,16,6,g2,d3,pan,17,g3,g2,pan,18,d3,g3,pan,19,g2,d3,pan,20,bf3,g2,pan,19,d3,a3,pan,18,g2,pan,17,d3,pan,16,g3,g2
	db pan,15,6,g2,pan,14,d3,pan,13,g3,pan,12,g2,pan,11,d3,pan,10,g3
 	db pan,9,g2,pan,8,d3,pan,7,bf3,pan,6,g2,pan,5,d3,pan,4,a3,pan,3,g2
	db pan,2,d3,pan,1,g3,pan,0,g2
	db 000			   
tune1bar21
	;db sno,sn5
	db pan,0,6,g2,ef3,pan,1,g3,g2,pan,2,ef3,g3,pan,3,g2,ef3,pan,4,bf3,g2,pan,5,ef3,a3,pan,6,g2,ef3,pan,7,g3,g2
	db pan,8,6,g2,ef3,pan,9,g3,g2,pan,10,ef3,g3,pan,11,g2,ef3,pan,12,bf3,g2,pan,13,ef3,a3,pan,14,g2,ef3,pan,15,g3,g2
	db pan,16,6,a2,d3,pan,17,g3,a2,pan,18,d3,g3,pan,19,a2,d3,pan,20,bf3,a2,pan,19,d3,a3,pan,18,a2,pan,17,d3,pan,16,g3,a2
	db pan,15,6,a2,pan,14,d3,pan,13,a3,pan,12,a2,pan,11,d3,pan,10,a3
 	db pan,9,a2,pan,8,d3,pan,7,c4,pan,6,a2,pan,5,d3,pan,4,bf3,pan,3,a2
	db pan,2,d3,pan,1,a3,pan,0,a2
	db 000			   

level2
	DW	level2_channels
	DW	255

level2_channels
	DW	level2Chan_SS1	;guitar
	DW	level2Chan_SS2	;bass
	DW	level2Chan_SS3	;drums
	DW	level2Chan_SS4	;lead
	DW	level2Chan_SSx	;
	DW	level2Chan_SSx	;
	DW	level2Chan_SSx	;  
	DW	level2Chan_SSx	;
level2Chan_SSX
	DB PAT,<level2bar2,>level2bar2,51,0
level2Chan_SS1
	db      mv1,155
	DB 	WAV,17
	DB	TP1,35	;27		; tempo
	DB	PV1,255		; part volume
	DB	PAN,11	; panpot
	db	ecv,1,50,127	;249 = 1 45678 ;193
	db 	edl,1,255,2
	DB	024,P80+V99			; step_time,gate_time,velocity
 	db 	ptp,-12
	db 	sno,sn1
	db 	vib,24,15,40
    	db 	pat,<level2bar1,>level2bar1,4
	db 	pat,<level2bar10,>level2bar10,1
    	db 	pat,<level2bar1,>level2bar1,2
    	db 	pat,<level2bar9,>level2bar9,2
    	db 	pat,<level2bar1,>level2bar1,4
    	db 	pat,<level2bar1,>level2bar1,2
    	db 	pat,<level2bar9,>level2bar9,2
  	db 	pat,<level2bar14,>level2bar14,2
	db ptp,-10
	db	pat,<level2bar9,>level2bar9,1 
	db 0
level2Chan_SS2
	DB	PV1,200		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
 	db 	ptp,-12
	db 	sno,sn2
	db 	pat,<level2bar2,>level2bar2,1
	db 	pat,<level2bar1,>level2bar1,3
	;****************************
	db 	pat,<level2bar2,>level2bar2,1
	db  	pat,<level2bar1,>level2bar1,3
	db 	pat,<level2bar12,>level2bar12,2
	db  	pat,<level2bar1,>level2bar1,2
	db  	pat,<level2bar1,>level2bar1,2
	db  	pat,<level2bar1,>level2bar1,2
	db 	pat,<level2bar12,>level2bar12,2
	db 	ptp,-10
	db 	pat,<level2bar1,>level2bar1,2
	db 	pat,<level2bar12,>level2bar12,1 
	db	0

level2Chan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,-2		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	sno,sn3
	db 	pat,<level2bar2,>level2bar2,2
	db 	pat,<level2bar3,>level2bar3,7
	db 	sno,sn4
	db 	pat,<level2bar3,>level2bar3,1

	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1	
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1	
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1	
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	
	db 	pat,<level2bar5,>level2bar5,2	
	db 	pat,<level2bar6,>level2bar6,2	
	db 	pat,<level2bar5,>level2bar5,2	
	db 	pat,<level2bar6,>level2bar6,2	
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1

	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1	
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	
	db 	pat,<level2bar5,>level2bar5,2	
	db 	pat,<level2bar6,>level2bar6,2	
	db 	pat,<level2bar5,>level2bar5,2	
	db 	pat,<level2bar6,>level2bar6,2	

	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	db 	pat,<level2bar5,>level2bar5,3	
	db 	pat,<level2bar6,>level2bar6,1
	db 	sno,sn4
	db 	pat,<level2bar5,>level2bar5,2	
	db 	pat,<level2bar3,>level2bar3,2
	db	0

level2Chan_SS4	    
	DB	PV1,250		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85 
	db 	pat,<level2bar2,>level2bar2,3	;pos 0
	db	sno,sn5
	db 	pat,<level2bar4,>level2bar4,3
	db 	pat,<level2bar3,>level2bar3,1
	db ptp,0
	db 	pat,<level2bar2,>level2bar2,1	;pos 0
	db 	pat,<level2bar7,>level2bar7,1	;pos 0
	db 	pat,<level2bar8,>level2bar8,2	;pos 0
	db 	pat,<level2bar13,>level2bar13,2
	db 	pat,<level2bar8,>level2bar8,2	;pos 0
	db 	pat,<level2bar2,>level2bar2,2;pos 0
	db 	pat,<level2bar8,>level2bar8,2	;pos 0
	db 	pat,<level2bar13,>level2bar13,2
	db 	pat,<level2bar15,>level2bar15,1
	db 	pat,<level2bar16,>level2bar16,1
	db 0
level2bar2
	db 96,kyu,kyu,kyu,kyu,0
level2bar4
	db 48,c3,12,c3,36,c3,0	
level2bar1
	db 12,c2,c2,c2,24,bf1,c2,12,bf1,24,af1,c2,g1,bf1
	db 12,c2,c2,c2,24,bf1,c2,12,bf1,24,af1,c2,g1,f1,0
level2bar3
	db 6,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,0
level2bar5
	db sno,sn5,24,c3,sno,sn4,c3,sno,sn5,12,c3,c3,sno,sn4,24,c3,0
level2bar6
	db sno,sn5,24,c3,sno,sn4,c3,sno,sn5,12,c3,sno,sn4,c3,c3,6,c3,c3,0
level2bar7	
	db sno,sn6
	db 96,xxx,xxx,xxx,84,xxx,24,c3,0
level2bar8
	db 12,bf2,c3,d3,ef3,f3,ef3,36,c3,24,g2,bf2,36,c3
	db 12,ef3,d3,ef3,d3,c3,bf2,24,c3,12,bf2,24,g3,12,f3,ef3,d3,24,c3,0
level2bar9
	db 24,f1,12,ef1,60,f1
	db 24,g1,12,f1,60,g1
	db 24,af1,12,g1,60,af1
	db 24,bf1,12,af1,60,bf1,0
level2bar10
	db 72,c2,24,bf1
	db 72,c2,24,bf1
	db 72,c2,24,bf1
	db 72,c2,24,bf1
	db 96,c2,tie,kyu,kyu,0
level2bar11
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2,0
level2bar12
	db 12,f1,f1,f1,f1,f1,f1,f1,f1,g1,g1,g1,g1,g1,g1,g1,g1
	db af1,af1,af1,af1,af1,af1,af1,af1,bf1,bf1,bf1,bf1,bf1,bf1,bf1,bf1
 	db 0
level2bar13					  ;SWS - BENDONDOWN
	db 12,bf2,c3,d3,ef3,f3,ef3,24,c3
	db 12,f3,ef3,f3,gf3,f3,24,ef3
	db 12,c3,ef3,d3,ef3,d3,c3,bf2,24,c3,12,bf2,24,g3,12,f3,ef3,d3,24,c3,000
level2bar14
	db 24,d2,12,d2,b1,d2,24,d2,60,bf1,48,c2
	db 24,d2,12,d2,b1,d2,24,d2,60,bf1,48,a1,0
level2bar15
	db 12,c3,d3,e3,f3,g3,f3,24,d3
	db 12,g3,f3,g3,af3,g3,24,f3
	db 12,d3,f3,e3,f3,e3,d3,c3
	db 24,d3,12,c3,24,a3,12,g3,f3,e3,24,d3
	db 12,c3,d3,e3,f3,g3,f3,24,d3
	db 12,g3,f3,g3,af3,g3,24,f3
	db 12,d3,f3,e3,f3,e3,d3,c3
	db 24,d3,12,c3,24,a3,12,g3,f3,e3,d3,0
level2bar16
 	db 12,d3,6,e3,f3,12,e3,d3,6,e3,f3,12,e3,d3,6,e3,f3
	db 12,e3,d3,6,e3,f3,12,e3,d3,6,f3,e3,12,f3,d3
	db 12,d3,6,f3,e3,12,f3,d3,6,g3,f3,12,g3,d3,6,a3,g3
	db 12,a3,d3,6,a3,bf3,12,a3,d3,6,c3,d3,12,c3,6,d3,d3,0
level2bar17
			

level3
	DW	level3_channels
	DW	255

level3_channels
	DW	level3Chan_SS1	;bass
	DW	level3Chan_SS2	;tinklies
	DW	level3Chan_SS3	;drums
	DW	level3Chan_SS4	;
	DW	level3Chan_SS8
	DW	level3Chan_SS8
	DW	level3Chan_SS8
	DW	level3Chan_SS8
level3Chan_SS1
	DB 	WAV,17
	DB	TP1,32	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	DB	PTP,-12		; key transpose
   	db	ecv,11,127,127
	db 	edl,12,255,1
	DB	024,P80+V10			; step_time,gate_time,velocity
   	db 	pat,<level3bar1,>level3bar1,15
;******************************	
 	db 	ptp,-9
   	db 	pat,<level3bar1,>level3bar1,3
 	db 	ptp,-12
   	db 	pat,<level3bar1,>level3bar1,4


level3Chan_SS2
	DB	PV1,150		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot

	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,12
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,2	;dfbf
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,2	;dfbf
;******************************	
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,2	;dfbf
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,2	;dfbf
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,2	;dfbf
;******************************	
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,2	;dfbf
	db 	pat,<level3bar10,>level3bar10,1	;solobit
	db 	pat,<level3bar3,>level3bar3,2	;df#a
	db 	pat,<level3bar4,>level3bar4,2	;ceg
;******************************	
	db 	pat,<level3bar5,>level3bar5,2	;dgb
	db 	pat,<level3bar6,>level3bar6,1	;dfbf
	db 	pat,<level3bar4,>level3bar4,1	;ceg

	db 	pat,<level3bar12,>level3bar12,2	;cfa
	db 	pat,<level3bar13,>level3bar13,2	;d#ga#
	db 	pat,<level3bar12,>level3bar12,2	;cfa
	db 	pat,<level3bar3,>level3bar3,4	;d#ga#
	db 	ptp,10,pat,<level3bar13,>level3bar13,2,ptp,12
	db 	pat,<level3bar12,>level3bar12,2	;cfa
	db 	pat,<level3bar13,>level3bar13,2	;d#ga#

	db	0

level3Chan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db pat,<level3bar7,>level3bar7,22
	db	0


level3Chan_SS4	    
	DB	PV1,255		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db ptp,-12
	db pat,<level3bar2,>level3bar2,2
	db pat,<level3bar8,>level3bar8,1
	db pat,<level3bar9,>level3bar9,1
	db pat,<level3bar11,>level3bar11,1
	db pat,<level3bar2,>level3bar2,4
	db pat,<level3bar14,>level3bar14,1
	db pat,<level3bar2,>level3bar2,1
	db pat,<level3bar15,>level3bar15,1
 	db	0

level3Chan_SS8
	DB	PV1,250		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V85		; step_time,gate_time,velocity
	db 	ptp,7
	DB 	PAT,<level3bar2,>level3bar2,051

level3bar2	db 96,KYU,KYU,KYU,KYU
	DB 000
level3bar1	db sno,sn2
	db 12,d2,d2,f2,d2,g2,d2,af2,a2
	db d2,d2,f2,d2,c2,a1,c2,df2
	db d2,d2,f2,d2,g2,d2,af2,a2
	db d2,d2,f2,d2,c2,a1,c2,df2,0
level3bar3 	db sno,sn3,6
	db d1,gf1,a1,d2,gf2,a2,d3,gf3,a3,gf3,d3,a2,gf2,d2,a1,gf1,0
level3bar4	db c1,e1,g1,c2,e2,g2,c3,e3,g3,e3,c3,g2,e2,c2,g1,e1,0
level3bar5	db d1,g1,b1,d2,g2,b2,d3,g3,b3,g3,d3,b2,g2,d2,b1,g1,0
level3bar6	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1,0
level3bar7	db sno,sn5,24,c3
	db sno,sn4,24,c3
	db sno,sn5,12,c3,c3
	db sno,sn4,24,c3
	db sno,sn5,12,c3,c3
	db sno,sn4,12,c3
	db sno,sn5,24,c3,12,c3
	db sno,sn4,24,c3
	db sno,sn5,24,c3
	db sno,sn4,24,c3
	db sno,sn5,12,c3,c3
	db sno,sn4,24,c3
	db sno,sn5,12,c3,c3
	db sno,sn4,12,c3
	db sno,sn5,24,c3,12,c3
	db sno,sn4,12,c3,6,c3,c3,0
level3bar8
	db vib,12,20,30
	db sno,sn6,24
	db d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2
	db 12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2
	db 36,c2,12,b1,c2,c2,24,df2,36,d2,0
level3bar9
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2
 	db 36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2
 	db 12,d2
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,60,d3
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,d3,c3,g2,a2,c3
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,60,d3
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,d3,c3,g2,a2,c3,0
level3bar10
	db 6
	db a3,gf3,d3,gf3,d3,a2,d3,a2
	db gf2,a2,gf2,d2,gf2,d2,a1,d2
	db a1,gf1,a1,gf1,d1,gf1,d1,a0,48,d1
	db 6
	db g3,e3,c3,e3,c3,g2,c3,g2
	db e2,g2,e2,c2,e2,c2,g1,c2
	db g1,e1,g1,e1,c1,e1,c1,g0,48,c1,0
level3bar11
	db 24,d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,12,d2,0
level3bar12
	db c1,f1,a1,c2,f2,a2,c3,f3,a3,f3,c3,a2,f2,c2,a1,f1,0
level3bar13 	db ef1,g1,bf1,ef2,g2,bf2,ef3,g3,bf3,g3,ef3,bf2,g2,ef2,bf1,g1
	db 0
level3bar14
	db 24,f2,12,c2,c2,ef2,24,f2,36,f2,12,d2,d2,ef2,24,af2,36,f2,12,c2,c2,ef2,24,ef2,36,ef2,12,d2,ef2,ef2,24,e2,36,f2
	db 12,c2,c2,ef2,24,f2,36,f2,12,d2,d2,ef2,24,af2,36,f2,12,c2,c2,ef2,24,ef2,36,ef2,12,d2,ef2,ef2,24,e2,12,f2,0
level3bar15
	db 24,d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,12,d2
	db 24,d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,12,d2
	db 96,kyu,kyu,kyu,kyu,0






level4
	DW	level4_channels
	DW	255

level4_channels
	DW	level4Chan_SS1	;TINLKY1
	DW	level4Chan_SS2	;DRUMS
	DW	level4Chan_SS3	;BASS
	DW	level4Chan_SS4	;LEAD
	DW	level4Chan_SS8
	DW	level4Chan_SS8
	DW	level4Chan_SS8
	DW	level4Chan_SS8
level4Chan_SS1
	DB 	WAV,17
	db 	mv1,255
	DB	TP1,32	;27		; tempo
	DB	PV1,220		; part volume
	DB	PAN,11	; panpot
	DB	PTP,12	; key transpose
   	db	ecv,9,127,127
	db 	edl,15,255,1
	DB	24,P80+V99			; step_time,gate_time,velocity
   	db 	pat,<level4bar1,>level4bar1,3
   	db 	pat,<level4bar3,>level4bar3,1
;******************************	
	DB PTP,-12
   	db 	pat,<level4bar4,>level4bar4,2
   	db 	pat,<level4bar5,>level4bar5,1
   	db 	pat,<level4bar4,>level4bar4,2
   	db 	pat,<level4bar6,>level4bar6,1
   	db 	pat,<level4bar7,>level4bar7,1
       	db  Ecv,11,127,127
   	db 	pat,<level4bar8,>level4bar8,4
	DB EOF
	DB ECV,9,127,127
   	db 	pat,<level4bar9,>level4bar9,1
   	db 	pat,<level4bar2,>level4bar2,7
   	db 	pat,<level4bar10,>level4bar10,2
   	db 	pat,<level4bar11,>level4bar11,1
   	db 	pat,<level4bar4,>level4bar4,2
   	db 	pat,<level4bar5,>level4bar5,1
   	db 	pat,<level4bar4,>level4bar4,2
   	db 	pat,<level4bar6,>level4bar6,1
   	db 	pat,<level4bar9,>level4bar9,1
   	db 	pat,<level4bar1,>level4bar1,1
	db 0


level4Chan_SS2
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot

	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,0
 	DB PAT,<level4bar12,>level4bar12,12
 	DB PAT,<level4bar13,>level4bar13,1
 	DB PAT,<level4bar14,>level4bar14,6
	DB PAT,<level4bar15,>level4bar15,1
	DB PTP,12
	DB PAT,<level4bar16,>level4bar16,2
	DB PTP,0,PAT,<level4bar17,>level4bar17,1
	DB PTP,0
	DB PAT,<level4bar12,>level4bar12,2
	DB PAT,<level4bar18,>level4bar18,38

 	DB PAT,<level4bar14,>level4bar14,6
 	DB PAT,<level4bar12,>level4bar12,8
	db	0

level4Chan_SS3
	DB	PV1,230		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	DB PAT,<level4bar2,>level4bar2,1
	DB PAT,<level4bar19,>level4bar19,2
	DB PAT,<level4bar20,>level4bar20,3
	DB PAT,<level4bar21,>level4bar21,2
	DB PAT,<level4bar20,>level4bar20,2
	DB PAT,<level4bar21,>level4bar21,2
	DB PAT,<level4bar20,>level4bar20,5
	   
	DB PTP,-12
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-7
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-12
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-7
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-12
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-7
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-12
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-7
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-12
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-7
	DB PAT,<level4bar24,>level4bar24,2
	DB PTP,-12
	DB PAT,<level4bar20,>level4bar20,2
	DB PAT,<level4bar21,>level4bar21,2
	DB PAT,<level4bar20,>level4bar20,2
	DB PAT,<level4bar21,>level4bar21,2
	DB PAT,<level4bar25,>level4bar25,1
	DB PAT,<level4bar2,>level4bar2,1
	db	0
	


level4Chan_SS4	    
	DB	PV1,200		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db      ptp,12
	DB PAT,<level4bar2,>level4bar2,2
	DB SNO,SN3,6
	DB PAT,<level4bar8,>level4bar8,4
	DB PAT,<level4bar26,>level4bar26,2
	DB PAT,<level4bar8,>level4bar8,2
	DB PAT,<level4bar26,>level4bar26,2
   	db 	pat,<level4bar1,>level4bar1,5
	DB PAT,<level4bar25,>level4bar25,1
	DB PAT,<level4bar2,>level4bar2,3
	DB PAT,<level4bar27,>level4bar27,3
	DB PAT,<level4bar8,>level4bar8,2
	DB PAT,<level4bar26,>level4bar26,2
	DB PAT,<level4bar8,>level4bar8,2
	DB PAT,<level4bar26,>level4bar26,2
   	db 	pat,<level4bar1,>level4bar1,1
	DB PAT,<level4bar2,>level4bar2,1
	
 	db	0

level4Chan_SS8
	DB	PV1,250		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V85		; step_time,gate_time,velocity
	db 	ptp,7
	DB 	PAT,<level4bar2,>level4bar2,051

level4bar2	db 96,KYU,KYU,KYU,KYU
	DB 000
level4bar1	db sno,sn3
	db 6
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1
	db ef1,g1,bf1,ef2,g2,bf2,ef3,g3,bf3,g3,ef3,bf2,g2,ef2,bf1,g1
	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1,0
level4bar3	db 6,c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1
	db ef1,g1,bf1,ef2,g2,bf2,ef3,g3,bf3,g3,ef3,bf2,g2,ef2,bf1,g1
	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1
	DB PTP,-12
	db sno,sn1,24,g3,ef3,c3,g2,0
level4bar4
	db sno,sn1
	db 12,c3,g2,6,bf2,12,c3,ef3,6,ef3,12,d3,c3,bf2
	db ef3,bf2,ef3,6,g2,54,bf2
	db 12,f3,d3,f3,6,g3,18,af3,12,g3,f3,ef3,g3,ef3,d3,6,ef3,54,c3,0
level4bar5
	db 36,af2,24,ef3,12,d3,6,c3,d3,12,af2,36,bf2
	db 24,f3,12,ef3,6,d3,ef3,12,f3
	db 36,c3,24,af3,12
	db g3,6,f3,g3,12,ef3,d3,d3,d3,ef3,f3,ef3,d3,bf2,0
level4bar6
	db 72,af2,24,ef3,72,bf2,24,ef3,72,af2,24,ef3
	db 6,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,g3,bf2,f3,bf2,0
level4bar7
	db 6,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,af3,ef3,g3,ef3
	db g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,af3,bf2,g3,bf2
	db f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,g3,bf2,f3,bf2
	db 24,g3,ef3,d3,ef3,0

level4bar8
	db 6,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,af3,ef3,g3,ef3
	db g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,af3,bf2,g3,bf2
	db f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,g3,bf2,f3,bf2
	db 6,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,af3,ef3,g3,ef3
	db 0
level4bar9
	DB 96,C3,KYU,KYU,KYU,0
level4bar10
	DB 12,C3,G2,BF2,6,C3,12,EF3,6,EF3,12,D3,C3,BF2
	DB EF3,BF2,EF3,6,G2,54,BF2,0
level4bar11
	DB 12,F3,C3,6,EF3,12,F3,AF3,6,AF3,12,G3,F3,EF3
	DB 12,F3,C3,6,EF3,12,F3,AF3,6,AF3,12,G3,F3,EF3
	DB 12,F3,C3,6,EF3,12,F3,AF3,6,AF3,12,G3,F3,AF3
	DB 6
	DB C4,C3,C3,C4,C3,C3,C4,C3,C3,C4,C3,C3,BF3,BF2,AF3,AF2,0
level4bar12
	DB SNO,SN4,6,C4,C4,C3,C4,C4,C4,C3,C4,C4,C4,C3,C4,C4,C4,C3,C4,0
level4bar13
	DB SNO,SN6,6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4

	DB SNO,SN5,6,C3,SNO,SN4,C4
	DB SNO,SN5,6,C3,SNO,SN4,C4
	DB SNO,SN5,6,C3,C3,SNO,SN4,C4
	DB SNO,SN5,6,C3,SNO,SN4,C4
	DB SNO,SN5,6,C3,SNO,SN4,C4
	DB SNO,SN5,6,C3,C3,SNO,SN4,C4
	DB SNO,SN5,6,C3,C3,0
level4bar14
	DB SNO,SN6,6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4

	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
 
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4

	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,SNO,SN5,C3,C3,0

level4bar15
	DB SNO,SN6,6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4

	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
 
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN6,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,C3,SNO,SN4,C4,C4,C4
	DB SNO,SN5,24,C3,C3,12,C3,C3,6,C3,12,C3,6,C3,0
level4bar16
	DB SNO,SN3,6
	DB G3,EF3,C3,G2,EF2,C2,G1,EF1,C1,EF1,G1,C2,EF2,G2,C3,EF3
	DB BF3,G3,EF3,BF2,G2,EF2,BF1,G1,EF1,G1,BF1,EF2,G2,BF2,EF3,G3
	DB BF3,F3,D3,BF2,F2,D2,BF1,F1,D1,F1,BF1,D2,F2,BF2,D3,F3
	DB G3,EF3,C3,G2,EF2,C2,G1,EF1,C1,EF1,G1,C2,EF2,G2,C3,EF3,000
level4bar17
	DB SNO,SN1
	DB 36,C2,BF1,24,G1,48,BF1,C2,36,D2,C2,24,BF1,96,C2
	DB 36,C2,BF1,24,G1,48,BF1,G1,36,BF1,F1,24,EF1,96,C1,0 
level4bar18
	DB SNO,SN6,24,C3,C3,12,C3,SNO,SN5,C3,SNO,SN6,C3,SNO,SN5,C3,0
level4bar19
	DB SNO,SN3,12,G2,G2,24,EF2,C2,12,EF2,24,G2,12,G2,24,EF2,48,BF1
	DB 12,F2,F2,24,D2,BF1,12,G1,108,C2,0
level4bar20
	DB SNO,SN2,6,PTP,-12
	DB C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,C3,C2
	DB EF2,EF3,EF2,EF2,EF3,EF2,EF2,EF3,EF2,EF3,EF3,EF2,EF3,EF2,EF3,EF2
	DB BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1
	DB C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,C3,C2,0
level4bar21
	DB AF1,AF2,AF1,AF1,AF2,AF1,AF1,AF2,AF1,AF2,AF2,AF1,AF2,AF1,AF2,AF1
	DB BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1,0

level4bar22
level4bar23
	DB SNO,SN2,12,PTP,-12
	DB C2,C2,C2,C2,C2,C2,C2,C2,EF2,EF2,EF2,EF2,EF2,EF2,EF2,EF2
	DB BF1,BF1,BF1,BF1,BF1,BF1,BF1,BF1,C2,C2,C2,C2,C2,C2,C2,C2,0
level4bar24
	DB 6,C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,D3,D2
	DB EF2,EF3,EF2,EF2,EF3,EF2,EF2,EF3,D2,D3,EF3,EF2,D3,D2,BF2,BF1,0
	;DB 12,C2,C2,C2,C2,C2,C2,C2,D2,EF2,EF2,EF2,EF2,D2,EF2,D2,BF1,0

level4bar25
	db 96,c2,kyu,kyu,kyu,000
level4bar26
	DB AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,BF3,C3,AF3,C3
	DB F3,D3,BF2,F3,D3,BF2,F3,D3,BF2,F3,D3,BF2,G3,BF2,F3,BF2,0	 
level4bar27
	DB 6
	DB G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,AF3,C3,G3,C3
	DB G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,AF3,BF2,G3,BF2
	DB G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,AF3,C3,G3,C3
	DB G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,AF3,BF2,G3,BF2

	DB AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,BF3,C3,AF3,C3
	DB AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,BF3,C3,AF3,C3
	DB AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,BF3,C3,AF3,C3
	DB AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,BF3,C3,AF3,C3,0

fanf1
	DW	fanf1_channels
	DW	000

fanf1_channels
	DW	fanf1Chan_SS1	;
	DW	fanf1Chan_SS2	;
	DW	fanf1Chan_SS3	;
	DW	fanf1Chan_SS4	;
	DW	fanf1Chan_SS5
	DW	fanf1Chan_SS6
	DW	fanf1Chan_SS7
	DW	fanf1Chan_SS8
fanf1Chan_SS1
	DB 	WAV,17
	db 	mv1,255
	DB	TP1,22	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	;DB	PTP,-24	; key transpose
   	db	ecv,15,80,127
	db 	edl,12,155,1
	DB	24,P80+V99			; step_time,gate_time,velocity
	db ptp,12
	db 	pat,<fanf1bar1,>fanf1bar1,1

	db 0


fanf1Chan_SS2
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
	db ptp,12
	db pat,<fanf1bar3,>fanf1bar3,1
	db	0

fanf1Chan_SS3
	DB	PV1,230		; part volume
	DB	PAN,011		; panpot
	DB	PTP,12		; key transpose
	DB	024,P90+V99 
	db pat,<fanf1bar4,>fanf1bar4,1			; step_time,gate_time,velocity
	db	0
	

fanf1Chan_SS4	    
	DB	PV1,200		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db      ptp,12
	db pat,<fanf1bar5,>fanf1bar5,1			; step_time,gate_time,velocity
	db 0
fanf1Chan_SS5
	DB	TP1,22	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	DB	24,P80+V80			; step_time,gate_time,velocity
	db ptp,0
	db 	pat,<fanf1bar1,>fanf1bar1,1
	db 0
fanf1Chan_SS6
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<fanf1bar3,>fanf1bar3,1
	db	0
fanf1Chan_SS7
	DB	PV1,230		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V80 
	db pat,<fanf1bar4,>fanf1bar4,1			; step_time,gate_time,velocity
	db	0
fanf1Chan_SS8
	DB	PV1,250		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V85		; step_time,gate_time,velocity
	db 	ptp,7
	DB 	PAT,<fanf1bar2,>fanf1bar2,051

fanf1bar2
	db 96,xxx,xxx,xxx,xxx,0
fanf1bar1
	db sno,sn3
	db vib,6,20,40
	db 12,c2,6,c2,c2,36,c2,6,c2,c2,12,g1,c2,e2
	db 6,e2,e2,36,e2,6,e2,e2,12,c2,e2,g2,6,g2,g2,12,f2,6,f2,f2,12,e2,6,e2,e2,12,d2
	db 6,d2,d2,12,c2,g1,c2,g1,96,c1,kyu,kyu,xxx,xxx,0
fanf1bar3
	db sno,sn3,vib,6,20,40
	db 12,e2,6,e2,e2,36,e2,6,e2,e2,12,c2,e2
	db 12,g2,6,g2,g2,36,g2,6,g2,g2,12,e2,g2
	db 12,c3,6,c3,c3,12,a2,6,a2,a2,12,g2,6,g2,g2,12,f2,6,f2,f2
	db 12,e2,c2,e2,c2,96,g1,kyu,kyu,xxx,xxx,0
fanf1bar4
	db sno,sn3,vib,6,20,40
	db 12,g2,6,g2,g2,36,g2,6,g2,g2,12,e2,g2
	db 12,c3,6,c3,c3,36,c3,6,c3,c3,12,g2,c3
	db 12,e3,6,e3,e3,12,d3,6,d3,d3,12,c3,6,c3,c3,12,a2,6,a2,a2
	db 12,g2,e2,g2,e2,96,c2,kyu,kyu,xxx,xxx,0
fanf1bar5
	db sno,sn2,vib,6,10,40
	db 36,c2,24,c3,12,g2,24,c2
	db 36,e2,24,e3,12,c3,24,g2
	db 12,g3,6,e3,c3,12,f3,6,c3,g2,12,e3,6,c3,g2,12,d3,6,c3,a2,12,c3,g2,c3,g2,96,c2,kyu,kyu,xxx,xxx,0
fanf1bar6


fanf1bar7





fanf1bar8





fanf1bar9
;
 
fanf1bar10
 
 
fanf1bar11
 
 
 
 
 
fanf1bar12
 
fanf1bar13
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
fanf1bar14
 
 
 
 

 
 
 
 
 
 
 
 
 

 
 
 
 

fanf1bar15
 
 
 
 

 
 
 
 
 
 
 
 
 
 
fanf1bar16
 
 
 
 
 
fanf1bar17
 
 
 
fanf1bar18
 
fanf1bar19
 
 
fanf1bar20
 
 
 
 
 
fanf1bar21
 
 

fanf1bar22
;
;
;
;
;
fanf1bar23
 
 
 
fanf1bar24
 
 
 

fanf1bar25
 
;
fanf1bar26
 
 
fanf1bar27
 
 
 
 
 

 
 
 
 

fanf2
	DW	fanf2_channels
	DW	255

fanf2_channels
	DW	fanf2Chan_SS1	;
	DW	fanf2Chan_SS2	;
	DW	fanf2Chan_SS3	;
	DW	fanf2Chan_SS4	;
	DW	fanf2Chan_SS5
	DW	fanf2Chan_SS6
	DW	fanf2Chan_SS7
	DW	fanf2Chan_SS8
fanf2Chan_SS1
	DB 	WAV,17
	db 	mv1,255
	DB	TP1,26	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
       db	ecv,3,80,127
	db 	edl,12,155,1
	DB	24,P80+V99			; step_time,gate_time,velocity
	db 	ptp,-12
	db 	pat,<fanf2bar1,>fanf2bar1,3

	db 0


fanf2Chan_SS2
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
	db ptp,12
	db pat,<fanf2bar3,>fanf2bar3,3
	db	0

fanf2Chan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0	; key transpose
	DB	024,P90+V99 
	db pat,<fanf2bar4,>fanf2bar4,6			; step_time,gate_time,velocity
	db	0
	

fanf2Chan_SS4	    
	DB	PV1,250		; part volume
	DB	PTP,12	; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db pat,<fanf2bar5,>fanf2bar5,1			; step_time,gate_time,velocity
	db 0
fanf2Chan_SS5
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	DB	24,P80+V80			; step_time,gate_time,velocity
	db 	ptp,12
	db 	pat,<fanf2bar6,>fanf2bar6,24
	db 0
fanf2Chan_SS6
	DB	PV1,160		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<fanf2bar7,>fanf2bar7,3
	db	0
fanf2Chan_SS7
	DB	PV1,160		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<fanf2bar8,>fanf2bar8,3
	db 0
fanf2Chan_SS8
	DB	PV1,160		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<fanf2bar9,>fanf2bar9,3
	db 0
fanf2bar2
	db 96,xxx,xxx,xxx,xxx,0
fanf2bar1
	db sno,sn2
	db 12,c2,6,c2
	db 12,e2,6,e2
	db 12,g2,6,g2
	db 12,a2,6,g2
	db 12,c2,6,c2
	db 12,e2,6,e2
	db 12,g2,6,g2
	db 12,a2,6,g2

	db 12,f2,6,f2
	db 12,a2,6,a2
	db 12,c3,6,c3
	db 12,d3,6,c3
	db 12,f2,6,f2
	db 12,a2,6,a2
	db 12,c3,6,c3
	db 12,d3,6,c3

	db 12,g2,6,g2
	db 12,b2,6,b2
	db 12,d3,6,d3
	db 12,e3,6,d3
	db 12,f2,6,f2
	db 12,a2,6,a2
	db 12,c3,6,c3
	db 12,d3,6,c3
	db 12,c2,6,c2
	db 12,e2,6,e2
	db 12,g2,6,g2
	db 12,a2,6,g2
	db 12,c2,6,c2
	db 12,e2,6,e2
	db 12,g2,6,g2
	db 12,a2,6,g2,0
	

fanf2bar3
	db sno,sn3
	db 6
	db g3,e3,c3,g3,e3,c3,g3,e3,c3,a3,xxx,g3
	db g3,e3,c3,g3,e3,c3,g3,e3,c3,a3,xxx,g3
	db a3,f3,c3,a3,f3,c3,a3,f3,c3,bf3,xxx,a3
	db a3,f3,c3,a3,f3,c3,a3,f3,c3,bf3,xxx,a3
	db g3,d3,b2,g3,d3,b2,g3,d3,b2,g3,d3,b2
	db f3,c3,a2,f3,c3,a2,f3,c3,a2,f3,c3,a2
	db g3,e3,c3,g3,e3,c3,g3,e3,c3,a3,xxx,g3
	db g3,e3,c3,g3,e3,c3,g3,e3,c3,a3,xxx,g3,0

fanf2bar4
	db sno,sn6,12,c3,6,c3
	db sno,sn5,18,c3
	db sno,sn6,18,c3
	db sno,sn5,18,c3
	db sno,sn6,12,c3,6,c3
	db sno,sn5,18,c3
	db sno,sn6,18,c3
	db sno,sn5,18,c3
	db sno,sn6,12,c3,6,c3
	db sno,sn5,18,c3
	db sno,sn6,18,c3
	db sno,sn5,18,c3
	db sno,sn6,12,c3,6,c3
	db sno,sn5,18,c3
	db sno,sn6,12,c3
	db sno,sn5,6,c3,c3,c3,c3,0
fanf2bar5
	db 72,xxx,xxx,xxx,xxx,xxx,xxx,xxx
	db vib,6,40,20
	db sno,sn2,12,g2,6,g2,12,f2,6,f2,12,e2,6,e2,12,d2,6,d2,c2,c3,c2,12,c3,18,c3,6,g2,bf2,a2,g2
	db c2,c3,c2,12,c3,18,c3,6,g3,f3,e3,d3
	db f3,e3,c3,12,f3,6,e3,36,c3
	db 6,f3,e3,d3,f3,e3,c3,18,a2,b2
	db 6,d3,g2,d3,12,g3,6,d3,d3,g2,d3,12,g3,6,d3
	db f3,c3,a2,12,a3,6,f3,f3,c3,a2,12,a3,6,f3
	db g3,e3,c3,g3,e3,c3,g3,e3,c3,a3,e3,c3
	db g3,e3,c3,g3,e3,c3,g3,e3,c3,a3,e3,c3
	db 72,kyu,kyu,kyu,xxx
	db xxx,xxx,xxx,xxx,0
fanf2bar6
	db sno,sn4,6,12,c3,6,c3,12,c3,6,c3,12,c3,6,c3,12,c3,6,c3,0
fanf2bar7
	db sno,sn7
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3

	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3

	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3

	db 12,d3,6,d3
	db 12,d3,6,d3
	db 12,d3,6,d3
	db 12,c3,6,d3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3
	db 12,c3,6,c3,0
fanf2bar8
	db sno,sn7
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3

	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3

	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,f3,6,f3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3
	db 12,e3,6,e3,0

fanf2bar9
	db sno,sn7
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3

	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3

	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3

	db 12,b3,6,b3
	db 12,b3,6,b3
	db 12,b3,6,b3
	db 12,b3,6,b3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,a3,6,a3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3
	db 12,g3,6,g3,0














































  






















  
