#line 1 "D:/GitHub/MENU_LCD_PIC32/LCD/LCD.c"
#line 1 "d:/github/menu_lcd_pic32/lcd/lcd.h"
#line 14 "d:/github/menu_lcd_pic32/lcd/lcd.h"
 sbit LCD_RS at LATC3_bit;
 sbit LCD_EN at LATC2_bit;
 sbit LCD_D4 at LATC1_bit;
 sbit LCD_D5 at LATE7_bit;
 sbit LCD_D6 at LATE6_bit;
 sbit LCD_D7 at LATE5_bit;
 sbit LCD_BACK at RC4_bit;

 sbit LCD_RS_Direction at TRISC3_bit;
 sbit LCD_EN_Direction at TRISC2_bit;
 sbit LCD_D4_Direction at TRISC1_bit;
 sbit LCD_D5_Direction at TRISE7_bit;
 sbit LCD_D6_Direction at TRISE6_bit;
 sbit LCD_D7_Direction at TRISE5_bit;
 sbit LCD_BACK_Direction at TRISC4_bit;
#line 12 "D:/GitHub/MENU_LCD_PIC32/LCD/LCD.c"
void Lcd_Inicialize()
{

 Lcd_Init();

 LCD_BACK_Direction = 0;

 LCD_BACK =  1 ;

 Lcd_Cmd(_LCD_CURSOR_OFF);
}




void PrintLcd(char c)
{
 switch(c)
 {
 case '\r': { Lcd_cmd(_LCD_MOVE_CURSOR_RIGHT); }; break;
 case '\1': { Lcd_cmd(_LCD_FIRST_ROW); }; break;
 case '\2': { Lcd_cmd(_LCD_SECOND_ROW); }; break;
 default: { Lcd_Chr_CP(c); }; break;
 }
}
