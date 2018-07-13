
/*================= CONFIGURAÇÃO DAS TECLA FUNÇAO ==============================
Seleciona os pinos onde esta ligados ao TECLADO DE FUNÇÕES da CPU e os LEDs
indicativos.

by Márcio.

IMPORTANTE: AS VARIAVEIS DECLARADAS AQUI SÃO "PRIVATE" E NÃO PODEM SER ACESSADAS
            FORA DA CLASSE "PANEL". PARA TORNAR "PUBLIC" USO ROTINAS DENTRO
            DA "PANEL.c".
==============================================================================*/
  // Set Pins
  sbit T_MAIS        at RB11_bit; //TECLA MAIS                 PIC32
  sbit T_MENOS       at RB10_bit; //TECLA MENOS               PIC32
  sbit T_CONFIRMA    at RB13_bit; //TECLA CONFIRMA (OK)       PIC32
  sbit T_CANCELA     at RB12_bit; //TECLA CANCELA (VOLTA)     PIC32
  sbit C_PISCA       at RB9_bit; //CHAVE PISCA (CPU)         PIC32
  sbit L_OPERACAO    at RB8_bit; //LED OPERAÇAO DO MICRO  (Antigo L_APAGAFOCO)  PIC32

  sbit C_APAGAFOCO   at RD13_bit; //CHAVE APAGA FOCO (DISJUNTOR)       PIC32
  sbit T_PORTA       at RD12_bit; //CHAVE PORTA ABERTA DO CONTROLADOR  PIC32
  sbit T_MANUAL      at RB7_bit; //CHAVE PORTA ABERTA DO CONTROLADOR   PIC32

  sbit DET1          at RD7_bit; //Detetor 1 - Entrada Botoeira ou Laço  PIC32
  sbit DET2          at RD6_bit; //Detetor 2  - Entrada Botoeira ou Laço PIC32
  sbit DET3          at RD5_bit; //Detetor 3 - Entrada Botoeira ou Laço  PIC32
  sbit DET4          at RD4_bit; //Detetor 4 - Entrada Botoeira ou Laço  PIC32

  // Pin direction(TECLADO)
  sbit T_MAIS_Direction        at TRISB11_bit;
  sbit T_MENOS_Direction       at TRISB10_bit;
  sbit T_CONFIRMA_Direction    at TRISB13_bit;
  sbit T_CANCELA_Direction     at TRISB12_bit;
  sbit C_PISCA_Direction       at TRISB9_bit; //CHAVE PISCA (CPU)
  sbit L_OPERACAO_Direction    at TRISB8_bit;  //LED OPERAÇAO DO MICRO

  sbit C_APAGAFOCO_Direction   at TRISD13_bit; //CHAVE APAGA FOCO (DISJUNTOR)
  sbit T_PORTA_Direction       at TRISD12_bit; //CHAVE PORTA ABERTA DO CONTROLADOR
  sbit T_MANUAL_Direction      at TRISB7_bit; //CHAVE MODO MANUAL (PINO P10)

  sbit DET1_Direction          at TRISD7_bit; //DETETOR 1
  sbit DET2_Direction          at TRISD6_bit; //DETETOR 2
  sbit DET3_Direction          at TRISD5_bit; //DETETOR 3
  sbit DET4_Direction          at TRISD4_bit; //DETETOR 4

