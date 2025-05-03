; Palindrome.asm
INCLUDE Irvine32.inc

.data
str BYTE "LEVEL", 0
len = ($ - str - 1)
msgYes BYTE "Palindrome", 0
msgNo BYTE "Not a palindrome", 0

.code
main PROC
    lea esi, str
    mov ecx, len
    call IsPalindrome
    cmp eax, 1
    je ShowYes
    mov edx, OFFSET msgNo
    call WriteString
    jmp Done

ShowYes:
    mov edx, OFFSET msgYes
    call WriteString

Done:
    call Crlf
    exit
main ENDP

IsPalindrome PROC
    ; Input: ESI = string, ECX = length
    push edi
    lea edi, [esi + ecx - 1]
    mov eax, 1

L5:
    cmp esi, edi
    jge DonePalindrome
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne NotPalindrome
    inc esi
    dec edi
    jmp L5

NotPalindrome:
    mov eax, 0

DonePalindrome:
    pop edi
    ret
IsPalindrome ENDP

END main
