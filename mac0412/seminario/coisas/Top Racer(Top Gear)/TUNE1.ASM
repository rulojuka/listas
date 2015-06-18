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
	DW	TGChan_SS2	;lead
	DW	TGChan_SS3	;drums
	DW	TGChan_SS4	;synth backing
	DW	TGChan_SS5
	DW	TGChan_SS6
	DW	TGChan_SS8
	DW	TGChan_SS8
TGChan_SS1
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
	DB PAT,<bar1,>bar1,001	;g; pattern call
	db 	ptp,-4
	db pat,<bar1,>bar1,001	;d#
	db 	ptp,-7
	db pat,<bar1,>bar1,001	;c
	db 	ptp,0
	db pat,<bar3,>bar3,001 	;G*8 geff#
	db 	ptp,0
	DB PAT,<bar1,>bar1,001	;g; pattern call
	db 	ptp,-4
	db pat,<bar1,>bar1,001	;d#
	db 	ptp,0
	DB PAT,<bar1,>bar1,001	;g; pattern call
	db 	ptp,0
	db pat,<bar4,>bar4,001	;blank,g,g#,a
      	db 	ptp,000
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-5
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,0
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-5
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,2
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,0
	db pat,<bar6,>bar6,001	;pos9pat7	;blank,g,g#,a
	db 	ptp,0
	DB PAT,<bar1,>bar1,001	;bac to pos 2	;;g; pattern call
	db 	ptp,-4
	db pat,<bar1,>bar1,001	;d#
	db 	ptp,0
	DB PAT,<bar1,>bar1,001	;g; pattern call
	db 	ptp,0
	db pat,<bar4,>bar4,001	;blank,g,g#,a
      	db 	ptp,0
	db pat,<bar5,>bar5,001	;position12 pat 4 ;blank,g,g#,a
	db 	ptp,-5
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-3
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,2
	db pat,<bar5,>bar5,001	;posblank,g,g#,a
	db 	ptp,-3
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,-7
	db pat,<bar5,>bar5,001	;blank,g,g#,a
	db 	ptp,0
	db pat,<bar7,>bar7,001	;pos17pat8	;blank,g,g#,a
	db	0

;	DB 	255				; data end
TGChan_SS2
	DB	PV1,250		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot

	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	ptp,-12
	;db	ecv,2,80,80	;120,120
	;db 	edl,12,255,1
	DB	SNO,SN6		; sound name
	db 	pat,<bar8,>bar8,004
	db 	pat,<bar9,>bar9,1
	db 	pat,<bar10,>bar10,1
	db 	sno,sn6
	db 	pat,<bar9,>bar9,1
	db 	pat,<bar10,>bar10,1
	db 	sno,sn6
	db 	pat,<bar11,>bar11,1
	db 	pat,<bar12,>bar12,1
	db 	pat,<bar8,>bar8,002
	db 	pat,<bar9,>bar9,1
	db 	pat,<bar10,>bar10,1
	db 	sno,sn6
	db 	pat,<bar11,>bar11,1
	db 	pat,<bar12,>bar12,1
	db 	pat,<bar11,>bar11,1
	db 	pat,<bar13,>bar13,1

	db	0

;	db 255
TGChan_SS3
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot
	DB	PTP,0		; key transpose
	DB	024,P90+V99			; step_time,gate_time,velocity
	db 	pat,<bar14,>bar14,1
 	db 	pat,<bar15,>bar15,1
	db 	pat,<bar16,>bar16,5
 	db 	pat,<bar15,>bar15,1
	db 	pat,<bar14,>bar14,1
 	db 	pat,<bar15,>bar15,1
	db 	pat,<bar16,>bar16,3
 	db 	pat,<bar15,>bar15,1
	db 	pat,<bar16,>bar16,1
 	db 	pat,<bar15,>bar15,1

	db	0

;	db 255

TGChan_SS4	    
	DB	PV1,190		; part volume
	DB	PTP,0	; key transpose
	DB	024,P90+V85			; step_time,gate_time,velocity
	db	ecv,9,127,127
	db 	edl,12,255,1
	DB 	PAT,<bar17,>bar17,1
	DB 	PAT,<bar18,>bar18,1
	DB 	PAT,<bar17,>bar17,2
	DB 	PAT,<bar19,>bar19,1
	DB 	PAT,<bar17,>bar17,1
	DB 	PAT,<bar19,>bar19,1
	DB 	PAT,<bar17,>bar17,1
	DB 	PAT,<bar20,>bar20,1
	DB 	PAT,<bar21,>bar21,1
	DB 	PAT,<bar17,>bar17,1
	DB 	PAT,<bar18,>bar18,1
	DB 	PAT,<bar19,>bar19,1
	DB 	PAT,<bar17,>bar17,1
	DB 	PAT,<bar18,>bar18,1
	DB 	PAT,<bar21,>bar21,1
	DB 	PAT,<bar18,>bar18,1
	DB 	PAT,<bar21,>bar21,1

 	db	0

