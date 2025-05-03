INCLUDE Irvine32.inc

.data
num DWORD 5
result DWORD ?

.code
main PROC
    mov eax, num
    call Square
    mov result, eax

    exit
main ENDP

Square PROC
    ; Input: EAX = number
    ; Output: EAX = EAX^2
    imul eax, eax
    ret
Square ENDP

END main
