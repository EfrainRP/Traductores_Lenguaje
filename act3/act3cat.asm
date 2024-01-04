.model small  
.stack 100
.data 
    msg: db " = $$$$"
    cen db 0   
    dece db 0
    uni db 0 
    r dw 0

.code   
    mov ax,@data
    mov ds,ax 
     
    jmp entrada     ;Funcion para introducir
                    ;1er numero
    
    inicio:
        mov r,di    ;Guardar 1er numero en r(del registro)
                
        mov ah, 01h 
        int 21h     ;Instruccion de entrada de multiplicacion (x)
        xor cx,cx   ;Limpiamos Cx
        mov cl,al   ;Movemos la entrada de la multiplicacion (x)
        
        jmp entrada ;Funcion para introducir 2ndo numero en Di  
        
    entrada:
        xor ah,ah   ;Limpiamos
        mov ah, 01h 
        
        int 21h     ;Entrada del 1er digito   
        sub al,30h  ;Lo convertimos en numero desde el ASCII
        mov dece,al ;Guardamos en memoria
         
        int 21h     ;Entrada del 2ndo digito
        sub al,30h  ;Lo convertimos en numero desde el ASCII
        mov uni,al  ;Guardamos en memoria
        
        xor ax,ax   ;Limpiamos
        xor bx,bx  
        
        ;Juntamos las cifras en el registro Di, multiplicando por
            ;multiplos de 10 con su respectiva cifra para sumarse 
        mov bl,uni
        mov di,bx
        
        xor ah,ah
        mov al,dece
        mov bx,10
        mul bx   
        
        add di,ax   ;Resultado final en Di   
        
        xor bx,bx   ;Limpiamos registros
        xor ax,ax 
        
        cmp cl, 'x' ;Analizara si se cumple, si tiene ("x")
        jz oper     ;Si cumple saltara en oper
        
        jmp inicio  ;Sino, seguira con este otro salto     
    
    oper:
        mov ax,r        
        mul di      ;Proceso para la MULTIPLICACION, resultado final en AX
        
        xor di,di   ;Limpiamos registros 
        xor cx,cx    

        mov bx,100
        xor dx,dx
        div bx      ;Dividimos entre 100 para las centenas
        mov cen,al
        mov ax,dx 
        
        mov bx,10
        xor dx,dx
        div bx      ;Dividimos entre 10 para las decenas
        mov dece,al
        mov uni,dl  ;El resto de la division son las unidades

        mov bx,3    ;Introduccion de valores en la memoria MSG 
        
        mov ah,cen 
        add ah,30h
        mov msg[bx],ah
        
        mov ah,dece 
        add ah,30h
        mov msg[bx+1],ah 
        
        mov ah,uni
        add ah,30h
        mov msg[bx+2],ah
          
        mov ah,09h
        mov dx,msg
        int 21h     ;Instruccion para mostrar la cadena final
