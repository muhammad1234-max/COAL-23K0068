.MODEL SMALL
.STACK 100H
.DATA
    arrayD DWORD 1000, 200, 150, 50, 25
    result DWORD ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA ESI, arrayD  ; Point to first element
    MOV EAX, [ESI]   ; Load first element
    ADD ESI, 4

    SUB EAX, [ESI]   ; Subtract second element
    ADD ESI, 4
    SUB EAX, [ESI]   ; Subtract third element
    ADD ESI, 4
    SUB EAX, [ESI]   ; Subtract fourth element
    ADD ESI, 4
    SUB EAX, [ESI]   ; Subtract fifth element

    MOV result, EAX  ; Store final result

    MOV AX, 4C00H   ; Exit
    INT 21H
MAIN ENDP
END MAIN
