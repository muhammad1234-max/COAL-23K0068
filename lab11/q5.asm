Extended_Add PROC
    ; Inputs: EDX:EAX + EBX:ECX
    add eax, ecx        ; Add lower 32 bits
    adc edx, ebx        ; Add upper 32 bits with carry
    ret
Extended_Add ENDP
