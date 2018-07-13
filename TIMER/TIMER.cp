#line 1 "D:/GitHub/MENU_LCD_PIC32/TIMER/TIMER.c"
#line 1 "d:/github/menu_lcd_pic32/timer/timer.h"








void TimerKeyboard_Init();
#line 1 "d:/github/menu_lcd_pic32/panel/panel_prototype.h"


void Panel_Init();

char TeclaMais();
char TeclaMenos();
char TeclaConfirma();
char TeclaCancela();
char TeclaManual();

void LedOperacaoON();
void LedOperacaoOFF();

char ChaveIntermitente();
char DisjuntorFocos();
#line 1 "d:/github/menu_lcd_pic32/menu_lcd_prototype.h"



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
#line 13 "D:/GitHub/MENU_LCD_PIC32/TIMER/TIMER.c"
void InterruptTimerKeyboard() iv IVT_TIMER_4 ilevel 5 ics ICS_AUTO {


 T4IF_bit = 0;


 Keyboard_Interrupt();









}
#line 35 "D:/GitHub/MENU_LCD_PIC32/TIMER/TIMER.c"
void TimerKeyboard_Init() {
 T4CON = 0x8050;
 T4IP0_bit = 1;
 T4IP1_bit = 0;
 T4IP2_bit = 1;
 T4IF_bit = 0;
 T4IE_bit = 1;
 PR4 = 45000;
 TMR4 = 0;
}
