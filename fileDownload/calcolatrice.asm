DATA SEGMENT PUBLIC 
    STRINGA1 DB "CALCOLATRICE IN LINGUAGGIO ASSEMBLY",10,13,'$'
    STRINGA2 DB "INSERIRE PRIMO ADDENDO",10,13,'$'
    STRINGA3 DB "INSERIRE SECONDO ADDENDO",10,13,'$'
    STRINGA4 DB "INSERIRE OPERATORE + - * /",10,13,'$'
    STRINGA5 DB "IL RISULTATO E'",10,13,'$'
    CAPO DB "",10,13,'$'
    NUM1 DB 0
    NUM2 DB 0
    SCELTA DB 0
    X DB 0 
    DIVISORE DB 10
    RIS DB 0
    RESTO DB 0   
DATA ENDS  

CODE SEGMENT     
    
    ASSUME DS:DATA,CS:DATA
    
INIZIO: 

MOV AX,DATA
MOV DS,AX 
    
                         ;STAMPA STRINGA1 
                         ;RICHIESTA DI STAMPA STRINGA 
                     
MOV AH,09H  
MOV DX,OFFSET STRINGA1   ;CARICAMENTO STRINGA
LEA DX,STRINGA1
INT 21H 
                          ;STAMPA STRINGA2  
                          ;RICHIESTA DI STAMPA STRINGA                      
MOV AH,09H
MOV DX,OFFSET STRINGA2    ;CARICAMENTO STRINGA
LEA DX,STRINGA2
INT 21H  
                          ;INPUT DATO
MOV AH,01H  
INT 21H 
SUB AL,30H                ;CONVERSIONE  
MOV NUM1,AL
MOV AH,09H
MOV DX,OFFSET CAPO        ;A CAPO
LEA DX,CAPO
INT 21H
                          ;STAMPA STRINGA3 
                          ;RICHIESTA DI STAMPA STRINGA
MOV AH,09H
MOV DX,OFFSET STRINGA3    ;CARICAMENTO STRINGA
LEA DX,STRINGA3
INT 21H 
                          ;INPUT DATO
MOV AH,01H  
INT 21H 
SUB AL,30H                ;CONVERSIONE  
MOV NUM2,AL
MOV AH,09H
MOV DX,OFFSET CAPO        ; A CAPO
LEA DX,CAPO
INT 21H
                          ;STAMPA STRINGA4 
                          ;RICHIESTA DI STAMPA STRINGA
MOV AH,09H
MOV DX,OFFSET STRINGA4    ;CARICAMENTO STRINGA
LEA DX,STRINGA4
INT 21H 
                          ;INPUT DATO
MOV AH,01H  
INT 21H   
MOV SCELTA,AL
MOV AH,09H
MOV DX,OFFSET CAPO    ; A CAPO
LEA DX,CAPO
INT 21H

CMP SCELTA,2BH        ; IF CONDIZIONE (SCELTA == '+')
JE ELSE1

CMP SCELTA,2DH
JE ELSE2

CMP SCELTA,2AH
JE ELSE3 

CMP SCELTA,2FH
JE ELSE4

JMP FINE

ELSE1:        ;CONDIZIONE DI ADDIZIONE

MOV AL,NUM1                    
ADD AL,NUM2 
MOV AH,00H
MOV X,AL 
JMP FINE

ELSE2:        ;CONDIZIONE DI SOTTRAZIONE

MOV AL,NUM1
SUB AL,NUM2        
MOV AH,00H
MOV X,AL
JMP FINE  

ELSE3:        ;CONDIZIONE DI MOLTIPLICAZIONE

MOV AL,NUM1
MUL NUM2
MOV AH,00H
MOV X,AL
JMP FINE  

ELSE4:        ;CONDIZIONE DI DIVISIONE

MOV AL,NUM1
DIV NUM2
MOV AH,00H
MOV X,AL


FINE:

DIV DIVISORE             ;DIVIDO PER 10 
MOV RIS,AL
MOV RESTO,AH
MOV AH,09H                  ;STAMPA STRINGA5
MOV DX,OFFSET STRINGA5
LEA DX,STRINGA5
INT 21H
MOV AH,02H
MOV DL,RIS
ADD DL,30H                   ;STAMPO IL NUMERO
INT 21H  
MOV AH,02H
MOV DL,RESTO
ADD DL,30H
INT 21H
  
MOV AH,4CH
INT 21H

CODE ENDS
END INIZIO