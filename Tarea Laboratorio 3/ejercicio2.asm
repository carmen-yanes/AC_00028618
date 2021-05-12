org   100h
    mov ch,00
    mov cl,[0200h]
    mov ah, 00
    mov al, 01
    cmp cl, 00
    jz salto1
condic mul cx
    loop condic
salto 1 mov [0210h],ah
        mov [0211h],al

    int 20h
