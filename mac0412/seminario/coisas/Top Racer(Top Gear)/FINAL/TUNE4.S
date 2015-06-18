;top gear title music v.000001 very basic stucture in no way complete....
	;							 n
GFT
	DW	TopGearTitle, 0D000H, 0D000H
;	ecv = echo,channel,volleft,volright  channel=1-ch1,2=chan2,3chan1&2,4chan3,5chan3&1,6chan3&2
	;7=channel12&3,8=channel4,9channel4&1, 
;	ev2 =move echo left and right ,time to take,target left vol,target rightvol
;	evl = 		2nd=feedback,filter
;	edl = delayecho,delaytime,feedback,filter   0=nofilter/1=hipassfilt/2=lowpass/3bandpass
TopGearTitle
	DW	TopGear_channels
	DW	255
	DW	TopGearTitle
	DW	000

TopGear_channels
	DW	TGChan_SS1	;TINLKY1
	DW	TGChan_SS2	;DRUMS
	DW	TGChan_SS3	;BASS
	DW	TGChan_SS4	;LEAD
	DW	TGChan_SS8
	DW	TGChan_SS8
	DW	TGChan_SS8
	DW	TGChan_SS8
TGChan_SS1
	DB 	WAV,17
	db 	mv1,255
	DB	TP1,32	;27		; tempo
	DB	PV1,220		; part volume
	DB	PAN,11	; panpot
	DB	PTP,12	; key transpose
   	db	ecv,9,127,127
	db 	edl,15,255,1
	DB	24,P80+V99			; step_time,gate_time,velocity
   	db 	pat,<bar1,>bar1,3
   	db 	pat,<bar3,>bar3,1
;******************************	
	DB PTP,-12
   	db 	pat,<bar4,>bar4,2
   	db 	pat,<bar5,>bar5,1
   	db 	pat,<bar4,>bar4,2
   	db 	pat,<bar6,>bar6,1
   	db 	pat,<bar7,>bar7,1
       	db  Ecv,11,127,127
;       	db  edl,15,255,1
   	db 	pat,<bar8,>bar8,4
	DB EOF
	DB ECV,9,127,127
   	db 	pat,<bar9,>bar9,1
   	db 	pat,<bar2,>bar2,7
   	db 	pat,<bar10,>bar10,2
   	db 	pat,<bar11,>bar11,1
   	db 	pat,<bar4,>bar4,2
   	db 	pat,<bar5,>bar5,1
   	db 	pat,<bar4,>bar4,2
   	db 	pat,<bar6,>bar6,1
   	db 	pat,<bar9,>bar9,1
   	db 	pat,<bar1,>bar1,1
	db 0


;	DB 	255				; data end
TGChan_SS2
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot

	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,0
 	DB PAT,<BAR12,>BAR12,12
 	DB PAT,<BAR13,>BAR13,1
 	DB PAT,<BAR14,>BAR14,6
	DB PAT,<BAR15,>BAR15,1
	DB PTP,12
	DB PAT,<BAR16,>BAR16,2
	DB PTP,0,PAT,<BAR17,>BAR17,1
	DB PTP,0
	DB PAT,<BAR12,>BAR12,2
	DB PAT,<BAR18,>BAR18,38

 	DB PAT,<BAR14,>BAR14,6
 	DB PAT,<BAR12,>BAR12,8
	db	0

;	db 255
TGChan_SS3
	DB	PV1,230		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	DB PAT,<BAR2,>BAR2,1
	DB PAT,<BAR19,>BAR19,2
	DB PAT,<BAR20,>BAR20,3
	DB PAT,<BAR21,>BAR21,2
	DB PAT,<BAR20,>BAR20,2
	DB PAT,<BAR21,>BAR21,2
  ;	DB PAT,<BAR22,>BAR22,1
;	DB SNO,SN3,PTP,12
	DB PAT,<BAR20,>BAR20,5
;	DB PAT,<BAR8,>BAR8,2
;	DB PAT,<BAR23,>BAR23,2
;	DB SNO,SN2 
;	DB PTP,-12       
	   
	DB PTP,-12
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-7
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-12
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-7
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-12
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-7
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-12
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-7
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-12
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-7
	DB PAT,<BAR24,>BAR24,2
	DB PTP,-12
	DB PAT,<BAR20,>BAR20,2
	DB PAT,<BAR21,>BAR21,2
	DB PAT,<BAR20,>BAR20,2
	DB PAT,<BAR21,>BAR21,2
	DB PAT,<BAR25,>BAR25,1
	DB PAT,<BAR2,>BAR2,1
	db	0
	

;	db 255

