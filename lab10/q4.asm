INCLUDE Irvine32.inc

Swap MACRO var1, var2
    mov eax, var1
    xchg eax, var2
    mov var1, eax
ENDM

.data
    a DWORD 15
    b DWORD 30

.code
main PROC
    call WriteString
    mov edx, OFFSET a
    call WriteInt
    call Crlf

    call WriteString
    mov edx, OFFSET b
    call WriteInt
    call Crlf

    Swap a, b

    call WriteInt ; a after swap
    call Crlf
    mov eax, b
    call WriteInt ; b after swap

    exit
main ENDP

END main
