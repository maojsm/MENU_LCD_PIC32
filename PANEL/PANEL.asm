_LedOperacaoON:
;PANEL.c,10 :: 		void LedOperacaoON()     { L_OPERACAO = 0;/*0=Apagado*/ }
LUI	R2, BitMask(RB8_bit+0)
ORI	R2, R2, BitMask(RB8_bit+0)
_SX	
L_end_LedOperacaoON:
JR	RA
NOP	
; end of _LedOperacaoON
_LedOperacaoOFF:
;PANEL.c,11 :: 		void LedOperacaoOFF()    { L_OPERACAO = 1;/*1=Aceso*/ }
LUI	R2, BitMask(RB8_bit+0)
ORI	R2, R2, BitMask(RB8_bit+0)
_SX	
L_end_LedOperacaoOFF:
JR	RA
NOP	
; end of _LedOperacaoOFF
_ChaveIntermitente:
;PANEL.c,13 :: 		char ChaveIntermitente() { return !C_PISCA;/*Retorna 1 se Ligada*/ }
_LX	
EXT	R2, R2, BitPos(RB9_bit+0), 1
XORI	R2, R2, 1
L_end_ChaveIntermitente:
JR	RA
NOP	
; end of _ChaveIntermitente
_DisjuntorFocos:
;PANEL.c,14 :: 		char DisjuntorFocos()    { return !C_APAGAFOCO;/*Retorna 1 se Ligada*/ }
_LX	
EXT	R2, R2, BitPos(RD13_bit+0), 1
XORI	R2, R2, 1
L_end_DisjuntorFocos:
JR	RA
NOP	
; end of _DisjuntorFocos
_TeclaMais:
;PANEL.c,17 :: 		char TeclaMais()       { return T_MAIS; }
_LX	
EXT	R2, R2, BitPos(RB11_bit+0), 1
L_end_TeclaMais:
JR	RA
NOP	
; end of _TeclaMais
_TeclaMenos:
;PANEL.c,18 :: 		char TeclaMenos()      { return T_MENOS; }
_LX	
EXT	R2, R2, BitPos(RB10_bit+0), 1
L_end_TeclaMenos:
JR	RA
NOP	
; end of _TeclaMenos
_TeclaConfirma:
;PANEL.c,19 :: 		char TeclaConfirma()   { return T_CONFIRMA; }
_LX	
EXT	R2, R2, BitPos(RB13_bit+0), 1
L_end_TeclaConfirma:
JR	RA
NOP	
; end of _TeclaConfirma
_TeclaCancela:
;PANEL.c,20 :: 		char TeclaCancela()    { return T_CANCELA; }
_LX	
EXT	R2, R2, BitPos(RB12_bit+0), 1
L_end_TeclaCancela:
JR	RA
NOP	
; end of _TeclaCancela
_TeclaManual:
;PANEL.c,21 :: 		char TeclaManual()     { return T_MANUAL; }
_LX	
EXT	R2, R2, BitPos(RB7_bit+0), 1
L_end_TeclaManual:
JR	RA
NOP	
; end of _TeclaManual
_Panel_Init:
;PANEL.c,29 :: 		void Panel_Init()
;PANEL.c,32 :: 		T_MAIS_Direction          = 1;//Define direção do pin como entrada
LUI	R2, BitMask(TRISB11_bit+0)
ORI	R2, R2, BitMask(TRISB11_bit+0)
_SX	
;PANEL.c,33 :: 		T_MENOS_Direction         = 1;//Define direção do pin como entrada
LUI	R2, BitMask(TRISB10_bit+0)
ORI	R2, R2, BitMask(TRISB10_bit+0)
_SX	
;PANEL.c,34 :: 		T_CONFIRMA_Direction      = 1;//Define direção do pin como entrada
LUI	R2, BitMask(TRISB13_bit+0)
ORI	R2, R2, BitMask(TRISB13_bit+0)
_SX	
;PANEL.c,35 :: 		T_CANCELA_Direction       = 1;//Define direção do pin como entrada
LUI	R2, BitMask(TRISB12_bit+0)
ORI	R2, R2, BitMask(TRISB12_bit+0)
_SX	
;PANEL.c,37 :: 		L_OPERACAO                = 0; //LED OPERAÇAO DO MICRO, INICIA ACES0=0
LUI	R2, BitMask(RB8_bit+0)
ORI	R2, R2, BitMask(RB8_bit+0)
_SX	
;PANEL.c,40 :: 		C_APAGAFOCO_Direction     = 1; //1=Entrada
LUI	R2, BitMask(TRISD13_bit+0)
ORI	R2, R2, BitMask(TRISD13_bit+0)
_SX	
;PANEL.c,41 :: 		C_PISCA_Direction         = 1; //1=Entrada
LUI	R2, BitMask(TRISB9_bit+0)
ORI	R2, R2, BitMask(TRISB9_bit+0)
_SX	
;PANEL.c,42 :: 		T_PORTA_Direction         = 1; //1=Entrada (Porta do Controlador)
LUI	R2, BitMask(TRISD12_bit+0)
ORI	R2, R2, BitMask(TRISD12_bit+0)
_SX	
;PANEL.c,43 :: 		T_MANUAL_Direction        = 1; //1=Entrada (Modo Manual - P10)
LUI	R2, BitMask(TRISB7_bit+0)
ORI	R2, R2, BitMask(TRISB7_bit+0)
_SX	
;PANEL.c,44 :: 		L_OPERACAO_Direction      = 0; //0=Saida
LUI	R2, BitMask(TRISB8_bit+0)
ORI	R2, R2, BitMask(TRISB8_bit+0)
_SX	
;PANEL.c,47 :: 		DET1_Direction            = 1; //1=Entrada
LUI	R2, BitMask(TRISD7_bit+0)
ORI	R2, R2, BitMask(TRISD7_bit+0)
_SX	
;PANEL.c,48 :: 		DET2_Direction            = 1; //1=Entrada
LUI	R2, BitMask(TRISD6_bit+0)
ORI	R2, R2, BitMask(TRISD6_bit+0)
_SX	
;PANEL.c,49 :: 		DET3_Direction            = 1; //1=Entrada
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;PANEL.c,50 :: 		DET4_Direction            = 1; //1=Entrada
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;PANEL.c,53 :: 		L_OPERACAO = 0;//0=Apagado
LUI	R2, BitMask(RB8_bit+0)
ORI	R2, R2, BitMask(RB8_bit+0)
_SX	
;PANEL.c,54 :: 		}
L_end_Panel_Init:
JR	RA
NOP	
; end of _Panel_Init
