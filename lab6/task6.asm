INCLUDE Irvine32.inc

.DATA
    arr DWORD 8, 5, 1, 2, 6  ; Unsorted array
    arrSize DWORD LENGTHOF arr ; Number of elements

.CODE
main PROC
    MOV ECX, arrSize  ; Outer loop counter (number of passes)
    DEC ECX           ; Last element doesn't need to be checked

OuterLoop:
    MOV EDX, ECX      ; Inner loop counter
    MOV ESI, 0        ; Index starts at 0

InnerLoop:
    MOV EAX, arr[ESI]      ; Load arr[i] into EAX
    MOV EBX, arr[ESI+4]    ; Load arr[i+1] into EBX

    CMP EAX, EBX           ; Compare arr[i] with arr[i+1]
    JBE NoSwap             ; If arr[i] ≤ arr[i+1], skip swap

    ; Swap arr[i] and arr[i+1]
    MOV arr[ESI], EBX      
    MOV arr[ESI+4], EAX    

NoSwap:
    ADD ESI, 4             ; Move to next element (DWORD = 4 bytes)
    DEC EDX                ; Decrease inner loop counter
    JNZ InnerLoop          ; Repeat inner loop

    DEC ECX                ; Decrease outer loop counter
    JNZ OuterLoop          ; Repeat outer loop

    ; Program exit
    CALL DumpRegs          ; Display registers for debugging
    CALL ExitProcess, 0

main ENDP
END main
