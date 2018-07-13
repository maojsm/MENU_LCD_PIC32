/*
   CONFIGURAÇOES DO LCD - PIC32MX.
   by Marcio. 25/05/2018.
*/

#define LCD_BACK_ON  1//BackLight do LCD aceso
#define LCD_BACK_OFF 0//BackLight do LCD apagado

/*===================== CONFIGURAÇÃO DO LCD ====================================
Seleciona os pinos onde esta ligado o LCD. by Márcio.
==============================================================================*/

  //Utilizei LAT, pois PORT (RBx) não funcionou.24/01/2015.
  sbit LCD_RS   at LATC3_bit;
  sbit LCD_EN   at LATC2_bit;
  sbit LCD_D4   at LATC1_bit;
  sbit LCD_D5   at LATE7_bit;
  sbit LCD_D6   at LATE6_bit;
  sbit LCD_D7   at LATE5_bit;
  sbit LCD_BACK at RC4_bit;//ACENDE/APAGA BACKLIGHT DO LCD
  // Pin direction(LCD)
  sbit LCD_RS_Direction   at TRISC3_bit;
  sbit LCD_EN_Direction   at TRISC2_bit;
  sbit LCD_D4_Direction   at TRISC1_bit;
  sbit LCD_D5_Direction   at TRISE7_bit;
  sbit LCD_D6_Direction   at TRISE6_bit;
  sbit LCD_D7_Direction   at TRISE5_bit;
  sbit LCD_BACK_Direction at TRISC4_bit;
  
  
