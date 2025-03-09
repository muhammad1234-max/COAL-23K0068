.MODEL SMALL
.STACK 100H
.DATA
    arrayB BYTE 60, 70, 80
    arrayW WORD 150, 250, 350
    arrayD DWORD 600, 1200, 1800
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; BYTE array: add first and last element
    MOV ESI, OFFSET arrayB
    MOV AL, [ESI]
    ADD AL, [ESI + 2]   ; 60 + 80

    ; WORD array: add first and last element
    MOV ESI, OFFSET arrayW
    MOV AX, [ESI]
    ADD AX, [ESI + 4]   ; 150 + 350

    ; DWORD array: add first and last element
    MOV ESI, OFFSET arrayD
    MOV EAX, [ESI]
    ADD EAX, [ESI + 8]  ; 600 + 1800

    MOV AX, 4C00H   ; Exit
    INT 21H
MAIN ENDP
END MAIN
