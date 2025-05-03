INCLUDE Irvine32.inc

.data
array DWORD 10, 22, 15, 30, 5
arraySize = LENGTHOF array
maxVal DWORD ?

.code
main PROC
    mov esi, OFFSET array
    mov ecx, arraySize
    call MaxInArray
    mov maxVal, eax

    exit
main ENDP

MaxInArray PROC
    ; Input: ESI = array base, ECX = count
    mov eax, [esi]
    add esi, 4
    dec ecx

L3:
    cmp [esi], eax
    jle Skip
    mov eax, [esi]
Skip:
    add esi, 4
    loop L3
    ret
MaxInArray ENDP

END main
