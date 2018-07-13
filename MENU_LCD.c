
#include "MENU_LCD.h"
#include "MENU_LCD_Read.h"
#include "PANEL_Prototype.h"
#include "LCD_Prototype.h"


#define NULL 0


/*
       PROTOTIPOS
*/
typedef struct MenuItem Item;
static void LcdWriteFromROM( const char* texto );
//Suas Funcoes
void DefinirSaidas( char );
void AlternarSaidas( char );



struct MenuItem
{
        const Item** mItem;     //submenu
        char Texto[16];         //texto
        void(*Tarefa)(char);    //Funcao a ser executada
        char Parms;             //valor do parametro da funcao
};

/*
       VARIAVEIS DO MENU_LCD
*/
static char selecao = 0;        //posicao do item selecionado
static const Item** MenuAtual;  //Menu Atual
static const Item*** MenuAnterior; //Pilha de Menus
static unsigned Stack[16];      //Aloca memoria para a pilha



/*
       MENU
*/

//Terceiro Nivel
const Item Menu30 = { NULL, "PORTD = 32", &DefinirSaidas, 32 };
const Item* Screen3[] = { &Menu30, 0 }; //Terminar sempre com o valor 0(NULO)

//Segundo Nivel
const  Item Menu10 = { Screen3, "Outra Funcao", 0, 0 };
const  Item Menu11 = { NULL, "Ativar Saidas", &DefinirSaidas, 255 };
const  Item Menu12 = { NULL, "Alternar Saidas", &AlternarSaidas, 0 };
const  Item Menu13 = { NULL, "Desligar Saidas", &DefinirSaidas, 0 };
const Item* Screen1[] = { &Menu10, &Menu11, &Menu12, &Menu13, 0 };  //Terminar sempre com o valor 0(NULO)

const  Item Menu20 = { NULL, "PORTD = 1", &DefinirSaidas, 1 };
const  Item Menu21 = { NULL, "PORTD = 2", &DefinirSaidas, 2 };
const  Item Menu22 = { NULL, "PORTD = 4", &DefinirSaidas, 4 };
const  Item Menu23 = { NULL, "PORTD = 8", &DefinirSaidas, 8 };
const Item* Screen2[] = { &Menu20, &Menu21, &Menu22, &Menu23, 0 }; //Terminar sempre com o valor 0(NULO)

//Primeiro Nivel
const  Item Menu01 = { Screen1, "FUNCAO 1", NULL, 0 };
const  Item Menu02 = { Screen2, "FUNCAO 2", NULL, 0 };
const Item* TelaInicial[] = { &Menu01, &Menu02, 0 }; //Terminar sempre com o valor 0(NULO)




/*
      Exibe os items do menu atual no display LCD
*/
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
    MenuAtual = TelaInicial; //A tela atual = tela inicial
    MenuAnterior = &Stack;   //Aponta para a pilha

    MostrarItens( MenuAtual, selecao ); //Exibe os itens
}


//Executar em loop infinito no main do Programa Principal
void Menu_main()
{
   //Lê se teve tecla pressionada!
   switch( KeyRead())
   {
     //Botao MAIS/PRÓXIMO foi pressionado
     case key_MAIS: {
     
     
       UART2_Write_Text("\r\nMAIS!");
     
       ++selecao; //seleciona o proximo item
       //Exibe os itens da tela selecionada e
       //se o indice do item estourar
       //retorna para o primeiro item
       if( MostrarItens( MenuAtual, selecao ).B0 )
       {
            selecao = 0;
            MostrarItens( MenuAtual, selecao );
       }
     
     } break;
     
     
     //Botao MENOS/ANTERIOR foi pressionado
     case key_MENOS: {

        UART2_Write_Text("\r\nMENOS!");

     } break;
     
     
     //Botao CONFIRMA/ENTER foi pressionado
     case key_CONFIRMA: {
     

       
       //Recebe o ponteiro da funcao a ser executada
       void(*Func)(char) = MenuAtual[selecao]->Tarefa;

       UART2_Write_Text("\r\nCONFIRMA!");
       //Caso exista uma funcao a ser executada...
       if( Func != NULL )
       {
           //Executa a função
           Func( MenuAtual[selecao]->Parms );
       }

       //Se existir um submenu
       if( MenuAtual[selecao]->mItem != NULL )
       {
           //Salva o menu atual no MenuAnteror
           *MenuAnterior++ = MenuAtual;
           //atualiza o menu atual com o proximo menu
           MenuAtual = MenuAtual[selecao]->mItem;
           //Exibe os itens deste proximo menu
           selecao = 0;
           MostrarItens( MenuAtual, selecao );
       }


     
     } break;
     
     
     //Botao CANCELA/VOLTAR foi pressionado
     case key_CANCELA: {

        UART2_Write_Text("\r\nCANCELA!");

        selecao = 0;
        //Se não for o primeiro menu( Tela Inicial )
        if( ((unsigned*)&MenuAnterior)[0] > (unsigned)&Stack )
        {
           //MenuAtual recebe o menu salvo no MenuAnterior
           MenuAtual = *--MenuAnterior;
           MostrarItens( MenuAtual, selecao );
        }


     } break;

   
   }


}

//Suas Funcoes

void DefinirSaidas( char valor )
{
    UART2_Write_Text("\r\nDefinir Saidas!");
}

void AlternarSaidas( char valor )
{
     UART2_Write_Text("\r\nAlternar Saidas!");
}