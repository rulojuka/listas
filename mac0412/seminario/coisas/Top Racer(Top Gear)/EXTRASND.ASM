
;ADDITIONS TO THE SOUND PLAYER

;SILENCE AND JUMP TO DOWNLOAD

	CLRP
	MOV	$F2,#$0D
	MOV	$F3,#$00
	MOV	$F2,#$1D
	MOV	$F3,#$00
	JMP	$FFC0
