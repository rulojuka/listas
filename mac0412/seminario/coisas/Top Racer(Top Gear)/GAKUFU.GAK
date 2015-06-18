;top gear title music v.000001 very basic stucture in no way complete....
	;							 n
GFT
	DW	TopGearTitle, 0D000H, 0D000H
;	ecv = echo,channel,volleft,volright 
	; channel=1-ch1,
	;  2=chan2,3chan1&2,4chan3,5chan3&1,6chan3&2
	;7=channel12&3,8=channel4,9channel4&1,10=4&2,11=4&3,12=1&2&3&4
	;13=5,14=5&1,15=5&2,16=5&3,17=5&4,18=1&2&3&4 
;	ev2 =move echo left and right ,time to take,target left vol,target rightvol
;	evl = 		2nd=feedback,filter
;	edl = delayecho,delaytime,feedback,filter   0=nofilter/1=hipassfilt/2=lowpass/3bandpass
TopGearTitle
	DW	TopGear_channels
	DW	255
	DW	TopGearTitle
	DW	000

TopGear_channels
	DW	TGChan_SS1	;TINKLE1
	DW	TGChan_SS2	;DRUMS
	DW	TGChan_SS3	;BASS
	DW	TGChan_SS4	;CHORDS 1
	DW	TGChan_SS5	;CHORDS 2
	DW	TGChan_SS6	;CHORDS 3
	DW	TGChan_SS7	;TINKLE 2  
	DW	TGChan_SS8	;LEAD
TGChan_SSX
	DB PAT,<BAR2,>BAR2,51,0
TGChan_SS1
	DB 	WAV,17
	DB	TP1,55	;27		; tempo
	DB	PV1,150		; part volume
	DB	SNO,SN1		; sound name
	DB	PAN,11	; panpot
	db	ecv,193,127,127	;249 = 1 45678 ;193
	db 	edl,12,255,1

	DB	024,P80+V99			; step_time,gate_time,velocity
 	db 	ptp,0
	DB PAT,<bar1,>bar1,2	;pos 0 +1
	db pat,<bar3,>bar3,1	;pos 2
	DB PAT,<bar1,>bar1,2	;pos 3 +4
	db pat,<bar3,>bar3,1	;pos 5
	;start of main tune *************
	db pat,<bar4,>bar4,6	;pos 6,7 &8
	db pat,<bar5,>bar5,2	;pos 9
	db pat,<bar4,>bar4,2	;pos 10
	db pat,<bar5,>bar5,2	;pos 11
	db pat,<bar4,>bar4,2	;pos 12
	db pat,<bar5,>bar5,2	;pos 13
	db pat,<bar3,>bar3,1	;pos 14
	db pat,<bar4,>bar4,12	;pos 15,16,17,18,19,20	
	db pat,<bar5,>bar5,2	;pos 21
	db pat,<bar4,>bar4,2	;pos 22
	db pat,<bar5,>bar5,2	;pos 23
	db pat,<bar3,>bar3,1	;pos 24
	db pat,<bar4,>bar4,2 	;pos 25	
	db pat,<bar24,>bar24,1 	;pos 25	


	db 0
TGChan_SS2
	DB	PV1,250		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,0
	db pat,<bar6,>bar6,8	;pos 0
	db pat,<bar7,>bar7,12	;pos 1 and 1/2 pat 2
	db pat,<bar8,>bar8,1	;pos 0
	db pat,<bar7,>bar7,16	;pos 1 and 1/2 pat 2
	db pat,<bar6,>bar6,20	;pos 1 and 1/2 pat 2
	db pat,<bar10,>bar10,1	;pos 1 and 1/2 pat 2
	;start of main tune *************
	db pat,<bar9,>bar9,5	;BASIC BAR BEAT 
	db pat,<bar36,>bar36,1	;BASIC AMD ROLL
	db pat,<bar9,>bar9,1	;BASIC BAR BEAT
	db pat,<bar37,>bar37,1	;4 BY 4 BEAT FOR 32
	db pat,<bar8,>bar8,1	;ROLL ON IT'S OWN
	db pat,<bar9,>bar9,3	;BASIC BAR BEAT 
	db pat,<bar36,>bar36,1	;BASIC AMD ROLL
	db pat,<bar9,>bar9,3	;BASIC BAR BEAT 
	db pat,<bar36,>bar36,1	;BASIC AMD ROLL
	db pat,<bar9,>bar9,1	;BASIC BAR BEAT
	db pat,<bar37,>bar37,1	;4 BY 4 BEAT FOR 32
	db pat,<bar8,>bar8,1	;ROLL ON IT'S OWN
	DB PAT,<BAR6,>BAR6,64
	db	0

