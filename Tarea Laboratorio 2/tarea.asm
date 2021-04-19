;Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h (25%):


org 	100h

	section	.text

	mov	byte [200h], "C"
	mov	byte [201h], "M"
	mov	byte [202h], "Y"
	mov	byte [203h], "B"



;Luego, copiar a los siguientes registros los códigos ASCII de los caracteres guardados en 200h (75%):

;Copiar el valor de 200h a AX usando direccionamiento directo.
;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.


; Direccionamiento directo o absoluto
	mov 	AL, [200h]


; Direccionamiento indirecto por registro
; Usamos el registro base como puntero para acceder a la memoria

        mov BX, 201h
        mov CX, [BX]


; Direccionamiento indirecto base mas indice 
; Usamos el registro base junto con un registro apuntador
	mov 	SI, 1h
        mov DX, [BX+SI]


; Direccionamiento relativo por registro
	mov	DI, [BX+2h]
	int 	20h