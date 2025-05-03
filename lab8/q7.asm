INCLUDE Irvine32.inc

.data
str BYTE "HELLO", 0
len = ($ - str - 1)

.code
main PROC
    lea esi, str
    mov ecx, len
    call Reverse
    call WriteString
    call Crlf

    exit
main ENDP

Reverse PROC
    ; ESI = string address, ECX = length
    push edi
    lea edi, [esi + ecx - 1]

L4:
    cmp esi, edi
    jge Done
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    jmp L4
Done:
    pop edi
    ret
Reverse ENDP

END main
