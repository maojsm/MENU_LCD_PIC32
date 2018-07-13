_InterruptTimerKeyboard:
;TIMER.c,13 :: 		void InterruptTimerKeyboard() iv IVT_TIMER_4 ilevel 5 ics ICS_AUTO {
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 5120
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;TIMER.c,16 :: 		T4IF_bit         = 0;
LUI	R2, BitMask(T4IF_bit+0)
ORI	R2, R2, BitMask(T4IF_bit+0)
_SX	
;TIMER.c,19 :: 		Keyboard_Interrupt();
JAL	_Keyboard_Interrupt+0
NOP	
;TIMER.c,29 :: 		}//Fim do Timer da ProxInt()
L_end_InterruptTimerKeyboard:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
ERET	
; end of _InterruptTimerKeyboard
_TimerKeyboard_Init:
;TIMER.c,35 :: 		void TimerKeyboard_Init() {
;TIMER.c,36 :: 		T4CON         = 0x8050;
ORI	R2, R0, 32848
SW	R2, Offset(T4CON+0)(GP)
;TIMER.c,37 :: 		T4IP0_bit     = 1;
LUI	R2, BitMask(T4IP0_bit+0)
ORI	R2, R2, BitMask(T4IP0_bit+0)
_SX	
;TIMER.c,38 :: 		T4IP1_bit     = 0;
LUI	R2, BitMask(T4IP1_bit+0)
ORI	R2, R2, BitMask(T4IP1_bit+0)
_SX	
;TIMER.c,39 :: 		T4IP2_bit     = 1;
LUI	R2, BitMask(T4IP2_bit+0)
ORI	R2, R2, BitMask(T4IP2_bit+0)
_SX	
;TIMER.c,40 :: 		T4IF_bit      = 0;
LUI	R2, BitMask(T4IF_bit+0)
ORI	R2, R2, BitMask(T4IF_bit+0)
_SX	
;TIMER.c,41 :: 		T4IE_bit      = 1;
LUI	R2, BitMask(T4IE_bit+0)
ORI	R2, R2, BitMask(T4IE_bit+0)
_SX	
;TIMER.c,42 :: 		PR4           = 45000;
ORI	R2, R0, 45000
SW	R2, Offset(PR4+0)(GP)
;TIMER.c,43 :: 		TMR4          = 0;
SW	R0, Offset(TMR4+0)(GP)
;TIMER.c,44 :: 		}
L_end_TimerKeyboard_Init:
JR	RA
NOP	
; end of _TimerKeyboard_Init
