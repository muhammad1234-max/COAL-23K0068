.MODEL SMALL
.STACK 100H
.DATA
    ; Define values for equation 2
    Val1 DWORD 25h    ; 37 in decimal
    Val2 BYTE 36o     ; 30 in decimal
    Val3 WORD 20d     ; 20 in decimal

.CODE
MAIN PROC
    MOV AX, @DATA  ; Load data segment
    MOV DS, AX

    ; ---- Equation 1: EAX = 89 + 75Fh - 46o - 28 + 1101b ----
    MOV EAX, 89        ; Load 89
    ADD EAX, 75Fh      ; Add 75Fh (1887 decimal)
    SUB EAX, 46o       ; Subtract 46 octal (38 decimal)
    SUB EAX, 28        ; Subtract 28 (decimal)
    ADD EAX, 1101b     ; Add 1101 binary (13 decimal)

    ; ---- Equation 2: EAX = Val1 + Val2 - 654h + Val3 ----
    MOV EBX, DWORD PTR Val1   ; Load Val1 (37)
    ADD EBX, BYTE PTR Val2    ; Add Val2 (30)
    SUB EBX, 654h             ; Subtract 654h (1620 decimal)
    ADD EBX, WORD PTR Val3    ; Add Val3 (20)

    ; Program exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
