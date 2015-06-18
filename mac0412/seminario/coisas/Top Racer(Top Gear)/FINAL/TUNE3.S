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
	DW	TGChan_SS1	;bass
	DW	TGChan_SS2	;tinklies
	DW	TGChan_SS3	;drums
	DW	TGChan_SS4	;
	DW	TGChan_SS8
	DW	TGChan_SS8
	DW	TGChan_SS8
	DW	TGChan_SS8
TGChan_SS1
	DB 	WAV,17
	DB	TP1,32	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	DB	PTP,-12		; key transpose
   	db	ecv,11,127,127
	db 	edl,12,255,1
	DB	024,P80+V10			; step_time,gate_time,velocity
   	db 	pat,<bar1,>bar1,15
;******************************	
 	db 	ptp,-9
   	db 	pat,<bar1,>bar1,3
 	db 	ptp,-12
   	db 	pat,<bar1,>bar1,4


;	DB 	255				; data end
TGChan_SS2
	DB	PV1,150		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot

	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,12
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,2	;dfbf
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,2	;dfbf
;******************************	
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,2	;dfbf
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,2	;dfbf
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,2	;dfbf
;******************************	
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,2	;dfbf
	db 	pat,<bar10,>bar10,1	;solobit
	db 	pat,<bar3,>bar3,2	;df#a
	db 	pat,<bar4,>bar4,2	;ceg
;******************************	
	db 	pat,<bar5,>bar5,2	;dgb
	db 	pat,<bar6,>bar6,1	;dfbf
	db 	pat,<bar4,>bar4,1	;ceg

	db 	pat,<bar12,>bar12,2	;cfa
	db 	pat,<bar13,>bar13,2	;d#ga#
	db 	pat,<bar12,>bar12,2	;cfa
	db 	pat,<bar3,>bar3,4	;d#ga#
	db 	ptp,10,pat,<bar13,>bar13,2,ptp,12
	db 	pat,<bar12,>bar12,2	;cfa
	db 	pat,<bar13,>bar13,2	;d#ga#

	db	0

;	db 255
TGChan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db pat,<bar7,>bar7,22
	db	0

;	db 255

TGChan_SS4	    
	DB	PV1,255		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	;db	ecv,9,127,127
	;db 	edl,12,255,1
	db ptp,-12
	db pat,<bar2,>bar2,2
	db pat,<bar8,>bar8,1
	db pat,<bar9,>bar9,1
	db pat,<bar11,>bar11,1
	db pat,<bar2,>bar2,4
	db pat,<bar14,>bar14,1
	db pat,<bar2,>bar2,1
	db pat,<bar15,>bar15,1
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
bar1	db sno,sn2
	db 12,d2,d2,f2,d2,g2,d2,af2,a2
	db d2,d2,f2,d2,c2,a1,c2,df2
	db d2,d2,f2,d2,g2,d2,af2,a2
	db d2,d2,f2,d2,c2,a1,c2,df2,0
bar3 	db sno,sn3,6
	db d1,gf1,a1,d2,gf2,a2,d3,gf3,a3,gf3,d3,a2,gf2,d2,a1,gf1,0
bar4	db c1,e1,g1,c2,e2,g2,c3,e3,g3,e3,c3,g2,e2,c2,g1,e1,0
bar5	db d1,g1,b1,d2,g2,b2,d3,g3,b3,g3,d3,b2,g2,d2,b1,g1,0
bar6	db d1,f1,bf1,d2,f2,bf2,d3,f3,bf3,f3,d3,bf2,f2,d2,bf1,f1,0
bar7	db sno,sn5,24,c3
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
bar8
	db vib,12,20,30
	db sno,sn6,24
	db d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2
	db 12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2
	db 36,c2,12,b1,c2,c2,24,df2,36,d2,0
bar9
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2
 	db 36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2
 	db 12,d2
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,60,d3
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,d3,c3,g2,a2,c3
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,60,d3
	db 12,d3,c3,d3,24,c3,d3,12,f3,f3,f3,f3,24,f3,12,e3,24,d3,12,f3,f3,f3,24,f3,12,e3,d3,c3,c3,a2,f3,d3,c3,g2,a2,c3,0
bar10
	db 6
	db a3,gf3,d3,gf3,d3,a2,d3,a2
	db gf2,a2,gf2,d2,gf2,d2,a1,d2
	db a1,gf1,a1,gf1,d1,gf1,d1,a0,48,d1
	db 6
	db g3,e3,c3,e3,c3,g2,c3,g2
	db e2,g2,e2,c2,e2,c2,g1,c2
	db g1,e1,g1,e1,c1,e1,c1,g0,48,c1,0
bar11
	db 24,d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,12,d2,0
bar12
	db c1,f1,a1,c2,f2,a2,c3,f3,a3,f3,c3,a2,f2,c2,a1,f1,0
bar13 	db ef1,g1,bf1,ef2,g2,bf2,ef3,g3,bf3,g3,ef3,bf2,g2,ef2,bf1,g1
	db 0
bar14
	db 24,f2,12,c2,c2,ef2,24,f2,36,f2,12,d2,d2,ef2,24,af2,36,f2,12,c2,c2,ef2,24,ef2,36,ef2,12,d2,ef2,ef2,24,e2,36,f2
	db 12,c2,c2,ef2,24,f2,36,f2,12,d2,d2,ef2,24,af2,36,f2,12,c2,c2,ef2,24,ef2,36,ef2,12,d2,ef2,ef2,24,e2,12,f2,0
bar15
	db 24,d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,36,d2
	db 12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,12,d2
	db 24,d2,12,a1,a1,c2,24,d2,36,d2,12,b1,b1,c2,24,f2,36,d2,12,a1,a1,c2,24,c2,36,c2,12,b1,c2,c2,24,df2,12,d2
	db 96,kyu,kyu,kyu,kyu,0