;	db 	255
TGChan_SS5
	DB	PV1,250		; part volume
	DB	SNO,SN1		; sound name
	DB	PAN,011		; panpot

	DB	024,P90+V85			; step_time,gate_time,velocity
	db 	ptp,12
	db 	pat,<bar22,>bar22,76
	db 0
TGChan_SS6
	DB	PV1,255		; part volume
	DB	PAN,011		; panpot

	DB	024,P90+V85			; step_time,gate_time,velocity
	db 	ptp,12		
	db 	pat,<bar23,>bar23,76
	db 0
		      	DB 	PAT,<bar2,>bar2,052
TGChan_SS7
	DB	PV1,250		; part volume
	DB	PAN,11	 ;0=allright 20=allleft	; panpot
	;db 	pam,12,0
	DB	024,P90+V85			; step_time,gate_time,velocity
	db 	ptp,12
	;db	ecv,255,80,80	;120,120
	;db 	edl,12,20,2
;	DB 	PAT,<bar2,>bar2,003
	db 	sno,sn10
	db 	pat,<bar8,>bar8,004
	db 	pat,<bar9,>bar9,1
	db 	pat,<bar10,>bar10,1
	db 	sno,sn10
	db 	pat,<bar9,>bar9,1
	db 	pat,<bar10,>bar10,1
	db 	sno,sn10
	db 	pat,<bar11,>bar11,1
	db 	pat,<bar12,>bar12,1
	db 	pat,<bar8,>bar8,002
	db 	pat,<bar9,>bar9,1
	db 	pat,<bar10,>bar10,1
	db 	sno,sn10
	db 	pat,<bar11,>bar11,1
	db 	pat,<bar12,>bar12,1
	db 	pat,<bar11,>bar11,1
	db 	pat,<bar13,>bar13,1

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
	;DB	c5,c5,c5,c5,c5,c5,c5,c5,c5,c5	
	db KYU,KYU,KYU,KYU,KYU,KYU,KYU,KYU
	DB	000
bar4
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1	;120,kyu
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1	;120,kyu
	db g1,g1
	db g1,g1
 	db af1,af1
 	db af1,af1
 	db a1,a1
 	db a1,a1
	DB	000
bar1
	db 6,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
 	DB	000
bar3
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
	db g1,g1,g1,g1,g1,g1,g1,g1,g1,g1
 	db e1,e1
 	db e1,e1
 	db  f1,f1
 	db  f1,f1
 db gf1,gf1
 db gf1,gf1
	DB	000
bar5
	db bf1,bf1,bf1,bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1,bf1,bf1,bf1
	db bf1
	db bf1,000
bar6
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
bar7
	db d1,d1,d1,d1,d1,d1,d1,d1
	db d1,d1,d1,d1,d1,d1,d1,d1
	db a1,a1,a1
	db a1,a1,a1
	db bf1,bf1
	db bf1,bf1
	db c2,c2,c2,c2,d2,d2,000	;	db 024,a1,012,bf1,bf1,c2,c2,d2,000
bar8
	db vib,18,40,60		;delay,speedofvib,valuetovib
	db 024,kyu
	;db ev2,60,127,0 
	db g2,12,f2,024,g2,bf2,12,bf2,g2,d2,f2,36,g2
	db 24,kyu
	;db ev2,60,0,127 
	db 024,g2,012,f2,024,g2,24,df3,012,df3,c3,bf2,c3,36,bf2,000
bar9
	db sno,sn6
	db 012,d3,ef3,d3,c3,bf2,c3,d3,024,bf2,012,bf2,024,bf2,c3,d3,36,f3
	db 012,c3,120,c3,24,xxx,000	;144,c3
bar10
	db 012,bf3,a3,g3,f3,g3,a3,bf3,24,g3,12,g3,24,g3,a3,bf3,36,bf3
	db 12,g3,60,g3,24
	db sno,sn15,g3,d3,bf2,12,g2,000
