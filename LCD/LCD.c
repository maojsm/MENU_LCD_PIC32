/*
   CONFIGURAÇOES DO LCD - PIC32MX.
   by Marcio. 25/05/2018.
*/

#include "LCD.h"


/*========================== LCD_Inicialize() ==================================
 Iniciliza LCD conforme as necessidades especificas do projeto e tbm do MikroC
==============================================================================*/
void Lcd_Inicialize()
{
  //Inicializa Rotina do MikroC p/ LCD (direciona os pinos definidos)
  Lcd_Init();
  // COMANDO DO BACKLIGHT DO LCD (RE0 = SAÍDA)
  LCD_BACK_Direction = 0;
  //Acende BackLight do LCD
  LCD_BACK = LCD_BACK_ON;
  //Apaga cursor
  Lcd_Cmd(_LCD_CURSOR_OFF);
}

//Escreve no LCD
//PrintOut(PrintHandlerLcd, "\1\rJSM \2\rUCS03 %#02u.%#02u.%#02u", Ver.X, Ver.Y, Ver.Z);
//"\1" => vai pra linha 1, "\2"=> Vai pra linha 2, "\r"=> Passa p/ Proxima coluna
void PrintLcd(char c)
{
  switch(c)
  {
      case '\r': { Lcd_cmd(_LCD_MOVE_CURSOR_RIGHT); }; break;
      case '\1': { Lcd_cmd(_LCD_FIRST_ROW); };         break;
      case '\2': { Lcd_cmd(_LCD_SECOND_ROW); };        break;
      default:   { Lcd_Chr_CP(c); };                   break;
  }
}