INCLUDE Irvine32.inc

.data
sourceArray WORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
destArray WORD 10 DUP(0)
arraySize = ($ - sourceArray) / TYPE sourceArray

.code
main PROC
    ; Initialize loop counter and array pointers
    mov ecx, arraySize
    mov esi, OFFSET sourceArray
    mov edi, OFFSET destArray
    
    ; Push all elements from sourceArray to stack
pushLoop:
    push WORD PTR [esi]
    add esi, TYPE sourceArray
    loop pushLoop
    
    ; Reset counter and pop into destArray
    mov ecx, arraySize
popLoop:
    pop WORD PTR [edi]
    add edi, TYPE destArray
    loop popLoop
    
    ; Display results (optional)
    mov esi, OFFSET destArray
    mov ecx, arraySize
displayLoop:
    movzx eax, WORD PTR [esi]
    call WriteInt
    call Crlf
    add esi, TYPE destArray
    loop displayLoop
    
    INVOKE ExitProcess, 0
main ENDP
END main