;	db 255
TGChan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,-2		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	DB 	SNO,SN6
     ;	db	ecv,4,127,127
     ;	db 	edl,24,255,2
	db pat,<bar16,>bar16,1	;pos 0
	db pat,<bar11,>bar11,1	;pos 1
	db pat,<bar12,>bar12,1	;pos 2
	db pat,<bar13,>bar13,2	;pos 3
	db pat,<bar14,>bar14,1	;pos 4+5+6+7
	;start of main tune *************
	DB PTP,-2   
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,3  
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,-2   
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,3  
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,-2   
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,3  
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,-2
	DB PAT,<BAR22,>BAR22,1
	DB PAT,<BAR23,>BAR23,1
	DB PTP,-2   
	db pat,<bar21,>bar21,10	;pos 8
	DB PTP,3  
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,-2   
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,3  
	db pat,<bar21,>bar21,2	;pos 8
	DB PTP,-2
	DB PAT,<BAR22,>BAR22,1
	DB PAT,<BAR23,>BAR23,1
	DB PAT,<BAR43,>BAR43,1
	
	db	0

;	db 255

TGChan_SS4	    
	DB	PV1,150		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85 
	db ptp,0	
	db pat,<bar15,>bar15,1	;pos 0
	;start of main tune *************
	db ptp,0
	DB PAT,<BAR27,>BAR27,2
	DB PAT,<BAR30,>BAR30,2
	DB PAT,<BAR27,>BAR27,2
	DB PAT,<BAR30,>BAR30,2
	DB PAT,<BAR27,>BAR27,2
	DB PAT,<BAR30,>BAR30,2
	DB PTP,3
	DB PAT,<BAR30,>BAR30,1
	DB PTP,5
	DB PAT,<BAR30,>BAR30,1
	DB PTP,0
	DB PAT,<BAR27,>BAR27,12
	DB PAT,<BAR30,>BAR30,2
	DB PAT,<BAR27,>BAR27,2
	DB PAT,<BAR30,>BAR30,2
	DB PTP,3
	DB PAT,<BAR30,>BAR30,1
	DB PTP,5
	DB PAT,<BAR30,>BAR30,1
	DB PTP,0
	DB PAT,<BAR27,>BAR27,2
   
	DB PTP,0		;OS26 PAT 17
	DB PAT,<BAR33,>BAR33,1
	db	0

;	db 	255
TGChan_SS5
	DB	PV1,150		; part volume
	DB	SNO,SN1		; sound name
	DB	PAN,011		; panpot
	DB	024,P90+V85			; step_time,gate_time,velocity
	db ptp,0
	db pat,<bar17,>bar17,1	;pos 0
	;start of main tune *************
	db ptp,0
	DB PAT,<BAR28,>BAR28,2
	DB PAT,<BAR31,>BAR31,2
	DB PAT,<BAR28,>BAR28,2
	DB PAT,<BAR31,>BAR31,2
	DB PAT,<BAR28,>BAR28,2
	DB PAT,<BAR31,>BAR31,2
	DB PTP,3
	DB PAT,<BAR31,>BAR31,1
	DB PTP,5
	DB PAT,<BAR31,>BAR31,1
	DB PTP,0
	DB PAT,<BAR28,>BAR28,12
	DB PAT,<BAR31,>BAR31,2
	DB PAT,<BAR28,>BAR28,2
	DB PAT,<BAR31,>BAR31,2
	DB PTP,3
	DB PAT,<BAR31,>BAR31,1
	DB PTP,5
	DB PAT,<BAR31,>BAR31,1
	DB PTP,0
	DB PAT,<BAR28,>BAR28,2

	DB PTP,0		;OS26 PAT 17
	DB PAT,<BAR34,>BAR34,1

	db 0