TGChan_SS4	    
	DB	PV1,200		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db      ptp,12
	DB PAT,<BAR2,>BAR2,2
	DB SNO,SN3,6
	DB PAT,<BAR8,>BAR8,4
	DB PAT,<BAR26,>BAR26,2
	DB PAT,<BAR8,>BAR8,2
	DB PAT,<BAR26,>BAR26,2
   	db 	pat,<bar1,>bar1,5
	DB PAT,<BAR25,>BAR25,1
	DB PAT,<BAR2,>BAR2,3
	DB PAT,<BAR27,>BAR27,3
	DB PAT,<BAR8,>BAR8,2
	DB PAT,<BAR26,>BAR26,2
	DB PAT,<BAR8,>BAR8,2
	DB PAT,<BAR26,>BAR26,2
   	db 	pat,<bar1,>bar1,1
	DB PAT,<BAR2,>BAR2,1
	
 	db	0

;	db 	255
;TGChan_SS5
;	DB	PV1,250		; part volume
;	DB	SNO,SN1		; sound name
;	DB	PAN,011		; panpot
;
;	DB	024,P90+V85			; step_time,gate_time,velocity
;	db 	ptp,12
;	db 	pat,<bar22,>bar22,76
;	db 0
;TGChan_SS6
;	DB	PV1,255		; part volume
;	DB	PAN,011		; panpot
;
;	DB	024,P90+V85			; step_time,gate_time,velocity
;	db 	ptp,12		
;	db 	pat,<bar23,>bar23,76
;	db 0
;		      	DB 	PAT,<bar2,>bar2,052
;TGChan_SS7
;	DB	PV1,250		; part volume
;	DB	PAN,11	 ;0=allright 20=allleft	; panpot
;	;db 	pam,12,0
;	DB	024,P90+V85			; step_time,gate_time,velocity
;	db 	ptp,12
;	;db	ecv,255,80,80	;120,120
;	;db 	edl,12,20,2
;;	DB 	PAT,<bar2,>bar2,003
;	db 	sno,sn10
;	db 	pat,<bar8,>bar8,004
;	db 	pat,<bar9,>bar9,1
 ;;	db 	pat,<bar10,>bar10,1
 ;	db 	sno,sn10
 ;	db 	pat,<bar9,>bar9,1
 ;	db 	pat,<bar10,>bar10,1
 ;	db 	sno,sn10
 ;	db 	pat,<bar11,>bar11,1
 ;	db 	pat,<bar12,>bar12,1
 ;	db 	pat,<bar8,>bar8,002
 ;	db 	pat,<bar9,>bar9,1
 ;	db 	pat,<bar10,>bar10,1
 ;	db 	sno,sn10
 ;	db 	pat,<bar11,>bar11,1
 ;	db 	pat,<bar12,>bar12,1
 ;	db 	pat,<bar11,>bar11,1
 ;	db 	pat,<bar13,>bar13,1
 ;
 ;	db	0
TGChan_SS8
	DB	PV1,250		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V85		; step_time,gate_time,velocity
	db 	ptp,7
	DB 	PAT,<bar2,>bar2,051

bar2	db 96,KYU,KYU,KYU,KYU
	DB 000
bar1	db sno,sn3
	db 6
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1
	db ef1,g1,bf1,ef2,g2,bf2,ef3,g3,bf3,g3,ef3,bf2,g2,ef2,bf1,g1
	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1
	db c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1,0
bar3	db 6,c1,ef1,g1,c2,ef2,g2,c3,ef3,g3,ef3,c3,g2,ef2,c2,g1,ef1
	db ef1,g1,bf1,ef2,g2,bf2,ef3,g3,bf3,g3,ef3,bf2,g2,ef2,bf1,g1
	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1
	DB PTP,-12
	db sno,sn1,24,g3,ef3,c3,g2,0
bar4
	db sno,sn1
	db 12,c3,g2,6,bf2,12,c3,ef3,6,ef3,12,d3,c3,bf2
	db ef3,bf2,ef3,6,g2,54,bf2
	db 12,f3,d3,f3,6,g3,18,af3,12,g3,f3,ef3,g3,ef3,d3,6,ef3,54,c3,0
bar5
	db 36,af2,24,ef3,12,d3,6,c3,d3,12,af2,36,bf2
	db 24,f3,12,ef3,6,d3,ef3,12,f3
	db 36,c3,24,af3,12
	db g3,6,f3,g3,12,ef3,d3,d3,d3,ef3,f3,ef3,d3,bf2,0
bar6
	db 72,af2,24,ef3,72,bf2,24,ef3,72,af2,24,ef3
	db 6,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,g3,bf2,f3,bf2,0
bar7
	db 6,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,af3,ef3,g3,ef3
	db g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,af3,bf2,g3,bf2
	db f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,g3,bf2,f3,bf2
	db 24,g3,ef3,d3,ef3,0

bar8
	db 6,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,af3,ef3,g3,ef3
	db g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,g3,ef3,bf2,af3,bf2,g3,bf2
	db f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,f3,d3,bf2,g3,bf2,f3,bf2
	db 6,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,g3,ef3,c3,af3,ef3,g3,ef3
	db 0
BAR9
  ;	db 6,c3,kyu,kyu,kyu,000
	DB 96,C3,KYU,KYU,KYU,0
