.MODEL SMALL
.STACK 100H
.DATA
    varB BYTE +10      ; 8-bit signed value (+10)
    varW WORD -150     ; 16-bit signed value (-150)
    varD DWORD 600     ; 32-bit signed value (600)

.CODE
MAIN PROC
    MOV AX, @DATA  ; Load data segment
    MOV DS, AX

    ; Move BYTE varB into EAX with sign extension
    MOV AL, varB   ; Move the 8-bit value into AL
    CBW            ; Convert BYTE to WORD (sign extend to AX)
    CWD            ; Convert WORD to DWORD (sign extend to DX:AX)
    MOV EAX, EAX   ; Ensure full extension into EAX (not strictly needed)

    ; Move WORD varW into EBX with sign extension
    MOV AX, varW   ; Move 16-bit value into AX
    CWD            ; Convert WORD to DWORD (sign extend DX:AX)
    MOV EBX, EAX   ; Move extended value into EBX

    ; Move DWORD varD into ECX
    MOV ECX, varD  ; Directly move 32-bit value

    ; Program exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
