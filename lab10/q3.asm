INCLUDE Irvine32.inc

.data
    n DWORD 10
    sum DWORD ?

.code
main PROC
    mov eax, n
    call sum_nat
    mov sum, eax

    call WriteInt
    call Crlf
    exit
main ENDP

sum_nat PROC
    ; Input in EAX
    ; Output in EAX
    push ebx
    mov ebx, eax
    inc ebx
    imul eax, ebx
    shr eax, 1
    pop ebx
    ret
sum_nat ENDP

END main