BAR10
	DB 12,C3,G2,BF2,6,C3,12,EF3,6,EF3,12,D3,C3,BF2
	DB EF3,BF2,EF3,6,G2,54,BF2,0
BAR11
	DB 12,F3,C3,6,EF3,12,F3,AF3,6,AF3,12,G3,F3,EF3
	DB 12,F3,C3,6,EF3,12,F3,AF3,6,AF3,12,G3,F3,EF3
	DB 12,F3,C3,6,EF3,12,F3,AF3,6,AF3,12,G3,F3,AF3
	DB 6
	DB C4,C3,C3,C4,C3,C3,C4,C3,C3,C4,C3,C3,BF3,BF2,AF3,AF2,0
BAR12
	DB SNO,SN4,6,C4,C4,C3,C4,C4,C4,C3,C4,C4,C4,C3,C4,C4,C4,C3,C4,0
BAR13
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
BAR14
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

BAR15
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
BAR16
	DB SNO,SN3,6
	DB G3,EF3,C3,G2,EF2,C2,G1,EF1,C1,EF1,G1,C2,EF2,G2,C3,EF3
	DB BF3,G3,EF3,BF2,G2,EF2,BF1,G1,EF1,G1,BF1,EF2,G2,BF2,EF3,G3
	DB BF3,F3,D3,BF2,F2,D2,BF1,F1,D1,F1,BF1,D2,F2,BF2,D3,F3
	DB G3,EF3,C3,G2,EF2,C2,G1,EF1,C1,EF1,G1,C2,EF2,G2,C3,EF3,000
BAR17
	DB SNO,SN1
	DB 36,C2,BF1,24,G1,48,BF1,C2,36,D2,C2,24,BF1,96,C2
	DB 36,C2,BF1,24,G1,48,BF1,G1,36,BF1,F1,24,EF1,96,C1,0 
BAR18
	DB SNO,SN6,24,C3,C3,12,C3,SNO,SN5,C3,SNO,SN6,C3,SNO,SN5,C3,0
BAR19
	DB SNO,SN3,12,G2,G2,24,EF2,C2,12,EF2,24,G2,12,G2,24,EF2,48,BF1
	DB 12,F2,F2,24,D2,BF1,12,G1,108,C2,0
BAR20
	DB SNO,SN2,6,PTP,-12
	DB C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,C3,C2
	DB EF2,EF3,EF2,EF2,EF3,EF2,EF2,EF3,EF2,EF3,EF3,EF2,EF3,EF2,EF3,EF2
	DB BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1
	DB C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,C3,C2,0
BAR21
	DB AF1,AF2,AF1,AF1,AF2,AF1,AF1,AF2,AF1,AF2,AF2,AF1,AF2,AF1,AF2,AF1
	DB BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1,0

BAR22
;	DB SNO,SN2,6,PTP,-12
;	DB C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,C3,C2
;	DB EF2,EF3,EF2,EF2,EF3,EF2,EF2,EF3,EF2,EF3,EF3,EF2,EF3,EF2,EF3,EF2
;	DB BF1,BF2,BF1,BF1,BF2,BF1,BF1,BF2,BF1,BF2,BF2,BF1,BF2,BF1,BF2,BF1
;	DB 24,C3,BF2,G2,EF2,0
BAR23
	DB SNO,SN2,12,PTP,-12
	DB C2,C2,C2,C2,C2,C2,C2,C2,EF2,EF2,EF2,EF2,EF2,EF2,EF2,EF2
	DB BF1,BF1,BF1,BF1,BF1,BF1,BF1,BF1,C2,C2,C2,C2,C2,C2,C2,C2,0
BAR24
	DB 6,C2,C3,C2,C2,C3,C2,C2,C3,C2,C3,C3,C2,C3,C2,D3,D2
	DB EF2,EF3,EF2,EF2,EF3,EF2,EF2,EF3,D2,D3,EF3,EF2,D3,D2,BF2,BF1,0
	;DB 12,C2,C2,C2,C2,C2,C2,C2,D2,EF2,EF2,EF2,EF2,D2,EF2,D2,BF1,0

BAR25
	db 96,c2,kyu,kyu,kyu,000
;	DB 96,C2,KYU,KYU,KYU,0
BAR26
	DB AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,BF3,C3,AF3,C3
	DB F3,D3,BF2,F3,D3,BF2,F3,D3,BF2,F3,D3,BF2,G3,BF2,F3,BF2,0	 
BAR27
	DB 6
	DB G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,AF3,C3,G3,C3
	DB G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,AF3,BF2,G3,BF2
	DB G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,G3,EF3,C3,AF3,C3,G3,C3
	DB G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,G3,EF3,BF2,AF3,BF2,G3,BF2

	DB AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,BF3,C3,AF3,C3
	DB AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,BF3,C3,AF3,C3
	DB AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,AF3,F3,C3,BF3,C3,AF3,C3
	DB AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,AF3,EF3,C3,BF3,C3,AF3,C3,0
