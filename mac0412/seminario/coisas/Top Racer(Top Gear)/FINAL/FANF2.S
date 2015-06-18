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
	DB	TP1,26	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
       db	ecv,3,80,127
	db 	edl,12,155,1
	DB	24,P80+V99			; step_time,gate_time,velocity
	db 	ptp,-12
	db 	pat,<bar1,>bar1,3

	db 0


;	DB 	255				; data end
TGChan_SS2
	DB	PV1,240		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
	db ptp,12
	db pat,<bar3,>bar3,3
	db	0

;	db 255
TGChan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0	; key transpose
	DB	024,P90+V99 
	db pat,<bar4,>bar4,6			; step_time,gate_time,velocity
	db	0
	

;	db 255

TGChan_SS4	    
	DB	PV1,250		; part volume
	DB	PTP,12	; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db pat,<bar5,>bar5,1			; step_time,gate_time,velocity
	db 0
TGChan_SS5
;	DB	TP1,22	;27		; tempo
	DB	PV1,250		; part volume
	DB	PAN,11	; panpot
	DB	24,P80+V80			; step_time,gate_time,velocity
	db 	ptp,12
	db 	pat,<bar6,>bar6,24
	db 0
TGChan_SS6
	DB	PV1,160		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<bar7,>bar7,3
	db	0
TGChan_SS7
	DB	PV1,160		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<bar8,>bar8,3
	db 0
TGChan_SS8
	DB	PV1,160		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V80			; step_time,gate_time,velocity
	db ptp,0
	db pat,<bar9,>bar9,3
	db 0
bar2
	db 96,xxx,xxx,xxx,xxx,0
bar1
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
	

bar3
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

bar4
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
bar5
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
bar6
	db sno,sn4,6,12,c3,6,c3,12,c3,6,c3,12,c3,6,c3,12,c3,6,c3,0
bar7
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
bar8
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

bar9
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