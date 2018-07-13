#line 1 "D:/GitHub/MENU_LCD_PIC32/MENU_LCD.c"
#line 1 "d:/github/menu_lcd_pic32/menu_lcd.h"
#line 1 "d:/github/menu_lcd_pic32/menu_lcd_read.h"
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
#line 5 "d:/github/menu_lcd_pic32/menu_lcd_read.h"
char keyPressed= 95 ;
char T0_cntKEY;
#line 24 "d:/github/menu_lcd_pic32/menu_lcd_read.h"
char KeyReading()
{

 if (TeclaMais() ==  0 ) return( 43 );
 if (TeclaMenos() ==  0 ) return( 45 );
 if (TeclaConfirma() ==  0 ) return( 62 );
 if (TeclaCancela() ==  0 ) return( 60 );
 if (TeclaManual() ==  0 ) return( 52 );

 return( 95 );

}
#line 43 "d:/github/menu_lcd_pic32/menu_lcd_read.h"
char KeyRead()
{
 char keyCurrent;

 keyCurrent = keyPressed;

 keyPressed =  95 ;

 return(keyCurrent);
}
#line 56 "d:/github/menu_lcd_pic32/menu_lcd_read.h"
void Keyboard_Interrupt()
{

 if (T0_cntKEY < 250) T0_cntKEY++;

 if (T0_cntKEY > 10 )
 {

 keyPressed = KeyReading();
 if (keyPressed !=  95 ) {

 T0_cntKEY = 0;



 }
 }
}
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
#line 1 "d:/github/menu_lcd_pic32/lcd/lcd_prototype.h"



 void Lcd_Inicialize( void );
 void PrintLcd( char );
#line 14 "D:/GitHub/MENU_LCD_PIC32/MENU_LCD.c"
typedef struct MenuItem Item;
static void LcdWriteFromROM( const char* texto );

void DefinirSaidas( char );
void AlternarSaidas( char );



struct MenuItem
{
 const Item** mItem;
 char Texto[16];
 void(*Tarefa)(char);
 char Parms;
};
#line 33 "D:/GitHub/MENU_LCD_PIC32/MENU_LCD.c"
static char selecao = 0;
static const Item** MenuAtual;
static const Item*** MenuAnterior;
static unsigned Stack[16];
#line 45 "D:/GitHub/MENU_LCD_PIC32/MENU_LCD.c"
const Item Menu30 = {  0 , "PORTD = 32", &DefinirSaidas, 32 };
const Item* Screen3[] = { &Menu30, 0 };


const Item Menu10 = { Screen3, "Outra Funcao", 0, 0 };
const Item Menu11 = {  0 , "Ativar Saidas", &DefinirSaidas, 255 };
const Item Menu12 = {  0 , "Alternar Saidas", &AlternarSaidas, 0 };
const Item Menu13 = {  0 , "Desligar Saidas", &DefinirSaidas, 0 };
const Item* Screen1[] = { &Menu10, &Menu11, &Menu12, &Menu13, 0 };

const Item Menu20 = {  0 , "PORTD = 1", &DefinirSaidas, 1 };
const Item Menu21 = {  0 , "PORTD = 2", &DefinirSaidas, 2 };
const Item Menu22 = {  0 , "PORTD = 4", &DefinirSaidas, 4 };
const Item Menu23 = {  0 , "PORTD = 8", &DefinirSaidas, 8 };
const Item* Screen2[] = { &Menu20, &Menu21, &Menu22, &Menu23, 0 };


const Item Menu01 = { Screen1, "FUNCAO 1",  0 , 0 };
const Item Menu02 = { Screen2, "FUNCAO 2",  0 , 0 };
const Item* TelaInicial[] = { &Menu01, &Menu02, 0 };
#line 72 "D:/GitHub/MENU_LCD_PIC32/MENU_LCD.c"
static char MostrarItens( const Item* menu[], char sel )
{
char index = 0, row = 1;

 Lcd_Cmd( _LCD_CLEAR );

 if( menu == 0 )
 return 0;

 while( menu[index] )
 {
 if( index < sel ) { index++; continue; }
 if( index == sel ) Lcd_Chr( row, 1, '>' );
 else Lcd_Chr( row, 1, ' ' );
 row++;
 LcdWriteFromROM( menu[index++]->Texto );
 }

 if( index <= sel )
 return 1;
 return 0;
}

static void LcdWriteFromROM( const char* texto )
{
 while( *texto )
 {
 Lcd_Chr_CP( *texto++ );
 }
}

void Menu_init()
{
 MenuAtual = TelaInicial;
 MenuAnterior = &Stack;

 MostrarItens( MenuAtual, selecao );
}



void Menu_main()
{

 switch( KeyRead())
 {

 case  43 : {


 UART2_Write_Text("\r\nMAIS!");

 ++selecao;



 if( MostrarItens( MenuAtual, selecao ).B0 )
 {
 selecao = 0;
 MostrarItens( MenuAtual, selecao );
 }

 } break;



 case  45 : {

 UART2_Write_Text("\r\nMENOS!");

 } break;



 case  62 : {




 void(*Func)(char) = MenuAtual[selecao]->Tarefa;

 UART2_Write_Text("\r\nCONFIRMA!");

 if( Func !=  0  )
 {

 Func( MenuAtual[selecao]->Parms );
 }


 if( MenuAtual[selecao]->mItem !=  0  )
 {

 *MenuAnterior++ = MenuAtual;

 MenuAtual = MenuAtual[selecao]->mItem;

 selecao = 0;
 MostrarItens( MenuAtual, selecao );
 }



 } break;



 case  60 : {

 UART2_Write_Text("\r\nCANCELA!");

 selecao = 0;

 if( ((unsigned*)&MenuAnterior)[0] > (unsigned)&Stack )
 {

 MenuAtual = *--MenuAnterior;
 MostrarItens( MenuAtual, selecao );
 }


 } break;


 }


}



void DefinirSaidas( char valor )
{
 UART2_Write_Text("\r\nDefinir Saidas!");
}

void AlternarSaidas( char valor )
{
 UART2_Write_Text("\r\nAlternar Saidas!");
}
