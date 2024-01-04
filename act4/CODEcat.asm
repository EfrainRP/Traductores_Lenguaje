org 100h
jmp inicio
directorio  db "E:\program files\emu8086\emu8086\MyBuild\Efrain", 0 
directorio1 db "E:\program files\emu8086\emu8086\MyBuild\Efrain\Robles.text", 0 
directorio2 db "E:\program files\emu8086\emu8086\MyBuild", 0 
handle dw ? 
texto db "Traductores de lenguaje I" 

inicio: 
    ;Crea carpeta
    mov dx, offset directorio   ;Buffer con la direccion deseada a crear
    mov ah, 39h                 ;Crea subdirectorio / carpeta deseado
    int 21h                     
    
    jc error                    ;Verificacion de bandera C de la carpeta creada
    
    ;Entra a la carpeta
    mov dx, offset directorio   ;Buffer con la direccion deseada a entrar
    mov ah, 3Bh                 ;Establece el directorio actual   
    int 21h 
    
    jc error                    ;Verificacion de bandera C de la carpeta encontrada 
    
    ;Entra a la carpeta
    mov dx, offset directorio2   ;Buffer con la direccion deseada a entrar
    mov ah, 3Bh                 ;Establece el directorio actual   
    int 21h 
    
    jc error                    ;Verificacion de bandera C de la carpeta encontrada
    
    ;Creamos archivo
    mov dx, offset directorio1  ;Buffer con la direccion deseada a crear
    mov ah, 3Ch                 ;Creacion del archivo
    int 21h                     ;Devolviendo: Ax=Handle  C=0/1 segun su ejecucion
    
    jc error                    ;Verificacion de bandera C del archivo creado     
    mov handle, ax              ;Handle almacenado en memoria                           

    ;Escribir archivo
    mov bx, handle              ;Bx=(Handle)Manejador del archivo texto
    mov cx, 25                  ;Cx=Numero de bytes deseados a leer
    mov dx, offset texto        ;Dx=Buffer de nuestra cadena a ser cargado(archivo a escribir)
    mov ah, 40h                 ;Escritura desde archivo / dispositivo    
    int 21h 
                                 
    jc error                    ;Verificacion de bandera C del archivo modificado
    
    ;Cierre de archivo (handle)
    mov bx, handle              ;Bx=(Handle)Manejador del archivo texto
    mov ah, 3Eh                 ;Cierre del manejador de archivo(Handle)
    int 21h
    
    jc error                    ;Verificacion de bandera C del archivo cerrado  
    
    ;Eliminacion de archivo de la carpeta
    mov dx, offset directorio1  ;Dx=Buffer de nuestra cadena a ser eliminado(archivo a borrar)
    mov ah,41h                  ;Borrar archivo del directorio 
    int 21h
    
    jc error                    ;Verificacion de bandera C del archivo borrado   
        
    ;Eliminacion de la carpeta
    mov dx, offset directorio    ;Dx=Buffer de nuestra cadena a ser eliminado(carpeta a borrar)
    mov ah, 3Ah                  ;Elimina el subdirectorio/carpeta  
    int 21h     
    jc error                     ;Verificacion de bandera C de la carpeta borrado    
    
    error:     
    ret

