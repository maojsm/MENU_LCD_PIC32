_main:
;MENU_LCD_Main.c,41 :: 		void main() {
;MENU_LCD_Main.c,43 :: 		AD_Init();               //Configura pinos IO como Digitais
JAL	_AD_Init+0
NOP	
;MENU_LCD_Main.c,44 :: 		Delay_ms(100);           //Estabilizar tensões do circuito
LUI	R24, 24
ORI	R24, R24, 27135
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
;MENU_LCD_Main.c,45 :: 		Lcd_Inicialize();        //Iniciliza o LCD
JAL	_Lcd_Inicialize+0
NOP	
;MENU_LCD_Main.c,46 :: 		UART2_Init(9600);        //Iniciliza UART 2 p/ Testar Menu
ORI	R25, R0, 9600
JAL	_UART2_Init+0
NOP	
;MENU_LCD_Main.c,47 :: 		TimerKeyboard_Init();    //Inicializar o Timer 4 p/ Leitura das Teclas
JAL	_TimerKeyboard_Init+0
NOP	
;MENU_LCD_Main.c,48 :: 		EnableInterrupts();      //Habilitação Global de Interupçoes.
EI	R30
;MENU_LCD_Main.c,50 :: 		Lcd_Out(1,3,"Marcio");
LUI	R27, hi_addr(?lstr1_MENU_LCD_Main+0)
ORI	R27, R27, lo_addr(?lstr1_MENU_LCD_Main+0)
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Lcd_Out+0
NOP	
;MENU_LCD_Main.c,51 :: 		Delay_ms(1000);
LUI	R24, 244
ORI	R24, R24, 9215
L_main2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main2
NOP	
NOP	
;MENU_LCD_Main.c,54 :: 		Menu_init();
JAL	_Menu_init+0
NOP	
;MENU_LCD_Main.c,58 :: 		while(1) {
L_main4:
;MENU_LCD_Main.c,60 :: 		Menu_main();
JAL	_Menu_main+0
NOP	
;MENU_LCD_Main.c,63 :: 		}
J	L_main4
NOP	
;MENU_LCD_Main.c,68 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_AD_Init:
;MENU_LCD_Main.c,75 :: 		void AD_Init()
;MENU_LCD_Main.c,78 :: 		AD1PCFG = 0xFFFF;   // Initialize AN pins as digital
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;MENU_LCD_Main.c,79 :: 		JTAGEN_bit = 0;     // Desabilita JTAG
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;MENU_LCD_Main.c,80 :: 		WDTCLR_bit = 1;     //Zera flag watch dog timer
LUI	R2, BitMask(WDTCLR_bit+0)
ORI	R2, R2, BitMask(WDTCLR_bit+0)
_SX	
;MENU_LCD_Main.c,82 :: 		}
L_end_AD_Init:
JR	RA
NOP	
; end of _AD_Init
