INCLUDE Irvine32.inc

.data
num DWORD 7
msgEven BYTE "Even", 0
msgOdd BYTE "Odd", 0

.code
main PROC
    mov eax, num
    call IsEven
    cmp eax, 1
    je DisplayEven
    call WriteString
    jmp ExitProgram

DisplayEven:
    mov edx, OFFSET msgEven
    call WriteString
    jmp ExitProgram

DisplayOdd:
    mov edx, OFFSET msgOdd
    call WriteString

ExitProgram:
    call Crlf
    exit
main ENDP

IsEven PROC
    ; Input: EAX = number
    ; Output: EAX = 1 if even, 0 if odd
    test eax, 1
    jz Even
    mov eax, 0
    ret
Even:
    mov eax, 1
    ret
IsEven ENDP

END main