TGChan_SS6
	DB	PV1,150		; part volume
	DB	PAN,011		; panpot
	DB	024,P90+V85			; step_time,gate_time,velocity
	db ptp,7
	db pat,<bar15,>bar15,1	;pos 0
	;start of main tune *************
	db ptp,0
	DB PAT,<BAR29,>BAR29,2
	DB PAT,<BAR32,>BAR32,2
	DB PAT,<BAR29,>BAR29,2
	DB PAT,<BAR32,>BAR32,2
	DB PAT,<BAR29,>BAR29,2
	DB PAT,<BAR32,>BAR32,2
	DB PTP,3
	DB PAT,<BAR32,>BAR32,1
	DB PTP,5
	DB PAT,<BAR32,>BAR32,1
	DB PTP,0
	DB PAT,<BAR29,>BAR29,12
	DB PAT,<BAR32,>BAR32,2
	DB PAT,<BAR29,>BAR29,2
	DB PAT,<BAR32,>BAR32,2
	DB PTP,3
	DB PAT,<BAR32,>BAR32,1
	DB PTP,5
	DB PAT,<BAR32,>BAR32,1
	DB PTP,0
	DB PAT,<BAR29,>BAR29,2

	DB PTP,0		;OS26 PAT 17
	DB PAT,<BAR35,>BAR35,1

	db 0
		      	DB 	PAT,<bar2,>bar2,052
TGChan_SS7
	DB	PV1,150		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V85			; step_time,gate_time,velocity
	db 	ptp,12
	;db	ecv,65,127,127
	;db 	edl,12,255,1
	db 	sno,sn7
	DB 	PAT,<bar18,>bar18,002 ;FMAJ TO CMIN
	DB 	PAT,<bar19,>bar19,001 ;G+ TO BFMAJ
	DB 	PAT,<bar18,>bar18,002
	DB 	PAT,<bar19,>bar19,001
	DB 	PAT,<bar20,>bar20,004 ;CMINOR
	;start of main tune *************
	DB 	PAT,<bar20,>bar20,002	;CMIN
	DB 	PAT,<bar25,>bar25,002	;FMAJ
	DB 	PAT,<bar20,>bar20,002
	DB 	PAT,<bar25,>bar25,002
	DB 	PAT,<bar20,>bar20,002
	DB 	PAT,<bar25,>bar25,002

	DB 	PAT,<bar19,>bar19,001 ;G+ TO BFMAJ

	DB 	PAT,<bar20,>bar20,012 ;CMINOR

	DB 	PAT,<bar25,>bar25,002	;FMAJ
	DB 	PAT,<bar20,>bar20,002 ;CMINOR
	DB 	PAT,<bar25,>bar25,002	;FMAJ
	DB 	PAT,<bar19,>bar19,001 ;G+ TO BFMAJ
	DB 	PAT,<bar20,>bar20,002 ;CMINOR

	DB PAT,<BAR26,>BAR26,01	;END BIT

	db	0
TGChan_SS8
	DB	PV1,225		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V99		; step_time,gate_time,velocity
	db 	ptp,0
	DB 	PAT,<bar2,>bar2,10
	DB PV1,225,PAT,<BAR38,>BAR38,1
	DB PTP,12
	DB PV1,255,PAT,<BAR39,>BAR39,1
	DB PAT,<BAR40,>BAR40,1
	DB 	PAT,<bar2,>bar2,4
	db ptp,0
	DB PV1,225,PAT,<BAR38,>BAR38,1
	DB PTP,12
	DB PAT,<BAR39,>BAR39,1
	DB PAT,<BAR40,>BAR40,1
	DB PAT,<BAR39,>BAR39,1
	DB PAT,<BAR41,>BAR41,1
	DB PAT,<BAR39,>BAR39,1
	DB PAT,<BAR42,>BAR42,5
 
	DB 0
