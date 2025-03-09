.MODEL SMALL
.STACK 100H
.DATA
    A  WORD 0FF10h   ; Define variable A with initial value 0FF10h
    B  WORD 0E10Bh   ; Define variable B with initial value 0E10Bh

.CODE
MAIN PROC
    MOV AX, @DATA  ; Initialize data segment
    MOV DS, AX

    ; Load values into registers
    MOV AX, A      ; AX = 0FF10h
    MOV BX, B      ; BX = 0E10Bh

    ; Swap AX and BX using a temporary register
    XCHG AX, BX    ; Now AX = 0E10Bh, BX = 0FF10h

    ; Store the swapped values back in memory
    MOV A, AX      ; A = 0E10Bh
    MOV B, BX      ; B = 0FF10h

    ; Program exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
