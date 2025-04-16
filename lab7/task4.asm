INCLUDE Irvine32.inc

.data
columns BYTE 5

.code
main PROC
    movzx ecx, columns    ; Number of rows = columns
    mov bl, 1            ; Stars to print in current row
    
printPattern:
    push ecx             ; Save outer loop counter
    mov ecx, ebx         ; Set inner loop counter
    
printStars:
    mov al, '*'
    call WriteChar
    loop printStars
    
    call Crlf            ; New line
    inc bl               ; Increase stars for next row
    pop ecx              ; Restore outer loop counter
    loop printPattern
    
    INVOKE ExitProcess, 0
main ENDP
END main
