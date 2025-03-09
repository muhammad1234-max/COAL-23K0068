.MODEL SMALL
.STACK 100H
.DATA
    SecondsInDay EQU (24 * 60 * 60)  ; 86400 seconds in a day
    result DWORD ?

.CODE
MAIN PROC
    MOV AX, @DATA   ; Initialize data segment
    MOV DS, AX

    ; Store the constant value into result
    MOV EAX, SecondsInDay  ; Load 86400 into EAX register
    MOV result, EAX        ; Store in memory

    ; Program exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
