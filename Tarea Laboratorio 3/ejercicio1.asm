org 100h

section .text

XOR AX, AX
MOV CX, 8D

MOV byte [200h], 0D
MOV byte [201h], 0D
MOV byte [202h], 0D
MOV byte [203h], 2D
MOV byte [204h], 8D
MOV byte [205h], 6D
MOV byte [206h], 1D
MOV byte [207h], 8D
MOV BX, 200h

JMP SUM

SUM:
    ADD AL, [BX]
    ADD BX, 100h
    LOOP SUM

    MOV CL, 8D
    DIV CL
    MOV byte [20AH],AL


int 20h