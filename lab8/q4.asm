INCLUDE Irvine32.inc

.data
array DWORD 1, 2, 3, 4, 5
arraySize = LENGTHOF array
sum DWORD ?

.code
main PROC
    mov esi, OFFSET array
    mov ecx, arraySize
    call SumArray
    mov sum, eax

    exit
main ENDP

SumArray PROC
    ; Input: ESI = offset of array, ECX = count
    ; Output: EAX = sum
    xor eax, eax
L1:
    add eax, [esi]
    add esi, 4
    loop L1
    ret
SumArray ENDP

END main
