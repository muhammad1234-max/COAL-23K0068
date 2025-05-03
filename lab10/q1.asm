INCLUDE Irvine32.inc

.data
    num DWORD 5
    result DWORD ?

.code
main PROC
    mov eax, num
    call factorial
    mov result, eax

    call WriteInt
    call Crlf
    exit
main ENDP

factorial PROC
    ; Receives number in EAX
    ; Returns factorial in EAX
    push ecx
    mov ecx, eax
    dec ecx
L1:
    cmp ecx, 1
    jl done
    mul ecx
    loop L1
done:
    pop ecx
    ret
factorial ENDP

END main
