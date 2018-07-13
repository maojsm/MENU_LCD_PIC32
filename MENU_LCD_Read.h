#include "PANEL_Prototype.h"


//Usadas na Leitura do Teclado da CPU
char keyPressed=key_NULL;//Contem a tecla que foi pressionada, usada na keyReading()
char T0_cntKEY;//Usada na leitura do teclado, evita repique e nao leituras

/*====================== KeyReading() ==========================================
 Faz a Leitura do Teclado e Carrega "keyPressed"
 key_MAIS     1   //Anda nos Menus '+' e Altera Valor Variavel
 key_MENOS    3   //Anda nos Menus '-' e Altera Valor Variavel
 key_OK       13  //Entra No Menu e/ou Confirma Alteraçao
 key_VOLTA    11  //Sai do Menu e/ou Cancela Alteraçao
 *** USADA APENAS NA INTERRUPT P/ LEITURA DO TECLADO *** 19/02/2017
    ROTINA NA INTERRUPT:
    if (T0_cntKEY > 30 )  //0,3s com a tecla "travada"
    {
      //Faz a leitura do teclado constantemente
      keyPressed = KeyReading();
      if (keyPressed != key_NULL) T0_cntKEY=0;
    }
    //FIM DA ROTINA
==============================================================================*/
char KeyReading()
{
  //VERIFICA QUAL TECLA FOI CLICADA (não da pra usar switch)
  if (TeclaMais()     == _TC_ON)   return(key_MAIS);
  if (TeclaMenos()    == _TC_ON)   return(key_MENOS);
  if (TeclaConfirma() == _TC_ON)   return(key_CONFIRMA);
  if (TeclaCancela()  == _TC_ON)   return(key_CANCELA);
  if (TeclaManual()   == _TC_ON)   return(key_MANUAL);
  //Nenhuma Tecla esta pressionada
  return(key_NULL);

}//fim da KeyReading

/*=========================== KeyRead() =========================================
 RETORNA A TECLA PRESSIONADA E FAZ O ZERAMENTE DA VARIAVEL, PERMITINDO QUE O
 USUARIO POSSA PRESSIONAR OUTRA TECLA MAIS RAPIDAMENTE E O PROGRAMA NAO FIQUE
 REPICANDO A TECLA.
 *** USADA NO PROGRAMA EM GERAL P/ LER TECLA PRESSIONADA *** 19/02/2017
==============================================================================*/
char KeyRead()
{
  char keyCurrent;
  //Salva valor atual da tecla pressionada
  keyCurrent = keyPressed;
  //Zera valor da tecla pressionada, pois foi precebida já.
  keyPressed = key_NULL;
  //Retorna tecla que foi clicada pelo usuario
  return(keyCurrent);
}
/*==================== Keyboard_Interrupt() ====================================
 funçao de leitura do teclado que deve ser executada na interrupt Timer 30ms.
==============================================================================*/
void Keyboard_Interrupt()
{
  //incremeta contador (evita repique)
  if (T0_cntKEY < 250)          T0_cntKEY++;
  //faz a leitura do teclado
  if (T0_cntKEY > 10/*0,3s com a tecla "travada"*/)
  {
    //Faz a leitura do teclado constantemente
    keyPressed = KeyReading();
    if (keyPressed != key_NULL) {
      //Evita repique
      T0_cntKEY = 0;
      //Zera tempo  p/ apagar o display LCD
      //T1_cntLCD = 0;

    }
  }
}