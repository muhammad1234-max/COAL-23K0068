.MODEL SMALL
.STACK 100H
.DATA
    LETTERS DB 'MOH'  ; Store 'M', 'O', 'H' in memory (for reference)
    
.CODE
MAIN PROC
    MOV AX, @DATA  ; Load data segment
    MOV DS, AX

    ; Store ASCII values in registers
    MOV AL, 'M'    ; ASCII of M (77 in decimal)
    MOV BL, 'O'    ; ASCII of O (79 in decimal)
    MOV CL, 'H'    ; ASCII of H (72 in decimal)

    ; Store them in memory for verification
    MOV LETTERS, AL
    MOV LETTERS+1, BL
    MOV LETTERS+2, CL

    ; Program exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
