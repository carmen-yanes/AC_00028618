; LEER UNA CADENA DE TEXTO DESDE TECLADO Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text
    mov cx, 5
	call 	LeerCadena
	call 	EsperarTecla

	int 	20h

    section .data

    correcta db "bienvenido$" ;este mensaje tirará cuando la contraseña este buena
    incorrecta db "incorrecto$"  ;este mensaje tirará cuando la contraseña este mala
    contra db "pswrd" ;se define la contraseña


; FUNCIONES
EsperarTecla:
        mov     AH, 07h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena

LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      verify            
        mov     [300h+SI], AL   ; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while


verify:
    xor SI, SI 
    xor DI, DI
    jmp for


for: 
    mov BL, [contra+DI]
    cmp BL, [300h+SI]
    jne contraMala
    INC SI
    INC DI
    loop for 
    call contraBuena
    jmp exit


; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
contraMala: ;funcion que muestra mensaje cuando contraseña está mala 
	mov 	AH, 09h
	mov 	DX, incorrecta	
	int 	21h
	int 20h ;se pone esto debido a que es un jump por lo tanto debe salirse del programa


contraBuena:  ;funcion que muestra mensaje cuando contraseña se ha ingresado correctamente
	mov 	AH, 09h
	mov 	DX, correcta
	int 	21h
	ret


exit:
    int 20h