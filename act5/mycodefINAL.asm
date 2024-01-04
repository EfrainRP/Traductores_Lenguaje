org 100h

jmp start 

Y db 80,84,88,93,97,101,105,109,113,116,120,124,127,130,134,137,139,142,145,147,149,151,153,155,156,157,158,159,160,160,160,160,160,159,158,157,156,155,153,151,149,147,145,142,139,137,134,130,127,124,120,116,113,109,105,101,97,93,88,84,80,76,72,67,63,59,55,51,47,44,40,36,33,30,26,23,21,18,15,13,11,9,7,5,4,3,2,1,0,0,0,0,0,1,2,3,4,5,7,9,11,13,15,18,21,23,26,30,33,36,40,44,47,51,55,59,63,67,72,76

COLOR EQU 0Fh    ;La expresion COLOR es igual a 0Fh (255d), como constante numerica

macro PIX yo     ;La expresion PIX se sustituira por definicion, incluyendo argumentos  
                        ;es como se definiera una funcion
    mov Cx,Bx    ;Valor de la coordenada X
    mov Dl,yo    ;Valor de la coordenada Y
    mov Al,COLOR ;Valor del color a pintar
    int 10h
    
    endm

start: 
    mov ax, @data ;Se almacena la direccion de memoria de nuestro arreglo 
    mov ds,ax     ;Guardandola en el registro para las direcciones
    
    mov Ah, 0    ;Establece el modo video
    mov Al, 13h  ;320 x 200 en grafico
    int 10h
     
    mov Ah,0Ch   ;Escribe un punto en la pantalla en modo video
    mov Bx,0     ;Inicio del contador en 1
    
     
repite:
    PIX Y(Bx)    ;Ejecucion de la funcion para pintar pixel
        
    inc Bx       ;Incremento del contador
    cmp Bx,120   ;Condicion de paro del ciclo
    jne repite   ;Si no es igual a 120, saltara a la etiqueta repite 
   
    mov Ah,0h    ;Termina la ejecucion del programa
    int 16h
ret
                       
                       
                       
                       