bar11
	;db sno,sn6
 	db 12,ef3,d3,c3,d3,ef3,g3,f3,36,ef3,24,ef3,f3,g3,12,ef3,d3,c3,bf2,c3,d3,ef3,24,d3,12,g2,72,g2,000
bar12
	db 012,ef3,d3,c3,d3,ef3,g3,f3,36,ef3,24,ef3,f3,g3,12,bf3,a3,g3,f3,g3,a3,bf3
	db 24,a3,12,a3,a3,bf3,bf3,a3,a3,g3,000
bar13
	db 12,ef3,d3,c3,d3,ef3,g3,f3,36,ef3,24,ef3,f3,g3,12,bf3,a3,g3,f3
	db g3,a3,bf3,24,a3,12,a3,a3,bf3,bf3,c3,c3,d3,000
bar14
	db sno,sn14,24,kyu,48,c3,c3,c3,12,c3,sno,sn13,12,c3,24,c3
	db sno,sn14,24,c3,sno,sn13,c3
	db sno,sn14,24,c3,sno,sn13,c3
	db sno,sn14,24,c3,sno,sn13,c3
	db sno,sn14,24,c3,000
bar15
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,24,c3,12,sno,sn14,c3,6,c3,c3,12,c3,6,c3,c3,12
	db c3,6,c3,c3,000
bar16
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,24,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,24,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,24,c3
	db sno,sn13,24,c3,sno,sn14,c3
	db sno,sn13,12,c3,c3,sno,sn14,c3,c3,000
bar17
	db sno,sn7
	db pan,0,6,g2,d3,pan,1,g3,g2,pan,2,d3,g3,pan,3,g2,d3,pan,4,bf3,g2,pan,5,d3,a3,pan,6,g2,d3,pan,7,g3,g2
	db pan,8,6,g2,d3,pan,9,g3,g2,pan,10,d3,g3,pan,11,g2,d3,pan,12,bf3,g2,pan,13,d3,a3,pan,14,g2,d3,pan,15,g3,g2
	db pan,16,6,g2,ef3,pan,17,g3,g2,pan,18,ef3,g3,pan,19,g2,ef3,pan,20,bf3,g2,pan,19,ef3,a3,pan,18,g2,pan,17,ef3,pan,16,g3,g2
	db pan,15,6,g2,pan,14,ef3,pan,13,g3,pan,12,g2,pan,11,ef3,pan,10,g3,pan,9,g2
	db pan,8,ef3,pan,7,bf3,pan,6,g2,pan,5,ef3,pan,4,a3,pan,3,g2
	  db pan,2,ef3,pan,1,g3,pan,0,g2
	db 000
bar18
	;db sno,sn10
	db pan,0,6,g2,c3,pan,1,g3,g2,pan,2,c3,g3,pan,3,g2,c3,pan,4,bf3,g2,pan,5,c3,a3,pan,6,g2,c3,pan,7,g3,g2
	db pan,8,6,g2,c3,pan,9,g3,g2,pan,10,c3,g3,pan,11,g2,c3,pan,12,bf3,g2,pan,13,c3,a3,pan,14,g2,c3,pan,15,g3,g2
	db pan,16,6,g2,d3,pan,17,g3,g2,pan,18,d3,g3,pan,19,g2,d3,pan,20,bf3,g2,pan,19,d3,a3,pan,18,g2,pan,17,d3,pan,16,g3,g2
	db pan,15,6,g2,pan,14,d3,pan,13,g3,pan,12,g2,pan,11,e2,pan,10,b2
 	db pan,9,e3,pan,8,e2,pan,7,f2,pan,6,c3,pan,5,f3,pan,4,f2,pan,3,gf2
	db pan,2,df3,pan,1,gf3,pan,0,gf2
	db 000			   
bar19
	;db sno,sn5
	db pan,0,6,bf1,f2,pan,1,bf2,bf1,pan,2,f2,bf2,pan,3,bf1,f2,pan,4,d3,bf1,pan,5,f2,c3,pan,6,bf1,f2,pan,7,bf2,bf1
	db pan,8,6,bf1,f2,pan,9,bf2,bf1,pan,10,f2,bf2,pan,11,bf1,f2,pan,12,d3,bf1,pan,13,f2,c3,pan,14,bf1,f2,pan,15,bf2,bf1
	db pan,16,6,f2,c3,pan,17,f3,f2,pan,18,c3,f3,pan,19,f2,c3,pan,20,a3,f2,pan,19,c3,g3,pan,18,f2,pan,17,c3,pan,16,f3,f2

	db pan,15,6,f2,pan,14,c3,pan,13,f3,pan,12,f2,pan,11,c3,pan,10,f3,pan,9,f2
	db pan,8,c3,pan,7,a3,pan,6,f2,pan,5,c3,pan,4,g3,pan,3,f2
	 db pan,2,c3,pan,1,f3,pan,0,f2
       	db 000			
