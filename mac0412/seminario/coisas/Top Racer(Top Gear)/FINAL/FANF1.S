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
	DW	000
	DW	TopGearTitle
	DW	000

TopGear_channels
	DW	TGChan_SS1	;
	DW	TGChan_SS2	;
	DW	TGChan_SS3	;
	DW	TGChan_SS4	;
	DW	TGChan_SS5
	DW	TGChan_SS6
	DW	TGChan_SS7
	DW	TGChan_SS8
TGChan_SS1
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
	db 	pat,<bar1,>bar1,1

	db 0


;	DB 	255				; data end
TGChan_SS2
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
	db ptp,12
	db pat,<bar3,>bar3,1
	db	0

;	db 255
TGChan_SS3
	DB	PV1,230		; part volume
	DB	PAN,011		; panpot
	DB	PTP,12		; key transpose
	DB	024,P90+V99 
	db pat,<bar4,>bar4,1			; step_time,gate_time,velocity
	db	0
	

;	db 255

TGChan_SS4	    
	DB	PV1,200		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db      ptp,12
	db pat,<bar5,>bar5,1			; step_time,gate_time,velocity
	db 0
TGChan_SS5
	DB	TP1,22	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	DB	24,P80+V80			; step_time,gate_time,velocity
	db ptp,0
	db 	pat,<bar1,>bar1,1
	db 0
TGChan_SS6
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<bar3,>bar3,1
	db	0
TGChan_SS7
	DB	PV1,230		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V80 
	db pat,<bar4,>bar4,1			; step_time,gate_time,velocity
	db	0
TGChan_SS8
	DB	PV1,250		; part volume
	DB	SNO,SN2		; sound name
	DB	PAN,009		; panpot
	DB	PTP,000		; key transpose

	DB	024,P90+V85		; step_time,gate_time,velocity
	db 	ptp,7
	DB 	PAT,<bar2,>bar2,051

bar2
	db 96,xxx,xxx,xxx,xxx,0
bar1
	db sno,sn3
	db vib,6,20,40
	db 12,c2,6,c2,c2,36,c2,6,c2,c2,12,g1,c2,e2
	db 6,e2,e2,36,e2,6,e2,e2,12,c2,e2,g2,6,g2,g2,12,f2,6,f2,f2,12,e2,6,e2,e2,12,d2
	db 6,d2,d2,12,c2,g1,c2,g1,96,c1,kyu,kyu,xxx,xxx,0
bar3
	db sno,sn3,vib,6,20,40
	db 12,e2,6,e2,e2,36,e2,6,e2,e2,12,c2,e2
	db 12,g2,6,g2,g2,36,g2,6,g2,g2,12,e2,g2
	db 12,c3,6,c3,c3,12,a2,6,a2,a2,12,g2,6,g2,g2,12,f2,6,f2,f2
	db 12,e2,c2,e2,c2,96,g1,kyu,kyu,xxx,xxx,0
bar4
	db sno,sn3,vib,6,20,40
	db 12,g2,6,g2,g2,36,g2,6,g2,g2,12,e2,g2
	db 12,c3,6,c3,c3,36,c3,6,c3,c3,12,g2,c3
	db 12,e3,6,e3,e3,12,d3,6,d3,d3,12,c3,6,c3,c3,12,a2,6,a2,a2
	db 12,g2,e2,g2,e2,96,c2,kyu,kyu,xxx,xxx,0
bar5
	db sno,sn2,vib,6,10,40
	db 36,c2,24,c3,12,g2,24,c2
	db 36,e2,24,e3,12,c3,24,g2
	db 12,g3,6,e3,c3,12,f3,6,c3,g2,12,e3,6,c3,g2,12,d3,6,c3,a2,12,c3,g2,c3,g2,96,c2,kyu,kyu,xxx,xxx,0
bar6


bar7





bar8





BAR9
;
 
BAR10
 
 
BAR11
 
 
 
 
 
BAR12
 
BAR13
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
BAR14
 
 
 
 

 
 
 
 
 
 
 
 
 

 
 
 
 

BAR15
 
 
 
 

 
 
 
 
 
 
 
 
 
 
BAR16
 
 
 
 
 
BAR17
 
 
 
BAR18
 
BAR19
 
 
BAR20
 
 
 
 
 
BAR21
 
 

BAR22
;
;
;
;
;
BAR23
 
 
 
BAR24
 
 
 

BAR25
 
;
BAR26
 
 
BAR27
 
 
 
 
 

 
 
 
 
