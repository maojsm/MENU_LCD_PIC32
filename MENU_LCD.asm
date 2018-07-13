_KeyReading:
;menu_lcd_read.h,24 :: 		char KeyReading()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;menu_lcd_read.h,27 :: 		if (TeclaMais()     == _TC_ON)   return(key_MAIS);
JAL	_TeclaMais+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__KeyReading28
NOP	
J	L_KeyReading0
NOP	
L__KeyReading28:
ORI	R2, R0, 43
J	L_end_KeyReading
NOP	
L_KeyReading0:
;menu_lcd_read.h,28 :: 		if (TeclaMenos()    == _TC_ON)   return(key_MENOS);
JAL	_TeclaMenos+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__KeyReading29
NOP	
J	L_KeyReading1
NOP	
L__KeyReading29:
ORI	R2, R0, 45
J	L_end_KeyReading
NOP	
L_KeyReading1:
;menu_lcd_read.h,29 :: 		if (TeclaConfirma() == _TC_ON)   return(key_CONFIRMA);
JAL	_TeclaConfirma+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__KeyReading30
NOP	
J	L_KeyReading2
NOP	
L__KeyReading30:
ORI	R2, R0, 62
J	L_end_KeyReading
NOP	
L_KeyReading2:
;menu_lcd_read.h,30 :: 		if (TeclaCancela()  == _TC_ON)   return(key_CANCELA);
JAL	_TeclaCancela+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__KeyReading31
NOP	
J	L_KeyReading3
NOP	
L__KeyReading31:
ORI	R2, R0, 60
J	L_end_KeyReading
NOP	
L_KeyReading3:
;menu_lcd_read.h,31 :: 		if (TeclaManual()   == _TC_ON)   return(key_MANUAL);
JAL	_TeclaManual+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__KeyReading32
NOP	
J	L_KeyReading4
NOP	
L__KeyReading32:
ORI	R2, R0, 52
J	L_end_KeyReading
NOP	
L_KeyReading4:
;menu_lcd_read.h,33 :: 		return(key_NULL);
ORI	R2, R0, 95
;menu_lcd_read.h,35 :: 		}//fim da KeyReading
L_end_KeyReading:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _KeyReading
_KeyRead:
;menu_lcd_read.h,43 :: 		char KeyRead()
;menu_lcd_read.h,47 :: 		keyCurrent = keyPressed;
; keyCurrent start address is: 12 (R3)
LBU	R3, Offset(_keyPressed+0)(GP)
;menu_lcd_read.h,49 :: 		keyPressed = key_NULL;
ORI	R2, R0, 95
SB	R2, Offset(_keyPressed+0)(GP)
;menu_lcd_read.h,51 :: 		return(keyCurrent);
ANDI	R2, R3, 255
; keyCurrent end address is: 12 (R3)
;menu_lcd_read.h,52 :: 		}
L_end_KeyRead:
JR	RA
NOP	
; end of _KeyRead
_Keyboard_Interrupt:
;menu_lcd_read.h,56 :: 		void Keyboard_Interrupt()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;menu_lcd_read.h,59 :: 		if (T0_cntKEY < 250)          T0_cntKEY++;
LBU	R2, Offset(_T0_cntKEY+0)(GP)
SLTIU	R2, R2, 250
BNE	R2, R0, L__Keyboard_Interrupt35
NOP	
J	L_Keyboard_Interrupt5
NOP	
L__Keyboard_Interrupt35:
LBU	R2, Offset(_T0_cntKEY+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_T0_cntKEY+0)(GP)
L_Keyboard_Interrupt5:
;menu_lcd_read.h,61 :: 		if (T0_cntKEY > 10/*0,3s com a tecla "travada"*/)
LBU	R2, Offset(_T0_cntKEY+0)(GP)
SLTIU	R2, R2, 11
BEQ	R2, R0, L__Keyboard_Interrupt36
NOP	
J	L_Keyboard_Interrupt6
NOP	
L__Keyboard_Interrupt36:
;menu_lcd_read.h,64 :: 		keyPressed = KeyReading();
JAL	_KeyReading+0
NOP	
SB	R2, Offset(_keyPressed+0)(GP)
;menu_lcd_read.h,65 :: 		if (keyPressed != key_NULL) {
ANDI	R3, R2, 255
ORI	R2, R0, 95
BNE	R3, R2, L__Keyboard_Interrupt38
NOP	
J	L_Keyboard_Interrupt7
NOP	
L__Keyboard_Interrupt38:
;menu_lcd_read.h,67 :: 		T0_cntKEY = 0;
SB	R0, Offset(_T0_cntKEY+0)(GP)
;menu_lcd_read.h,71 :: 		}
L_Keyboard_Interrupt7:
;menu_lcd_read.h,72 :: 		}
L_Keyboard_Interrupt6:
;menu_lcd_read.h,73 :: 		}
L_end_Keyboard_Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Keyboard_Interrupt
MENU_LCD_MostrarItens:
;MENU_LCD.c,72 :: 		static char MostrarItens( const Item* menu[], char sel )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;MENU_LCD.c,74 :: 		char index = 0, row = 1;
SW	R27, 4(SP)
; index start address is: 20 (R5)
MOVZ	R5, R0, R0
; row start address is: 16 (R4)
ORI	R4, R0, 1
;MENU_LCD.c,76 :: 		Lcd_Cmd( _LCD_CLEAR );
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_Lcd_Cmd+0
NOP	
LW	R25, 8(SP)
;MENU_LCD.c,78 :: 		if( menu == 0 )
BEQ	R25, R0, L_MENU_LCD_MostrarItens40
NOP	
J	L_MENU_LCD_MostrarItens8
NOP	
L_MENU_LCD_MostrarItens40:
; row end address is: 16 (R4)
; index end address is: 20 (R5)
;MENU_LCD.c,79 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_MostrarItens
NOP	
L_MENU_LCD_MostrarItens8:
;MENU_LCD.c,81 :: 		while( menu[index] )
; index start address is: 20 (R5)
; index end address is: 20 (R5)
; row start address is: 16 (R4)
L_MENU_LCD_MostrarItens9:
; row start address is: 16 (R4)
; row end address is: 16 (R4)
; index start address is: 20 (R5)
ANDI	R2, R5, 255
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R2, 0(R2)
BNE	R2, R0, L_MENU_LCD_MostrarItens42
NOP	
J	L_MENU_LCD_MostrarItens10
NOP	
L_MENU_LCD_MostrarItens42:
; row end address is: 16 (R4)
;MENU_LCD.c,83 :: 		if( index < sel ) { index++; continue; }
; row start address is: 16 (R4)
ANDI	R3, R5, 255
ANDI	R2, R26, 255
SLTU	R2, R3, R2
BNE	R2, R0, L_MENU_LCD_MostrarItens43
NOP	
J	L_MENU_LCD_MostrarItens11
NOP	
L_MENU_LCD_MostrarItens43:
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
J	L_MENU_LCD_MostrarItens9
NOP	
L_MENU_LCD_MostrarItens11:
;MENU_LCD.c,84 :: 		if( index == sel ) Lcd_Chr( row, 1, '>' );
ANDI	R3, R5, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L_MENU_LCD_MostrarItens44
NOP	
J	L_MENU_LCD_MostrarItens12
NOP	
L_MENU_LCD_MostrarItens44:
SB	R26, 8(SP)
SW	R25, 12(SP)
ORI	R27, R0, 62
ORI	R26, R0, 1
ANDI	R25, R4, 255
JAL	_Lcd_Chr+0
NOP	
LW	R25, 12(SP)
LBU	R26, 8(SP)
J	L_MENU_LCD_MostrarItens13
NOP	
L_MENU_LCD_MostrarItens12:
;MENU_LCD.c,85 :: 		else Lcd_Chr( row, 1, ' ' );
SB	R26, 8(SP)
SW	R25, 12(SP)
ORI	R27, R0, 32
ORI	R26, R0, 1
ANDI	R25, R4, 255
JAL	_Lcd_Chr+0
NOP	
LW	R25, 12(SP)
LBU	R26, 8(SP)
L_MENU_LCD_MostrarItens13:
;MENU_LCD.c,86 :: 		row++;
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;MENU_LCD.c,87 :: 		LcdWriteFromROM( menu[index++]->Texto );
ANDI	R2, R5, 255
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R2, 0(R2)
ADDIU	R2, R2, 4
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	MENU_LCD_LcdWriteFromROM+0
NOP	
LW	R25, 8(SP)
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;MENU_LCD.c,88 :: 		}
; row end address is: 16 (R4)
J	L_MENU_LCD_MostrarItens9
NOP	
L_MENU_LCD_MostrarItens10:
;MENU_LCD.c,90 :: 		if( index <= sel )
ANDI	R3, R5, 255
; index end address is: 20 (R5)
ANDI	R2, R26, 255
SLTU	R2, R2, R3
BEQ	R2, R0, L_MENU_LCD_MostrarItens45
NOP	
J	L_MENU_LCD_MostrarItens14
NOP	
L_MENU_LCD_MostrarItens45:
;MENU_LCD.c,91 :: 		return 1;
ORI	R2, R0, 1
J	L_end_MostrarItens
NOP	
L_MENU_LCD_MostrarItens14:
;MENU_LCD.c,92 :: 		return 0;
MOVZ	R2, R0, R0
;MENU_LCD.c,93 :: 		}
;MENU_LCD.c,92 :: 		return 0;
;MENU_LCD.c,93 :: 		}
L_end_MostrarItens:
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of MENU_LCD_MostrarItens
MENU_LCD_LcdWriteFromROM:
;MENU_LCD.c,95 :: 		static void LcdWriteFromROM( const char* texto )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;MENU_LCD.c,97 :: 		while( *texto )
L_MENU_LCD_LcdWriteFromROM15:
LBU	R2, 0(R25)
BNE	R2, R0, L_MENU_LCD_LcdWriteFromROM48
NOP	
J	L_MENU_LCD_LcdWriteFromROM16
NOP	
L_MENU_LCD_LcdWriteFromROM48:
;MENU_LCD.c,99 :: 		Lcd_Chr_CP( *texto++ );
SW	R25, 4(SP)
LBU	R25, 0(R25)
JAL	_Lcd_Chr_CP+0
NOP	
LW	R25, 4(SP)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;MENU_LCD.c,100 :: 		}
J	L_MENU_LCD_LcdWriteFromROM15
NOP	
L_MENU_LCD_LcdWriteFromROM16:
;MENU_LCD.c,101 :: 		}
L_end_LcdWriteFromROM:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of MENU_LCD_LcdWriteFromROM
_Menu_init:
;MENU_LCD.c,103 :: 		void Menu_init()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;MENU_LCD.c,105 :: 		MenuAtual = TelaInicial; //A tela atual = tela inicial
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(_TelaInicial+0)
ORI	R2, R2, lo_addr(_TelaInicial+0)
SW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
;MENU_LCD.c,106 :: 		MenuAnterior = &Stack;   //Aponta para a pilha
LUI	R2, hi_addr(MENU_LCD_Stack+0)
ORI	R2, R2, lo_addr(MENU_LCD_Stack+0)
SW	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
;MENU_LCD.c,108 :: 		MostrarItens( MenuAtual, selecao ); //Exibe os itens
LBU	R26, Offset(MENU_LCD_selecao+0)(GP)
LW	R25, Offset(MENU_LCD_MenuAtual+0)(GP)
JAL	MENU_LCD_MostrarItens+0
NOP	
;MENU_LCD.c,109 :: 		}
L_end_Menu_init:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Menu_init
_Menu_main:
;MENU_LCD.c,113 :: 		void Menu_main()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;MENU_LCD.c,116 :: 		switch( KeyRead())
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_KeyRead+0
NOP	
SB	R2, 16(SP)
J	L_Menu_main17
NOP	
;MENU_LCD.c,119 :: 		case key_MAIS: {
L_Menu_main19:
;MENU_LCD.c,122 :: 		UART2_Write_Text("\r\nMAIS!");
LUI	R25, hi_addr(?lstr1_MENU_LCD+0)
ORI	R25, R25, lo_addr(?lstr1_MENU_LCD+0)
JAL	_UART2_Write_Text+0
NOP	
;MENU_LCD.c,124 :: 		++selecao; //seleciona o proximo item
LBU	R2, Offset(MENU_LCD_selecao+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(MENU_LCD_selecao+0)(GP)
;MENU_LCD.c,128 :: 		if( MostrarItens( MenuAtual, selecao ).B0 )
ANDI	R26, R2, 255
LW	R25, Offset(MENU_LCD_MenuAtual+0)(GP)
JAL	MENU_LCD_MostrarItens+0
NOP	
EXT	R2, R2, 0, 1
BNE	R2, R0, L__Menu_main52
NOP	
J	L_Menu_main20
NOP	
L__Menu_main52:
;MENU_LCD.c,130 :: 		selecao = 0;
SB	R0, Offset(MENU_LCD_selecao+0)(GP)
;MENU_LCD.c,131 :: 		MostrarItens( MenuAtual, selecao );
MOVZ	R26, R0, R0
LW	R25, Offset(MENU_LCD_MenuAtual+0)(GP)
JAL	MENU_LCD_MostrarItens+0
NOP	
;MENU_LCD.c,132 :: 		}
L_Menu_main20:
;MENU_LCD.c,134 :: 		} break;
J	L_Menu_main18
NOP	
;MENU_LCD.c,138 :: 		case key_MENOS: {
L_Menu_main21:
;MENU_LCD.c,140 :: 		UART2_Write_Text("\r\nMENOS!");
LUI	R25, hi_addr(?lstr2_MENU_LCD+0)
ORI	R25, R25, lo_addr(?lstr2_MENU_LCD+0)
JAL	_UART2_Write_Text+0
NOP	
;MENU_LCD.c,142 :: 		} break;
J	L_Menu_main18
NOP	
;MENU_LCD.c,146 :: 		case key_CONFIRMA: {
L_Menu_main22:
;MENU_LCD.c,151 :: 		void(*Func)(char) = MenuAtual[selecao]->Tarefa;
LBU	R2, Offset(MENU_LCD_selecao+0)(GP)
SLL	R3, R2, 2
LW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
ADDU	R2, R2, R3
LW	R2, 0(R2)
ADDIU	R2, R2, 20
LW	R2, 0(R2)
; Func start address is: 20 (R5)
MOVZ	R5, R2, R0
;MENU_LCD.c,153 :: 		UART2_Write_Text("\r\nCONFIRMA!");
LUI	R25, hi_addr(?lstr3_MENU_LCD+0)
ORI	R25, R25, lo_addr(?lstr3_MENU_LCD+0)
JAL	_UART2_Write_Text+0
NOP	
;MENU_LCD.c,155 :: 		if( Func != NULL )
BNE	R5, R0, L__Menu_main54
NOP	
J	L_Menu_main23
NOP	
L__Menu_main54:
;MENU_LCD.c,158 :: 		Func( MenuAtual[selecao]->Parms );
LBU	R2, Offset(MENU_LCD_selecao+0)(GP)
SLL	R3, R2, 2
LW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
ADDU	R2, R2, R3
LW	R2, 0(R2)
ADDIU	R2, R2, 24
SW	R5, 12(SP)
LBU	R25, 0(R2)
JALR	RA, R5
NOP	
; Func end address is: 20 (R5)
LW	R5, 12(SP)
;MENU_LCD.c,159 :: 		}
L_Menu_main23:
;MENU_LCD.c,162 :: 		if( MenuAtual[selecao]->mItem != NULL )
LBU	R2, Offset(MENU_LCD_selecao+0)(GP)
SLL	R3, R2, 2
LW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
ADDU	R2, R2, R3
LW	R2, 0(R2)
LW	R2, 0(R2)
BNE	R2, R0, L__Menu_main56
NOP	
J	L_Menu_main24
NOP	
L__Menu_main56:
;MENU_LCD.c,165 :: 		*MenuAnterior++ = MenuAtual;
LW	R3, Offset(MENU_LCD_MenuAtual+0)(GP)
LW	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
SW	R3, 0(R2)
LW	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
ADDIU	R2, R2, 4
SW	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
;MENU_LCD.c,167 :: 		MenuAtual = MenuAtual[selecao]->mItem;
LBU	R2, Offset(MENU_LCD_selecao+0)(GP)
SLL	R3, R2, 2
LW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
ADDU	R2, R2, R3
LW	R2, 0(R2)
LW	R2, 0(R2)
SW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
;MENU_LCD.c,169 :: 		selecao = 0;
SB	R0, Offset(MENU_LCD_selecao+0)(GP)
;MENU_LCD.c,170 :: 		MostrarItens( MenuAtual, selecao );
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	MENU_LCD_MostrarItens+0
NOP	
;MENU_LCD.c,171 :: 		}
L_Menu_main24:
;MENU_LCD.c,175 :: 		} break;
J	L_Menu_main18
NOP	
;MENU_LCD.c,179 :: 		case key_CANCELA: {
L_Menu_main25:
;MENU_LCD.c,181 :: 		UART2_Write_Text("\r\nCANCELA!");
LUI	R25, hi_addr(?lstr4_MENU_LCD+0)
ORI	R25, R25, lo_addr(?lstr4_MENU_LCD+0)
JAL	_UART2_Write_Text+0
NOP	
;MENU_LCD.c,183 :: 		selecao = 0;
SB	R0, Offset(MENU_LCD_selecao+0)(GP)
;MENU_LCD.c,185 :: 		if( ((unsigned*)&MenuAnterior)[0] > (unsigned)&Stack )
ORI	R2, R0, lo_addr(MENU_LCD_Stack+0)
ANDI	R3, R2, 65535
LHU	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Menu_main57
NOP	
J	L_Menu_main26
NOP	
L__Menu_main57:
;MENU_LCD.c,188 :: 		MenuAtual = *--MenuAnterior;
LW	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
ADDIU	R2, R2, -4
SW	R2, Offset(MENU_LCD_MenuAnterior+0)(GP)
LW	R2, 0(R2)
SW	R2, Offset(MENU_LCD_MenuAtual+0)(GP)
;MENU_LCD.c,189 :: 		MostrarItens( MenuAtual, selecao );
LBU	R26, Offset(MENU_LCD_selecao+0)(GP)
MOVZ	R25, R2, R0
JAL	MENU_LCD_MostrarItens+0
NOP	
;MENU_LCD.c,190 :: 		}
L_Menu_main26:
;MENU_LCD.c,193 :: 		} break;
J	L_Menu_main18
NOP	
;MENU_LCD.c,196 :: 		}
L_Menu_main17:
LBU	R4, 16(SP)
ANDI	R3, R4, 255
ORI	R2, R0, 43
BNE	R3, R2, L__Menu_main59
NOP	
J	L_Menu_main19
NOP	
L__Menu_main59:
ANDI	R3, R4, 255
ORI	R2, R0, 45
BNE	R3, R2, L__Menu_main61
NOP	
J	L_Menu_main21
NOP	
L__Menu_main61:
ANDI	R3, R4, 255
ORI	R2, R0, 62
BNE	R3, R2, L__Menu_main63
NOP	
J	L_Menu_main22
NOP	
L__Menu_main63:
ANDI	R3, R4, 255
ORI	R2, R0, 60
BNE	R3, R2, L__Menu_main65
NOP	
J	L_Menu_main25
NOP	
L__Menu_main65:
L_Menu_main18:
;MENU_LCD.c,199 :: 		}
L_end_Menu_main:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Menu_main
_DefinirSaidas:
;MENU_LCD.c,203 :: 		void DefinirSaidas( char valor )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;MENU_LCD.c,205 :: 		UART2_Write_Text("\r\nDefinir Saidas!");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr5_MENU_LCD+0)
ORI	R25, R25, lo_addr(?lstr5_MENU_LCD+0)
JAL	_UART2_Write_Text+0
NOP	
;MENU_LCD.c,206 :: 		}
L_end_DefinirSaidas:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _DefinirSaidas
_AlternarSaidas:
;MENU_LCD.c,208 :: 		void AlternarSaidas( char valor )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;MENU_LCD.c,210 :: 		UART2_Write_Text("\r\nAlternar Saidas!");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr6_MENU_LCD+0)
ORI	R25, R25, lo_addr(?lstr6_MENU_LCD+0)
JAL	_UART2_Write_Text+0
NOP	
;MENU_LCD.c,211 :: 		}
L_end_AlternarSaidas:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _AlternarSaidas
MENU_LCD____?ag:
L_end_MENU_LCD___?ag:
JR	RA
NOP	
; end of MENU_LCD____?ag
