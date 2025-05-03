INCLUDE Irvine32.inc

.data
num DWORD 5
result DWORD ?

.code
main PROC
    mov eax, num
    call Factorial
    mov result, eax

    exit
main ENDP

Factorial PROC
    ; Input: EAX = number
    ; Output: EAX = factorial
    cmp eax, 1
    jbe EndFactorial
    push eax
    dec eax
    call Factorial
    pop ebx
    imul eax, ebx
EndFactorial:
    ret
Factorial ENDP

END main
