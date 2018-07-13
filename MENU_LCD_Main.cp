#line 1 "D:/GitHub/MenuLcd_PIC32/MENU_LCD_Main.c"
#line 1 "d:/github/menulcd_pic32/menu_lcd_prototype.h"



typedef struct MenuItem Item;
static void LcdWriteFromROM( const char* texto );

void DefinirSaidas( char );
void AlternarSaidas( char );

void Menu_init();
void Menu_main();





char KeyReading();
char KeyRead();
void Keyboard_Interrupt();




void AD_Init();
#line 1 "d:/github/menulcd_pic32/timer/timer.h"








void TimerKeyboard_Init();
#line 1 "d:/github/menulcd_pic32/lcd/lcd_prototype.h"



 void Lcd_Inicialize( void );
 void PrintLcd( char );
#line 41 "D:/GitHub/MenuLcd_PIC32/MENU_LCD_Main.c"
void main() {

 AD_Init();
 Delay_ms(100);
 Lcd_Inicialize();
 UART2_Init(9600);
 TimerKeyboard_Init();
 EnableInterrupts();

 Lcd_Out(1,3,"Marcio");
 Delay_ms(1000);


 Menu_init();



 while(1) {

 Menu_main();


 }




}
#line 75 "D:/GitHub/MenuLcd_PIC32/MENU_LCD_Main.c"
void AD_Init()
{

 AD1PCFG = 0xFFFF;
 JTAGEN_bit = 0;
 WDTCLR_bit = 1;

}
