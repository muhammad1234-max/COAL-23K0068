INCLUDE Irvine32.inc

.DATA
    n DWORD 4          ; Number of rows (modifiable)
    newline BYTE 0Dh, 0Ah, 0   ; Newline for formatting output

.CODE
main PROC
    ; Call pattern functions one by one
    CALL Pattern1
    CALL NewLine
    CALL Pattern2
    CALL NewLine
    CALL Pattern3
    CALL NewLine
    CALL Pattern4
    CALL NewLine

    ; Exit program
    CALL ExitProcess, 0

; Function: Pattern1 (Increasing 1s)
Pattern1 PROC
    MOV ECX, 1         ; Row counter
P1_Row_Loop:
    PUSH ECX           ; Save row count
    MOV EDX, ECX       ; Column count
P1_Col_Loop:
    MOV AL, '1'        ; Print '1'
    CALL WriteChar
    DEC EDX
    JNZ P1_Col_Loop    ; Continue printing in row

    CALL Crlf          ; Newline after row
    POP ECX            ; Restore row count
    INC ECX            ; Next row
    CMP ECX, 5         ; Check if <= 4 (n)
    JLE P1_Row_Loop
    RET
Pattern1 ENDP

; Function: Pattern2 (Decreasing 1s)
Pattern2 PROC
    MOV ECX, 4         ; Row counter
P2_Row_Loop:
    PUSH ECX           ; Save row count
    MOV EDX, ECX       ; Column count
P2_Col_Loop:
    MOV AL, '1'        ; Print '1'
    CALL WriteChar
    DEC EDX
    JNZ P2_Col_Loop

    CALL Crlf          ; Newline after row
    POP ECX            ; Restore row count
    DEC ECX            ; Next row
    JNZ P2_Row_Loop
    RET
Pattern2 ENDP

; Function: Pattern3 (Decreasing numbers)
Pattern3 PROC
    MOV ECX, 4         ; Start from 4
P3_Row_Loop:
    PUSH ECX           ; Save row count
    MOV EDX, ECX       ; Column count
P3_Col_Loop:
    ADD DL, '0'        ; Convert to ASCII
    MOV AL, DL         ; Print number
    CALL WriteChar
    SUB DL, '0'        ; Convert back to number
    DEC EDX
    JNZ P3_Col_Loop

    CALL Crlf
    POP ECX
    DEC ECX
    JNZ P3_Row_Loop
    RET
Pattern3 ENDP

; Function: Pattern4 (Increasing numbers)
Pattern4 PROC
    MOV ECX, 1         ; Start from 1
P4_Row_Loop:
    PUSH ECX           ; Save row count
    MOV EDX, 1         ; Start from 1
P4_Col_Loop:
    ADD DL, '0'        ; Convert to ASCII
    MOV AL, DL         ; Print number
    CALL WriteChar
    SUB DL, '0'        ; Convert back
    INC EDX
    CMP EDX, ECX
    JG P4_NextRow      ; If column > row, go to next row
    JMP P4_Col_Loop

P4_NextRow:
    CALL Crlf
    POP ECX
    INC ECX
    CMP ECX, 5         ; Check if <= 4
    JLE P4_Row_Loop
    RET
Pattern4 ENDP

; Function: Prints a newline
NewLine PROC
    MOV EDX, OFFSET newline
    CALL WriteString
    RET
NewLine ENDP

END main