bar2
	db 96
	db KYU,KYU,KYU,KYU
	DB	000
bar4
	db g2,c3,ef3,g2,c3,ef3,g2,c3
	db f3,g2,c3,ef3,g2,c3,ef3,d3
	DB	000
bar1
	db 12
	db a2,c3,f3,a2,c3,f3,a2,c3
	db g3,a2,c3,f3,a2,c3,f3,a2
	db g2,c3,ef3,g2,c3,ef3,g2,c3
 	db f3,g2,c3,ef3,g2,c3,ef3,d3,000
bar3
	db af2,c3,ef3,af2,c3,ef3,af2,c3
	db ef3,af2,c3,ef3,af2,c3,ef3,af2
	db bf2,d3,f3,bf2,d3,f3,bf2,d3
	db f3,bf2,d3,f3,bf2,d3,f3,bf2,000
	
	DB	000
bar5
	db a2,c3,f3,a2,c3,f3,a2,c3
	db g3,a2,c3,f3,a2,c3,f3,a2,0
bar6
	db sno,sn3,12,c4,c4
	db sno,sn2,G2
	db sno,sn3,c4,0
bar7
	db sno,sn4,c3		  
	db sno,sn3,c4
	db sno,sn2,G2
	db sno,sn3,c4,0
bar8
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
bar9
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

    ;	DB SNO,SN5,12,C3	;BDRUM
    ;	DB SNO,SN3,C4		;HIHAT1
bar10
	db sno,sn4,24,c3
	db sno,sn3,c4
	db sno,sn4,24,c3
	db sno,sn3,c4
	db sno,sn4,24,c3
	db sno,sn3,c4
	db sno,sn4,24,c3
	db sno,sn3,c4,0
bar11
	db vib,24,160,80		;delay,speedofvib,valuetovib
	db sno,sn6
	DB 96,G1,TIE	;START FIRST QUARTER AT G2
	DB D1,TIE,0	; PLAY AND BEND AND PLAY UNTIL 48
bar12
	DB 72,BF1,BF1,48,BF1,72,C1,C2,48,C1,000
bar13					  ;SWS - BENDONDOWN
	DB 96,G1,TIE,D1,48,TIE,SWK,12,24,-12,D2,SOF,000
	;SWK
	;FIRST BYTE = SEMITONES BELOW FROM WHICH IT WILL COME FROM.
	;SECOND BYTE = SPEED - 1 = DAMN FAST 255= MOGADON SPEED.
	;THIRD = DETUNE IN SEMITONES TO WHICH IT WILL SLIDE
	;SWS
	; AS ABOVE ,BUT IT SEEMS TO BE FROM ABOVE AND NOT BELOW.
bar14
	DB 96,BF1,SWK,48,48,-12,BF1,SOF,C1,TIE,D1,TIE,TIE,TIE
	DB TIE,KYU,XXX,XXX,0
bar15
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
bar16
	DB 96,kyu,kyu,kyu,48,kyu,SWK,12,24,-7,D2,SOF,000

bar17
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
bar18
	db 12,c1,f1,a1,c2,f2,a2,c3,f3,a3,f3,c3,a2,f2,c2,a1,f1
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1,000
	db 000			   
bar19
	db c1,ef1,af1,c2,ef2,af2,c3,ef3,af3,ef3,c3,af2,ef2,c2,af1,ef1
	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1,0
       	db 000			
bar20
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1,000
	db 000			   
bar21
	 db 6,D1,d1,D1,D1,24,d1,d2,12,d1,24,d2,12,d1,24,d2,c2,A1,000

	;db 12,d1,d1,24,d1,d2,12,d1,24,d2,12,d1,24,d2,c2,A1,000
	db 000			   
bar22
	DB 12,BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1
	DB C1,C2,C1,C1,C2,C1,C1,C2,C1,C2,C2,C1,C2,C1,C2,C1,0
