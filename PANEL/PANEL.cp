#line 1 "D:/GitHub/MENU_LCD_PIC32/PANEL/PANEL.c"
#line 1 "d:/github/menu_lcd_pic32/panel/panel.h"
#line 13 "d:/github/menu_lcd_pic32/panel/panel.h"
 sbit T_MAIS at RB11_bit;
 sbit T_MENOS at RB10_bit;
 sbit T_CONFIRMA at RB13_bit;
 sbit T_CANCELA at RB12_bit;
 sbit C_PISCA at RB9_bit;
 sbit L_OPERACAO at RB8_bit;

 sbit C_APAGAFOCO at RD13_bit;
 sbit T_PORTA at RD12_bit;
 sbit T_MANUAL at RB7_bit;

 sbit DET1 at RD7_bit;
 sbit DET2 at RD6_bit;
 sbit DET3 at RD5_bit;
 sbit DET4 at RD4_bit;


 sbit T_MAIS_Direction at TRISB11_bit;
 sbit T_MENOS_Direction at TRISB10_bit;
 sbit T_CONFIRMA_Direction at TRISB13_bit;
 sbit T_CANCELA_Direction at TRISB12_bit;
 sbit C_PISCA_Direction at TRISB9_bit;
 sbit L_OPERACAO_Direction at TRISB8_bit;

 sbit C_APAGAFOCO_Direction at TRISD13_bit;
 sbit T_PORTA_Direction at TRISD12_bit;
 sbit T_MANUAL_Direction at TRISB7_bit;

 sbit DET1_Direction at TRISD7_bit;
 sbit DET2_Direction at TRISD6_bit;
 sbit DET3_Direction at TRISD5_bit;
 sbit DET4_Direction at TRISD4_bit;
#line 10 "D:/GitHub/MENU_LCD_PIC32/PANEL/PANEL.c"
void LedOperacaoON() { L_OPERACAO = 0; }
void LedOperacaoOFF() { L_OPERACAO = 1; }

char ChaveIntermitente() { return !C_PISCA; }
char DisjuntorFocos() { return !C_APAGAFOCO; }


char TeclaMais() { return T_MAIS; }
char TeclaMenos() { return T_MENOS; }
char TeclaConfirma() { return T_CONFIRMA; }
char TeclaCancela() { return T_CANCELA; }
char TeclaManual() { return T_MANUAL; }
#line 29 "D:/GitHub/MENU_LCD_PIC32/PANEL/PANEL.c"
void Panel_Init()
{

 T_MAIS_Direction = 1;
 T_MENOS_Direction = 1;
 T_CONFIRMA_Direction = 1;
 T_CANCELA_Direction = 1;

 L_OPERACAO = 0;


 C_APAGAFOCO_Direction = 1;
 C_PISCA_Direction = 1;
 T_PORTA_Direction = 1;
 T_MANUAL_Direction = 1;
 L_OPERACAO_Direction = 0;


 DET1_Direction = 1;
 DET2_Direction = 1;
 DET3_Direction = 1;
 DET4_Direction = 1;


 L_OPERACAO = 0;
}