bar20
	;db sno,sn5
	db pan,0,6,g2,c3,pan,1,g3,g2,pan,2,c3,g3,pan,3,g2,c3,pan,4,bf3,g2,pan,5,c3,a3,pan,6,g2,c3,pan,7,g3,g2
	db pan,8,6,g2,c3,pan,9,g3,g2,pan,10,c3,g3,pan,11,g2,c3,pan,12,bf3,g2,pan,13,c3,a3,pan,14,g2,c3,pan,15,g3,g2
	db pan,16,6,g2,d3,pan,17,g3,g2,pan,18,d3,g3,pan,19,g2,d3,pan,20,bf3,g2,pan,19,d3,a3,pan,18,g2,pan,17,d3,pan,16,g3,g2
	db pan,15,6,g2,pan,14,d3,pan,13,g3,pan,12,g2,pan,11,d3,pan,10,g3
 	db pan,9,g2,pan,8,d3,pan,7,bf3,pan,6,g2,pan,5,d3,pan,4,a3,pan,3,g2
	db pan,2,d3,pan,1,g3,pan,0,g2
	db 000			   
bar21
	;db sno,sn5
	db pan,0,6,g2,ef3,pan,1,g3,g2,pan,2,ef3,g3,pan,3,g2,ef3,pan,4,bf3,g2,pan,5,ef3,a3,pan,6,g2,ef3,pan,7,g3,g2
	db pan,8,6,g2,ef3,pan,9,g3,g2,pan,10,ef3,g3,pan,11,g2,ef3,pan,12,bf3,g2,pan,13,ef3,a3,pan,14,g2,ef3,pan,15,g3,g2
	db pan,16,6,a2,d3,pan,17,g3,a2,pan,18,d3,g3,pan,19,a2,d3,pan,20,bf3,a2,pan,19,d3,a3,pan,18,a2,pan,17,d3,pan,16,g3,a2
	db pan,15,6,a2,pan,14,d3,pan,13,a3,pan,12,a2,pan,11,d3,pan,10,a3
 	db pan,9,a2,pan,8,d3,pan,7,c4,pan,6,a2,pan,5,d3,pan,4,bf3,pan,3,a2
	db pan,2,d3,pan,1,a3,pan,0,a2
	db 000			   
bar22
	db sno,sn17
	db 12,c3,c3,c3,6,c3,c3,12,c3,c3,c3,06,c3,c3,000

bar23
 	db sno,sn16
	db 12,kyu,c2,kyu,kyu,c2,kyu,c1,c2,kyu,c2,c2,kyu,c2,kyu,kyu,c1,000
bar24
	db sno,sn6
	db 12,g3,bf3,d4,g3,bf3,d4,g3,bf3
	db g3,bf3,d4,g3,bf3,d4,g3,bf3
	db ef3,g3,bf3,ef3,g3,bf3,ef3,g3
	db ef3,g3,bf3,ef3,g3,bf3,ef3,g3
	db c3,ef3,g3,c3,ef3,g3,c3,ef3,g3
	db c3,ef3,g3,c3,ef3,g3,c3,ef3,g3
	db 000
	db g3,bf3,d4,g3,bf3,d4,g3,bf3

 	db sno,sn1,96,bf3,bf3,g3,g3,ef3,ef3,bf3,12,bf3,bf3,af3,af3,a3,a3,c4,c4,000
 	db sno,sn2
	db 12,d4,xxx,d4,xxx,d4,xxx,d4,xxx
	db 12,d4,xxx,d4,xxx,d4,xxx,d4,xxx
	db 12,bf3,xxx,bf3,xxx,bf3,xxx,bf3,xxx
	db 12,bf3,xxx,bf3,xxx,bf3,xxx,bf3,xxx
	db 12,g3,xxx,g3,xxx,g3,xxx,g3,xxx
	db 12,g3,xxx,g3,xxx,g3,xxx,g3,xxx,000


  
