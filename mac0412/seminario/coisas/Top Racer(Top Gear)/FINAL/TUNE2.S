;top gear level music number One...
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
	DW	TGChan_SS1	;guitar
	DW	TGChan_SS2	;bass
	DW	TGChan_SS3	;drums
	DW	TGChan_SS4	;lead
	DW	TGChan_SSx	;
	DW	TGChan_SSx	;
	DW	TGChan_SSx	;  
	DW	TGChan_SSx	;
TGChan_SSX
	DB PAT,<BAR2,>BAR2,51,0
TGChan_SS1
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
    	db 	pat,<bar1,>bar1,4
	db 	pat,<bar10,>bar10,1
    	db 	pat,<bar1,>bar1,2
    	db 	pat,<bar9,>bar9,2
    	db 	pat,<bar1,>bar1,4
    	db 	pat,<bar1,>bar1,2
    	db 	pat,<bar9,>bar9,2
  	db 	pat,<bar14,>bar14,2
	db ptp,-10
	db	pat,<bar9,>bar9,1 
	db 0
TGChan_SS2
	DB	PV1,200		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	DB	024,P90+V99			; step_time,gate_time,velocity
 	db 	ptp,-12
	db 	sno,sn2
	db 	pat,<bar2,>bar2,1
	db 	pat,<bar1,>bar1,3
	;****************************
	db 	pat,<bar2,>bar2,1
	db  	pat,<bar1,>bar1,3
	db 	pat,<bar12,>bar12,2
	db  	pat,<bar1,>bar1,2
	db  	pat,<bar1,>bar1,2
	db  	pat,<bar1,>bar1,2
	db 	pat,<bar12,>bar12,2
	db 	ptp,-10
	db 	pat,<bar1,>bar1,2
	db 	pat,<bar12,>bar12,1 
	db	0

;	db 255
TGChan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,-2		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	sno,sn3
	db 	pat,<bar2,>bar2,2
	db 	pat,<bar3,>bar3,7
	db 	sno,sn4
	db 	pat,<bar3,>bar3,1

	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1	
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1	
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1	
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	
	db 	pat,<bar5,>bar5,2	
	db 	pat,<bar6,>bar6,2	
	db 	pat,<bar5,>bar5,2	
	db 	pat,<bar6,>bar6,2	
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1

	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1	
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	
	db 	pat,<bar5,>bar5,2	
	db 	pat,<bar6,>bar6,2	
	db 	pat,<bar5,>bar5,2	
	db 	pat,<bar6,>bar6,2	

	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	db 	pat,<bar5,>bar5,3	
	db 	pat,<bar6,>bar6,1
	db 	sno,sn4
	db 	pat,<bar5,>bar5,2	
	db 	pat,<bar3,>bar3,2
	db	0

;	db 255

TGChan_SS4	    
	DB	PV1,250		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85 
	db 	pat,<bar2,>bar2,3	;pos 0
	db	sno,sn5
	db 	pat,<bar4,>bar4,3
	db 	pat,<bar3,>bar3,1
	db ptp,0
	db 	pat,<bar2,>bar2,1	;pos 0
	db 	pat,<bar7,>bar7,1	;pos 0
	db 	pat,<bar8,>bar8,2	;pos 0
	db 	pat,<bar13,>bar13,2
	db 	pat,<bar8,>bar8,2	;pos 0
	db 	pat,<bar2,>bar2,2;pos 0
	db 	pat,<bar8,>bar8,2	;pos 0
	db 	pat,<bar13,>bar13,2
	db 	pat,<bar15,>bar15,1
	db 	pat,<bar16,>bar16,1
	db 0
bar2
	db 96,kyu,kyu,kyu,kyu,0
bar4
	db 48,c3,12,c3,36,c3,0	
bar1
	db 12,c2,c2,c2,24,bf1,c2,12,bf1,24,af1,c2,g1,bf1
	db 12,c2,c2,c2,24,bf1,c2,12,bf1,24,af1,c2,g1,f1,0
bar3
	db 6,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,c3,0
bar5
	db sno,sn5,24,c3,sno,sn4,c3,sno,sn5,12,c3,c3,sno,sn4,24,c3,0
bar6
	db sno,sn5,24,c3,sno,sn4,c3,sno,sn5,12,c3,sno,sn4,c3,c3,6,c3,c3,0
bar7	
	db sno,sn6
	db 96,xxx,xxx,xxx,84,xxx,24,c3,0
bar8
	db 12,bf2,c3,d3,ef3,f3,ef3,36,c3,24,g2,bf2,36,c3
	db 12,ef3,d3,ef3,d3,c3,bf2,24,c3,12,bf2,24,g3,12,f3,ef3,d3,24,c3,0
bar9
	db 24,f1,12,ef1,60,f1
	db 24,g1,12,f1,60,g1
	db 24,af1,12,g1,60,af1
	db 24,bf1,12,af1,60,bf1,0
bar10
	db 72,c2,24,bf1
	db 72,c2,24,bf1
	db 72,c2,24,bf1
	db 72,c2,24,bf1
	db 96,c2,tie,kyu,kyu,0
bar11
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2
	db 12,c2,c2,c2,c2,bf1,bf1,c2,c2,0
bar12
	db 12,f1,f1,f1,f1,f1,f1,f1,f1,g1,g1,g1,g1,g1,g1,g1,g1
	db af1,af1,af1,af1,af1,af1,af1,af1,bf1,bf1,bf1,bf1,bf1,bf1,bf1,bf1
 	db 0
bar13					  ;SWS - BENDONDOWN
	db 12,bf2,c3,d3,ef3,f3,ef3,24,c3
	db 12,f3,ef3,f3,gf3,f3,24,ef3
	db 12,c3,ef3,d3,ef3,d3,c3,bf2,24,c3,12,bf2,24,g3,12,f3,ef3,d3,24,c3,000
bar14
	db 24,d2,12,d2,b1,d2,24,d2,60,bf1,48,c2
	db 24,d2,12,d2,b1,d2,24,d2,60,bf1,48,a1,0
bar15
	db 12,c3,d3,e3,f3,g3,f3,24,d3
	db 12,g3,f3,g3,af3,g3,24,f3
	db 12,d3,f3,e3,f3,e3,d3,c3
	db 24,d3,12,c3,24,a3,12,g3,f3,e3,24,d3
	db 12,c3,d3,e3,f3,g3,f3,24,d3
	db 12,g3,f3,g3,af3,g3,24,f3
	db 12,d3,f3,e3,f3,e3,d3,c3
	db 24,d3,12,c3,24,a3,12,g3,f3,e3,d3,0
bar16
 	db 12,d3,6,e3,f3,12,e3,d3,6,e3,f3,12,e3,d3,6,e3,f3
	db 12,e3,d3,6,e3,f3,12,e3,d3,6,f3,e3,12,f3,d3
	db 12,d3,6,f3,e3,12,f3,d3,6,g3,f3,12,g3,d3,6,a3,g3
	db 12,a3,d3,6,a3,bf3,12,a3,d3,6,c3,d3,12,c3,6,d3,d3,0
bar17
			
