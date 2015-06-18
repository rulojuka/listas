

;-----------------------------------------------
;              I/O  PORT DEFINE

CONT		EQU	$0F1		; control res
APUADD		EQU	$0F2		; APU address
APUDT		EQU	$0F3		;     data
PORT0		EQU	$0F4		;
PORT1		EQU	$0F5		;
PORT2		EQU	$0F6		;
PORT3		EQU	$0F7		;
TMSET		EQU	$0FA		; timer data set
TMSET2		EQU	$0FB		;	     set
TMSET3		EQU	$0FC		;	     set
TMDT		EQU	$0FD		; timer data read
TMDT2		EQU	$0FE		;	     read
TMDT3		EQU	$0FF		;	     read

;-----------------------------------------------
;              DSP REGISTER DEFINE

VOLL		=	$000
VOLR		=	$001
PL1		=	$002		; freq. low
PH1		=	$003		;	high
SRCN		=	$004		; source no.
ADSR1		=	$005
ADSR2		=	$006
GAIN		=	$007

MVOLL		=	$00C
MVOLR		=	$01C
EVOLL		=	$02C
EVOLR		=	$03C
KON		=	$04C		;
KOF		=	$05C		;
FLG		=	$06C

EFB		=	$00D
PMON		=	$02D
NON		=	$03D
EON		=	$04D
DIR		=	$05D
ESA		=	$06D
EDLY		=	$07D


;-----------------------------------------------
;                EQUATE TABLE
;-----------------------------------------------

		ORG	$0000

FL0		DS	1	;
FL1		DS	1	;
FL2		DS	1	;
FL3		DS	1	;

SF0		DS	1	;
SF1		DS	1	;
SF2		DS	1	;
SF3		DS	1	;

FL0S		DS	1	;
FL1S		DS	1	;
FL2S		DS	1	;
FL3S		DS	1	;

SF0C		DS	1	;
SF3C		DS	1	;

T00		DS	2	; word ZERO DATA

;---------------------------------------

SSS		DS	1	; sss & kkk pair work reg.
KKK		DS	1
TTT		DS	1
UUU		DS	1

ADX		DS	4	; keisan (4byte)

RDM		DS	2	; random (2byte)

FKIN		DS	1	; kinshi flag (from koukaon)


;---------------------------------------

CNT		DS	1	; 1/16 counter (for tempo 16ms)

ADS		DS	2	; block add. store (2byte)
BLC		DS	1	; block count (repeat count)

ADD		DS	$10	; address store (16byte) (8part)

KEYONS		DS	1	; key on set
KEYOFFS		DS	1	; key off set
KEYD		DS	1	; key data (loop bit 1,2,4,8,$10,$20,$40,$80)
CHN		DS	1	; channel No. (0,2,4,6,8,10,12,14)

FLGS		DS	1	; 06ch
NONS		DS	1	; 03dh
EONS		DS	1	; 04dh
MONS		DS	1	; 02dh
EKIN		DS	1	;
ECLR		DS	1	;
EFBS		DS	1	;

KTPS		DS	1	; key transpose

TMPD		DS	1	; tempo counter

TMPW		DS	2	; tempo data store
TMP		EQU	TMPW+1	;
TMPC		DS	1	; (@) change step
TMPM		DS	1	; (@) mokuteki
TMPADW		DS	2	; (@)
TMPAD		EQU	TMPADW+1	; (@)

MVOW		DS	2	; main vol.
MVO		EQU	MVOW+1	;
MVOC		DS	1	; (@) change step
MVOM		DS	1	; (@) mokuteki
MVOADW		DS	2	; (@)
MVOAD		EQU	MVOADW+1 ; (@)
VOLS		DS	1	; vol set flag

WAVS		DS	1	; source (for drums sound) 


EVOLW		DS	2	;
EVOL		EQU	EVOLW+1	;
EVORW		DS	2	;
EVOR		EQU	EVORW+1	;


EVOLADW		DS	2		;
EVOLAD		EQU	EVOLADW+1	;
EVORADW		DS	2		;
EVORAD		EQU	EVORADW+1	;

EVOC		DS	2	; (@) change step
EVOLM		EQU	EVOC+1	; (@) mokuteki
EVORM		DS	1	;


ZERO8_10	DS	1
ZERO8_11	DS	$10-1
ZERO8_20	DS	1
ZERO8_21	DS	$10-1
ZERO8_30	DS	1
ZERO8_31	DS	$10-1
ZERO8_40	DS	1
ZERO8_41	DS	$10-1
ZERO8_50	DS	1
ZERO8_51	DS	$10-1
ZERO8_60	DS	1
ZERO8_61	DS	$10-1


;----------------------------------------------------
		ORG	$0200

NGC	=	ZERO8_10	; count (@)
NGO	=	ZERO8_11	; keyoff count (@)
NGS		DS	$10	; nagasa store 8 channel
NGG		EQU	NGS+1	; gate off (%)

VOL		DS	$10	; vol store
SNOS		EQU	VOL+1	; sno store

BLS		DS	$10	; block su (2byte)

ADT		DS	$10	; add taihi (2byte)
ADP		DS	$10	; add store (2byte)

PTC	=	ZERO8_20	; pattern count

PVOC	=	ZERO8_30	; (@)
PVODW		DS	1	; (addw)
PVOD		DS	$10-1	; (addw)
PVOADW		DS	1	; (addw)
PVOAD		DS	$10-1	; (addw)
PVOM:		DS	1	; (addw)
VOLX:		DS	$10-1	; tre x mvo x pvo x vol

PANC	=	ZERO8_31	; (@)
PANDW		DS	1	; (addw)
PAND		DS	$10-1	; (addw)
PANADW		DS	1	; (addw)
PANAD		DS	$10-1	; (addw)
PANM		DS	1	; (addw)
PANF		DS	$10-1	; pan phase

SWPC	=	ZERO8_40	; (@)
SWPHC	=	ZERO8_41	; (@)
SWPDW		DS	1	; (addw)
SWPD		DS	$10-1	; (addw)
SWPADW		DS	1	; (addw)
SWPAD		DS	$10-1	; (addw)
SWPM		DS	1	; (addw)
TUND		DS	$10-1	; part tun

SWSC		DS	1	;
SWSHC		DS	$10-1	;
SWSK		DS	1	;
SWSS		DS	$10-1	;

VIBC		DS	1	; count (?)
VIBCAD		DS	$10-1	; + @ (!)
VIBHC	=	ZERO8_50	; hold count (@)
VIBD	=	ZERO8_51	; depth	 (@)
VIBHS		DS	1	; hold store (!)

VIBCC	=	ZERO8_21	; change count (1)
VIBCS		DS	$10-1	; change store (!)
VIBAD		DS	1	; (!)
VIBDM		DS	$10-1	; (!)

TREC		DS	1	; count (?)
TREHC	=	ZERO8_60	; hold count (@)
TRED	=	ZERO8_61	; depth	 (@)
TRECAD		DS	$10-1	; + @ (!)
TREHS		DS	1	; hold store (!)

PTPS		DS	$10-1	; key transpose

;
