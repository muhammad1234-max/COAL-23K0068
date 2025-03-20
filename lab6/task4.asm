TITLE Copy String Using Indexed Addressing
INCLUDE Irvine32.inc

.DATA
    Source  BYTE  "Hello, World!", 0   ; Null-terminated source string
    Target  BYTE  SIZEOF Source DUP(?) ; Empty target array with same size
    Length  DWORD SIZEOF Source        ; Length of the string including null terminator

.CODE
main PROC
    ; Set up registers for indexed addressing
    MOV  ESI, OFFSET Source   ; Load address of Source string into SI
    MOV  EDI, OFFSET Target   ; Load address of Target array into DI

CopyLoop:
    MOV  AL, [ESI]    ; Load a byte from Source into AL
    MOV  [EDI], AL    ; Store it in Target
    INC  ESI          ; Move to the next character in Source
    INC  EDI          ; Move to the next character in Target
    CMP  AL, 0        ; Check if the copied character is NULL
    JNE  CopyLoop     ; If not, continue copying

    ; Exit program
    INVOKE ExitProcess, 0  

main ENDP
END main
