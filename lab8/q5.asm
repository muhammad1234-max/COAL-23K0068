; SearchArray.asm
INCLUDE Irvine32.inc

.data
array DWORD 4, 7, 2, 9, 5
target DWORD 9
index DWORD ?
arraySize = LENGTHOF array

.code
main PROC
    mov esi, OFFSET array
    mov ecx, arraySize
    mov eax, target
    call Search
    mov index, eax

    exit
main ENDP

Search PROC
    ; EAX = target, ESI = offset, ECX = size
    push edi
    xor edi, edi

L2:
    cmp eax, [esi + edi*4]
    je Found
    inc edi
    loop L2
    mov eax, -1
    pop edi
    ret

Found:
    mov eax, edi
    pop edi
    ret
Search ENDP

END main
