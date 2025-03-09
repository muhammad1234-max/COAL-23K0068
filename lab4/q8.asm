.MODEL SMALL
.STACK 100H
.DATA
    val1 BYTE  10h
    val2 WORD  8000h
    val3 DWORD 0FFFFh
    val4 WORD  7FFFh

.CODE
MAIN PROC
    MOV AX, @DATA  ; Initialize Data Segment
    MOV DS, AX

    ; (i) Increment val2
    INC val2   ; val2 = val2 + 1

    ; (ii) Subtract val3 from EAX
    MOV EAX, val3  ; Load val3 (0FFFFh) into EAX
    SUB EAX, val3  ; EAX = EAX - val3 (result should be 0)

    ; (iii) Subtract val4 from val2
    MOV AX, val2   ; Load val2 (8001h) into AX (updated from INC)
    SUB AX, val4   ; AX = AX - val4 (8001h - 7FFFh)
    MOV val2, AX   ; Store result back in val2

    ; Program Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
