; Task 1: Fibonacci Sequence (First 10 Numbers)
INCLUDE Irvine32.inc
.code
main PROC
    mov eax, 0            ; First number
    mov ebx, 1            ; Second number
    mov ecx, 10           ; Loop counter for 10 numbers

    ; Print first two numbers
    call WriteDec
    call Crlf
    mov eax, ebx
    call WriteDec
    call Crlf

fibonacci_loop:
    add eax, ebx          ; EAX = EAX + EBX
    xchg eax, ebx         ; Swap EAX and EBX
    call WriteDec         ; Print current Fibonacci number
    call Crlf
    loop fibonacci_loop

    exit
main ENDP
END main
