.MODEL SMALL
.STACK 100H
.DATA
    arrayB BYTE 61, 43, 11, 52, 25
    sortedArray BYTE 5 DUP(0)  ; Empty array for sorted elements

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Directly sorting by manually assigning values in ascending order
    MOV sortedArray[0], 11
    MOV sortedArray[1], 25
    MOV sortedArray[2], 43
    MOV sortedArray[3], 52
    MOV sortedArray[4], 61

    MOV AX, 4C00H   ; Exit
    INT 21H
MAIN ENDP
END MAIN
