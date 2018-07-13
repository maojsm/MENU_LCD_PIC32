_Lcd_Inicialize:
;LCD.c,12 :: 		void Lcd_Inicialize()
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;LCD.c,15 :: 		Lcd_Init();
SW	R25, 4(SP)
JAL	_Lcd_Init+0
NOP	
;LCD.c,17 :: 		LCD_BACK_Direction = 0;
LUI	R2, BitMask(TRISC4_bit+0)
ORI	R2, R2, BitMask(TRISC4_bit+0)
_SX	
;LCD.c,19 :: 		LCD_BACK = LCD_BACK_ON;
LUI	R2, BitMask(RC4_bit+0)
ORI	R2, R2, BitMask(RC4_bit+0)
_SX	
;LCD.c,21 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
ORI	R25, R0, 12
JAL	_Lcd_Cmd+0
NOP	
;LCD.c,22 :: 		}
L_end_Lcd_Inicialize:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Lcd_Inicialize
_PrintLcd:
;LCD.c,27 :: 		void PrintLcd(char c)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;LCD.c,29 :: 		switch(c)
SW	R25, 4(SP)
J	L_PrintLcd0
NOP	
;LCD.c,31 :: 		case '\r': { Lcd_cmd(_LCD_MOVE_CURSOR_RIGHT); }; break;
L_PrintLcd2:
ORI	R25, R0, 20
JAL	_Lcd_Cmd+0
NOP	
J	L_PrintLcd1
NOP	
;LCD.c,32 :: 		case '\1': { Lcd_cmd(_LCD_FIRST_ROW); };         break;
L_PrintLcd3:
ORI	R25, R0, 128
JAL	_Lcd_Cmd+0
NOP	
J	L_PrintLcd1
NOP	
;LCD.c,33 :: 		case '\2': { Lcd_cmd(_LCD_SECOND_ROW); };        break;
L_PrintLcd4:
ORI	R25, R0, 192
JAL	_Lcd_Cmd+0
NOP	
J	L_PrintLcd1
NOP	
;LCD.c,34 :: 		default:   { Lcd_Chr_CP(c); };                   break;
L_PrintLcd5:
JAL	_Lcd_Chr_CP+0
NOP	
J	L_PrintLcd1
NOP	
;LCD.c,35 :: 		}
L_PrintLcd0:
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L__PrintLcd9
NOP	
J	L_PrintLcd2
NOP	
L__PrintLcd9:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__PrintLcd11
NOP	
J	L_PrintLcd3
NOP	
L__PrintLcd11:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__PrintLcd13
NOP	
J	L_PrintLcd4
NOP	
L__PrintLcd13:
J	L_PrintLcd5
NOP	
L_PrintLcd1:
;LCD.c,36 :: 		}
L_end_PrintLcd:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _PrintLcd