bar23
	DB SWK,12,255,-12,96,D1,TIE,TIE,TIE,SOF,000
bar24
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
BAR25
 	DB C1,F1,A1,C2,F2,A2,C3,F3,A3,F3,C3,A2,F2,C2,A1,F1
	DB 0
BAR26
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
BAR27
	DB SNO,SN7
	DB 12,C2,C2,C2,C2
	DB C3
;	DB SNO,SN7
	DB C2,C2,6,C2
	DB 18,C3
 ;	DB SNO,SN7
	DB 12,C2,6,C2
	DB 18,C3
	DB SNO,SN7,12,C2,C2,C2,C2,0
BAR28
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
      
BAR29
	DB SNO,SN7
	DB 12,G2,G2,G2,G2
	DB BF3
	DB G2,G2,6,G2
	DB 18,G3
	DB 12,G2,6,G2
	DB 18,G3
	DB 12,G2,G2,G2,G2,0      

BAR30
	DB SNO,SN7
	DB 12,F2,F2,F2,F2
	DB F3
	DB F2,F2,6,F2
	DB 18,F3
	DB 12,F2,6,F2
	DB 18,F3
	DB 12,F2,F2,F2,F2,0      
BAR31
	DB SNO,SN7
	DB 12,A2,A2,A2,A2
	DB A3
	DB A2,A2,6,A2
	DB 18,A3
	DB 12,A2,6,A2
	DB 18,A3
	DB 12,A2,A2,A2,A2,0      
BAR32
	DB SNO,SN7
	DB 12,C3,C3,C3,C3
	DB C4
	DB C3,C3,6,C3
	DB 18,C4
	DB 12,C3,6,C3
	DB 18,C4
	DB 12,C3,C3,C3,C3,0 
BAR33
	DB 96,AF2,TIE,BF2,TIE,C3,TIE,TIE,TIE
	DB 96,AF2,TIE,BF2,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE
	DB C3,TIE,C3,TIE,000
BAR34
    	DB 96,C3,TIE,D3,TIE,EF3,TIE,TIE,TIE
	DB 96,C3,TIE,D3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE
	DB A3,TIE,EF3,TIE,000
BAR35
	DB 96,EF3,TIE,F3,TIE,G3,TIE,TIE,TIE
	DB 96,EF3,TIE,F3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE
	DB F3,TIE,G3,TIE,000
BAR36
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

BAR37
 	DB SNO,SN4,48,C3,C3,C3,C3,0
BAR38
	DB SNO,SN8
	db vib,24,10,40		;delay,speedofvib,valuetovib
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,C2
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,G1
	DB 96,F1,72,TIE,24,EF1,48,F1,C1,EF1,A1
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,C2
	DB 12,C2,G2,24,C2,EF2,D2,36,BF1,60,EF2
	DB 96,F2,72,TIE,24,A2,48,BF2,C3,24,BF2,A2,F2,BF1,0
 
BAR39
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
BAR40
	DB SNO,SN7
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1
	DB EF1,C2,G1,EF1,G1,EF1,C1,G1
	DB EF1,C1,G1,EF1,C1,G1,EF1,C1
	DB G1,EF1,C1,G1,EF1,C1,G1,EF1
	DB C1,G1,EF1,C1,G1,EF1,C1,G1,0
BAR41
	DB SNO,SN7
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1,0

BAR42
	DB SNO,SN7
	DB A3,F3,C3,A3,F3,C3,F3,C3
	DB A2,F3,C3,A2,C3,A2,F2,C3
	DB A2,F2,A2,F2,C2,A2,F2,C2
	DB F2,C2,A1,F2,C2,A1,C2,A1
	DB G3,EF3,C3,G3,EF3,C3,EF3,C3
	DB G2,EF3,C3,G2,C3,G2,EF2,C3
	DB G2,EF2,G2,EF2,C2,G2,EF2,C2
	DB EF2,C2,G1,EF2,C2,G1,C2,G1,0
BAR43
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
       								      




  
