.MODEL SMALL
.STACK 100H
.DATA
    val1 SDWORD 8000H  ; 32-bit signed integer

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV EAX, val1   ; Load val1 into EAX
    ADD EAX, 1      ; Increment val1 by 1
    
    ; Check flags
    PUSHF           ; Push flags to stack
    POP AX          ; Retrieve flag register into AX

    ; The Carry Flag (CF) will be 0 as there is no overflow bit in unsigned addition.
    ; The Sign Flag (SF) will be set according to the sign bit.
    
    MOV AX, 4C00H   ; Exit to DOS
    INT 21H
MAIN ENDP
END MAIN
