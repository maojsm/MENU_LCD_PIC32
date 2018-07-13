
#include "TIMER.h"
#include "PANEL_Prototype.h"
#include "MENU_LCD_Prototype.h"




/*==============================================================================
   *********** INTERRUPÇÃO TIMER 4 - KeyBoard - PIC32 - 30ms ****************
   Faz a leitura do Teclado da CPU, Chave Intermitente, DisjuntorFocos e outras.
==============================================================================*/
void InterruptTimerKeyboard() iv IVT_TIMER_4 ilevel 5 ics ICS_AUTO {

  //Zera flag de reinicio do Timer
  T4IF_bit         = 0;

  //Executa a leitura da tecla e arqmazena o recultado.
  Keyboard_Interrupt();




  //Executa o Menu LCD
  //MenuLcd();



}//Fim do Timer da ProxInt()
/*================== InitTimerProxInt() - PIC32 ================================
  Usando Timer 3! Pic32MX
  Prescaler 1:8; PR3 Preload = 60000; Actual Interrupt Time = 10 ms
  Cristal 16Mhz, Clock 48Mhz (UBS)
==============================================================================*/
void TimerKeyboard_Init() {
  T4CON         = 0x8050;
  T4IP0_bit     = 1;
  T4IP1_bit     = 0;
  T4IP2_bit     = 1;
  T4IF_bit      = 0;
  T4IE_bit      = 1;
  PR4           = 45000;
  TMR4          = 0;
}