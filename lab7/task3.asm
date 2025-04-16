INCLUDE Irvine32.inc

.data
array1 DWORD 1, 2, 3, 4, 5
array2 DWORD 6, 7, 8, 9, 10
arraySize = ($ - array1) / TYPE array1
sum1 DWORD ?
sum2 DWORD ?
totalSum DWORD ?

.code
main PROC
    ; Calculate sum of array1
    mov esi, OFFSET array1
    mov ecx, arraySize
    call SumArray
    mov sum1, eax
    
    ; Calculate sum of array2
    mov esi, OFFSET array2
    mov ecx, arraySize
    call SumArray
    mov sum2, eax
    
    ; Calculate total sum
    mov eax, sum1
    add eax, sum2
    mov totalSum, eax
    
    ; Display results
    mov eax, sum1
    call WriteInt
    call Crlf
    
    mov eax, sum2
    call WriteInt
    call Crlf
    
    mov eax, totalSum
    call WriteInt
    call Crlf
    
    INVOKE ExitProcess, 0
main ENDP

; Procedure to sum an array
SumArray PROC
    push esi
    push ecx
    mov eax, 0
    
sumLoop:
    add eax, [esi]
    add esi, TYPE DWORD
    loop sumLoop
    
    pop ecx
    pop esi
    ret
SumArray ENDP

END main
