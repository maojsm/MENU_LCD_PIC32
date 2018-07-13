/*
 * Project name:
     MENU_LCD_PIC32 - Exemplo de Menu com Submenus usando Mokroc PRO for PIC32
 * Copyright:
     (c) JSM Engenharia, 2018 - By Marcio Silva (Brasil)
 * Revision History:
     20180713:
       - initial release;
 * Description:
     Na falta de exemplos prontos e funcionais disponiveis na internaet, 
     resolvi fazer e publicar minha solução de Menu com multiplos SubMenus.
 * Test configuration:
     MCU:             P32MX795F512L
                      http://ww1.microchip.com/downloads/en/DeviceDoc/60001156J.pdf
     Dev.Board:       CPU do Controlador JSM
     Oscillator:      HS-PLL, 48.00000 MHz
     ext. modules:    LCD
     SW:              mikroC PRO for PIC 32MX

 * NOTES:

 */



#include "MENU_LCD_Prototype.h"
#include "TIMER.h"
#include "LCD_Prototype.h"



/*==============================================================================
    ************** INICIO DO PROGRAMA ********************
          ||||||||     |||||||     ||            ||
             ||       ||     ||    || ||      || ||
             ||        |||         ||   ||  ||   ||
             ||           |||      ||     ||     ||
        ||   ||       ||    |||    ||            ||
          ||||         |||||||     ||            ||
==============================================================================*/
void main() {

  AD_Init();               //Configura pinos IO como Digitais
  Delay_ms(100);           //Estabilizar tensões do circuito
  Lcd_Inicialize();        //Iniciliza o LCD
  UART2_Init(9600);        //Iniciliza UART 2 p/ Testar Menu
  TimerKeyboard_Init();    //Inicializar o Timer 4 p/ Leitura das Teclas
  EnableInterrupts();      //Habilitação Global de Interupçoes.

  Lcd_Out(1,3,"Marcio");
  Delay_ms(1000);


  Menu_init();



  while(1) {

    Menu_main();


  }




}



/*==================== AD_Init() ===========================================
 Configurando as portas de I/O do PIC42K22. Uso todas como digitais.
==============================================================================*/
void AD_Init()
{
  //CONFIGURA TODAS AS SAIDAS A/D COMO DIGITAL PIC32MX
  AD1PCFG = 0xFFFF;   // Initialize AN pins as digital
  JTAGEN_bit = 0;     // Desabilita JTAG
  WDTCLR_bit = 1;     //Zera flag watch dog timer

}