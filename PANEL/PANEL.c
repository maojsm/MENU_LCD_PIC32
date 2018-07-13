/*
   CONFIGURAÇOES LCD E TECLADO E MENU P/ CPU - MUITO EFICIENTE!
   USADO A PARTIR DA VERSÃO CPU_46K22_2_06_09.
   by Marcio. 21/02/2017 - Revisado PIC32MX em 09/07/2018.
*/

#include "PANEL.h"

//Rotinas usadas para tornar public
void LedOperacaoON()     { L_OPERACAO = 0;/*0=Apagado*/ }
void LedOperacaoOFF()    { L_OPERACAO = 1;/*1=Aceso*/ }
//
char ChaveIntermitente() { return !C_PISCA;/*Retorna 1 se Ligada*/ }
char DisjuntorFocos()    { return !C_APAGAFOCO;/*Retorna 1 se Ligada*/ }

//Funções de Leitura Pública das Teclas do Teclado.
char TeclaMais()       { return T_MAIS; }
char TeclaMenos()      { return T_MENOS; }
char TeclaConfirma()   { return T_CONFIRMA; }
char TeclaCancela()    { return T_CANCELA; }
char TeclaManual()     { return T_MANUAL; }



/*==================== TECLADO_Init() ==========================================
 Basicamente coloca a direção dos pinos do teclado.
 by Márcio.
==============================================================================*/
void Panel_Init()
{
    //CONFIGURAÇÃO DOS PINOS DO TECLADO
    T_MAIS_Direction          = 1;//Define direção do pin como entrada
    T_MENOS_Direction         = 1;//Define direção do pin como entrada
    T_CONFIRMA_Direction      = 1;//Define direção do pin como entrada
    T_CANCELA_Direction       = 1;//Define direção do pin como entrada
    //Configuraçao inicial dos Pinos e Leds
    L_OPERACAO                = 0; //LED OPERAÇAO DO MICRO, INICIA ACES0=0
    //CONFIGURAÇÃO DOS LEDS E CHAVES DA CPU

    C_APAGAFOCO_Direction     = 1; //1=Entrada
    C_PISCA_Direction         = 1; //1=Entrada
    T_PORTA_Direction         = 1; //1=Entrada (Porta do Controlador)
    T_MANUAL_Direction        = 1; //1=Entrada (Modo Manual - P10)
    L_OPERACAO_Direction      = 0; //0=Saida

    //CONFIGURAÇÃO DOS PINOS USADOS NOS DETETORES
    DET1_Direction            = 1; //1=Entrada
    DET2_Direction            = 1; //1=Entrada
    DET3_Direction            = 1; //1=Entrada
    DET4_Direction            = 1; //1=Entrada

    //Estado inicial dos Leds
    L_OPERACAO = 0;//0=Apagado
}