INCLUDE Irvine32.inc

.data
prompt BYTE "Enter a number n: ",0
result BYTE "The sum from 1 to n is: ",0
n DWORD ?

.code
main PROC
    ; Prompt for input
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n, eax
    
    ; Calculate sum
    call CalculateSum
    
    ; Display result
    mov edx, OFFSET result
    call WriteString
    call WriteInt
    call Crlf
    
    INVOKE ExitProcess, 0
main ENDP

CalculateSum PROC
    mov ecx, n    ; Loop counter
    mov eax, 0    ; Accumulator
    
sumLoop:
    add eax, ecx
    loop sumLoop
    
    ret
CalculateSum ENDP

END main
