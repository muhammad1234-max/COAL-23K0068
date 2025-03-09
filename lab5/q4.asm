.MODEL SMALL
.STACK 100H
.DATA
    arrayB BYTE 10, 20, 30
    arrayW WORD 150, 250, 350
    arrayD DWORD 600, 1200, 1800
    SUM1 DWORD ?
    SUM2 DWORD ?
    SUM3 DWORD ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; SUM1 = arrayB[0] + arrayW[0] + arrayD[0]
    MOV AL, arrayB[0]   ; Load BYTE
    MOV BX, arrayW[0]   ; Load WORD
    MOV ECX, arrayD[0]  ; Load DWORD
    ADD BX, AX
    ADD ECX, BX
    MOV SUM1, ECX

    ; SUM2 = arrayB[1] + arrayW[1] + arrayD[1]
    MOV AL, arrayB[1]
    MOV BX, arrayW[1]
    MOV ECX, arrayD[1]
    ADD BX, AX
    ADD ECX, BX
    MOV SUM2, ECX

    ; SUM3 = arrayB[2] + arrayW[2] + arrayD[2]
    MOV AL, arrayB[2]
    MOV BX, arrayW[2]
    MOV ECX, arrayD[2]
    ADD BX, AX
    ADD ECX, BX
    MOV SUM3, ECX

    MOV AX, 4C00H   ; Exit
    INT 21H
MAIN ENDP
END MAIN
