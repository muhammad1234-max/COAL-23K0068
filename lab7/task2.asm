INCLUDE Irvine32.inc

.data
num1 DWORD 5
num2 DWORD 7
num3 DWORD 3

.code
main PROC
    ; Push three numbers onto stack
    push num1
    push num2
    push num3
    
    ; Initialize sum in eax
    mov eax, 0
    
    ; Pop and add three numbers
    pop ebx
    add eax, ebx
    pop ebx
    add eax, ebx
    pop ebx
    add eax, ebx
    
    ; Display result
    call WriteInt
    call Crlf
    
    INVOKE ExitProcess, 0
main ENDP
END main
