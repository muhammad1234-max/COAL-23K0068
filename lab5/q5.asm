.MODEL SMALL
.STACK 100H
.DATA
    array1 BYTE 10, 20, 30, 40
    array2 BYTE 4 DUP (?)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA ESI, array1     ; Point to array1
    LEA EDI, array2+3   ; Point to last index of array2

    MOV AL, [ESI]
    MOV [EDI], AL
    DEC EDI
    INC ESI

    MOV AL, [ESI]
    MOV [EDI], AL
    DEC EDI
    INC ESI

    MOV AL, [ESI]
    MOV [EDI], AL
    DEC EDI
    INC ESI

    MOV AL, [ESI]
    MOV [EDI], AL

    MOV AX, 4C00H   ; Exit
    INT 21H
MAIN ENDP
END MAIN
