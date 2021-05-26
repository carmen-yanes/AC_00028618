        org     100h
        section .text
        MOV     BP, arrayOneByte     
        XOR     SI, SI          
        XOR     AX, AX
        CALL    StArr
        INT     20h

        section .data
arrayOneByte db      01,02,03,04,05,06,07,08,09,10 

StArr:
while:
        MOV CL, 2d              
        MOV BL, 0d              
        MOV AL, [BP+SI]         
        DIV CL                  
        CMP AH, BL              
        JZ numPar               
        JA numImp             
finish:    
        ret 
numPar:
        MOV     BX, 300h        
        MOV     AL, [BP+SI]       
        CMP     AL, 10d
        MOV     [BX+SI], AL     
        INC     SI  
        JE      finish                       
        JMP     StArr        
numImp: 
        MOV     BX, 320h       
        MOV     AL, [BP+SI]     
        MOV     [BX+SI], AL     
        INC     SI              
        JMP     StArr    