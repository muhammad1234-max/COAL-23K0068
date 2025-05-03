INCLUDE Irvine32.inc

Square MACRO val
    mov eax, val
    imul eax, val
ENDM

.data
    num DWORD 6
    result DWORD ?

.code
main PROC
    Square num        ; Result in EAX
    mov result, eax

    call WriteInt
    call Crlf
    exit
main ENDP

END main
