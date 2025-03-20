TITLE Reverse Integer Array In-Place
INCLUDE Irvine32.inc

.DATA
    intArray DWORD 10, 20, 30, 40, 50, 60, 70, 80  ; Sample integer array
    arrSize  DWORD LENGTHOF intArray               ; Number of elements in the array

.CODE
main PROC
    MOV   ECX, arrSize            ; ECX = Number of elements
    SHR   ECX, 1                  ; ECX = arrSize / 2 (Loop only till middle)
    
    MOV   ESI, OFFSET intArray     ; ESI points to the start of the array
    MOV   EDI, OFFSET intArray     ; EDI also points to start
    ADD   EDI, (arrSize - 1) * TYPE intArray  ; Move EDI to last element

ReverseLoop:
    CMP   ECX, 0                   ; Check if swapping is done
    JLE   Done                      ; Exit if all swaps are completed
    
    ; Swap *ESI and *EDI
    MOV   EAX, [ESI]                ; Load intArray[i] into EAX
    MOV   EBX, [EDI]                ; Load intArray[j] into EBX
    MOV   [ESI], EBX                ; Store EBX (intArray[j]) in intArray[i]
    MOV   [EDI], EAX                ; Store EAX (intArray[i]) in intArray[j]

    ; Move pointers
    ADD   ESI, TYPE intArray         ; Move ESI to next element (forward)
    SUB   EDI, TYPE intArray         ; Move EDI to previous element (backward)
    
    LOOP  ReverseLoop                ; Repeat for next pair

Done:
    INVOKE ExitProcess, 0

main ENDP
END main
